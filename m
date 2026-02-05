Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CC0ECD997
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 19:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7170B60F92;
	Thu,  5 Feb 2026 19:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74EqUKFpStzv; Thu,  5 Feb 2026 19:30:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 580BD6110C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770319815;
	bh=KBRSPdZr/YuI8PVQ/ZLFDVGMbuTUS865sy+AOaKuVaY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=npEneJ4v4+tuM1Pd6ySXSff3vQqC1oLmvDst85/YGV8LqpzB7jmZtQmgCAOa5oErH
	 Ma9ggo+y3Z06cc4Qu8kC5Qwb/uJFO70bHcSSSyBuAAJMQOpqHld0lw5iu/XKqN3pg3
	 cLJcDB1WyCN7mFMMgZEsLblMyJwpumXyjd+pnPkkq3s7kBwtXDCL2BJ/qaNG3bWKQR
	 WcbBNWbFYklNTgnW3wD/SiT7LCjontqM7eD90Y4Ykq4uw6zt0xce4St4EQMM3akwvI
	 BOX75VO5nahYhc4v885s8hneaVKiHxPMHH/i304JxjOaWWf608qaWLFEVVEkYLBe96
	 ihXt4AScimyDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 580BD6110C;
	Thu,  5 Feb 2026 19:30:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 482CD173
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1788E41241
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WSSycFhLSnte for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 19:30:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B36C41244
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B36C41244
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B36C41244
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:30:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A3374A4C58DA;
 Thu,  5 Feb 2026 20:29:42 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49800)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vo52s-000000002Is-21mF;
 Thu, 05 Feb 2026 19:29:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Knight <james.knight@collins.com>
Date: Thu,  5 Feb 2026 20:29:42 +0100
Message-ID: <20260205192942.1729614-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205192942.1729614-1-bernd@kuhls.net>
References: <20260205192942.1729614-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770319782;
 bh=oX4JtwEel/dC+078JNWjWX5lRiAuHkKv2SAOuA8NI80=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=NAKIcxI+NAEjHy1EoHOL5tnJxv/eVqlc1uMQ1qhRUfrvqGBBPKCA/ML83Z9PdOlv1
 pxbzzl2ra5Ikgy45XU0mbJxUu41xc4hHud4Nl/EZHgSBp4LWrbzPBu9v/ydyNzU/n3
 2GbBhKzLnFmbwFJZYrew17Qc6iFLFD8SQhgcqOsxsHhjMAYJGZqYmPGBpjS0+hsvCp
 m+SCt92T6VnZYvcqusbNNnmPNq4WyStbUcBJT5Ui1Or7cuZX9dt6cDXnTJkmd9EXql
 n5MPNSC28rEb/ytQV30N8vA0NxmU4uX8lWNOIxoUgGOHBB3MP9+27m/YbgfWvkVGqN
 01LturVKqJbVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=NAKIcxI+
Subject: [Buildroot] [PATCH 3/3] package/gerbera: bump version to 3.1.1
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

https://github.com/gerbera/gerbera/blob/v3.1.1/ReleaseNotes.md

Removed patch which is included in this release.

Added optional dependency to libpqxx which needs to be built with CMake.

Added optional dependency to new libzippp package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gerbera/0001-fix_fmt_12.patch | 29 ---------------------------
 package/gerbera/gerbera.hash          |  2 +-
 package/gerbera/gerbera.mk            | 16 ++++++++++++++-
 3 files changed, 16 insertions(+), 31 deletions(-)
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
diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index 3056ff11ac..79c239b5e5 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6a7ed1c73bd86bdddd76bcb6c4bcd2e42788a20eb1f3165e0ea9f456abccd3ed  gerbera-2.6.1.tar.gz
+sha256  0556a6dc17da2043d88bee934c43a7475403da920a9b07a12fb48ac6dfc58ea3  gerbera-3.1.1.tar.gz
 sha256  cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index d2d68db686..71be0cb222 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 2.6.1
+GERBERA_VERSION = 3.1.1
 GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
@@ -91,6 +91,13 @@ GERBERA_DEPENDENCIES += libupnp
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
@@ -112,6 +119,13 @@ else
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
