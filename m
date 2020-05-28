From: Mario Mintel <mariomintel@gmail.com>
Date: Thu, 28 May 2020 16:43:33 +0200
Subject: [Buildroot] [PATCH 2/2] package/jailhouse: add option to choose
 custom repo/branch
In-Reply-To: <20200528144333.49268-1-mariomintel@gmail.com>
References: <20200528144333.49268-1-mariomintel@gmail.com>
Message-ID: <20200528144333.49268-3-mariomintel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In addition to official releases of Jailhouse, allow to specify a custom
Git URI + branches. This adds more flexibility for custom
configurations.

Signed-off-by: Mario Mintel <mariomintel@gmail.com>
---
 package/jailhouse/Config.in    | 36 ++++++++++++++++++++++++++++++++--
 package/jailhouse/jailhouse.mk | 17 ++++++++++++++--
 2 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/package/jailhouse/Config.in b/package/jailhouse/Config.in
index 596b4951db..47523747f9 100644
--- a/package/jailhouse/Config.in
+++ b/package/jailhouse/Config.in
@@ -3,18 +3,50 @@ config BR2_PACKAGE_JAILHOUSE
 	depends on BR2_aarch64 || BR2_x86_64
 	depends on BR2_LINUX_KERNEL
 	help
-	  The Jailhouse partitioning Hypervisor based on Linux.
+	  The Jailhouse Linux-based partitioning hypervisor.
 
 	  https://github.com/siemens/jailhouse
 
 if BR2_PACKAGE_JAILHOUSE
 
+choice
+	prompt "Jailhouse Version"
+
+config BR2_PACKAGE_JAILHOUSE_LATEST_VERSION
+	bool "Version 0.12"
+
+config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT
+	bool "Custom Git repository"
+	help
+	  This option allows Buildroot to get the Jailhouse source code
+	  from a custom Git repository.
+
+endchoice
+
+if BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT
+
+config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_URI
+	string "URI of custom repository"
+	default "https://github.com/siemens/jailhouse.git"
+
+config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_BRANCH
+	string "Name of Git branch"
+	default "master"
+
+endif
+
+config BR2_PACKAGE_JAILHOUSE_VERSION
+	string
+	default "0.12" if BR2_PACKAGE_JAILHOUSE_LATEST_VERSION
+	default BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_BRANCH \
+		if BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT
+
 config BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS
 	bool "helper scripts"
 	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_MAKO # runtime
 	help
-	  Python-based helpers for the Jailhouse Hypervisor.
+	  Python-based helpers for the Jailhouse hypervisor.
 
 	  https://github.com/siemens/jailhouse
 
diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
index 6356c5a7aa..d134b3d1b4 100644
--- a/package/jailhouse/jailhouse.mk
+++ b/package/jailhouse/jailhouse.mk
@@ -4,10 +4,23 @@
 #
 ################################################################################
 
-JAILHOUSE_VERSION = 0.12
-JAILHOUSE_SITE = $(call github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
+JAILHOUSE_VERSION = $(call qstrip,$(BR2_PACKAGE_JAILHOUSE_VERSION))
 JAILHOUSE_LICENSE = GPL-2.0
+ifeq ($(BR2_PACKAGE_JAILHOUSE_LATEST_VERSION),y)
 JAILHOUSE_LICENSE_FILES = COPYING
+endif
+
+ifeq ($(BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT),y)
+JAILHOUSE_SITE = $(call qstrip,$(BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_URI))
+JAILHOUSE_SITE_METHOD = git
+else
+JAILHOUSE_SITE = $(call github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
+endif
+
+ifeq ($(BR2_PACKAGE_JAILHOUSE)$(BR2_PACKAGE_JAILHOUSE_CUSTIM_GIT),y)
+BR_NO_CHECK_HASH_FOR += $(JAILHOUSE_SOURCE)
+endif
+
 JAILHOUSE_DEPENDENCIES = \
 	linux
 
-- 
2.26.1
