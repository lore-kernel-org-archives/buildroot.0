From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Mar 2020 23:49:49 +0100
Subject: [Buildroot] [git commit] package/classpath: drop package
Message-ID: <20200303224447.2DE9D8F2F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8fd0b242b1c015b8f20375fd622071bd86fbbf8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package has been abandoned by upstream since 2016 and has not
had a release since 2012. In addition the GNU Compiler for Java
that classpath was written to be used with has been removed as of
GCC 7.

It is no longer feasible to support classpath as it requires a java
compiler capable of producing java 1.5 compatible bytecode which is
not possible on hosts with a recent java compiler.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                 |  8 ++++++
 package/Config.in                |  1 -
 package/classpath/Config.in      | 19 --------------
 package/classpath/classpath.hash |  4 ---
 package/classpath/classpath.mk   | 55 ----------------------------------------
 5 files changed, 8 insertions(+), 79 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0238fbcb24..b925e563d3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -152,6 +152,14 @@ config BR2_PACKAGE_JAMVM
 	help
 	  JamVM has not had a release since 2014 and is unmaintained.
 
+config BR2_PACKAGE_CLASSPATH
+	bool "classpath removed"
+	select BR2_LEGACY
+	help
+	  GNU Classpath package was removed. The last upstream
+	  release was in 2012 and there hasn't been a commit
+	  since 2016.
+
 config BR2_PACKAGE_QT5_VERSION_5_6
 	bool "qt 5.6 support removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 564a60c617..edf7687ab7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1752,7 +1752,6 @@ menu "Other"
 	source "package/cereal/Config.in"
 	source "package/clang/Config.in"
 	source "package/clapack/Config.in"
-	source "package/classpath/Config.in"
 	source "package/cmocka/Config.in"
 	source "package/cppcms/Config.in"
 	source "package/cracklib/Config.in"
diff --git a/package/classpath/Config.in b/package/classpath/Config.in
deleted file mode 100644
index 0385ccd431..0000000000
--- a/package/classpath/Config.in
+++ /dev/null
@@ -1,19 +0,0 @@
-config BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS
-	bool
-	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_m68k \
-		|| BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el \
-		|| BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le \
-		|| BR2_sparc || BR2_sparc64 || BR2_sh || BR2_x86_64
-
-config BR2_PACKAGE_CLASSPATH
-	bool "classpath"
-	depends on BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS
-	select BR2_NEEDS_HOST_JAR
-	select BR2_NEEDS_HOST_JAVAC
-	help
-	  GNU Classpath, Essential Libraries for Java, is a GNU
-	  project to create free core class libraries for use with
-	  virtual machines and compilers for the java programming
-	  language.
-
-	  http://classpath.org
diff --git a/package/classpath/classpath.hash b/package/classpath/classpath.hash
deleted file mode 100644
index 98a7f1eab0..0000000000
--- a/package/classpath/classpath.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From https://www.gnu.org/software/classpath/announce/20120307.html
-sha256  f929297f8ae9b613a1a167e231566861893260651d913ad9b6c11933895fecc8  classpath-0.99.tar.gz
-# locally computed
-sha256  357bd31f17c7869a73cd159e46b3dafa2bbf434f022085a820c1f68d941a0b4c  COPYING
diff --git a/package/classpath/classpath.mk b/package/classpath/classpath.mk
deleted file mode 100644
index 7177bbfe06..0000000000
--- a/package/classpath/classpath.mk
+++ /dev/null
@@ -1,55 +0,0 @@
-################################################################################
-#
-# classpath
-#
-################################################################################
-
-CLASSPATH_VERSION = 0.99
-CLASSPATH_SITE = $(BR2_GNU_MIRROR)/classpath
-CLASSPATH_CONF_OPTS = \
-	--disable-examples \
-	--disable-rpath \
-	--disable-Werror \
-	--disable-gconf-peer \
-	--disable-gjdoc \
-	--disable-gstreamer-peer \
-	--enable-tools
-
-# classpath assumes qt runs on top of X11, but we
-# don't support qt4 on X11
-CLASSPATH_CONF_OPTS += --disable-qt-peer
-CLASSPATH_DEPENDENCIES = host-pkgconf
-CLASSPATH_LICENSE = GPL-2.0+ with exception
-CLASSPATH_LICENSE_FILES = COPYING
-
-# Needs ALSA pcm and sequencer (midi) support
-# pcm is always on for alsa-lib
-ifeq ($(BR2_PACKAGE_ALSA_LIB_SEQ),y)
-CLASSPATH_CONF_OPTS += --enable-alsa
-CLASSPATH_DEPENDENCIES += alsa-lib
-else
-CLASSPATH_CONF_OPTS += --disable-alsa
-endif
-
-ifeq ($(BR2_PACKAGE_GMP),y)
-CLASSPATH_CONF_OPTS += --enable-gmp --with-gmp="$(STAGING_DIR)/usr"
-CLASSPATH_DEPENDENCIES += gmp
-else
-CLASSPATH_CONF_OPTS += --disable-gmp
-endif
-
-ifeq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_XORG7),yy)
-CLASSPATH_CONF_OPTS += --enable-gtk-peer
-CLASSPATH_DEPENDENCIES += libgtk2
-else
-CLASSPATH_CONF_OPTS += --disable-gtk-peer
-endif
-
-ifeq ($(BR2_PACKAGE_LIBXML2)$(BR2_PACKAGE_LIBXSLT)$(BR2_TOOLCHAIN_HAS_THREADS),yyy)
-CLASSPATH_CONF_OPTS += --enable-xmlj
-CLASSPATH_DEPENDENCIES += libxml2 libxslt
-else
-CLASSPATH_CONF_OPTS += --disable-xmlj
-endif
-
-$(eval $(autotools-package))
