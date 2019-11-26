From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 26 Nov 2019 12:59:33 +0100
Subject: [Buildroot] [PATCH v2] linux: add option to select the CIP
 real-time kernel
Message-ID: <1574769573-28984-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

This patch adds Linux CIP RT, the PREEMPT_RT real-time variant maintained
by the CIP team.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
Changelo:
v1 -> v2:
* better commit message (T. Petazzoni)
* fixed variable condition checking in mk (T. Petazzoni) 

 linux/Config.in | 12 ++++++++++++
 linux/linux.mk  |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 8c5539c..eacd53d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -53,6 +53,17 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 
 	  https://www.cip-project.org
 
+config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	bool "Latest CIP RT SLTS version (4.19.72-cip10-rt4)"
+	help
+	  Same as the CIP version, but this is the PREEMPT_RT realtime
+	  variant.
+
+	  The CIP community plans to maintain 4.19 for security and
+	  bug fixes for more than 10 years.
+
+	  https://www.cip-project.org
+
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
 	help
@@ -124,6 +135,7 @@ config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.3.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.82-cip14" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "4.19.72-cip10-rt4" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.mk b/linux/linux.mk
index c45db4d..762f886 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -29,7 +29,7 @@ LINUX_SITE_METHOD = hg
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SVN),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = svn
-else ifeq ($(BR2_LINUX_KERNEL_LATEST_CIP_VERSION),y)
+else ifeq ($(BR2_LINUX_KERNEL_LATEST_CIP_VERSION)$(BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION),y)
 LINUX_SOURCE = linux-cip-$(LINUX_VERSION).tar.gz
 LINUX_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git/snapshot
 else ifneq ($(findstring -rc,$(LINUX_VERSION)),)
-- 
2.7.4
