From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 21:36:53 +0200
Subject: [Buildroot] [git commit] linux-headers: prepare to support custom
 tarball/git
Message-ID: <20180923201053.20EAE889A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97ffbc9aeee076ef2975bb3271bc78369da858dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit reworks how linux-headers.mk is written to prepare adding
support for custom tarball/git fetching for the Linux kernel headers.

Basically, the idea is to have a single condition at the beginning of
the file that defines a number of LINUX_HADERS_* variables depending
on whether "kernel headers same as kernel" is used or not, and then
use these variables in the rest of the .mk file.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
[Thomas: split from the original patch "package/linux-headers: add
support for custom headers" from Mark. The commit log is entirely
mine.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-headers/linux-headers.mk | 74 ++++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 31 deletions(-)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 954c6b7978..994bd627ba 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -7,27 +7,48 @@
 # This package is used to provide Linux kernel headers for the
 # internal toolchain backend.
 
+# Set variables depending on whether we are using headers from a kernel
+# build or a standalone header package.
 ifeq ($(BR2_KERNEL_HEADERS_AS_KERNEL),y)
-
+LINUX_HEADERS_CUSTOM_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL))
+LINUX_HEADERS_CUSTOM_GIT = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT))
+LINUX_HEADERS_CUSTOM_HG = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_HG))
+LINUX_HEADERS_CUSTOM_SVN = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_SVN))
 LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
+LINUX_HEADERS_CUSTOM_TARBALL_LOCATION = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
+LINUX_HEADERS_REPO_URL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
+else # ! BR2_KERNEL_HEADERS_AS_KERNEL
+LINUX_HEADERS_CUSTOM_TARBALL =
+LINUX_HEADERS_CUSTOM_GIT =
+LINUX_HEADERS_CUSTOM_HG =
+LINUX_HEADERS_CUSTOM_SVN =
+LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
+LINUX_HEADERS_CUSTOM_TARBALL_LOCATION =
+LINUX_HEADERS_REPO_URL =
+endif # BR2_KERNEL_HEADERS_AS_KERNEL
+
+# Configure tarball filenames.
+ifeq ($(LINUX_HEADERS_CUSTOM_TARBALL),y)
+LINUX_HEADERS_SOURCE = $(notdir $(LINUX_HEADERS_CUSTOM_TARBALL_LOCATION))
+else ifeq ($(LINUX_HEADERS_CUSTOM_GIT)$(LINUX_HEADERS_CUSTOM_HG)$(LINUX_HEADERS_CUSTOM_SVN),y)
+LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz
+else
+LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
+endif
 
-# Compute LINUX_HEADERS_SOURCE and LINUX_HEADERS_SITE from the configuration
-ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
-LINUX_HEADERS_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
-LINUX_HEADERS_SITE = $(patsubst %/,%,$(dir $(LINUX_HEADERS_TARBALL)))
-LINUX_HEADERS_SOURCE = $(notdir $(LINUX_HEADERS_TARBALL))
-else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
-LINUX_HEADERS_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
+# Configure the various kernel source locations.
+ifeq ($(LINUX_HEADERS_CUSTOM_TARBALL),y)
+LINUX_HEADERS_SITE = $(patsubst %/,%,$(dir $(LINUX_HEADERS_CUSTOM_TARBALL_LOCATION)))
+else ifeq ($(LINUX_HEADERS_CUSTOM_GIT),y)
+LINUX_HEADERS_SITE = $(LINUX_HEADERS_REPO_URL)
 LINUX_HEADERS_SITE_METHOD = git
-# use same git tarball as linux kernel
-LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz
-else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_HG),y)
-LINUX_HEADERS_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
+else ifeq ($(LINUX_HEADERS_CUSTOM_HG),y)
+LINUX_HEADERS_SITE = $(LINUX_HEADERS_REPO_URL)
 LINUX_HEADERS_SITE_METHOD = hg
-# use same hg tarball as linux kernel
-LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz
+else ifeq ($(LINUX_HEADERS_CUSTOM_SVN),y)
+LINUX_HEADERS_SITE = $(LINUX_HEADERS_REPO_URL)
+LINUX_HEADERS_SITE_METHOD = svn
 else
-LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
 # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
 # to use the $(word) function. We support versions such as 4.0, 3.1,
 # 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
@@ -37,13 +58,16 @@ else ifeq ($(findstring x3.,x$(LINUX_HEADERS_VERSION)),x3.)
 LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
 else ifeq ($(findstring x4.,x$(LINUX_HEADERS_VERSION)),x4.)
 LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v4.x
-endif
+endif # x2.6
 # release candidates are in testing/ subdir
 ifneq ($(findstring -rc,$(LINUX_HEADERS_VERSION)),)
 LINUX_HEADERS_SITE := $(LINUX_HEADERS_SITE)/testing
 endif # -rc
-endif
+endif # LINUX_HEADERS_CUSTOM_TARBALL
 
+# Apply any necessary patches if we are using the headers from a kernel
+# build.
+ifeq ($(BR2_KERNEL_HEADERS_AS_KERNEL),y)
 LINUX_HEADERS_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
 # We rely on the generic package infrastructure to download and apply
@@ -63,25 +87,13 @@ define LINUX_HEADERS_APPLY_LOCAL_PATCHES
 endef
 
 LINUX_HEADERS_POST_PATCH_HOOKS += LINUX_HEADERS_APPLY_LOCAL_PATCHES
+endif # BR2_KERNEL_HEADERS_AS_KERNEL
 
-else # ! BR2_KERNEL_HEADERS_AS_KERNEL
-
-LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
-ifeq ($(findstring x2.6.,x$(LINUX_HEADERS_VERSION)),x2.6.)
-LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
-else ifeq ($(findstring x3.,x$(LINUX_HEADERS_VERSION)),x3.)
-LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
-else ifeq ($(findstring x4.,x$(LINUX_HEADERS_VERSION)),x4.)
-LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v4.x
-endif
-LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
-
+# Skip hash checking for custom kernel headers.
 ifeq ($(BR2_KERNEL_HEADERS_VERSION),y)
 BR_NO_CHECK_HASH_FOR += $(LINUX_HEADERS_SOURCE)
 endif
 
-endif # ! BR2_KERNEL_HEADERS_AS_KERNEL
-
 # linux-headers really is the same as the linux package
 LINUX_HEADERS_DL_SUBDIR = linux
 
