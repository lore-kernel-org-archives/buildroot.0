From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 10 Jan 2014 11:06:03 +0100
Subject: [Buildroot] [PATCH v11 3/8] package: add support for top-level
	parallel make
In-Reply-To: <1389348368-2509-1-git-send-email-fabio.porcedda@gmail.com>
References: <1389348368-2509-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1389348368-2509-4-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be able to use top-level parallel make we must not depend in a rule
on the order of evaluation of the prerequisites, so instead of relying
on the left to right ordering of evaluation of the prerequisites add
an explicit rule to describe the dependencies.

We cannot use the pattern rules because they must have the same
dependency for every package, but we need to change the dependencies
depending on $(2)_OVERRIDE_SRCDIR variable value, so we must use a
more flexible way like $(2)_TARGET_% variables.

So add explicit dependencies for the following stamp files:
  $(2)_TARGET_EXTRACT
  $(2)_TARGET_PATCH
  $(2)_TARGET_CONFIGURE
  $(2)_TARGET_BUILD
  $(2)_TARGET_INSTALL_STAGING
  $(2)_TARGET_INSTALL_TARGET
  $(2)_TARGET_INSTALL_IMAGES
  $(2)_TARGET_INSTALL_HOST

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/glibc/glibc.mk   |  6 +++---
 package/pkg-generic.mk   | 40 +++++++++++++++++++++++-----------------
 package/uclibc/uclibc.mk |  6 +++---
 3 files changed, 29 insertions(+), 23 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 0968f67..3013df3 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -38,9 +38,6 @@ GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 # cross-compiler and the kernel headers
 GLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-gawk
 
-# Before (e)glibc is built, we must have the second stage cross-compiler
-glibc-build: host-gcc-intermediate
-
 GLIBC_SUBDIR = build
 
 GLIBC_INSTALL_STAGING = YES
@@ -142,3 +139,6 @@ define GLIBC_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(autotools-package))
+
+# Before (e)glibc is built, we must have the second stage cross-compiler
+$(GLIBC_TARGET_BUILD): | host-gcc-intermediate
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 63d3793..ff2d082 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -414,30 +414,37 @@ $(1)-install:		$(1)-install-staging $(1)-install-target $(1)-install-images
 endif
 
 ifeq ($$($(2)_INSTALL_TARGET),YES)
-$(1)-install-target:	$(1)-build \
-			$$($(2)_TARGET_INSTALL_TARGET)
+$(1)-install-target:	$$($(2)_TARGET_INSTALL_TARGET)
 else
 $(1)-install-target:
 endif
 
 ifeq ($$($(2)_INSTALL_STAGING),YES)
-$(1)-install-staging:	$(1)-build \
-			$$($(2)_TARGET_INSTALL_STAGING)
+$(1)-install-staging:	$$($(2)_TARGET_INSTALL_STAGING)
 else
 $(1)-install-staging:
 endif
 
 ifeq ($$($(2)_INSTALL_IMAGES),YES)
-$(1)-install-images:	$(1)-build \
-			$$($(2)_TARGET_INSTALL_IMAGES)
+$(1)-install-images:	$$($(2)_TARGET_INSTALL_IMAGES)
 else
 $(1)-install-images:
 endif
 
-$(1)-install-host:      $(1)-build $$($(2)_TARGET_INSTALL_HOST)
+$(1)-install-host:      $$($(2)_TARGET_INSTALL_HOST)
 
-$(1)-build:		$(1)-configure \
-			$$($(2)_TARGET_BUILD)
+$$($(2)_TARGET_INSTALL_TARGET) $$($(2)_TARGET_INSTALL_STAGING) \
+$$($(2)_TARGET_INSTALL_IMAGES) $$($(2)_TARGET_INSTALL_HOST): \
+	$$($(2)_TARGET_BUILD)
+
+$(1)-build:		$$($(2)_TARGET_BUILD)
+$$($(2)_TARGET_BUILD):	$$($(2)_TARGET_CONFIGURE)
+
+# The symbol "|" specify a order-only-prerequisite, this is needed for
+# phony requisites to avoid rebuilding every time the target.
+
+$(1)-configure:			$$($(2)_TARGET_CONFIGURE)
+$$($(2)_TARGET_CONFIGURE):	| $$($(2)_DEPENDENCIES)
 
 $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dirs prepare
 ifeq ($(filter $(1),$(DEPENDENCIES_HOST_PREREQ)),)
@@ -451,13 +458,13 @@ ifeq ($$($(2)_OVERRIDE_SRCDIR),)
 #  extract
 #  patch
 #  configure
-$(1)-configure:		$(1)-patch $(1)-depends \
-			$$($(2)_TARGET_CONFIGURE)
+$$($(2)_TARGET_CONFIGURE):	$$($(2)_TARGET_PATCH)
 
-$(1)-patch:		$(1)-extract $$($(2)_TARGET_PATCH)
+$(1)-patch:		$$($(2)_TARGET_PATCH)
+$$($(2)_TARGET_PATCH):	$$($(2)_TARGET_EXTRACT)
 
-$(1)-extract:		$(1)-source \
-			$$($(2)_TARGET_EXTRACT)
+$(1)-extract:			$$($(2)_TARGET_EXTRACT)
+$$($(2)_TARGET_EXTRACT):	$$($(2)_TARGET_SOURCE)
 
 $(1)-depends:		$$($(2)_DEPENDENCIES)
 
@@ -467,10 +474,9 @@ else
 #  source, by rsyncing
 #  depends
 #  configure
-$(1)-configure:		$(1)-depends \
-			$$($(2)_TARGET_CONFIGURE)
+$$($(2)_TARGET_CONFIGURE):	$$($(2)_TARGET_RSYNC)
 
-$(1)-depends:		$(1)-rsync $$($(2)_DEPENDENCIES)
+$(1)-depends:		$$($(2)_DEPENDENCIES)
 
 $(1)-patch:		$(1)-rsync
 $(1)-extract:		$(1)-rsync
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 5cd9a46..902c0a2 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -29,9 +29,6 @@ UCLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 # cross-compiler and the kernel headers
 UCLIBC_DEPENDENCIES = host-gcc-initial linux-headers
 
-# Before uClibc is built, we must have the second stage cross-compiler
-uclibc-build: host-gcc-intermediate
-
 # specifying UCLIBC_CONFIG_FILE on the command-line overrides the .config
 # setting.
 ifndef UCLIBC_CONFIG_FILE
@@ -554,3 +551,6 @@ uclibc-menuconfig: dirs uclibc-patch
 	rm -f $(UCLIBC_DIR)/.stamp_{configured,built,target_installed,staging_installed}
 
 $(eval $(generic-package))
+
+# Before uClibc is built, we must have the second stage cross-compiler
+$(UCLIBC_TARGET_BUILD): | host-gcc-intermediate
-- 
1.8.5.2
