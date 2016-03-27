From: Pauli Sundberg <susundberg@gmail.com>
Date: Sun, 27 Mar 2016 20:30:17 +0300
Subject: [Buildroot] [PATCH V3 2/2] Add custom Subversion repository support
	for package linux
In-Reply-To: <1459099817-4614-1-git-send-email-susundberg@gmail.com>
References: <87mvpmdx0i.fsf@dell.be.48ers.dk>
 <1459099817-4614-1-git-send-email-susundberg@gmail.com>
Message-ID: <1459099817-4614-2-git-send-email-susundberg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pauli Sundberg <susundberg@gmail.com>
---
 linux/Config.in | 12 +++++++++---
 linux/linux.mk  |  3 +++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 93968cd..dd21661 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -63,6 +63,12 @@ config BR2_LINUX_KERNEL_CUSTOM_HG
 	  This option allows Buildroot to get the Linux kernel source
 	  code from a Mercurial repository.
 
+config BR2_LINUX_KERNEL_CUSTOM_SVN
+	bool "Custom Subversion repository"
+	help
+	  This option allows Buildroot to get the Linux kernel source
+	  code from a subversion repository.
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
-- 
1.9.1
