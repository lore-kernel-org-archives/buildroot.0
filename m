From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  2 Apr 2014 21:46:21 +0200
Subject: [Buildroot] [PATCH v2 06/41] flac: version bump 1.3.0,
	add sse support
In-Reply-To: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396468015-1724-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/flac/flac-no-altivec.patch |   28 ----------------------------
 package/flac/flac.mk               |   16 +++++++++++++---
 2 files changed, 13 insertions(+), 31 deletions(-)
 delete mode 100644 package/flac/flac-no-altivec.patch

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
index 95cd5a1..69e4a90 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -4,19 +4,29 @@
 #
 ################################################################################
 
-FLAC_VERSION = 1.2.1
-FLAC_SITE = http://downloads.sourceforge.net/project/flac/flac-src/flac-$(FLAC_VERSION)-src
+FLAC_VERSION = 1.3.0
+FLAC_SOURCE = flac-$(FLAC_VERSION).tar.xz
+FLAC_SITE = http://downloads.xiph.org/releases/flac
 FLAC_INSTALL_STAGING = YES
 
 FLAC_CONF_OPT = \
 	--disable-cpplibs \
 	--disable-xmms-plugin
 
+ifeq ($(BR2_X86_CPU_HAS_SSE),y)
+FLAC_DEPENDENCIES += host-nasm
+FLAC_CONF_OPT += --enable-sse
+else
+FLAC_CONF_OPT += --disable-sse
+endif
+
 ifeq ($(BR2_PACKAGE_LIBOGG),y)
 FLAC_CONF_OPT += --with-ogg=$(STAGING_DIR)/usr
-FLAC_DEPENDENCIES = libogg
+FLAC_DEPENDENCIES += libogg
 else
 FLAC_CONF_OPT += --disable-ogg
 endif
 
+FLAC_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+
 $(eval $(autotools-package))
-- 
1.7.10.4
