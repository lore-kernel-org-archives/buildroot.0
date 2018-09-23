From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 21:43:12 +0200
Subject: [Buildroot] [git commit] package/linux-headers: add support for
 fetching from custom tarball/git
Message-ID: <20180923201053.2C731889A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1eca624c03e5e1f815e0e62cbfc3b99f3cd628b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for building toolchains against custom headers. Allows
the selection of a manual version, custom tarball or custom git
repository for the kernel headers. This enables toolchains to be
built against custom kernel headers without having to build a full
kernel.

This is particularly useful for new architectures, such as RISC-V
where updated kernel headers may not have made it into the mainline
kernel yet.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-headers/Config.in.host   | 40 +++++++++++++++++++++++++++++++++-
 package/linux-headers/linux-headers.mk | 12 +++++-----
 2 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 53f684b452..b12ea6986c 100644
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
 	default "4.18.9"	if BR2_KERNEL_HEADERS_4_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
+	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
+	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
+		if BR2_KERNEL_HEADERS_CUSTOM_GIT
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 994bd627ba..45e17688c5 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -18,13 +18,13 @@ LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 LINUX_HEADERS_CUSTOM_TARBALL_LOCATION = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
 LINUX_HEADERS_REPO_URL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 else # ! BR2_KERNEL_HEADERS_AS_KERNEL
-LINUX_HEADERS_CUSTOM_TARBALL =
-LINUX_HEADERS_CUSTOM_GIT =
+LINUX_HEADERS_CUSTOM_TARBALL = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_TARBALL))
+LINUX_HEADERS_CUSTOM_GIT = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_GIT))
 LINUX_HEADERS_CUSTOM_HG =
 LINUX_HEADERS_CUSTOM_SVN =
 LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
-LINUX_HEADERS_CUSTOM_TARBALL_LOCATION =
-LINUX_HEADERS_REPO_URL =
+LINUX_HEADERS_CUSTOM_TARBALL_LOCATION = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION))
+LINUX_HEADERS_REPO_URL = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_REPO_URL))
 endif # BR2_KERNEL_HEADERS_AS_KERNEL
 
 # Configure tarball filenames.
@@ -90,7 +90,7 @@ LINUX_HEADERS_POST_PATCH_HOOKS += LINUX_HEADERS_APPLY_LOCAL_PATCHES
 endif # BR2_KERNEL_HEADERS_AS_KERNEL
 
 # Skip hash checking for custom kernel headers.
-ifeq ($(BR2_KERNEL_HEADERS_VERSION),y)
+ifeq ($(BR2_KERNEL_HEADERS_VERSION)$(BR2_KERNEL_HEADERS_CUSTOM_TARBALL)$(BR2_KERNEL_HEADERS_CUSTOM_GIT),y)
 BR_NO_CHECK_HASH_FOR += $(LINUX_HEADERS_SOURCE)
 endif
 
@@ -137,7 +137,7 @@ define LINUX_HEADERS_INSTALL_STAGING_CMDS
 			headers_install)
 endef
 
-ifeq ($(BR2_KERNEL_HEADERS_VERSION)$(BR2_KERNEL_HEADERS_AS_KERNEL),y)
+ifeq ($(BR2_KERNEL_HEADERS_VERSION)$(BR2_KERNEL_HEADERS_AS_KERNEL)$(BR2_KERNEL_HEADERS_CUSTOM_TARBALL)$(BR2_KERNEL_HEADERS_CUSTOM_GIT),y)
 define LINUX_HEADERS_CHECK_VERSION
 	$(call check_kernel_headers_version,\
 		$(STAGING_DIR),\
