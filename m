From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Apr 2016 22:28:09 +0200
Subject: [Buildroot] [git commit] linux: Add custom Subversion repository
	support for the package
Message-ID: <20160405203417.8D45081D67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=986fa441e49cc180f77704699a6d2bb3627bf86a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pauli Sundberg <susundberg@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 12 +++++++++---
 linux/linux.mk  |  3 +++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 49b6994..9f0267d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -63,6 +63,12 @@ config BR2_LINUX_KERNEL_CUSTOM_HG
 	  This option allows Buildroot to get the Linux kernel source
 	  code from a Mercurial repository.
 
+config BR2_LINUX_KERNEL_CUSTOM_SVN
+	bool "Custom Subversion repository"
+	help
+	  This option allows Buildroot to get the Linux kernel source
+	  code from a Subversion repository.
+
 config BR2_LINUX_KERNEL_CUSTOM_LOCAL
 	bool "Local directory"
 	help
@@ -79,7 +85,7 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 	string "URL of custom kernel tarball"
 	depends on BR2_LINUX_KERNEL_CUSTOM_TARBALL
 
-if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG
+if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || BR2_LINUX_KERNEL_CUSTOM_SVN
 
 config BR2_LINUX_KERNEL_CUSTOM_REPO_URL
 	string "URL of custom repository"
@@ -91,7 +97,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION \
 		if BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION != ""  # legacy
 	help
-	  Revision to use in the typical format used by Git/Mercurial
+	  Revision to use in the typical format used by Git/Mercurial/Subversion
 	  E.G. a sha id, a tag, branch, ..
 
 endif
@@ -109,7 +115,7 @@ config BR2_LINUX_KERNEL_VERSION
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
 	default BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION \
-		if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG
+		if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || BR2_LINUX_KERNEL_CUSTOM_SVN
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_LOCAL
 
 #
diff --git a/linux/linux.mk b/linux/linux.mk
index 7e20255..317587f 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -23,6 +23,9 @@ LINUX_SITE_METHOD = git
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_HG),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = hg
+else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SVN),y)
+LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
+LINUX_SITE_METHOD = svn
 else
 LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
 ifeq ($(BR2_LINUX_KERNEL_CUSTOM_VERSION),y)
