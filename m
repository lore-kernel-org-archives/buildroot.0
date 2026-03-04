Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68EFEB7EB7
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 09:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B865D607AB;
	Wed,  4 Mar 2026 09:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MqF2ECjL6-us; Wed,  4 Mar 2026 09:20:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7389607AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772616010;
	bh=nBtBXL4zwktTSWBA22YpjwSLemF5bRUtE/ys78m41A0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iAyk5h+ZqqweyVfAUnKXNxf4/QoO7xIQHGf0rZsBXnAAq8t7KcdIj5xxtHFbJoltj
	 A0TFPQ2rOXSurbRfc7S2cKzEITDVF3ySn9IhsehJHb7CpNkyM2BCmAGrq+yUZECgu5
	 c56EB9Uk4bT20CL/LS4S019OebcDlMCLAz2xZcIFfC1a7NtsYuAlRfCPTdLKFS8GoO
	 2Tl0feebnGwu2X7Yz76/3Tp3GySLQ8f8P2LLtwscq+DHHcMJbyYd2aZYN3MfTOe9Z8
	 VCzzm9mziAq6rdlcOHvFoQ0bUmwWYzujI6bYHcwjGy0pO238IGMPrH2lNBSCYGrl9b
	 Pv5GQF7Dq4pYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7389607AD;
	Wed,  4 Mar 2026 09:20:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 63F931EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 09:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 618838131F
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 09:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1yFwVD-aXucg for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 09:20:06 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3882B80E82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3882B80E82
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3882B80E82
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 09:20:06 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id ABE2EBDE2DAF;
 Wed, 04 Mar 2026 10:20:03 +0100 (CET)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Wed,  4 Mar 2026 10:19:12 +0100
Message-ID: <20260304091915.1102943-4-br025@umbiko.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304091915.1102943-1-br025@umbiko.net>
References: <20260304091915.1102943-1-br025@umbiko.net>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1772616004; bh=Zq33ZKmohaqjzoSlaS41ffIKoGPopxTnv/2QLuBnbCY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=d0qZKzGQg6jNKp4xXWBqV9E4SoE01Wuv0GDZ8kQU5epVDtU2E0CD37kINbxk1E50J
 ECVVXWvgpK4gMVF1Hwmda5PD+wwgkJNfAN16+UiG4IlAqvuUCi8SEJ3IYQrE55zjY6
 KmGrncpAz4/9kPBf9mIyNGTG3YjeaCf4ZgFVkqBY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=d0qZKzGQ
Subject: [Buildroot] [PATCH 3/3] package/icu: Upgrade customizing for size
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adding Unicode functionality to a project may double the size of the root
file system. The method that Buildroot implements to mitigate the data
library size went out of fashion with ICU version 58.

Rework package to upgrade data slicing and add more options to customize
for size:

  remove option to add custom data library
  add option to supply custom JSON filter file
  download data source archive if data build is requested
  add option to omit extra libraries from target build and installation
  disable target build of tools instead of removing post-installation

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
 Config.in.legacy      | 16 +++++++++++++
 package/icu/Config.in | 47 +++++++++++++++++++++++++++++++------
 package/icu/icu.mk    | 54 +++++++++++++++++++++++++++++++------------
 3 files changed, 95 insertions(+), 22 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a2a7b06a6d..a6655a69fc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,22 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2026.03"
+
+config BR2_PACKAGE_ICU_CUSTOM_DATA_PATH
+	string "ICU custom data file generation has changed"
+	help
+	  The online tool for generating custom data files is no longer
+	  available.  The data file generation has been integrated into
+	  the ICU build.
+
+	  Reference:  https://unicode-org.atlassian.net/browse/ICU-12977
+
+config BR2_PACKAGE_ICU_CUSTOM_DATA_PATH_WRAP
+	bool
+	default y if BR2_PACKAGE_ICU_CUSTOM_DATA_PATH != ""
+	select BR2_LEGACY
+
 comment "Legacy options removed in 2026.02"
 
 config BR2_PACKAGE_QEMU_TARGET_CRIS
diff --git a/package/icu/Config.in b/package/icu/Config.in
index f5686085dd..05cde830f1 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -16,15 +16,48 @@ config BR2_PACKAGE_ICU
 
 if BR2_PACKAGE_ICU
 
-config BR2_PACKAGE_ICU_CUSTOM_DATA_PATH
-	string "Path to custom data library file"
+config BR2_PACKAGE_ICU_BUILD_DATA
+	bool "Build ICU data"
 	help
-	  This option allows to define the path to a custom data
-	  library generated with http://apps.icu-project.org/datacustom/
-	  Make sure you select the appropriate version to match the one
-	  provided by buildroot.
-	  Leave empty to not use this functionality.
+	  ICU is delivered with a nearly complete set of features and
+	  locales, which currently use 38 MiB of space. If you want to
+	  customize the feature set, and thereby reduce the size of the
+	  data library, you need to create a JSON file that defines the
+	  components that should be included in a custom configuration
+	  and thereby have ICU build a downsized data library.
 
+	  For details see:
+	  https://unicode-org.github.io/icu/userguide/icu_data/buildtool.html
+
+if BR2_PACKAGE_ICU_BUILD_DATA
+
+config BR2_PACKAGE_ICU_DATA_FILTER_FILE
+	string "Custom data filter file"
+	default BR2_PACKAGE_ICU_CUSTOM_DATA_PATH if BR2_PACKAGE_ICU_CUSTOM_DATA_PATH != ""  # legacy
+	help
+	  Specify the path to the custom filter file. Only JSON is
+	  supported. If you omit the file name here, the default data
+	  set is generated.
+
+config BR2_PACKAGE_ICU_OMIT_EXTRAS
+	bool "Build without extra libraries"
+	help
+	  This will just build the data library plus i18n and unicode
+	  conversion functionality. This is usually sufficent to allow
+	  the represenation of Unicode characters on the target system
+	  and removes 2-3 MiB from the root file system.
+
+config BR2_PACKAGE_ICU_HOST_PYTHON_JSONSCHEMA
+	bool "Host python-jsonschema"
+	select BR2_PACKAGE_HOST_PYTHON_JSONSCHEMA
+	help
+	  This adds the python-jsonschema host package for validating
+	  JSON syntax. This is useful while developing filter rules;
+	  once you have a working filter file, it is unnecessary.
+
+	  Only use this in a build that has a fairly complete set of
+	  Python already, python-jsonschema has multiple dependencies!
+endif
 endif
 
 comment "icu needs a toolchain w/ C++, wchar, threads, gcc >= 7, host gcc >= 7"
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 3030e0c71c..81990d1df7 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-# Git tags (and therefore versions on release-monitoring.org) use the
-# XX-Y format, but the tarballs are named XX_Y and the containing
-# directories XX.Y.
 ICU_VERSION = 78.2
-ICU_SOURCE = icu4c-$(ICU_VERSION)-sources.tgz
+ICU_PKG_NAME = icu4c-$(ICU_VERSION)
+ICU_SOURCE = $(ICU_PKG_NAME)-sources.tgz
+ICU_DATA_SOURCE = $(ICU_PKG_NAME)-data.zip
 ICU_SITE = \
 	https://github.com/unicode-org/icu/releases/download/release-$(ICU_VERSION)
 ICU_LICENSE = ICU License
@@ -23,7 +22,14 @@ ICU_CONFIG_SCRIPTS = icu-config
 ICU_CONF_OPTS = \
 	--with-cross-build=$(HOST_ICU_DIR)/source \
 	--disable-samples \
-	--disable-tests
+	--disable-tests \
+	--disable-tools
+
+ifeq ($(BR2_PACKAGE_ICU_OMIT_EXTRAS),y)
+ICU_CONF_OPTS += \
+	--disable-extras \
+	--disable-icuio
+endif
 
 # the icu build process breaks if the TARGET environment variable is
 # non-empty
@@ -32,6 +38,12 @@ ICU_MAKE_ENV += TARGET=""
 HOST_ICU_CONF_ENV += TARGET=""
 HOST_ICU_MAKE_ENV += TARGET=""
 
+# this is an optional dependency of the icu databuilder
+# https://github.com/unicode-org/icu/blob/main/docs/userguide/icu_data/buildtool.md
+ifeq ($(BR2_PACKAGE_ICU_HOST_PYTHON_JSONSCHEMA),y)
+ICU_DEPENDENCIES += host-python-jsonschema
+endif
+
 # When available, icu prefers to use C++11 atomics, which rely on the
 # __atomic builtins. On certain architectures, this requires linking
 # with libatomic starting from gcc 4.8.
@@ -44,12 +56,13 @@ ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
 ICU_CONF_ENV += ac_cv_func_strtod_l=no
 endif
 
+# tools are needed on the host
 HOST_ICU_CONF_OPTS = \
-	--disable-samples \
-	--disable-tests \
 	--disable-extras \
 	--disable-icuio \
-	--disable-layout
+	--disable-samples \
+	--disable-tests
+
 ICU_SUBDIR = source
 HOST_ICU_SUBDIR = source
 
@@ -64,18 +77,29 @@ ifeq ($(LD_LIBRARY_PATH),)
 ICU_MAKE_ENV += LD_LIBRARY_PATH=/dev/null
 endif
 
-ICU_CUSTOM_DATA_PATH = $(call qstrip,$(BR2_PACKAGE_ICU_CUSTOM_DATA_PATH))
+ifeq ($(BR2_PACKAGE_ICU_BUILD_DATA),y)
 
-ifneq ($(ICU_CUSTOM_DATA_PATH),)
-define ICU_COPY_CUSTOM_DATA
-	cp $(ICU_CUSTOM_DATA_PATH) $(@D)/source/data/in/
+# The source/data directory has to be replaced with the downloaded source
+# tree. Custom make files for the data library will be generated during the
+# configure step
+ICU_DATA_FILE = $(BR2_DL_DIR)/$(ICU_NAME)/$(ICU_DATA_SOURCE)
+define ICU_DOWNLOAD_DATA
+	[ -e $(ICU_DATA_FILE) ] || wget "$(ICU_SITE)/$(ICU_DATA_SOURCE)" -qO "$(ICU_DATA_FILE)"
+	rm -fr $(@D)/source/data
+	$(UNZIP) -d $(@D)/source $(ICU_DATA_FILE)
 endef
-ICU_POST_PATCH_HOOKS += ICU_COPY_CUSTOM_DATA
+ICU_POST_PATCH_HOOKS += ICU_DOWNLOAD_DATA
+
+endif
+
+ICU_DATA_FILTER_FILE = $(call qstrip,$(BR2_PACKAGE_ICU_DATA_FILTER_FILE))
+
+ifneq ($(ICU_DATA_FILTER_FILE),)
+ICU_CONF_ENV += ICU_DATA_FILTER_FILE="$(ICU_DATA_FILTER_FILE)"
 endif
 
 define ICU_REMOVE_DEV_FILES
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,derb genbrk gencfu gencnval gendict genrb icuinfo makeconv uconv)
-	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,genccode gencmn gennorm2 gensprep icupkg)
+	rm -rf $(TARGET_DIR)/usr/lib/icu
 	rm -rf $(TARGET_DIR)/usr/share/icu
 endef
 ICU_POST_INSTALL_TARGET_HOOKS += ICU_REMOVE_DEV_FILES
-- 
2.51.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
