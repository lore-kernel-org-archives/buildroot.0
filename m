From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Apr 2014 07:55:05 -0300
Subject: [Buildroot] [PATCH] flac: bump to version 1.3.0
Message-ID: <1397213705-30850-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/flac/flac-01-fix-altivec-logic.patch | 32 ++++++++++++++++++++++++++++
 package/flac/flac-no-altivec.patch           | 28 ------------------------
 package/flac/flac.mk                         | 22 ++++++++++++++-----
 3 files changed, 49 insertions(+), 33 deletions(-)
 create mode 100644 package/flac/flac-01-fix-altivec-logic.patch
 delete mode 100644 package/flac/flac-no-altivec.patch

diff --git a/package/flac/flac-01-fix-altivec-logic.patch b/package/flac/flac-01-fix-altivec-logic.patch
new file mode 100644
index 0000000..a1ac8a1
--- /dev/null
+++ b/package/flac/flac-01-fix-altivec-logic.patch
@@ -0,0 +1,32 @@
+From d65ede3e874c79348efc85cf3a185c170046c4c8 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 4 Dec 2013 13:31:28 -0300
+Subject: [PATCH] Fix Makefile.am altivec logic
+
+Besides SPE (FSL e500v? cores) there are other powerpc processors
+that don't support altivec instructions so only enable them when it's
+100% sure that the target has it.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Erik de Castro Lopo <erikd@mega-nerd.com>
+---
+ src/libFLAC/Makefile.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/libFLAC/Makefile.am b/src/libFLAC/Makefile.am
+index 247e33c..258de40 100644
+--- a/src/libFLAC/Makefile.am
++++ b/src/libFLAC/Makefile.am
+@@ -47,8 +47,7 @@ CPUCFLAGS = -faltivec -force_cpusubtype_ALL -DFLAC__NO_ASM
+ else
+ # Linux-gcc for PPC does not have -force_cpusubtype_ALL, it is Darwin-specific
+ CPUCFLAGS =
+-if FLaC__CPU_PPC_SPE
+-else
++if FLaC__USE_ALTIVEC
+ CPUCFLAGS += -maltivec -mabi=altivec
+ endif
+ #@@@ PPC optimizations temporarily disabled
+-- 
+1.8.3.2
+
diff --git a/package/flac/flac-no-altivec.patch b/package/flac/flac-no-altivec.patch
deleted file mode 100644
index c6a535b..0000000
--- a/package/flac/flac-no-altivec.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-FLAC assumes every powerpc around has altivec ABI which is wrong.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura flac-1.2.1/src/libFLAC/Makefile.am flac-1.2.1-noaltivec/src/libFLAC/Makefile.am
---- flac-1.2.1/src/libFLAC/Makefile.am	2007-09-14 18:06:17.000000000 -0300
-+++ flac-1.2.1-noaltivec/src/libFLAC/Makefile.am	2011-01-06 15:14:36.384242614 -0300
-@@ -41,7 +41,7 @@
- else
- # Linux-gcc for PPC does not have -force_cpusubtype_ALL, it is Darwin-specific
- #@@@ PPC optimizations temporarily disabled
--CPUCFLAGS = -maltivec -mabi=altivec -DFLAC__NO_ASM
-+CPUCFLAGS = -DFLAC__NO_ASM
- endif
- endif
- 
-diff -Nura flac-1.2.1/src/libFLAC/Makefile.in flac-1.2.1-noaltivec/src/libFLAC/Makefile.in
---- flac-1.2.1/src/libFLAC/Makefile.in	2007-09-16 17:05:12.000000000 -0300
-+++ flac-1.2.1-noaltivec/src/libFLAC/Makefile.in	2011-01-06 15:14:50.997545602 -0300
-@@ -240,7 +240,7 @@
- @FLaC__CPU_PPC_TRUE@@FLaC__SYS_DARWIN_TRUE at CPUCFLAGS = -faltivec -force_cpusubtype_ALL -DFLAC__NO_ASM
- # Linux-gcc for PPC does not have -force_cpusubtype_ALL, it is Darwin-specific
- #@@@ PPC optimizations temporarily disabled
-- at FLaC__CPU_PPC_TRUE@@FLaC__SYS_DARWIN_FALSE at CPUCFLAGS = -maltivec -mabi=altivec -DFLAC__NO_ASM
-+ at FLaC__CPU_PPC_TRUE@@FLaC__SYS_DARWIN_FALSE at CPUCFLAGS = -DFLAC__NO_ASM
- 
- AM_CFLAGS = $(DEBUGCFLAGS) $(CPUCFLAGS) @OGG_CFLAGS@
- @FLaC__CPU_PPC_TRUE@@FLaC__NO_ASM_FALSE at ARCH_SUBDIRS = ppc
diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index 95cd5a1..9db3534 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -4,19 +4,31 @@
 #
 ################################################################################
 
-FLAC_VERSION = 1.2.1
-FLAC_SITE = http://downloads.sourceforge.net/project/flac/flac-src/flac-$(FLAC_VERSION)-src
+FLAC_VERSION = 1.3.0
+FLAC_SITE = http://downloads.xiph.org/releases/flac
+FLAC_SOURCE = flac-$(FLAC_VERSION).tar.xz
 FLAC_INSTALL_STAGING = YES
-
+FLAC_AUTORECONF = YES
+FLAC_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+FLAC_LICENSE = Xiph BSD-like (libFLAC), GPLv2+ (tools), LGPLv2.1+ (other libraries)
+FLAC_LICENSE_FILES = COPYING.Xiph COPYING.GPL COPYING.LGPL
 FLAC_CONF_OPT = \
 	--disable-cpplibs \
-	--disable-xmms-plugin
+	--disable-xmms-plugin \
+	--disable-altivec
 
 ifeq ($(BR2_PACKAGE_LIBOGG),y)
 FLAC_CONF_OPT += --with-ogg=$(STAGING_DIR)/usr
-FLAC_DEPENDENCIES = libogg
+FLAC_DEPENDENCIES += libogg
 else
 FLAC_CONF_OPT += --disable-ogg
 endif
 
+ifeq ($(BR2_X86_CPU_HAS_SSE),y)
+FLAC_DEPENDENCIES += host-nasm
+FLAC_CONF_OPT += --enable-sse
+else
+FLAC_CONF_OPT += --disable-sse
+endif
+
 $(eval $(autotools-package))
-- 
1.8.3.2
