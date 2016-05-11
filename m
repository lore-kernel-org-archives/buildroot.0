From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 May 2016 15:27:15 +0200
Subject: [Buildroot] [git commit] m68k: fix open issues with qemu coldfire
Message-ID: <20160511132725.CCCE281E67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc72cf2ca62ccc2adb3c5acb9553f418006c8425
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable kernel drivers for networking and add a simple
busybox config with basic network tools.

Add kernel patch from Linux git to fix hush segfaults while
using signal handler.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/m68k-mcf5208/linux-4.5.config           |   7 ++
 .../patches/linux/0001-fix-do_sigreturn.patch      | 100 +++++++++++++++++++++
 configs/qemu_m68k_mcf5208_defconfig                |   6 +-
 package/busybox/busybox-minimal.config             |  82 ++++++++---------
 4 files changed, 151 insertions(+), 44 deletions(-)

diff --git a/board/qemu/m68k-mcf5208/linux-4.5.config b/board/qemu/m68k-mcf5208/linux-4.5.config
index bf30bf4..09a89d7 100644
--- a/board/qemu/m68k-mcf5208/linux-4.5.config
+++ b/board/qemu/m68k-mcf5208/linux-4.5.config
@@ -19,3 +19,10 @@ CONFIG_SERIAL_MCF_BAUDRATE=115200
 CONFIG_SERIAL_MCF_CONSOLE=y
 CONFIG_BOOTPARAM=y
 CONFIG_BOOTPARAM_STRING="console=ttyS0,115200"
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_NETDEVICES=y
+CONFIG_NET_VENDOR_FREESCALE=y
+CONFIG_FEC=y
diff --git a/board/qemu/m68k-mcf5208/patches/linux/0001-fix-do_sigreturn.patch b/board/qemu/m68k-mcf5208/patches/linux/0001-fix-do_sigreturn.patch
new file mode 100644
index 0000000..c52a4e2
--- /dev/null
+++ b/board/qemu/m68k-mcf5208/patches/linux/0001-fix-do_sigreturn.patch
@@ -0,0 +1,100 @@
+From a95517992a37488c0bc8b629c47c570e580e407d Mon Sep 17 00:00:00 2001
+From: Greg Ungerer <gerg@uclinux.org>
+Date: Mon, 15 Feb 2016 16:36:29 +1000
+Subject: m68k: Use conventional function parameters for do_sigreturn
+
+Create conventional stack parameters for the calls to do_sigreturn and
+do_rt_sigreturn. The current C code for do_sigreturn and do_rt_sigreturn
+dig into the stack to create local pointers to the saved switch stack
+and the pt_regs structs.
+
+The motivation for this change is a problem with non-MMU targets that
+have broken signal return paths on newer versions of gcc. It appears as
+though gcc has determined that the pointers into the saved stack structs,
+and the saved structs themselves, are function parameters and updates to
+them will be lost on function return, so they are optimized away. This
+results in large parts of restore_sigcontext() and mangle_kernel_stack()
+functions being removed. Of course this results in non-functional code
+causing kernel oops. This problem has been observed with gcc version
+5.2 and 5.3, and probably exists in earlier versions as well.
+
+Using conventional stack parameter pointers passed to these functions has
+the advantage of the code here not needing to know the exact details of
+how the underlying entry handler layed these structs out on the stack.
+So the rather ugly pointer setup casting and arg referencing can be
+removed.
+
+The resulting code after this change is a few bytes larger (due to the
+overhead of creating the stack args and their tear down). Not being hot
+paths I don't think this is too much of a problem here.
+
+An alternative solution is to put a barrier() in the do_sigreturn() code,
+but this doesn't feel quite as clean as this solution.
+
+This change has been compile tested on all defconfigs, and run tested on
+Atari (through aranym), ColdFire with MMU (M5407EVB) and ColdFire with
+no-MMU (QEMU and M5208EVB).
+
+Signed-off-by: Greg Ungerer <gerg@uclinux.org>
+Acked-by: Andreas Schwab <schwab@linux-m68k.org>
+Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
+---
+ arch/m68k/kernel/entry.S  | 6 ++++++
+ arch/m68k/kernel/signal.c | 8 ++------
+ 2 files changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
+index b54ac7a..97cd3ea 100644
+--- a/arch/m68k/kernel/entry.S
++++ b/arch/m68k/kernel/entry.S
+@@ -71,13 +71,19 @@ ENTRY(__sys_vfork)
+ 
+ ENTRY(sys_sigreturn)
+ 	SAVE_SWITCH_STACK
++	movel	%sp,%sp at -		  | switch_stack pointer
++	pea	%sp@(SWITCH_STACK_SIZE+4) | pt_regs pointer
+ 	jbsr	do_sigreturn
++	addql	#8,%sp
+ 	RESTORE_SWITCH_STACK
+ 	rts
+ 
+ ENTRY(sys_rt_sigreturn)
+ 	SAVE_SWITCH_STACK
++	movel	%sp,%sp at -		  | switch_stack pointer
++	pea	%sp@(SWITCH_STACK_SIZE+4) | pt_regs pointer
+ 	jbsr	do_rt_sigreturn
++	addql	#8,%sp
+ 	RESTORE_SWITCH_STACK
+ 	rts
+ 
+diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
+index af1c4f3..2dcee3a 100644
+--- a/arch/m68k/kernel/signal.c
++++ b/arch/m68k/kernel/signal.c
+@@ -737,10 +737,8 @@ badframe:
+ 	return 1;
+ }
+ 
+-asmlinkage int do_sigreturn(unsigned long __unused)
++asmlinkage int do_sigreturn(struct pt_regs *regs, struct switch_stack *sw)
+ {
+-	struct switch_stack *sw = (struct switch_stack *) &__unused;
+-	struct pt_regs *regs = (struct pt_regs *) (sw + 1);
+ 	unsigned long usp = rdusp();
+ 	struct sigframe __user *frame = (struct sigframe __user *)(usp - 4);
+ 	sigset_t set;
+@@ -764,10 +762,8 @@ badframe:
+ 	return 0;
+ }
+ 
+-asmlinkage int do_rt_sigreturn(unsigned long __unused)
++asmlinkage int do_rt_sigreturn(struct pt_regs *regs, struct switch_stack *sw)
+ {
+-	struct switch_stack *sw = (struct switch_stack *) &__unused;
+-	struct pt_regs *regs = (struct pt_regs *) (sw + 1);
+ 	unsigned long usp = rdusp();
+ 	struct rt_sigframe __user *frame = (struct rt_sigframe __user *)(usp - 4);
+ 	sigset_t set;
+-- 
+cgit v0.12
+
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
index 53ee1ff..31db912 100644
--- a/configs/qemu_m68k_mcf5208_defconfig
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -9,6 +9,8 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+BR2_GLOBAL_PATCH_DIR="board/qemu/m68k-mcf5208/patches/"
+
 # Linux headers same as kernel, a 4.5 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 
@@ -24,7 +26,5 @@ BR2_LINUX_KERNEL_VMLINUX=y
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
-# use minimal busybox with hush
+# use minimal busybox with hush and networking tools
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
-# mdev does not work correctly
-BR2_ROOTFS_DEVICE_CREATION_STATIC=y
diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
index 3261e5a..368ce8e 100644
--- a/package/busybox/busybox-minimal.config
+++ b/package/busybox/busybox-minimal.config
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.24.1
-# Sat Mar 12 15:36:27 2016
+# Busybox version: 1.24.2
+# Mon May  9 18:42:38 2016
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
@@ -364,9 +364,9 @@ CONFIG_DEFAULT_SETFONT_DIR=""
 #
 # CONFIG_MKTEMP is not set
 # CONFIG_PIPE_PROGRESS is not set
-# CONFIG_RUN_PARTS is not set
-# CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS is not set
-# CONFIG_FEATURE_RUN_PARTS_FANCY is not set
+CONFIG_RUN_PARTS=y
+CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS=y
+CONFIG_FEATURE_RUN_PARTS_FANCY=y
 CONFIG_START_STOP_DAEMON=y
 CONFIG_FEATURE_START_STOP_DAEMON_FANCY=y
 CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=y
@@ -384,7 +384,7 @@ CONFIG_WHICH=y
 # CONFIG_FEATURE_DIFF_DIR is not set
 # CONFIG_ED is not set
 # CONFIG_PATCH is not set
-# CONFIG_SED is not set
+CONFIG_SED=y
 # CONFIG_VI is not set
 CONFIG_FEATURE_VI_MAX_LEN=0
 # CONFIG_FEATURE_VI_8BIT is not set
@@ -759,14 +759,14 @@ CONFIG_FEATURE_BEEP_LENGTH_MS=0
 # CONFIG_NAMEIF is not set
 # CONFIG_FEATURE_NAMEIF_EXTENDED is not set
 # CONFIG_NBDCLIENT is not set
-# CONFIG_NC is not set
-# CONFIG_NC_SERVER is not set
+CONFIG_NC=y
+CONFIG_NC_SERVER=y
 # CONFIG_NC_EXTRA is not set
 # CONFIG_NC_110_COMPAT is not set
-# CONFIG_PING is not set
+CONFIG_PING=y
 # CONFIG_PING6 is not set
 # CONFIG_FEATURE_FANCY_PING is not set
-# CONFIG_WGET is not set
+CONFIG_WGET=y
 # CONFIG_FEATURE_WGET_STATUSBAR is not set
 # CONFIG_FEATURE_WGET_AUTHENTICATION is not set
 # CONFIG_FEATURE_WGET_LONG_OPTIONS is not set
@@ -806,23 +806,23 @@ CONFIG_HOSTNAME=y
 # CONFIG_FEATURE_HTTPD_ERROR_PAGES is not set
 # CONFIG_FEATURE_HTTPD_PROXY is not set
 # CONFIG_FEATURE_HTTPD_GZIP is not set
-# CONFIG_IFCONFIG is not set
-# CONFIG_FEATURE_IFCONFIG_STATUS is not set
+CONFIG_IFCONFIG=y
+CONFIG_FEATURE_IFCONFIG_STATUS=y
 # CONFIG_FEATURE_IFCONFIG_SLIP is not set
 # CONFIG_FEATURE_IFCONFIG_MEMSTART_IOADDR_IRQ is not set
-# CONFIG_FEATURE_IFCONFIG_HW is not set
-# CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS is not set
+CONFIG_FEATURE_IFCONFIG_HW=y
+CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS=y
 # CONFIG_IFENSLAVE is not set
 # CONFIG_IFPLUGD is not set
-# CONFIG_IFUPDOWN is not set
-CONFIG_IFUPDOWN_IFSTATE_PATH=""
-# CONFIG_FEATURE_IFUPDOWN_IP is not set
-# CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN is not set
+CONFIG_IFUPDOWN=y
+CONFIG_IFUPDOWN_IFSTATE_PATH="/var/run/ifstate"
+CONFIG_FEATURE_IFUPDOWN_IP=y
+CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN=y
 # CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN is not set
-# CONFIG_FEATURE_IFUPDOWN_IPV4 is not set
+CONFIG_FEATURE_IFUPDOWN_IPV4=y
 # CONFIG_FEATURE_IFUPDOWN_IPV6 is not set
 # CONFIG_FEATURE_IFUPDOWN_MAPPING is not set
-# CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set
+CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP=y
 # CONFIG_INETD is not set
 # CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set
 # CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD is not set
@@ -830,37 +830,37 @@ CONFIG_IFUPDOWN_IFSTATE_PATH=""
 # CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME is not set
 # CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN is not set
 # CONFIG_FEATURE_INETD_RPC is not set
-# CONFIG_IP is not set
-# CONFIG_FEATURE_IP_ADDRESS is not set
-# CONFIG_FEATURE_IP_LINK is not set
-# CONFIG_FEATURE_IP_ROUTE is not set
-CONFIG_FEATURE_IP_ROUTE_DIR=""
+CONFIG_IP=y
+CONFIG_FEATURE_IP_ADDRESS=y
+CONFIG_FEATURE_IP_LINK=y
+CONFIG_FEATURE_IP_ROUTE=y
+CONFIG_FEATURE_IP_ROUTE_DIR="/etc/iproute2"
 # CONFIG_FEATURE_IP_TUNNEL is not set
 # CONFIG_FEATURE_IP_RULE is not set
-# CONFIG_FEATURE_IP_SHORT_FORMS is not set
+CONFIG_FEATURE_IP_SHORT_FORMS=y
 # CONFIG_FEATURE_IP_RARE_PROTOCOLS is not set
-# CONFIG_IPADDR is not set
-# CONFIG_IPLINK is not set
-# CONFIG_IPROUTE is not set
+CONFIG_IPADDR=y
+CONFIG_IPLINK=y
+CONFIG_IPROUTE=y
 # CONFIG_IPTUNNEL is not set
 # CONFIG_IPRULE is not set
 # CONFIG_IPCALC is not set
 # CONFIG_FEATURE_IPCALC_FANCY is not set
 # CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
-# CONFIG_NETSTAT is not set
+CONFIG_NETSTAT=y
 # CONFIG_FEATURE_NETSTAT_WIDE is not set
-# CONFIG_FEATURE_NETSTAT_PRG is not set
+CONFIG_FEATURE_NETSTAT_PRG=y
 # CONFIG_NSLOOKUP is not set
 # CONFIG_NTPD is not set
 # CONFIG_FEATURE_NTPD_SERVER is not set
 # CONFIG_FEATURE_NTPD_CONF is not set
 # CONFIG_PSCAN is not set
-# CONFIG_ROUTE is not set
+CONFIG_ROUTE=y
 # CONFIG_SLATTACH is not set
 # CONFIG_TCPSVD is not set
-# CONFIG_TELNET is not set
-# CONFIG_FEATURE_TELNET_TTYPE is not set
-# CONFIG_FEATURE_TELNET_AUTOLOGIN is not set
+CONFIG_TELNET=y
+CONFIG_FEATURE_TELNET_TTYPE=y
+CONFIG_FEATURE_TELNET_AUTOLOGIN=y
 # CONFIG_TELNETD is not set
 # CONFIG_FEATURE_TELNETD_STANDALONE is not set
 # CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
@@ -885,16 +885,16 @@ CONFIG_FEATURE_IP_ROUTE_DIR=""
 # CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
 # CONFIG_FEATURE_UDHCPD_BASE_IP_ON_MAC is not set
 CONFIG_DHCPD_LEASES_FILE=""
-# CONFIG_UDHCPC is not set
+CONFIG_UDHCPC=y
 # CONFIG_FEATURE_UDHCPC_ARPING is not set
-# CONFIG_FEATURE_UDHCPC_SANITIZEOPT is not set
+CONFIG_FEATURE_UDHCPC_SANITIZEOPT=y
 # CONFIG_FEATURE_UDHCP_PORT is not set
-CONFIG_UDHCP_DEBUG=0
+CONFIG_UDHCP_DEBUG=9
 # CONFIG_FEATURE_UDHCP_RFC3397 is not set
 # CONFIG_FEATURE_UDHCP_8021Q is not set
-CONFIG_UDHCPC_DEFAULT_SCRIPT=""
-CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=0
-CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=""
+CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
+CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
+CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
 # CONFIG_UDPSVD is not set
 # CONFIG_VCONFIG is not set
 # CONFIG_ZCIP is not set
