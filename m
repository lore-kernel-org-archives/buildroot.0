From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 22:24:18 +0200
Subject: [Buildroot] [git commit] linux: Add CIP SLTS selection option
Message-ID: <20170406202429.EF62782309@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31d4fa76f0fcadb82512361eb762f96cefdfc669
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds an easy way to select the CIP project SLTS
kernel within the kernel menu.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
[Thomas: remove BR2_CIP_KERNEL_REPO_URL option.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in | 20 ++++++++++++++++++++
 linux/linux.mk  |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index c5565e5..10bb250 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,6 +28,25 @@ choice
 config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (4.10.8)"
 
+config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	bool "Latest CIP SLTS version (v4.4.55-cip3)"
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
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
 	help
@@ -98,6 +117,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "4.10.8" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "v4.4.55-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.mk b/linux/linux.mk
index f68a3ff..7973677 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -30,6 +30,8 @@ LINUX_SITE_METHOD = hg
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SVN),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = svn
+else ifeq ($(BR2_LINUX_KERNEL_LATEST_CIP_VERSION),y)
+LINUX_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/bwh/linux-cip.git
 else
 LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
 ifeq ($(BR2_LINUX_KERNEL_CUSTOM_VERSION),y)
