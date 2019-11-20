From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 20 Nov 2019 19:58:53 +0100
Subject: [Buildroot] [PATCH 1/2] linux: change download method
Message-ID: <20191120185854.23820-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Downloading form https tarball is faster than clonig a git repo.
BR2_LINUX_KERNEL_CUSTOM_GIT can be used as a fallback mechanism
to downlad the CIP kernel with git.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/Config.in | 4 ++--
 linux/linux.mk  | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index a78a1761c9..923d67fb57 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -35,7 +35,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.3)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (v4.19.75-cip11)"
+	bool "Latest CIP SLTS version (4.19.75-cip11)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -123,7 +123,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.3.11" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "v4.19.75-cip11" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "4.19.75-cip11" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.mk b/linux/linux.mk
index 89ac31c2e1..c45db4d24f 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -30,7 +30,8 @@ else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SVN),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = svn
 else ifeq ($(BR2_LINUX_KERNEL_LATEST_CIP_VERSION),y)
-LINUX_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git
+LINUX_SOURCE = linux-cip-$(LINUX_VERSION).tar.gz
+LINUX_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git/snapshot
 else ifneq ($(findstring -rc,$(LINUX_VERSION)),)
 # Since 4.12-rc1, -rc kernels are generated from cgit. This also works for
 # older -rc kernels.
-- 
2.17.1
