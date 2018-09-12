From: Mark Corbin <mark.corbin@embecosm.com>
Date: Wed, 12 Sep 2018 11:22:52 +0100
Subject: [Buildroot] [PATCH v2 2/6] package/linux-headers: add support for
 custom headers
In-Reply-To: <20180912102256.3164-1-mark.corbin@embecosm.com>
References: <20180912102256.3164-1-mark.corbin@embecosm.com>
Message-ID: <20180912102256.3164-3-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for building toolchains against custom headers. Allows
the selection of a manual version, custom tarball or custom git
repository for the kernel headers. This enables toolchains to be
built against custom kernel headers without having to build a full
kernel.

This is particularly useful for new architectures, such as RISC-V
where updated kernel headers may not have made it into the mainline
kernel yet.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
---
 package/linux-headers/Config.in.host   | 40 ++++++++++-
 package/linux-headers/linux-headers.mk | 94 +++++++++++++++-----------
 2 files changed, 93 insertions(+), 41 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e11f07f0b0..4f79ccc991 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -70,6 +70,23 @@ config BR2_KERNEL_HEADERS_VERSION
 	  URL at kernel.org. Instead, select "Custom tarball" and
 	  specify the right URL directly.
 
+config BR2_KERNEL_HEADERS_CUSTOM_TARBALL
+	bool "Custom tarball"
+	help
+	  This option allows you to specify a URL pointing to a kernel
+	  source tarball. This URL can use any protocol recognized by
+	  Buildroot, like http://, ftp://, file:// or scp://.
+
+	  When pointing to a local tarball using file://, you may want
+	  to use a make variable like $(TOPDIR) to reference the root of
+	  the Buildroot tree.
+
+config BR2_KERNEL_HEADERS_CUSTOM_GIT
+	bool "Custom Git repository"
+	help
+	  This option allows Buildroot to get the Linux kernel source
+	  code from a Git repository.
+
 endchoice
 
 config BR2_DEFAULT_KERNEL_VERSION
@@ -79,9 +96,27 @@ config BR2_DEFAULT_KERNEL_VERSION
 	  Specify the version you want to use.
 	  E.G.: 3.6.10
 
+config BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION
+	string "URL of custom kernel tarball"
+	depends on BR2_KERNEL_HEADERS_CUSTOM_TARBALL
+
+if BR2_KERNEL_HEADERS_CUSTOM_GIT
+
+config BR2_KERNEL_HEADERS_CUSTOM_REPO_URL
+	string "URL of custom repository"
+
+config BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	help
+	  Revision to use in the typical format used by
+	  Git/Mercurial/Subversion E.G. a sha id, a tag, branch, ..
+
+endif
+
 choice
 	bool "Custom kernel headers series"
-	depends on BR2_KERNEL_HEADERS_VERSION || BR2_KERNEL_HEADERS_AS_KERNEL
+	depends on BR2_KERNEL_HEADERS_VERSION || BR2_KERNEL_HEADERS_AS_KERNEL || \
+		   BR2_KERNEL_HEADERS_CUSTOM_TARBALL || BR2_KERNEL_HEADERS_CUSTOM_GIT
 	help
 	  Specify the kernel headers series you manually selected,
 	  above.
@@ -260,3 +295,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
 	default "4.18.7"	if BR2_KERNEL_HEADERS_4_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
+	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
+	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
+		if BR2_KERNEL_HEADERS_CUSTOM_GIT
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 954c6b7978..6bc60d8d74 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -7,27 +7,50 @@
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
+LINUX_HEADERS_CUSTOM_TARBALL_LOCATION = \
+$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
+LINUX_HEADERS_REPO_URL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
+else # ! BR2_KERNEL_HEADERS_AS_KERNEL
+LINUX_HEADERS_CUSTOM_TARBALL = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_TARBALL))
+LINUX_HEADERS_CUSTOM_GIT = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_GIT))
+LINUX_HEADERS_CUSTOM_HG =
+LINUX_HEADERS_CUSTOM_SVN =
+LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
+LINUX_HEADERS_CUSTOM_TARBALL_LOCATION = \
+$(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION))
+LINUX_HEADERS_REPO_URL = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_REPO_URL))
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
@@ -37,13 +60,16 @@ else ifeq ($(findstring x3.,x$(LINUX_HEADERS_VERSION)),x3.)
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
@@ -53,35 +79,23 @@ LINUX_HEADERS_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 LINUX_HEADERS_PATCH = $(filter ftp://% http://% https://%,$(LINUX_HEADERS_PATCHES))
 
 define LINUX_HEADERS_APPLY_LOCAL_PATCHES
-	for p in $(filter-out ftp://% http://% https://%,$(LINUX_HEADERS_PATCHES)) ; do \
-		if test -d $$p ; then \
-			$(APPLY_PATCHES) $(@D) $$p \*.patch || exit 1 ; \
-		else \
-			$(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` || exit 1; \
-		fi \
-	done
+        for p in $(filter-out ftp://% http://% https://%,$(LINUX_HEADERS_PATCHES)) ; do \
+                if test -d $$p ; then \
+                        $(APPLY_PATCHES) $(@D) $$p \*.patch || exit 1 ; \
+                else \
+                        $(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` || exit 1; \
+                fi \
+        done
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
-ifeq ($(BR2_KERNEL_HEADERS_VERSION),y)
+# Skip hash checking for custom kernel headers.
+ifeq ($(BR2_KERNEL_HEADERS_VERSION)$(BR2_KERNEL_HEADERS_CUSTOM_TARBALL)$(BR2_KERNEL_HEADERS_CUSTOM_GIT),y)
 BR_NO_CHECK_HASH_FOR += $(LINUX_HEADERS_SOURCE)
 endif
 
-endif # ! BR2_KERNEL_HEADERS_AS_KERNEL
-
 # linux-headers really is the same as the linux package
 LINUX_HEADERS_DL_SUBDIR = linux
 
@@ -125,7 +139,7 @@ define LINUX_HEADERS_INSTALL_STAGING_CMDS
 			headers_install)
 endef
 
-ifeq ($(BR2_KERNEL_HEADERS_VERSION)$(BR2_KERNEL_HEADERS_AS_KERNEL),y)
+ifeq ($(BR2_KERNEL_HEADERS_VERSION)$(BR2_KERNEL_HEADERS_AS_KERNEL)$(BR2_KERNEL_HEADERS_CUSTOM_TARBALL)$(BR2_KERNEL_HEADERS_CUSTOM_GIT),y)
 define LINUX_HEADERS_CHECK_VERSION
 	$(call check_kernel_headers_version,\
 		$(STAGING_DIR),\
-- 
2.17.1
