Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5E7FCC9CA
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 06:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 899824201E;
	Tue, 10 Mar 2026 06:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h8y2HZtCFn81; Tue, 10 Mar 2026 06:03:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82A5C420F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773122612;
	bh=hrji5ZNS0yx1tgW0AFIFojuYJCgS06D1d7yDE7LVmvs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N/oMhNwUMVJ6+i+S16DS2XzGyWfGDqZELKuRFXuXcDtYGcRFVOseXIK3i3cnV/4Di
	 +soj4byOEVA6me742CXNetilwB5jHMPmQs6BRaUdRIZM6MBx/YhJy/xlNP7aN6Q0ym
	 rzjY6aJCYwICHSqDK6GCHqgwCDDeELWiljVgnHia1vfYpDP2A6Thfitkz+prRdwqR3
	 mpTIP146GAvQ3lz4w4zRAvcy5/yJaAhcgkPSdAJ/dTRL5bwrzqdx/JvLhSdg34iIN6
	 xhZuaVzWTM+g4duMfX0dbJ3Iopdq9aJqWW1mb9FI4KYQ0Rxb0JJVwJSR4rx11XzBzN
	 URArCWQuJFyLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82A5C420F6;
	Tue, 10 Mar 2026 06:03:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 317E935C
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 06:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F4FF4063A
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 06:03:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atBHAMZXhi_I for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 06:03:30 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 069C64002A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 069C64002A
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 069C64002A
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 06:03:29 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 76203BDE2C9B;
 Tue, 10 Mar 2026 07:03:27 +0100 (CET)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Tue, 10 Mar 2026 07:01:49 +0100
Message-ID: <20260310060155.240036-4-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304091915.1102943-1-br025@umbiko.net>
References: <20260304091915.1102943-1-br025@umbiko.net>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1773122608; bh=VeaRvF+Nqag9NCzvxSHKcH9IkwZ/2NP5VmMa9vsSWcE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=RZu5w5z7UUQgR4YaGhFmjl+Rp+X7mVt4elYBc4eKZhkEbqTKEF/vTIqZwrWvgyw9n
 9JB3B7gXwCld10Dot487PBS7yI7qxpv/dvPQ1bPpESJXvw3QqZPWK1BhUbVjtADKMD
 3y6mdb4nu+qwSuJR99LwbdmWAH9G5N0gNduVLVLI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=RZu5w5z7
Subject: [Buildroot] [PATCH v2 3/3] package/icu: Fix /enhance customizing
 for size
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
v1 -> v2: rebased (Config.in.legacy changed)

 Config.in.legacy      | 14 +++++++++++
 package/icu/Config.in | 47 +++++++++++++++++++++++++++++++------
 package/icu/icu.mk    | 54 +++++++++++++++++++++++++++++++------------
 3 files changed, 93 insertions(+), 22 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b85a147032..72dcf393f5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,20 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
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
 config BR2_PACKAGE_PYTHON3_OSSAUDIODEV
 	bool "python3 ossaudiodev module removed"
 	select BR2_LEGACY
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
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
