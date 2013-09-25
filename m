From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 25 Sep 2013 10:05:37 +0200
Subject: [Buildroot] [PATCH v5 2/4] pkg-generic: fix rules for top-level
	parallel make
In-Reply-To: <1380096339-4686-1-git-send-email-fabio.porcedda@gmail.com>
References: <1380096339-4686-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1380096339-4686-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be able to use top-level parallel make we must not depend in a rule
on the order of evaluation of the prerequisites, so instead of relyng on
the left to right ordering of evaluation of the prerequisites add
an explicit rule to describe the dependencies.

So add explicit dependencies for the following stamp files:
   %/.stamp_extracted
   %/.stamp_patched
   %/.stamp_configured
   %/.stamp_built
   %/.stamp_host_installed
   %/.stamp_staging_installed
   %/.stamp_images_installed
   %/.stamp_target_installed

Because the %-build target is not anymore part of the dependency chain,
add a new variable <pkgname>_BUILD_DEPENDENCIES to be used instead.
This new variable is used only by the uclibc package for building
the toolchain.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/glibc/glibc.mk   |  3 ++-
 package/pkg-generic.mk   | 38 +++++++++++++++++++++-----------------
 package/uclibc/uclibc.mk |  3 ++-
 3 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 4dd2e63..57f15dc 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -30,7 +30,8 @@ endif
 
 # Before (e)glibc is built, we must have the second stage
 # cross-compiler, for some gcc versions
-glibc-build: $(if $(BR2_TOOLCHAIN_NEEDS_THREE_STAGE_BUILD),host-gcc-intermediate)
+GLIBC_BUILD_DEPENDENCIES = \
+	$(if $(BR2_TOOLCHAIN_NEEDS_THREE_STAGE_BUILD),host-gcc-intermediate)
 
 GLIBC_SUBDIR = build
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d7efcd3..0de1f35 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -312,6 +312,7 @@ $(2)_DEPENDENCIES ?= $(filter-out  host-toolchain $(1),\
 ifeq ($$($(2)_TYPE),target)
 $(2)_DEPENDENCIES += toolchain
 endif
+$(2)_BUILD_DEPENDENCIES		?=
 
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
@@ -363,30 +364,34 @@ $(1)-install:		$(1)-install-staging $(1)-install-target $(1)-install-images
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
+$$($(2)_TARGET_BUILD):	$$($(2)_TARGET_CONFIGURE) | $$($(2)_BUILD_DEPENDENCIES)
+
+$(1)-configure:			$$($(2)_TARGET_CONFIGURE)
+$$($(2)_TARGET_CONFIGURE):	| $$($(2)_DEPENDENCIES)
 
 ifeq ($$($(2)_OVERRIDE_SRCDIR),)
 # In the normal case (no package override), the sequence of steps is
@@ -395,13 +400,13 @@ ifeq ($$($(2)_OVERRIDE_SRCDIR),)
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
 
@@ -411,10 +416,9 @@ else
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
index 3993d9b..f05b647 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -24,7 +24,8 @@ UCLIBC_DEPENDENCIES = host-gcc-initial linux-headers
 
 # Before uClibc is built, we must have the second stage
 # cross-compiler, for some gcc versions, and when NPTL is used.
-uclibc-build: $(if $(BR2_TOOLCHAIN_NEEDS_THREE_STAGE_BUILD),host-gcc-intermediate)
+UCLIBC_BUILD_DEPENDENCIES = \
+	$(if $(BR2_TOOLCHAIN_NEEDS_THREE_STAGE_BUILD),host-gcc-intermediate)
 
 # specifying UCLIBC_CONFIG_FILE on the command-line overrides the .config
 # setting.
-- 
1.8.4
