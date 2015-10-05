From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Oct 2015 15:59:01 +0100
Subject: [Buildroot] [git commit] nettle: bump to version 3.1.1
Message-ID: <20151005145917.2A6A681E5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8eaafb78ad7925e37c51b2aeb968973abd35b18d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

API is now compatible with nettle 2.7.x

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...patch => 0001-disable-testsuite-examples.patch} |    0
 package/nettle/0001-fix-shared-only-build.patch    |   75 --------------------
 package/nettle/nettle.hash                         |    2 +-
 package/nettle/nettle.mk                           |   15 +---
 4 files changed, 5 insertions(+), 87 deletions(-)

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
index a25bb24..67ae0a1 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-NETTLE_VERSION = 2.7.1
+NETTLE_VERSION = 3.1.1
 NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
-NETTLE_LICENSE = LGPLv2.1+
-NETTLE_LICENSE_FILES = COPYING.LIB
+NETTLE_LICENSE = Dual GPLv2+/LGPLv3+
+NETTLE_LICENSE_FILES = COPYING.LESSERv3 COPYINGv2
 # don't include openssl support for (unused) examples as it has problems
 # with static linking
 NETTLE_CONF_OPTS = --disable-openssl
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
