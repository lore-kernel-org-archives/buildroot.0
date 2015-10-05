From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  5 Oct 2015 10:49:30 -0300
Subject: [Buildroot] [PATCH 2/2] nettle: bump to version 3.1.1
In-Reply-To: <1444052970-26682-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444052970-26682-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1444052970-26682-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

API is now compatible with nettle 2.7.x

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...patch => 0001-disable-testsuite-examples.patch} |  0
 package/nettle/0001-fix-shared-only-build.patch    | 75 ----------------------
 package/nettle/nettle.hash                         |  2 +-
 package/nettle/nettle.mk                           | 11 +---
 4 files changed, 3 insertions(+), 85 deletions(-)
 rename package/nettle/{0002-disable-testsuite-examples.patch => 0001-disable-testsuite-examples.patch} (100%)
 delete mode 100644 package/nettle/0001-fix-shared-only-build.patch

diff --git a/package/nettle/0002-disable-testsuite-examples.patch b/package/nettle/0001-disable-testsuite-examples.patch
similarity index 100%
rename from package/nettle/0002-disable-testsuite-examples.patch
rename to package/nettle/0001-disable-testsuite-examples.patch
diff --git a/package/nettle/0001-fix-shared-only-build.patch b/package/nettle/0001-fix-shared-only-build.patch
deleted file mode 100644
index 3c9b186..0000000
--- a/package/nettle/0001-fix-shared-only-build.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-static/shared: use available libraries when linking our tools/examples/testsuite
-
-For a shared-only build, static libraries do not exist, so the build fails as
-soon as we try to link either of our tools, examples or testsuite utils.
-
-Use whatever libraries are available, with a preference toward using shared
-libraries.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN nettle-2.7.1.orig/config.make.in nettle-2.7.1/config.make.in
---- nettle-2.7.1.orig/config.make.in	2013-05-28 16:21:53.000000000 +0200
-+++ nettle-2.7.1/config.make.in	2014-12-12 19:56:07.031292752 +0100
-@@ -30,6 +30,8 @@
- PACKAGE_VERSION = @PACKAGE_VERSION@
- 
- SHLIBCFLAGS = @SHLIBCFLAGS@
-+ at IF_STATIC@LIBS_EXT = .a
-+ at IF_SHARED@LIBS_EXT = .so
- 
- LIBNETTLE_MAJOR = @LIBNETTLE_MAJOR@
- LIBNETTLE_MINOR = @LIBNETTLE_MINOR@
-diff -durN nettle-2.7.1.orig/tools/Makefile.in nettle-2.7.1/tools/Makefile.in
---- nettle-2.7.1.orig/tools/Makefile.in	2013-05-28 16:21:54.000000000 +0200
-+++ nettle-2.7.1/tools/Makefile.in	2014-12-12 19:57:12.499805574 +0100
-@@ -34,19 +34,19 @@
- DISTFILES = $(SOURCES) Makefile.in input.h misc.h output.h parse.h
- 
- sexp_conv_OBJS = $(sexp_conv_SOURCES:.c=.$(OBJEXT)) $(getopt_OBJS)
--sexp-conv$(EXEEXT): $(sexp_conv_OBJS) ../libnettle.a
-+sexp-conv$(EXEEXT): $(sexp_conv_OBJS) ../libnettle$(LIBS_EXT)
- 	$(LINK) $(sexp_conv_OBJS) -lnettle $(LIBS) -o $@
- 
--nettle-lfib-stream$(EXEEXT): nettle-lfib-stream.$(OBJEXT) ../libnettle.a
-+nettle-lfib-stream$(EXEEXT): nettle-lfib-stream.$(OBJEXT) ../libnettle$(LIBS_EXT)
- 	$(LINK) nettle-lfib-stream.$(OBJEXT) -lnettle $(LIBS) -o $@
- 
- pkcs1_conv_OBJS = $(pkcs1_conv_SOURCES:.c=.$(OBJEXT)) $(getopt_OBJS)
--pkcs1-conv$(EXEEXT): $(pkcs1_conv_OBJS) ../libnettle.a ../libhogweed.a
-+pkcs1-conv$(EXEEXT): $(pkcs1_conv_OBJS) ../libnettle$(LIBS_EXT) ../libhogweed$(LIBS_EXT)
- 	$(LINK) $(pkcs1_conv_OBJS) -lhogweed -lnettle $(LIBS) -o $@
- 
- # FIXME: Avoid linking with gmp
- nettle_hash_OBJS = $(nettle_hash_SOURCES:.c=.$(OBJEXT)) $(getopt_OBJS)
--nettle-hash$(EXEEXT): $(nettle_hash_OBJS) ../libnettle.a
-+nettle-hash$(EXEEXT): $(nettle_hash_OBJS) ../libnettle$(LIBS_EXT)
- 	$(LINK) $(nettle_hash_OBJS) -lnettle $(LIBS) -o $@
- 
- 
-diff -durN nettle-2.7.1.orig/examples/Makefile.in nettle-2.7.1/examples/Makefile.in
---- nettle-2.7.1.orig/examples/Makefile.in	2013-05-28 16:21:54.000000000 +0200
-+++ nettle-2.7.1/examples/Makefile.in	2014-12-12 21:54:48.286251022 +0100
-@@ -117,8 +117,8 @@
- 	-lhogweed -lnettle $(BENCH_LIBS) $(LIBS) $(OPENSSL_LIBFLAGS) \
- 	-o hogweed-benchmark$(EXEEXT)
- 
--$(TARGETS) : io.$(OBJEXT) ../libnettle.a
--$(HOGWEED_TARGETS): ../libhogweed.a
-+$(TARGETS) : io.$(OBJEXT) ../libnettle$(LIBS_EXT)
-+$(HOGWEED_TARGETS): ../libhogweed$(LIBS_EXT)
- 
- check: $(TS_ALL)
- 	LD_LIBRARY_PATH=../.lib PATH="../.lib:$$PATH" srcdir="$(srcdir)" \
-diff -durN nettle-2.7.1.orig/testsuite/Makefile.in nettle-2.7.1/testsuite/Makefile.in
---- nettle-2.7.1.orig/testsuite/Makefile.in	2013-05-28 16:21:54.000000000 +0200
-+++ nettle-2.7.1/testsuite/Makefile.in	2014-12-12 21:55:30.414814549 +0100
-@@ -96,7 +96,7 @@
- include $(srcdir)/.test-rules.make
- 
- $(TARGETS) $(EXTRA_TARGETS): testutils.$(OBJEXT) ../nettle-internal.$(OBJEXT) \
--	../libnettle.a @IF_HOGWEED@ ../libhogweed.a
-+	../libnettle$(LIBS_EXT) @IF_HOGWEED@ ../libhogweed$(LIBS_EXT)
- 
- # For use as, e.g.,
- #
diff --git a/package/nettle/nettle.hash b/package/nettle/nettle.hash
index 34c3862..f506992 100644
--- a/package/nettle/nettle.hash
+++ b/package/nettle/nettle.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40	nettle-2.7.1.tar.gz
+sha256	5fd4d25d64d8ddcb85d0d897572af73b05b4d163c6cc49438a5bfbb8ff293d4c	nettle-3.1.1.tar.gz
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index a25bb24..97b7625 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETTLE_VERSION = 2.7.1
+NETTLE_VERSION = 3.1.1
 NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
@@ -19,17 +19,10 @@ ifeq ($(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV5),y)
 NETTLE_CONF_OPTS += --disable-assembler
 endif
 
-# ARM NEON, requires binutils 2.21+
-ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_TOOLCHAIN_BUILDROOT)$(BR2_BINUTILS_VERSION_2_20_1),yy)
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
 NETTLE_CONF_OPTS += --enable-arm-neon
 else
 NETTLE_CONF_OPTS += --disable-arm-neon
 endif
 
-define NETTLE_DITCH_DEBUGGING_CFLAGS
-	$(SED) '/CFLAGS/ s/ -ggdb3//' $(@D)/configure
-endef
-
-NETTLE_POST_EXTRACT_HOOKS += NETTLE_DITCH_DEBUGGING_CFLAGS
-
 $(eval $(autotools-package))
-- 
2.4.9
