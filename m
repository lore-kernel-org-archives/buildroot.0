From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri,  3 Mar 2017 22:50:16 +0100
Subject: [Buildroot] [PATCH] linux: Add CIP SLTS easy selection option
Message-ID: <1488577816-19047-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds an easy way to select the CIP project SLTS
kernel within the kernel menu.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 Config.in       | 20 ++++++++++++++++++++
 linux/Config.in |  4 ++++
 linux/linux.mk  |  3 +++
 3 files changed, 27 insertions(+)

diff --git a/Config.in b/Config.in
index bd8f0d1..b089ed8 100644
--- a/Config.in
+++ b/Config.in
@@ -261,6 +261,26 @@ config BR2_KERNEL_MIRROR
 	     http://www.XX.kernel.org/pub (XX = country code)
 	     http://mirror.aarnet.edu.au/pub/ftp.kernel.org
 
+config BR2_CIP_KERNEL_REPO_URL
+	string "CIP SLTS (SuperLong Term Support) kernel url"
+	default "git://git.kernel.org/pub/scm/linux/kernel/git/bwh/linux-cip.git"
+	help
+	  CIP launched in the spring of 2016 to address the needs of
+	  organizations in industries such as power generation and
+	  distribution, water, oil and gas, transportation, building
+	  automation and more for reliable and secure Linux-based
+	  embedded systems that can be sustained over a period of
+	  10 to as many as 60 years.
+	  The project's goal is to provide an open source base layer
+	  of industrial-grade software that permits the use and
+	  implementation of software building blocks that meet
+	  these requirements.
+
+	  The CIP community plans to maintain 4.4 for security and
+	  bug fixes for more than 10 years.
+
+	  https://www.cip-project.org
+
 config BR2_GNU_MIRROR
 	string "GNU Software mirror"
 	default "http://ftpmirror.gnu.org"
diff --git a/linux/Config.in b/linux/Config.in
index 890b848..478cb18 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,6 +28,9 @@ choice
 config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (4.10)"
 
+config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	bool "Latest CIP SLTS (Super Long Term Support) version (4.4.y)"
+
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
 	help
@@ -98,6 +101,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "4.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "linux-4.4.y-cip" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.mk b/linux/linux.mk
index 7f4432e..0dd8ff0 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -30,6 +30,9 @@ LINUX_SITE_METHOD = hg
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SVN),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = svn
+else ifeq ($(BR2_LINUX_KERNEL_LATEST_CIP_VERSION),y)
+LINUX_SITE = $(call qstrip,$(BR2_CIP_KERNEL_REPO_URL))
+LINUX_SITE_METHOD = git
 else
 LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
 ifeq ($(BR2_LINUX_KERNEL_CUSTOM_VERSION),y)
-- 
2.7.4
