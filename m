From: kostap at marvell.com <kostap@marvell.com>
Date: Mon, 24 Dec 2018 15:18:14 +0200
Subject: [Buildroot] [PATCH] boot/mv-ddr-marvell: support custom GIT settings
Message-ID: <20181224131814.20804-1-kostap@marvell.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Konstantin Porotchkin <kostap@marvell.com>

Add support for custom repositories for mv-ddr-marvell sources.
This patch allows getting the mv-ddr-marvell package sources
out of user-defined repositories.
The configuration options are similar to uboot package - once
the BR2_TARGET_MV_DDR_MARVELL_CUSTOM_GIT=y, the following
configuration entries are used for fetching the package sources:
BR2_TARGET_MV_DDR_MARVELL_CUSTOM_REPO_URL
BR2_TARGET_MV_DDR_MARVELL_CUSTOM_REPO_VERSION

Change-Id: Ibdef65a3ccdfbe47123f27ab6ba311a75d66d50e
Signed-off-by: Konstantin Porotchkin <kostap@marvell.com>
---
 boot/mv-ddr-marvell/Config.in         | 16 ++++++++++++++++
 boot/mv-ddr-marvell/mv-ddr-marvell.mk |  7 +++++++
 2 files changed, 23 insertions(+)

diff --git a/boot/mv-ddr-marvell/Config.in b/boot/mv-ddr-marvell/Config.in
index 4ee8c95b2c..0a9ed7aca5 100644
--- a/boot/mv-ddr-marvell/Config.in
+++ b/boot/mv-ddr-marvell/Config.in
@@ -8,3 +8,19 @@ config BR2_TARGET_MV_DDR_MARVELL
 	  and 8040 SoCs.
 
 	  https://github.com/MarvellEmbeddedProcessors/mv-ddr-marvell/
+
+config BR2_TARGET_MV_DDR_MARVELL_CUSTOM_GIT
+	bool "Custom Git repository"
+
+if BR2_TARGET_MV_DDR_MARVELL_CUSTOM_GIT
+
+config BR2_TARGET_MV_DDR_MARVELL_CUSTOM_REPO_URL
+	string "URL of custom repository"
+
+config BR2_TARGET_MV_DDR_MARVELL_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	help
+	  Revision to use in the typical format used by Git
+	  E.G. a sha id, a tag, branch, ..
+
+endif
diff --git a/boot/mv-ddr-marvell/mv-ddr-marvell.mk b/boot/mv-ddr-marvell/mv-ddr-marvell.mk
index 8d508215f8..100aaccb5f 100644
--- a/boot/mv-ddr-marvell/mv-ddr-marvell.mk
+++ b/boot/mv-ddr-marvell/mv-ddr-marvell.mk
@@ -4,9 +4,16 @@
 #
 ################################################################################
 
+ifeq ($(BR2_TARGET_MV_DDR_MARVELL_CUSTOM_GIT),y)
+MV_DDR_MARVELL_VERSION = $(call qstrip,$(BR2_TARGET_MV_DDR_MARVELL_CUSTOM_REPO_VERSION))
+MV_DDR_MARVELL_SITE = $(call qstrip,$(BR2_TARGET_MV_DDR_MARVELL_CUSTOM_REPO_URL))
+MV_DDR_MARVELL_SITE_METHOD = git
+BR_NO_CHECK_HASH_FOR += $(MV_DDR_MARVELL_SOURCE)
+else
 # This is the commit for mv_ddr-armada-18.09.2
 MV_DDR_MARVELL_VERSION = 99d772547314f84921268d57e53d8769197d3e21
 MV_DDR_MARVELL_SITE = $(call github,MarvellEmbeddedProcessors,mv-ddr-marvell,$(MV_DDR_MARVELL_VERSION))
+endif
 MV_DDR_MARVELL_LICENSE = GPL-2.0+ or LGPL-2.1 with freertos-exception-2.0, BSD-3-Clause, Marvell Commercial
 MV_DDR_MARVELL_LICENSE_FILES = ddr3_init.c
 
-- 
2.17.1
