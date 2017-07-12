From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 12 Jul 2017 21:43:51 +0200
Subject: [Buildroot] [PATCH] uboot-tools: bump to version 2017.07
Message-ID: <20170712194351.20701-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch 0005 which has been fixed upstream in a different way [1] by only
building the Python libfdt library when needed [2].

[1] https://patchwork.ozlabs.org/patch/757380/
[2] https://www.mail-archive.com/u-boot at lists.denx.de/msg251051.html

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...nditionally-disable-python-libfdt-wrapper.patch | 44 ----------------------
 package/uboot-tools/uboot-tools.hash               |  2 +-
 package/uboot-tools/uboot-tools.mk                 |  7 +---
 3 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 package/uboot-tools/0005-tools-conditionally-disable-python-libfdt-wrapper.patch

diff --git a/package/uboot-tools/0005-tools-conditionally-disable-python-libfdt-wrapper.patch b/package/uboot-tools/0005-tools-conditionally-disable-python-libfdt-wrapper.patch
deleted file mode 100644
index e48f72b7b9..0000000000
--- a/package/uboot-tools/0005-tools-conditionally-disable-python-libfdt-wrapper.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 4dc3139cc9fa12882792053bdce7b69aca9b91bf Mon Sep 17 00:00:00 2001
-From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Mon, 1 May 2017 22:19:57 -0500
-Subject: [PATCH] tools: conditionally disable python libfdt wrapper
-
-Not all host systems want the default swig to be
-used when building the tools.  Allow for the
-disabling of the wrapper to enable cross-compiling
-of the tools on a host system with swig.
-
-Upsteam submission for RFC:
-https://lists.denx.de/pipermail/u-boot/2017-May/289520.html
-
-Workaround for:
-http://autobuild.buildroot.net/results/6d5/6d52ac8bb71012aea6fc4c679691b31a3366728b
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- tools/Makefile | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tools/Makefile b/tools/Makefile
-index 2fc4a58..7f6c29d 100644
---- a/tools/Makefile
-+++ b/tools/Makefile
-@@ -114,6 +114,7 @@ fit_check_sign-objs   := $(dumpimage-mkimage-objs) fit_check_sign.o
- 
- # Build a libfdt Python module if swig is available
- # Use 'sudo apt-get install swig libpython-dev' to enable this
-+ifndef CONFIG_TOOLS_PYTHON_WRAPPER_DISABLE
- hostprogs-y += \
- 	$(if $(shell which swig 2> /dev/null),_libfdt.so)
- _libfdt.so-sharedobjs += $(LIBFDT_OBJS)
-@@ -126,6 +127,7 @@ tools/_libfdt.so: $(patsubst %.o,%.c,$(LIBFDT_OBJS)) tools/libfdt_wrap.c
- 
- tools/libfdt_wrap.c: $(srctree)/lib/libfdt/libfdt.swig
- 	swig -python -o $@ $<
-+endif
- 
- # TODO(sjg@chromium.org): Is this correct on Mac OS?
- 
--- 
-1.9.1
-
diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
index e11d92ff15..3ba8e34ba0 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  c8373949d7f0de1059e507b83a655d4cea539f75dc66ccdbb27adbd38d83095e  u-boot-2017.05.tar.bz2
+sha256  5374bfdc8acb9a38c025371b1ff20f45e7533668e84e685d0df5d9e7c0e4feff  u-boot-2017.07.tar.bz2
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 1327a06525..4f39f4ad2c 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2017.05
+UBOOT_TOOLS_VERSION = 2017.07
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPL-2.0+
@@ -21,11 +21,6 @@ UBOOT_TOOLS_MAKE_OPTS = CROSS_COMPILE="$(TARGET_CROSS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	STRIP=$(TARGET_STRIP)
 
-# This option was added through an additional patch
-# and allows the disabling of a host python swig
-# detect which as of 2017.5 assumes the host systems swig.
-UBOOT_TOOLS_MAKE_OPTS += CONFIG_TOOLS_PYTHON_WRAPPER_DISABLE=y
-
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),y)
 UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y
 UBOOT_TOOLS_DEPENDENCIES += dtc
-- 
2.13.2
