From: Carlos Santos <casantos@datacom.ind.br>
Date: Sat, 30 Sep 2017 20:13:09 -0300
Subject: [Buildroot] [PATCH] syslinux: Use the host compiler to build
	extlinux
Message-ID: <20170930231309.17677-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Like the utilities, it is meant to run on the host machine, hence must
be built using the host toolchain.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
Tested with the following defconfig:

BR2_x86_64=y
BR2_x86_atom=y
BR2_DL_DIR="$(HOME)/src"
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2017.05-1078-g95b1dae.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_TARGET_GENERIC_ROOT_PASSWD="root"
BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
BR2_ENABLE_LOCALE_WHITELIST=""
BR2_ROOTFS_OVERLAY="board/technologic/ts5x00/fs-overlay"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_SYSLINUX=y
BR2_TARGET_SYSLINUX_MBR=y
BR2_TARGET_SYSLINUX_EFI=y

Notice that I did not actualy use a ts5x00 board, just used its
defconfig as a base to create my configuration.
---
 ...-extlinux-Use-the-host-toolchain-to-build.patch | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 boot/syslinux/0011-extlinux-Use-the-host-toolchain-to-build.patch

diff --git a/boot/syslinux/0011-extlinux-Use-the-host-toolchain-to-build.patch b/boot/syslinux/0011-extlinux-Use-the-host-toolchain-to-build.patch
new file mode 100644
index 0000000000..1ce484bd93
--- /dev/null
+++ b/boot/syslinux/0011-extlinux-Use-the-host-toolchain-to-build.patch
@@ -0,0 +1,60 @@
+From 9497112ff28f87ca3c12ca2191e64cdacc5bf8d6 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Sat, 30 Sep 2017 19:49:55 -0300
+Subject: [PATCH] extlinux: Use the host toolchain to build.
+
+It is meant to run on the host machine, hence must be built using the
+host toolchain.
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ extlinux/Makefile | 13 ++++++-------
+ 1 file changed, 6 insertions(+), 7 deletions(-)
+
+diff --git a/extlinux/Makefile b/extlinux/Makefile
+index 1721ee54..5c4baa5a 100644
+--- a/extlinux/Makefile
++++ b/extlinux/Makefile
+@@ -18,16 +18,15 @@ include $(MAKEDIR)/syslinux.mk
+ 
+ OPTFLAGS = -g -Os
+ INCLUDES = -I$(SRC) -I$(objdir) -I$(SRC)/../libinstaller
+-CFLAGS	 = $(GCCWARN) -Wno-sign-compare -D_FILE_OFFSET_BITS=64 \
++CFLAGS	 = $(CFLAGS_FOR_BUILD) $(GCCWARN) -Wno-sign-compare -D_FILE_OFFSET_BITS=64 \
+ 	   $(OPTFLAGS) $(INCLUDES)
+-LDFLAGS	 = 
++LDFLAGS	 = $(LDFLAGS_FOR_BUILD)
+ 
+ SRCS     = main.c \
+ 	   mountinfo.c \
+ 	   ../libinstaller/syslxmod.c \
+ 	   ../libinstaller/syslxopt.c \
+ 	   ../libinstaller/syslxcom.c \
+-	   ../libinstaller/syslxrw.c \
+ 	   ../libinstaller/setadv.c \
+ 	   ../libinstaller/advio.c \
+ 	   ../libinstaller/bootsect_bin.c \
+@@ -53,16 +52,16 @@ spotless: clean
+ installer: extlinux
+ 
+ extlinux: $(OBJS)
+-	$(CC) $(LDFLAGS) -o $@ $^
++	$(CC_FOR_BUILD) $(LDFLAGS) -o $@ $^
+ 
+ strip:
+ 	$(STRIP) extlinux
+ 
+ %.o: %.c
+-	$(CC) $(UMAKEDEPS) $(CFLAGS) -c -o $@ $<
++	$(CC_FOR_BUILD) $(UMAKEDEPS) $(CFLAGS) -c -o $@ $<
+ %.i: %.c
+-	$(CC) $(UMAKEDEPS) $(CFLAGS) -E -o $@ $<
++	$(CC_FOR_BUILD) $(UMAKEDEPS) $(CFLAGS) -E -o $@ $<
+ %.s: %.c
+-	$(CC) $(UMAKEDEPS) $(CFLAGS) -S -o $@ $<
++	$(CC_FOR_BUILD) $(UMAKEDEPS) $(CFLAGS) -S -o $@ $<
+ 
+ -include .*.d
+-- 
+2.13.5
+
-- 
2.13.5
