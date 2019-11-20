From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2019 21:24:21 +0100
Subject: [Buildroot] [git commit] linux: change CIP kernel download method
Message-ID: <20191202083934.051F98041D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=988d604bb7976fd1b50db87c99d22b928cf68bc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Downloading from https a tarball is faster than cloning a git repo.
If needed, BR2_LINUX_KERNEL_CUSTOM_GIT can be used as a fallback
mechanism to downlad the CIP kernel with git.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 4 ++--
 linux/linux.mk  | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index d26bf1b14a..f6572f5fad 100644
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
 	default "5.3.8" if BR2_LINUX_KERNEL_LATEST_VERSION
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
