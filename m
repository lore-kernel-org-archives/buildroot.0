From: Pauli Sundberg <susundberg@gmail.com>
Date: Thu, 17 Mar 2016 19:07:52 +0200
Subject: [Buildroot] [PATCH v2 2/2] Add SVN repository support for kernel
In-Reply-To: <1458234472-4741-1-git-send-email-susundberg@gmail.com>
References: <87oaaif6zv.fsf@dell.be.48ers.dk>
 <1458234472-4741-1-git-send-email-susundberg@gmail.com>
Message-ID: <1458234472-4741-3-git-send-email-susundberg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 linux/Config.in | 12 +++++++++---
 linux/linux.mk  |  3 +++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 93968cd..9f6fb40 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -69,6 +69,12 @@ config BR2_LINUX_KERNEL_CUSTOM_LOCAL
 	  This option allows Buildroot to get the Linux kernel source
 	  code from a local directory.
 
+config BR2_LINUX_KERNEL_CUSTOM_SVN
+	bool "Custom SVN repository"
+	help
+	  This option allows Buildroot to get the Linux kernel source
+	  code from a SVN repository.
+
 endchoice
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
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
+	  Revision to use in the typical format used by Git/Mercurial/Svn
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
-- 
1.9.1
