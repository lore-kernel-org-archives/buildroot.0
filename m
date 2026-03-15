Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8B2D58B22
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 13:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40E1281150;
	Sun, 15 Mar 2026 13:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VzC5rfm5pAWG; Sun, 15 Mar 2026 13:17:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41C32812DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773580626;
	bh=KM+XFJRh/m3zhQjg5FaP2dvH8+JND+TSObjIp934bJQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Srr27ElVwXnOyoRQX2C59Rbcoua44gCw+OyEg2LUyG6HA3pG3HHY9BBvSN1kApL5z
	 WuvpxnL9NRpB/9aCCHfHTDyon9qhWfAsr/qryd6nJVPlj0ToGmFIIrFwEbBFnxfEgA
	 ypVGCATJAJSv3Amytc2iJaP7RdPaLNIf+4ZgUIJv96TlMBcsMfE/RSbA1U6KUYqbW+
	 x/GR65HXg4EGXZ8+vlZLNHTvNLpwvIFKA+jRv57NPlKNuGctSdQoCxbqjEspM6nLIz
	 0xc/tY9MZdTpTpGXkE05IGurBXPtWeWqcU4idTLV6p9YMhnvp5S/XlVSUMp/KoEMRf
	 r1nYYmOui7S3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41C32812DB;
	Sun, 15 Mar 2026 13:17:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C8F81B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 13:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3241A60830
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 13:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bavqNM_kCNqb for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 13:17:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 19B23607D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19B23607D4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19B23607D4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 13:17:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5fc.dip0.t-ipconnect.de [84.161.181.252])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0F65AA4C06E9;
 Sun, 15 Mar 2026 14:17:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40510)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1lKN-000000007HE-1A82;
 Sun, 15 Mar 2026 13:16:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Knight <james.knight@collins.com>
Date: Sun, 15 Mar 2026 14:16:19 +0100
Message-ID: <20260315131619.3961450-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315131619.3961450-1-bernd@kuhls.net>
References: <20260315131619.3961450-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773580622;
 bh=XdNZBDCT0MA+nF+mGDwgmY50drOfcv5NYyvHraSMRDk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Q1l48tuwfkgSH5mlGfvevoT+IpfKqYPE5yjcQuEpDy9GVRVeAFDBRiBtzX5scgiAw
 mKCXLmaE66e1rtyuQhTtM9tcx1fXLWR2aWJ/wuRtuYa+UeIYe28n3Jn04EQB6Cq7Us
 1PUoYDdOMud8au4zZC6jwlmBaYZnKKBhQ24BCefzP5SXl3hmjfSl+er62O0Af4Ofb9
 h4p3GreCXq93V6KXyyiM5JI7tPupAW413ruR50K+muFKyDDszoytUMHN8if3r23U50
 9B2Ox9RuMm0OesAZ6AMDIroLrImudOfBVb5Uah691NWKoZv4wTaLyELtGqR0z8Q7mr
 EMloNN1eMMuVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Q1l48tuw
Subject: [Buildroot] [PATCH 4/4] package/gerbera: bump version to 3.2.0
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

https://github.com/gerbera/gerbera/blob/v3.2.0/ReleaseNotes.md

Removed patch which is included in this release.

Added optional dependency to libpqxx which needs to be built with CMake.

Added optional dependency to new libzippp package.

Added cxxopts as new dependency:
https://github.com/gerbera/gerbera/commit/72f7655e86402acac5600a462d429a40ce1aec84

Updated config.xml following a note from the release notes:
"xmlns was renamed to xml-ns for compliance reasons"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gerbera/0001-fix_fmt_12.patch | 29 ---------------------------
 package/gerbera/Config.in             |  1 +
 package/gerbera/config.xml            |  2 +-
 package/gerbera/gerbera.hash          |  2 +-
 package/gerbera/gerbera.mk            | 17 +++++++++++++++-
 5 files changed, 19 insertions(+), 32 deletions(-)
 delete mode 100644 package/gerbera/0001-fix_fmt_12.patch

diff --git a/package/gerbera/0001-fix_fmt_12.patch b/package/gerbera/0001-fix_fmt_12.patch
deleted file mode 100644
index a10b78dae6..0000000000
--- a/package/gerbera/0001-fix_fmt_12.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From f8e158bc72986e46b93d05358c29db0c10f2fe9f Mon Sep 17 00:00:00 2001
-From: Karlchen <k_straussberger@netzland.net>
-Date: Wed, 17 Sep 2025 21:18:49 +0200
-Subject: [PATCH] Update to fmt 12.0.0
-
-Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
-Upstream: https://github.com/gerbera/gerbera/commit/f8e158bc72986e46b93d05358c29db0c10f2fe9f
-[buildroot@heine.tech: removed all patch content not patching actual code]
-
----
- src/web/config_load.cc            | 4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-
-diff --git a/src/web/config_load.cc b/src/web/config_load.cc
-index 8b296c43e0..4259ae3331 100644
---- a/src/web/config_load.cc
-+++ b/src/web/config_load.cc
-@@ -150,7 +150,11 @@ void Web::ConfigLoad::addNewValue(
- template <typename T>
- void Web::ConfigLoad::setValue(Json::Value& item, const T& value)
- {
-+#if FMT_VERSION >= 120000
-+    static_assert(fmt::is_formattable<T, fmt::format_context>::value, "T must be formattable");
-+#else
-     static_assert(fmt::has_formatter<T, fmt::format_context>::value, "T must be formattable");
-+#endif
-     item[CONFIG_LOAD_VALUE] = fmt::to_string(value);
- }
- 
diff --git a/package/gerbera/Config.in b/package/gerbera/Config.in
index c5f7cf9cd1..3078d2017f 100644
--- a/package/gerbera/Config.in
+++ b/package/gerbera/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_GERBERA
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # fmt
+	select BR2_PACKAGE_CXXOPTS
 	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_ICU
 	select BR2_PACKAGE_JSONCPP
diff --git a/package/gerbera/config.xml b/package/gerbera/config.xml
index e6261f25d0..6d2d63c789 100644
--- a/package/gerbera/config.xml
+++ b/package/gerbera/config.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
-<config version="2" xmlns="http://mediatomb.cc/config/2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://mediatomb.cc/config/2 http://mediatomb.cc/config/2.xsd">
+<config version="2" xmlns="http://mediatomb.cc/config/2" xml-ns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://mediatomb.cc/config/2 http://mediatomb.cc/config/2.xsd">
   <!--
      See https://gerbera.io or read the docs for more
      information on creating and using config.xml configuration files.
diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index 3056ff11ac..a60017e8db 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6a7ed1c73bd86bdddd76bcb6c4bcd2e42788a20eb1f3165e0ea9f456abccd3ed  gerbera-2.6.1.tar.gz
+sha256  c55ec5cddc952e2563586ac76014be072c9dedb5094c6675889afa90b8df23e2  gerbera-3.2.0.tar.gz
 sha256  cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index d2d68db686..1f7a0d48ff 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 2.6.1
+GERBERA_VERSION = 3.2.0
 GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
 GERBERA_DEPENDENCIES = \
+	cxxopts \
 	fmt \
 	icu \
 	jsoncpp \
@@ -91,6 +92,13 @@ GERBERA_DEPENDENCIES += libupnp
 GERBERA_CONF_OPTS += -DWITH_NPUPNP=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPQXX),y)
+GERBERA_DEPENDENCIES += libpqxx
+GERBERA_CONF_OPTS += -DWITH_PGSQL=ON
+else
+GERBERA_CONF_OPTS += -DWITH_PGSQL=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_MARIADB),y)
 GERBERA_DEPENDENCIES += mariadb
 GERBERA_CONF_OPTS += -DWITH_MYSQL=ON
@@ -112,6 +120,13 @@ else
 GERBERA_CONF_OPTS += -DWITH_TAGLIB=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBZIPPP),y)
+GERBERA_DEPENDENCIES += libzip libzippp
+GERBERA_CONF_OPTS += -DWITH_ZIP=ON
+else
+GERBERA_CONF_OPTS += -DWITH_ZIP=OFF
+endif
+
 # gerbera does not provide a default configuration file, it can be
 # created during run time through --create-config:
 # http://docs.gerbera.io/en/latest/config-overview.html#generating-configuration
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
