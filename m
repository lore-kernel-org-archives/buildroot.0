From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jan 2013 21:25:26 +0100
Subject: [Buildroot] [RFC v1 02/14] package infrastructure: move subdir
	support to autotools
In-Reply-To: <1358713538-4364-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358713538-4364-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358713538-4364-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The <pkg>_SUBDIR variable was currently somewhat handled at the
generic package infrastructure level, with the $(PKG)_SRCDIR variable
taking into account this SUBDIR. But in fact, this <pkg>_SUBDIR
variable only makes sense in the context of the autotools
infrastructure, to indicate that the configure script is not located
at the root of the source tree, but instead in a sub-directory. In the
case of generic packages, the package .mk file already has enough
freedom to handle bizarre situations where the Makefile or other parts
of the build system may not be located at the root of the package
source tree.

In order to simplify the introduction of out of tree support, we
therefore move the SUBDIR support as an autotools infrastructure
specific feature.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-autotools.mk |   30 ++++++++++++++++++++----------
 package/pkg-generic.mk   |   11 +----------
 2 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 890506b..843239d 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -70,6 +70,16 @@ ifndef $(2)_MAKE
  endif
 endif
 
+ifndef $(2)_SUBDIR
+ ifdef $(3)_SUBDIR
+  $(2)_SUBDIR = $$($(3)_SUBDIR)
+ else
+  $(2)_SUBDIR ?=
+ endif
+endif
+
+$(2)_SRCSUBDIR = $$($(2)_SRCDIR)/$($(2)_SUBDIR)
+
 $(2)_CONF_ENV			?=
 $(2)_CONF_OPT			?=
 $(2)_MAKE_ENV			?=
@@ -93,7 +103,7 @@ ifeq ($(5),target)
 
 # Configure package for target
 define $(2)_CONFIGURE_CMDS
-	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache && \
+	(cd $$($$(PKG)_SRCSUBDIR) && rm -rf config.cache && \
 	$$(TARGET_CONFIGURE_OPTS) \
 	$$(TARGET_CONFIGURE_ARGS) \
 	$$($$(PKG)_CONF_ENV) \
@@ -120,7 +130,7 @@ else
 # because it often relies on host tools which may or may not be
 # installed.
 define $(2)_CONFIGURE_CMDS
-	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache; \
+	(cd $$($$(PKG)_SRCSUBDIR) && rm -rf config.cache; \
 	        $$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$$(HOST_CFLAGS)" \
 		LDFLAGS="$$(HOST_LDFLAGS)" \
@@ -216,11 +226,11 @@ endif
 ifndef $(2)_BUILD_CMDS
 ifeq ($(5),target)
 define $(2)_BUILD_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_SRCSUBDIR)
 endef
 else
 define $(2)_BUILD_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_SRCSUBDIR)
 endef
 endif
 endif
@@ -231,7 +241,7 @@ endif
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) -C $$($$(PKG)_SRCDIR) install
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) -C $$($$(PKG)_SRCSUBDIR) install
 endef
 endif
 
@@ -241,7 +251,7 @@ endif
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCSUBDIR)
 	for i in $$$$(find $(STAGING_DIR)/usr/lib* -name "*.la"); do \
 		cp -f $$$$i $$$$i~; \
 		$$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \
@@ -255,7 +265,7 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_SRCSUBDIR)
 endef
 endif
 
@@ -265,7 +275,7 @@ endif
 #
 ifndef $(2)_CLEAN_CMDS
 define $(2)_CLEAN_CMDS
-	-$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE)  $$($$(PKG)_CLEAN_OPT) -C $$($$(PKG)_SRCDIR)
+	-$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE)  $$($$(PKG)_CLEAN_OPT) -C $$($$(PKG)_SRCSUBDIR)
 endef
 endif
 
@@ -275,7 +285,7 @@ endif
 #
 ifndef $(2)_UNINSTALL_STAGING_CMDS
 define $(2)_UNINSTALL_STAGING_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_UNINSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_UNINSTALL_STAGING_OPT) -C $$($$(PKG)_SRCSUBDIR)
 endef
 endif
 
@@ -288,7 +298,7 @@ endif
 #
 ifndef $(2)_UNINSTALL_TARGET_CMDS
 define $(2)_UNINSTALL_TARGET_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) -k $$($$(PKG)_UNINSTALL_TARGET_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) -k $$($$(PKG)_UNINSTALL_TARGET_OPT) -C $$($$(PKG)_SRCSUBDIR)
 endef
 endif
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 59de0f0..eeaa4fe 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -218,16 +218,7 @@ endif
 $(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
 $(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
 $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
-
-ifndef $(2)_SUBDIR
- ifdef $(3)_SUBDIR
-  $(2)_SUBDIR = $$($(3)_SUBDIR)
- else
-  $(2)_SUBDIR ?=
- endif
-endif
-
-$(2)_SRCDIR		       = $$($(2)_DIR)/$$($(2)_SUBDIR)
+$(2)_SRCDIR		       = $$($(2)_DIR)
 $(2)_BUILDDIR		       ?= $$($(2)_SRCDIR)
 
 ifneq ($$($(2)_OVERRIDE_SRCDIR),)
-- 
1.7.9.5
