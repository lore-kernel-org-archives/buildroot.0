From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 May 2017 18:25:58 +0200
Subject: [Buildroot] [PATCH] libgpiod: bump version to 0.2
Message-ID: <1494433558-5480-1-git-send-email-brgl@bgdev.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New release adds a couple new features and improvements, although the
most important one - the test suite - doesn't really matter for
buildroot.

The project has also been relicensed under LGPLv2.1.

We need the m4 directory fixup now since the AC_CONFIG_MACRO_DIRS([m4])
macro was used in configure.ac, but we don't want to have unnecessary
files in the git repo.

New features:
- relicensed under LGPLv2.1
- implemented a unit testing framework together with a comprehensive
  set of test cases
- added a non-closing variant of the gpiochip iterator and foreach
  macro [by Clemens Gruber]
- added gpiod_chip_open_by_label()

Improvements:
- Makefiles & build commands have been reworked [by Thierry Reding]
- documentation updates
- code shrinkage here and there
- coding style fixes
- removed all designated initializers from the header for better standards
  compliance

Bug fixes:
- fix the return value of gpiod_simple_event_loop()
- don't try to process docs if doxygen is not installed

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 package/libgpiod/libgpiod.hash |  2 +-
 package/libgpiod/libgpiod.mk   | 11 +++++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index eee2a66..fcf212e 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 670a13518fabf2a99f9e349c33d5421c2146eec15b73c5edef3f1981a7adaeda libgpiod-v0.1.3.tar.gz
+sha256 de1947f3cb2cc4174364af430309fe6238976658575655bdbd76c60cffa7df92 libgpiod-v0.2.tar.gz
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index 0947a4a..c95ea44 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -4,10 +4,17 @@
 #
 ################################################################################
 
-LIBGPIOD_VERSION = v0.1.3
+LIBGPIOD_VERSION = v0.2
 LIBGPIOD_SITE = $(call github,brgl,libgpiod,$(LIBGPIOD_VERSION))
-LIBGPIOD_LICENSE = GPL-3.0+
+LIBGPIOD_LICENSE = LGPL-2.1+
 LIBGPIOD_LICENSE_FILES = COPYING
+
+# Needed for autoreconf to work properly
+define LIBGPIOD_FIXUP_M4_DIR
+        mkdir $(@D)/m4
+endef
+LIBGPIOD_POST_EXTRACT_HOOKS += LIBGPIOD_FIXUP_M4_DIR
+
 # fetched from github, no configure script provided
 LIBGPIOD_AUTORECONF = YES
 
-- 
2.9.3
