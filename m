From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  6 Jun 2019 13:17:20 -0400
Subject: [Buildroot] [PATCH 1/1] package/libfribidi: bump to version v1.0.5
Message-ID: <20190606171720.79017-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Changes include:
  - Changing the URL to GitHub, as the old URL was no longer valid resulting in
    the tar file being the HTML from www.fribidi.org.

  - Switching the package to a meson package.

  - Adding fix-meson.patch from
    http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-support/fribidi/fribidi/meson.patch
    which fixes the error: "Can not use target gen-unicode-version as a
    generator because it is cross-built and no exe wrapper is defined."

  - Add a sha256 hash for the license file.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libfribidi/0001-fix-meson.patch | 42 +++++++++++++++++++++++++
 package/libfribidi/libfribidi.hash      |  5 +--
 package/libfribidi/libfribidi.mk        | 16 +++-------
 3 files changed, 50 insertions(+), 13 deletions(-)
 create mode 100644 package/libfribidi/0001-fix-meson.patch

diff --git a/package/libfribidi/0001-fix-meson.patch b/package/libfribidi/0001-fix-meson.patch
new file mode 100644
index 0000000000..638d2dd140
--- /dev/null
+++ b/package/libfribidi/0001-fix-meson.patch
@@ -0,0 +1,42 @@
+From f5feb6c599adb52f24656f8589868039b0d14272 Mon Sep 17 00:00:00 2001
+From: Heiko Becker <heirecka@exherbo.org>
+Date: Fri, 7 Sep 2018 20:57:11 +0200
+Subject: [PATCH] Build generator executables natively
+
+They are run during the build and not installed in the end. Without
+this one gets the following error from meson: "ERROR: Can not use
+target gen-unicode-version as a generator because it is cross-built
+and no exe wrapper is defined. You might want to set it to native
+instead."
+
+Closes #87.
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ gen.tab/meson.build | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/gen.tab/meson.build b/gen.tab/meson.build
+index 6006d98..8c21e98 100644
+--- a/gen.tab/meson.build
++++ b/gen.tab/meson.build
+@@ -33,7 +33,8 @@ gen_unicode_version = executable('gen-unicode-version',
+   'gen-unicode-version.c',
+   include_directories: incs,
+   c_args: native_args,
+-  install: false)
++  install: false,
++  native: true)
+ 
+ fribidi_unicode_version_h = custom_target('fribidi-unicode-version.h',
+   input: files('unidata/ReadMe.txt', 'unidata/BidiMirroring.txt'),
+@@ -67,7 +68,8 @@ foreach tab : tabs
+     gen_prog_src, 'packtab.c',
+     include_directories: incs,
+     c_args: native_args,
+-    install: false)
++    install: false,
++    native: true)
+ 
+   tab_inc_file = custom_target(gen_prog_name,
+     input: gen_prog_inputs,
diff --git a/package/libfribidi/libfribidi.hash b/package/libfribidi/libfribidi.hash
index 79b5dd3185..d2c71d0cfe 100644
--- a/package/libfribidi/libfribidi.hash
+++ b/package/libfribidi/libfribidi.hash
@@ -1,2 +1,3 @@
-# From http://www.fribidi.org/download/fribidi-0.19.7.tar.bz2.sha256
-sha256	08222a6212bbc2276a2d55c3bf370109ae4a35b689acbc66571ad2a670595a8e	fribidi-0.19.7.tar.bz2
+# Locally caclulated
+sha256	aee3a93d081c293eaca9157700f17dc780a0b6674bc911decc5aaa43aec9abd7	fribidi-v1.0.5.tar.gz
+sha256	32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b	COPYING
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index a7a8519181..a01ecf6953 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -4,19 +4,13 @@
 #
 ################################################################################
 
-LIBFRIBIDI_VERSION = 0.19.7
-LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.bz2
-LIBFRIBIDI_SITE = http://www.fribidi.org/download
+LIBFRIBIDI_VERSION = v1.0.5
+LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.gz
+LIBFRIBIDI_SITE = $(call github,fribidi,fribidi,$(LIBFRIBIDI_VERSION))
 LIBFRIBIDI_LICENSE = LGPL-2.1+
 LIBFRIBIDI_LICENSE_FILES = COPYING
 LIBFRIBIDI_INSTALL_STAGING = YES
-# Ships a beta libtool version hence our patch doesn't apply.
-# Run autoreconf to regenerate ltmain.sh.
-LIBFRIBIDI_AUTORECONF = YES
 LIBFRIBIDI_DEPENDENCIES = host-pkgconf
-# libglib2 dependency causes a build failure, and this optional
-# dependency is going to be removed upstream, see
-# https://github.com/behdad/fribidi/pull/14
-LIBFRIBIDI_CONF_OPTS = --with-glib=no
+LIBFRIBIDI_CONF_OPTS = -Ddocs=false
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.21.0
