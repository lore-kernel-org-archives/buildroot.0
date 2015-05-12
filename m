From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 12 May 2015 23:51:23 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/harfbuzz: disable test programs
Message-ID: <1431467484-14459-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Workaround a build issue by disabling all test
binaries since it forget to link with -lstd++.

Add a new configure option to disable test programs
in a upstreamable way.

Fixes:
http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef521ca/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v2: reword commit log
---
 .../0001-autotools-add-disable-tests-option.patch  | 57 ++++++++++++++++++++++
 package/harfbuzz/harfbuzz.mk                       |  6 ++-
 2 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 package/harfbuzz/0001-autotools-add-disable-tests-option.patch

diff --git a/package/harfbuzz/0001-autotools-add-disable-tests-option.patch b/package/harfbuzz/0001-autotools-add-disable-tests-option.patch
new file mode 100644
index 0000000..59a7b5a
--- /dev/null
+++ b/package/harfbuzz/0001-autotools-add-disable-tests-option.patch
@@ -0,0 +1,57 @@
+From 4641f22b2297fdbf4206ccaea971868301887aa7 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Fri, 8 May 2015 15:58:51 +0200
+Subject: [PATCH] autotools: add --disable-tests option
+
+Disable all test programs in order to only build harfbuzz
+librarie and speed up the build time.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ Makefile.am  |  6 +++++-
+ configure.ac | 12 ++++++++++++
+ 2 files changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 47aeb97..0f8ee46 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -4,7 +4,11 @@ NULL =
+ 
+ ACLOCAL_AMFLAGS = -I m4
+ 
+-SUBDIRS = src util test docs
++SUBDIRS = src util docs
++
++if WITH_TESTS
++SUBDIRS += test
++endif
+ 
+ EXTRA_DIST = \
+ 	autogen.sh \
+diff --git a/configure.ac b/configure.ac
+index 5baad1f..b15f31e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -408,6 +408,18 @@ fi
+ 
+ dnl ===========================================================================
+ 
++AC_ARG_ENABLE([tests],
++  AS_HELP_STRING([--enable-tests], [build tests [default=yes]]),
++  [], enable_tests=yes
++)
++have_tests=yes
++if test "$enable_tests" = "no"; then
++  have_tests="no"
++fi
++AM_CONDITIONAL(WITH_TESTS, [test "$have_tests" = "yes"])
++
++dnl ===========================================================================
++
+ AC_CONFIG_FILES([
+ Makefile
+ src/Makefile
+-- 
+1.9.3
+
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 9cfd613..3f0b028 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -10,7 +10,8 @@ HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
 HARFBUZZ_LICENSE_FILES = COPYING src/hb-ucdn/COPYING
 HARFBUZZ_INSTALL_STAGING = YES
-HARFBUZZ_CONF_OPTS = --without-coretext --without-uniscribe --without-graphite2
+HARFBUZZ_CONF_OPTS = --disable-tests --without-coretext --without-uniscribe \
+	--without-graphite2
 
 # freetype & glib2 support required by host-pango
 HOST_HARFBUZZ_DEPENDENCIES = \
@@ -23,7 +24,8 @@ HOST_HARFBUZZ_CONF_OPTS = \
 	--with-cairo=no \
 	--with-icu=no \
 	--with-freetype=yes \
-	--with-glib=yes
+	--with-glib=yes \
+	--disable-tests
 
 # beta libtool version
 HARFBUZZ_AUTORECONF = YES
-- 
1.9.3
