From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue,  7 Mar 2017 23:23:48 +0100
Subject: [Buildroot] [PATCH v2 2/2] linux: Add CIP SLTS easy selection option
In-Reply-To: <1488925428-12805-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1488925428-12805-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1488925428-12805-3-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds an easy way to select the CIP project SLTS
kernel within the kernel menu.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 linux/Config.in | 25 +++++++++++++++++++++++++
 linux/linux.mk  |  4 ++++
 2 files changed, 29 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 1707f7d..76acece 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,6 +28,9 @@ choice
 config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (4.10.1)"
 
+config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	bool "Latest CIP SLTS (Super Long Term Support)"
+
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
 	help
@@ -95,9 +98,31 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION
 
 endif
 
+if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+
+choice
+	prompt "CIP version"
+	default BR2_LINUX_KERNEL_LATEST_CIP_VERSION_TAG
+
+	config BR2_LINUX_KERNEL_LATEST_CIP_VERSION_TAG
+		bool "Latest tagged version (v4.4.48-cip2)"
+		help
+		  Use the latest tagged version
+
+	config BR2_LINUX_KERNEL_LATEST_CIP_VERSION_BRANCH
+		bool "Latest released version"
+		help
+		  Always use the latest released version at the time of compiling
+
+endchoice
+
+endif
+
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "4.10.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "v4.4.48-cip2" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION_TAG
+	default "linux-4.4.y-cip" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION_BRANCH
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.mk b/linux/linux.mk
index 7f4432e..473a198 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -30,6 +30,10 @@ LINUX_SITE_METHOD = hg
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SVN),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = svn
+else ifeq ($(BR2_LINUX_KERNEL_LATEST_CIP_VERSION),y)
+LINUX_SITE = $(call gitlab,cip-project,cip-kernel-4.4,$(LINUX_VERSION))
+LINUX_SOURCE = linux-$(LINUX_VERSION).tar.bz2
+BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
 else
 LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
 ifeq ($(BR2_LINUX_KERNEL_CUSTOM_VERSION),y)
-- 
2.7.4
