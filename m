From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 19:28:42 +0200
Subject: [Buildroot] [git commit] pkg-*targets.mk: factorize and fix
	$(PKG)_SRCDIR and $(PKG)_BUILDDIR declaration
Message-ID: <20120722182025.E29919692E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ba9bfb9a02706fa414bcf4c6dcceac1b68a5c9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-autotools.mk |   10 ----------
 package/pkg-cmake.mk     |    9 ---------
 package/pkg-generic.mk   |   11 +++++++++++
 3 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index e454050..785daab 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -54,15 +54,6 @@ endef
 
 define inner-autotools-package
 
-# define package-specific variables to default values
-ifndef $(2)_SUBDIR
- ifdef $(3)_SUBDIR
-  $(2)_SUBDIR = $($(3)_SUBDIR)
- else
-  $(2)_SUBDIR ?=
- endif
-endif
-
 ifndef $(2)_LIBTOOL_PATCH
  ifdef $(3)_LIBTOOL_PATCH
   $(2)_LIBTOOL_PATCH = $($(3)_LIBTOOL_PATCH)
@@ -91,7 +82,6 @@ $(2)_CLEAN_OPT			?= clean
 $(2)_UNINSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) uninstall
 $(2)_UNINSTALL_TARGET_OPT	?= DESTDIR=$$(TARGET_DIR)  uninstall
 
-$(2)_SRCDIR                     = $$($(2)_DIR)/$$($(2)_SUBDIR)
 
 #
 # Configure step. Only define it if not already defined by the package
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index f9a5934..626a0b0 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -37,15 +37,6 @@
 
 define inner-cmake-package
 
-# define package-specific variables to default values
-ifndef $(2)_SUBDIR
- ifdef $(3)_SUBDIR
-  $(2)_SUBDIR = $($(3)_SUBDIR)
- else
-  $(2)_SUBDIR ?=
- endif
-endif
-
 $(2)_CONF_ENV			?=
 $(2)_CONF_OPT			?=
 $(2)_MAKE			?= $(MAKE)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index c01440e..8a730c0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -204,6 +204,17 @@ $(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
 $(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
 $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
 
+ifndef $(3)_SUBDIR
+ ifdef $(2)_SUBDIR
+  $(3)_SUBDIR = $$($(2)_SUBDIR)
+ else
+  $(3)_SUBDIR ?=
+ endif
+endif
+
+$(2)_SRCDIR		       = $$($(2)_DIR)/$$($(2)_SUBDIR)
+$(2)_BUILDDIR		       ?= $$($(2)_SRCDIR)
+
 ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 $(2)_VERSION = custom
 endif
