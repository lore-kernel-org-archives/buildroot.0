From: Mark Corbin <mark.corbin@embecosm.com>
Date: Tue, 21 Aug 2018 12:06:46 +0100
Subject: [Buildroot] [PATCH 1/1] Add support for building toolchains against
 custom kernel headers.
Message-ID: <20180821110646.5671-1-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allows the selection of a manual version, custom tarball or custom
git repository for the toolchain kernel headers. This enables
toolchains to be built against custom kernel headers without having
to build a full kernel.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
---
 package/linux-headers/Config.in.host   | 48 +++++++++++++++++++++++++-
 package/linux-headers/linux-headers.mk | 18 +++++++---
 2 files changed, 61 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 783cc7ea3a..df2e2263c4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -77,6 +77,31 @@ config BR2_KERNEL_HEADERS_4_17
 
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
+	help
+	  This option allows you to use a specific official version from
+	  kernel.org, like 2.6.x, 2.6.x.y, 3.x.y, ...
+
+	  Note: you cannot use this option to select a _longterm_ 2.6
+	  kernel, because these kernels are not located at the standard
+	  URL at kernel.org. Instead, select "Custom tarball" and
+	  specify the right URL directly.
+
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
 
 endchoice
 
@@ -87,9 +112,27 @@ config BR2_DEFAULT_KERNEL_VERSION
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
@@ -269,3 +312,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
 	default "4.17.17"	if BR2_KERNEL_HEADERS_4_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
+	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
+	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
+		if BR2_KERNEL_HEADERS_CUSTOM_GIT
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 954c6b7978..3c2509e249 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -64,8 +64,18 @@ endef
 
 LINUX_HEADERS_POST_PATCH_HOOKS += LINUX_HEADERS_APPLY_LOCAL_PATCHES
 
-else # ! BR2_KERNEL_HEADERS_AS_KERNEL
-
+else ifeq ($(BR2_KERNEL_HEADERS_CUSTOM_TARBALL),y)
+LINUX_HEADERS_TARBALL = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION))
+LINUX_HEADERS_SITE = $(patsubst %/,%,$(dir $(LINUX_HEADERS_TARBALL)))
+LINUX_HEADERS_SOURCE = $(notdir $(LINUX_HEADERS_TARBALL))
+BR_NO_CHECK_HASH_FOR += $(LINUX_HEADERS_SOURCE)
+else ifeq ($(BR2_KERNEL_HEADERS_CUSTOM_GIT),y)
+LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
+LINUX_HEADERS_SITE = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_REPO_URL))
+LINUX_HEADERS_SITE_METHOD = git
+LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz
+BR_NO_CHECK_HASH_FOR += $(LINUX_HEADERS_SOURCE)
+else
 LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
 ifeq ($(findstring x2.6.,x$(LINUX_HEADERS_VERSION)),x2.6.)
 LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
@@ -80,7 +90,7 @@ ifeq ($(BR2_KERNEL_HEADERS_VERSION),y)
 BR_NO_CHECK_HASH_FOR += $(LINUX_HEADERS_SOURCE)
 endif
 
-endif # ! BR2_KERNEL_HEADERS_AS_KERNEL
+endif
 
 # linux-headers really is the same as the linux package
 LINUX_HEADERS_DL_SUBDIR = linux
@@ -125,7 +135,7 @@ define LINUX_HEADERS_INSTALL_STAGING_CMDS
 			headers_install)
 endef
 
-ifeq ($(BR2_KERNEL_HEADERS_VERSION)$(BR2_KERNEL_HEADERS_AS_KERNEL),y)
+ifeq ($(BR2_KERNEL_HEADERS_VERSION)$(BR2_KERNEL_HEADERS_AS_KERNEL)$(BR2_KERNEL_HEADERS_CUSTOM_TARBALL)$(BR2_KERNEL_HEADERS_CUSTOM_GIT),y)
 define LINUX_HEADERS_CHECK_VERSION
 	$(call check_kernel_headers_version,\
 		$(STAGING_DIR),\
-- 
2.17.1
