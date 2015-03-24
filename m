From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 24 Mar 2015 02:22:00 +0100
Subject: [Buildroot] [PATCH] m68K: enable support
Message-ID: <20150324012200.GA27975@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for Aranym M68K Emulator.
Toolchain building with gcc 4.8.x / 4.9.x requires a small
patch. Tested with uClibc-ng and GNU libc.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 arch/Config.in                          |    7 +-
 board/aranym/aranym.cfg                 |  195 +++++++++++++++++++++++++++++++
 board/aranym/linux-3.19.config          |   21 ++++
 board/aranym/readme.txt                 |    8 ++
 configs/aranym_mmu_m68k_defconfig       |   24 ++++
 package/gcc/4.8.4/860-m68k-libgcc.patch |   15 +++
 package/gcc/4.9.2/870-m68k-libgcc.patch |   15 +++
 package/uclibc/Config.in                |    2 +-
 toolchain/toolchain-buildroot/Config.in |    2 +-
 9 files changed, 283 insertions(+), 6 deletions(-)
 create mode 100644 board/aranym/aranym.cfg
 create mode 100644 board/aranym/linux-3.19.config
 create mode 100644 board/aranym/readme.txt
 create mode 100644 configs/aranym_mmu_m68k_defconfig
 create mode 100644 package/gcc/4.8.4/860-m68k-libgcc.patch
 create mode 100644 package/gcc/4.9.2/870-m68k-libgcc.patch

diff --git a/arch/Config.in b/arch/Config.in
index 16ad8be..5e3eb5c 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -69,7 +69,6 @@ config BR2_i386
 
 config BR2_m68k
 	bool "m68k"
-	depends on BROKEN # ice in uclibc / inet_ntoa_r
 	help
 	  Motorola 68000 family microprocessor
 	  http://en.wikipedia.org/wiki/M68k
@@ -243,13 +242,13 @@ config BR2_BINFMT_SUPPORTS_SHARED
 # Set up target binary format
 choice
 	prompt "Target Binary Format"
-	default BR2_BINFMT_ELF if !(BR2_bfin || BR2_m68k)
+	default BR2_BINFMT_ELF if !BR2_bfin
 	default BR2_BINFMT_FDPIC if BR2_bfin
-	default BR2_BINFMT_FLAT if BR2_m68k
+	default BR2_BINFMT_FLAT
 
 config BR2_BINFMT_ELF
 	bool "ELF"
-	depends on !BR2_bfin && !BR2_m68k
+	depends on !BR2_bfin
 	select BR2_BINFMT_SUPPORTS_SHARED
 	help
 	  ELF (Executable and Linkable Format) is a format for libraries and
diff --git a/board/aranym/aranym.cfg b/board/aranym/aranym.cfg
new file mode 100644
index 0000000..50ef7a3
--- /dev/null
+++ b/board/aranym/aranym.cfg
@@ -0,0 +1,195 @@
+[GLOBAL]
+FastRAM = 32
+Floppy = 
+TOS = ROM
+EmuTOS = etos512k.img
+Bootstrap = mintara.prg
+BootstrapArgs = 
+BootDrive =  
+GMTime = No
+
+[STARTUP]
+GrabMouse = No
+Debugger = No
+
+[IKBD]
+WheelEiffel = No
+AltGr = Yes
+
+[HOTKEYS]
+Setup = 19:0
+Quit = 19:0x1
+Reboot = 19:0x40
+Ungrab = 27:0x141
+Debug = 19:0x100
+Screenshot = 316:0
+Fullscreen = 302:0
+
+[JIT]
+JIT = Yes
+JITFPU = Yes
+JITCacheSize = 8192
+JITLazyFlush = 1
+JITBlackList = 
+JITInline = No
+
+[VIDEO]
+FullScreen = No
+BootColorDepth = -1
+VidelRefresh = 2
+VidelMonitor = -1
+SingleBlitComposing = No
+SingleBlitRefresh = No
+
+[TOS]
+Cookie_MCH = 50000
+RedirConsole = No
+
+[IDE0]
+Present = No
+IsCDROM = No
+ByteSwap = No
+ReadOnly = No
+Path = 
+Cylinders = 0
+Heads = 0
+SectorsPerTrack = 0
+ModelName = Master
+
+[IDE1]
+Present = No
+IsCDROM = No
+ByteSwap = No
+ReadOnly = No
+Path = 
+Cylinders = 0
+Heads = 0
+SectorsPerTrack = 0
+ModelName = Slave
+
+[PARTITION0]
+Path = 
+Present = No
+PartID = BGM
+ByteSwap = No
+ReadOnly = No
+
+[HOSTFS]
+A = 
+B = 
+C = 
+D = 
+E = 
+F = 
+G = 
+H = 
+I = 
+J = 
+K = 
+L = 
+M = 
+N = 
+O = 
+P = 
+Q = 
+R = 
+S = 
+T = 
+U = 
+V = 
+W = 
+X = 
+Y = 
+Z = 
+
+[OPENGL]
+Enabled = No
+Filtered = No
+Library = 
+
+[ETH0]
+Type = bridge
+Tunnel = tap0
+HostIP = 172.24.30.12
+AtariIP = 172.24.42.46
+Netmask = 255.255.0.0
+MAC = 00:41:45:54:48:30
+
+[LILO]
+Kernel = output/images/vmlinux
+Args = console=tty debug=par 
+Ramdisk = output/images/rootfs.cpio
+
+[MIDI]
+Type = none
+File = 
+Sequencer = /dev/sequencer
+
+[CDROMS]
+A = -1
+B = -1
+C = -1
+D = -1
+E = -1
+F = -1
+G = -1
+H = -1
+I = -1
+J = -1
+K = -1
+L = -1
+M = -1
+N = -1
+O = -1
+P = -1
+Q = -1
+R = -1
+S = -1
+T = -1
+U = -1
+V = -1
+W = -1
+X = -1
+Y = -1
+Z = -1
+
+[AUTOZOOM]
+Enabled = No
+IntegerCoefs = No
+FixedSize = No
+Width = 640
+Height = 480
+
+[NFOSMESA]
+ChannelSize = 0
+LibGL = libGL.so
+LibOSMesa = libOSMesa.so
+
+[PARALLEL]
+Type = file
+File = stderr
+Parport = /dev/parport0
+
+[SERIAL]
+Serport = /dev/ttyS0
+
+[NATFEATS]
+CDROM = sdl
+Vdi = soft
+
+[NFVDI]
+UseHostMouseCursor = No
+
+[AUDIO]
+Frequency = 22050
+Channels = 2
+Bits = 16
+Samples = 1024
+
+[JOYSTICKS]
+Ikbd0 = -1
+Ikbd1 = 0
+JoypadA = -1
+JoypadAButtons = 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
+JoypadB = -1
+JoypadBButtons = 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
diff --git a/board/aranym/linux-3.19.config b/board/aranym/linux-3.19.config
new file mode 100644
index 0000000..24a0c74
--- /dev/null
+++ b/board/aranym/linux-3.19.config
@@ -0,0 +1,21 @@
+CONFIG_M68K=y
+CONFIG_MMU=y
+CONFIG_MMU_MOTOROLA=y
+CONFIG_M68KCLASSIC=y
+CONFIG_M68040=y
+CONFIG_FPU=y
+CONFIG_ATARI=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_NATFEAT=y
+CONFIG_NFETH=y
+CONFIG_SERIO=y
+CONFIG_SERIO_SERPORT=y
+CONFIG_SERIO_LIBPS2=y
+CONFIG_INPUT_KEYBOARD=y
+CONFIG_ATARI_KBD_CORE=y
+CONFIG_KEYBOARD_ATARI=y
+CONFIG_INPUT_MOUSE=y
+CONFIG_MOUSE_ATARI=y
+CONFIG_FB=y
+CONFIG_FB_ATARI=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/board/aranym/readme.txt b/board/aranym/readme.txt
new file mode 100644
index 0000000..97c9fe6
--- /dev/null
+++ b/board/aranym/readme.txt
@@ -0,0 +1,8 @@
+Run the emulation with:
+
+  aranym-mmu -l -c board/aranym/aranym.cfg
+
+The login prompt will appear in the terminal that started Aranym.
+The graphical window is the framebuffer.
+
+Tested with Aranym 1.0.2.
diff --git a/configs/aranym_mmu_m68k_defconfig b/configs/aranym_mmu_m68k_defconfig
new file mode 100644
index 0000000..8bb92d4
--- /dev/null
+++ b/configs/aranym_mmu_m68k_defconfig
@@ -0,0 +1,24 @@
+# Architecture
+BR2_m68k=y
+
+# system
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty0"
+
+# filesystem
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_NONE=y
+# BR2_TARGET_ROOTFS_EXT2 is not set
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Lock to 3.19 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.19"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
+
+# Linux kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/aranym/linux-3.19.config"
diff --git a/package/gcc/4.8.4/860-m68k-libgcc.patch b/package/gcc/4.8.4/860-m68k-libgcc.patch
new file mode 100644
index 0000000..d34e36a
--- /dev/null
+++ b/package/gcc/4.8.4/860-m68k-libgcc.patch
@@ -0,0 +1,15 @@
+header seems not to be required, but breaks toolchain building.
+
+Signed-Off-By: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-4.8.4.orig/libgcc/config/m68k/linux-atomic.c gcc-4.8.4/libgcc/config/m68k/linux-atomic.c
+--- gcc-4.8.4.orig/libgcc/config/m68k/linux-atomic.c	2013-02-04 20:06:20.000000000 +0100
++++ gcc-4.8.4/libgcc/config/m68k/linux-atomic.c	2015-03-22 10:57:31.000000000 +0100
+@@ -33,7 +33,6 @@
+    using the kernel helper defined below.  There is no support for
+    64-bit operations yet.  */
+ 
+-#include <asm/unistd.h>
+ #include <stdbool.h>
+ 
+ #ifndef __NR_atomic_cmpxchg_32
diff --git a/package/gcc/4.9.2/870-m68k-libgcc.patch b/package/gcc/4.9.2/870-m68k-libgcc.patch
new file mode 100644
index 0000000..aa8f67a
--- /dev/null
+++ b/package/gcc/4.9.2/870-m68k-libgcc.patch
@@ -0,0 +1,15 @@
+hearder seems not to be required, but breaks toolchain building.
+
+Signed-Off-By: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-4.9.2.orig/libgcc/config/m68k/linux-atomic.c gcc-4.9.2/libgcc/config/m68k/linux-atomic.c
+--- gcc-4.9.2.orig/libgcc/config/m68k/linux-atomic.c	2014-01-02 23:25:22.000000000 +0100
++++ gcc-4.9.2/libgcc/config/m68k/linux-atomic.c	2015-03-23 10:07:26.000000000 +0100
+@@ -33,7 +33,6 @@
+    using the kernel helper defined below.  There is no support for
+    64-bit operations yet.  */
+ 
+-#include <asm/unistd.h>
+ #include <stdbool.h>
+ 
+ #ifndef __NR_atomic_cmpxchg_32
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 3a6525b..7db7660 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -29,7 +29,7 @@ choice
 		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
 		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
 		       if !BR2_bfin && !BR2_x86_i386
-		depends on !(BR2_arc || BR2_xtensa)
+		depends on !(BR2_arc || BR2_m68k || BR2_xtensa)
 
 	config BR2_UCLIBC_VERSION_ARC_GIT
 		bool "uClibc Git ARC"
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index fcbce66..b388f0f 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -65,7 +65,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_mips64      || BR2_mips64el || BR2_powerpc || \
 		   BR2_powerpc64   || BR2_powerpc64le || BR2_sh   || \
 		   BR2_sh64        || BR2_sparc    || BR2_x86_64  || \
-		   BR2_microblaze  || BR2_nios2
+		   BR2_microblaze  || BR2_nios2	   || BR2_m68k
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_powerpc_SPE
-- 
1.7.10.4
