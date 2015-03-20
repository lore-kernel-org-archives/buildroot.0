From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Date: Fri, 20 Mar 2015 10:05:06 +0100
Subject: [Buildroot] [PATCH v3] configs: add defconfig for Freescale i.MX31
	PDK
In-Reply-To: <550B4081.3070906@mind.be>
References: <550B4081.3070906@mind.be>
Message-ID: <1426842306-13904-1-git-send-email-vincent.stehle@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The i.MX31 Product Development Kit (or PDK) is Freescale development board
based on the i.MX31 application processor.

This defconfig is based on Freescale kernel 2.6.28 5.1.0, and is aimed at a PDK
in "3 stack" configuration, with CPU engine board, personality board and debug
board.

Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---

Changes since v2:

- Remove unnecessary initramfs kernel patch.

Changes since v1:

- Use kernel headers 2.6.28 and add two patches to fix "build".

- Generate an initramfs included in the zImage and add one kernel patch to
  enable initramfs support. Adapt readme.txt accordingly.

- Remove a few "leftovers" from defconfig (eglibc, c++, no rootfs rw remount).

 ...C-libary-confusion-in-unifdef.c-due-to-ge.patch | 56 +++++++++++++
 ...x-headers-kbuild-fix-make-incompatibility.patch |  1 +
 .../linux-kbuild-fix-make-incompatibility.patch    | 60 ++++++++++++++
 board/freescale/imx31_3stack/readme.txt            | 92 ++++++++++++++++++++++
 configs/freescale_imx31_3stack_defconfig           | 24 ++++++
 5 files changed, 233 insertions(+)
 create mode 100644 board/freescale/imx31_3stack/patches/linux-headers/linux-headers-kbuild-fix-C-libary-confusion-in-unifdef.c-due-to-ge.patch
 create mode 120000 board/freescale/imx31_3stack/patches/linux-headers/linux-headers-kbuild-fix-make-incompatibility.patch
 create mode 100644 board/freescale/imx31_3stack/patches/linux/linux-kbuild-fix-make-incompatibility.patch
 create mode 100644 board/freescale/imx31_3stack/readme.txt
 create mode 100644 configs/freescale_imx31_3stack_defconfig

diff --git a/board/freescale/imx31_3stack/patches/linux-headers/linux-headers-kbuild-fix-C-libary-confusion-in-unifdef.c-due-to-ge.patch b/board/freescale/imx31_3stack/patches/linux-headers/linux-headers-kbuild-fix-C-libary-confusion-in-unifdef.c-due-to-ge.patch
new file mode 100644
index 0000000..7020e51
--- /dev/null
+++ b/board/freescale/imx31_3stack/patches/linux-headers/linux-headers-kbuild-fix-C-libary-confusion-in-unifdef.c-due-to-ge.patch
@@ -0,0 +1,56 @@
+From d15bd1067b1fcb2b7250d22bc0c7c7fea0b759f7 Mon Sep 17 00:00:00 2001
+From: "Justin P. Mattock" <justinmattock@gmail.com>
+Date: Sat, 7 Mar 2009 13:31:29 +0100
+Subject: [PATCH] kbuild: fix C libary confusion in unifdef.c due to getline()
+
+This fixes an error when compiling the kernel.
+
+  CHK     include/linux/version.h
+  HOSTCC  scripts/unifdef
+scripts/unifdef.c:209: error: conflicting types for 'getline'
+/usr/include/stdio.h:651: note: previous declaration of 'getline' was here
+make[1]: *** [scripts/unifdef] Error 1
+make: *** [__headers] Error 2
+
+Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>
+Cc:  Frederic Weisbecker <fweisbec@gmail.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
+---
+ scripts/unifdef.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/scripts/unifdef.c b/scripts/unifdef.c
+index 552025e..05a31a6 100644
+--- a/scripts/unifdef.c
++++ b/scripts/unifdef.c
+@@ -206,7 +206,7 @@ static void             done(void);
+ static void             error(const char *);
+ static int              findsym(const char *);
+ static void             flushline(bool);
+-static Linetype         getline(void);
++static Linetype         get_line(void);
+ static Linetype         ifeval(const char **);
+ static void             ignoreoff(void);
+ static void             ignoreon(void);
+@@ -512,7 +512,7 @@ process(void)
+ 
+ 	for (;;) {
+ 		linenum++;
+-		lineval = getline();
++		lineval = get_line();
+ 		trans_table[ifstate[depth]][lineval]();
+ 		debug("process %s -> %s depth %d",
+ 		    linetype_name[lineval],
+@@ -526,7 +526,7 @@ process(void)
+  * help from skipcomment().
+  */
+ static Linetype
+-getline(void)
++get_line(void)
+ {
+ 	const char *cp;
+ 	int cursym;
+-- 
+2.1.4
+
diff --git a/board/freescale/imx31_3stack/patches/linux-headers/linux-headers-kbuild-fix-make-incompatibility.patch b/board/freescale/imx31_3stack/patches/linux-headers/linux-headers-kbuild-fix-make-incompatibility.patch
new file mode 120000
index 0000000..194c46e
--- /dev/null
+++ b/board/freescale/imx31_3stack/patches/linux-headers/linux-headers-kbuild-fix-make-incompatibility.patch
@@ -0,0 +1 @@
+../linux/linux-kbuild-fix-make-incompatibility.patch
\ No newline at end of file
diff --git a/board/freescale/imx31_3stack/patches/linux/linux-kbuild-fix-make-incompatibility.patch b/board/freescale/imx31_3stack/patches/linux/linux-kbuild-fix-make-incompatibility.patch
new file mode 100644
index 0000000..b9a54e0
--- /dev/null
+++ b/board/freescale/imx31_3stack/patches/linux/linux-kbuild-fix-make-incompatibility.patch
@@ -0,0 +1,60 @@
+From f1b86605650627a0876163a89065b584f562e3b0 Mon Sep 17 00:00:00 2001
+From: Sam Ravnborg <sam@ravnborg.org>
+Date: Sat, 13 Dec 2008 23:00:45 +0100
+Subject: [PATCH] kbuild: fix make incompatibility
+
+"Paul Smith" <psmith@gnu.org> reported that we would fail
+to build with a new check that may be enabled in an
+upcoming version of make.
+
+The error was:
+
+      Makefile:442: *** mixed implicit and normal rules.  Stop.
+
+The problem is that we did stuff like this:
+
+config %config: ...
+
+The solution was simple - the above was split into two with identical
+prerequisites and commands.
+With only three lines it was not worth to try to avoid the duplication.
+
+Cc: "Paul Smith" <psmith@gnu.org>
+Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
+---
+ Makefile | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 71e98e9..f4161a1 100644
+--- a/Makefile
++++ b/Makefile
+@@ -439,7 +439,11 @@ ifeq ($(config-targets),1)
+ include $(srctree)/arch/$(SRCARCH)/Makefile
+ export KBUILD_DEFCONFIG KBUILD_KCONFIG
+ 
+-config %config: scripts_basic outputmakefile FORCE
++config: scripts_basic outputmakefile FORCE
++	$(Q)mkdir -p include/linux include/config
++	$(Q)$(MAKE) $(build)=scripts/kconfig $@
++
++%config: scripts_basic outputmakefile FORCE
+ 	$(Q)mkdir -p include/linux include/config
+ 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
+ 
+@@ -1604,7 +1608,11 @@ endif
+ 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
+ 
+ # Modules
+-/ %/: prepare scripts FORCE
++/: prepare scripts FORCE
++	$(cmd_crmodverdir)
++	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
++	$(build)=$(build-dir)
++%/: prepare scripts FORCE
+ 	$(cmd_crmodverdir)
+ 	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
+ 	$(build)=$(build-dir)
+-- 
+2.1.4
+
diff --git a/board/freescale/imx31_3stack/readme.txt b/board/freescale/imx31_3stack/readme.txt
new file mode 100644
index 0000000..47447fd
--- /dev/null
+++ b/board/freescale/imx31_3stack/readme.txt
@@ -0,0 +1,92 @@
+**************************************
+Freescale i.MX31 PDK development board
+**************************************
+
+This file documents the Buildroot support for the Freescale i.MX31 PDK in "3
+stack" configuration.
+
+The i.MX31 Product Development Kit (or PDK) is Freescale development board [1]
+based on the i.MX31 application processor [2].
+
+For more details on the i.MX31 PDK board, refer to the User's Guide [3].
+
+Build
+=====
+
+First, configure Buildroot for your i.MX31 PDK board:
+
+  make freescale_imx31_3stack_defconfig
+
+Build all components:
+
+  make
+
+You will find in ./output/images/ the following files:
+  - rootfs.cpio
+  - rootfs.cpio.gz
+  - rootfs.tar
+  - zImage
+
+The generated zImage does include the rootfs.
+
+Boot the PDK board
+==================
+
+The i.MX31 PDK contains a RedBoot bootloader in flash, which can be used to
+boot the newly created Buildroot images from the network.
+
+This necessitates to setup a TFTP server first. This setup is explained for
+example in Freescale i.MX31 PDK 1.5 Linux User's Guide [4].
+
+Here is a sample RedBoot configuration, for proper network boot of Buildroot on
+the i.MX31 PDK:
+
+    RedBoot> fconfig -l
+    Run script at boot: true
+    Boot script:
+    .. load -r -b 0x100000 zImage
+    .. exec -c "console=ttymxc0,115200"
+    
+    Boot script timeout (1000ms resolution): 2
+    Use BOOTP for network configuration: false
+    Gateway IP address: <your gateway IP address>
+    Local IP address: <your PDK IP address>
+    Local IP address mask: 255.255.255.0
+    Default server IP address: <your TFTP server IP address>
+    Board specifics: 0
+    Console baud rate: 115200
+    Set eth0 network hardware address [MAC]: false
+    GDB connection port: 9000
+    Force console for special debug messages: false
+    Network debug at boot time: false
+
+Adapt those settings to your network configuration by replacing the appropriate
+network addresses where necessary.
+
+You might want to verify that your i.MX31 PDK switches settings are the correct
+ones for UART, power, boot mode, etc. Here is a reference switches
+configuration:
+
+    SW4
+    1   2   3   4   5   6   7  8
+    ON off off off off off off ON
+
+    SW5 SW6 SW7 SW8 SW9 SW10
+     0   1   0   0   0    0
+
+See the i.MX31 PDK Linux Quick Start Guide [5] for more details on the switches
+settings.
+
+Connect a serial terminal set to 115200n8 and power on the i.MX31 PDK board.
+Buildroot will present a login prompt on the serial port.
+
+Enjoy!
+
+References
+==========
+
+[1] http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=i.MX31PDK
+[2] http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=i.MX31
+[3] http://cache.freescale.com/files/32bit/doc/user_guide/pdk15_imx31_Hardware_UG.pdf
+[4] http://cache.freescale.com/files/32bit/doc/support_info/IMX31_PDK15_LINUXDOCS_BUNDLE.zip, pdk15_imx31__Linux_UG.pdf
+[5] http://www.freescale.com/files/32bit/doc/quick_ref_guide/PDK14LINUXQUICKSTART.pdf
diff --git a/configs/freescale_imx31_3stack_defconfig b/configs/freescale_imx31_3stack_defconfig
new file mode 100644
index 0000000..ce8c9c7
--- /dev/null
+++ b/configs/freescale_imx31_3stack_defconfig
@@ -0,0 +1,24 @@
+# architecture
+BR2_arm=y
+BR2_arm1136jf_s_r0=y
+BR2_ARM_EABIHF=y
+
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx31_3stack/patches"
+
+# toolchain
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="2.6.28"
+
+# system
+BR2_ROOTFS_DEVICE_CREATION_STATIC=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_2.6.28_5.1.0"
+BR2_LINUX_KERNEL_DEFCONFIG="imx31_3stack"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
-- 
2.1.4
