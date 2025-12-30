Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF47CEE01FA
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 14:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B624480C51;
	Tue, 30 Dec 2025 14:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2EOJ_1R00uJ8; Tue, 30 Dec 2025 14:21:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1DA580C74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767104492;
	bh=RRGMEge+nQ8mbewSGQLJ2A9TC2l50GEhILsjvKDgpBc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T7GqMIxLlQ1AHNpgU1W2hgGjncnw0zfKad4/PkVQWS+rMli9vG6JrydB0Xhs16/O/
	 7rUeKpJEfR7XExJc24pRxj1GN8JlA0MQkkPSShGSP1HA0a5hxDVBtRXAaxNUHRTXEi
	 V3JPzg+IQfXqfybu/qeApsV+2Cq0eKazO1ofcV3YCblh88l7g3oag2WkS0Sz8Un3yF
	 mRx3ASEkyBe+VIjffcqpafGVHTq4Hs5iXCxdbp1lA7sdi+yiC3FRI3XRHjlDZJEi4S
	 pvKmSd1vss3BEg2WIqzEIVUmx/IVQcOCJQdnAT+8HhXRz/lVxZFGlkzpbmAOjTC8CJ
	 bQymikr+i0xAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1DA580C74;
	Tue, 30 Dec 2025 14:21:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DE25035B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 14:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4EAB80C74
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 14:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BlcJfndAIXK7 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 14:21:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3920980C51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3920980C51
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3920980C51
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 14:21:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EFC69A4C2AA0;
 Tue, 30 Dec 2025 15:21:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60254)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaab4-000000008KV-1Tw5;
 Tue, 30 Dec 2025 14:21:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Knight <james.knight@collins.com>
Date: Tue, 30 Dec 2025 15:21:14 +0100
Message-ID: <20251230142114.1564503-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230142114.1564503-1-bernd@kuhls.net>
References: <20251230142114.1564503-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767104474;
 bh=KpUkrRCWhWO37oVOHUqk7FeuiksFAdltlkBITuuTmD8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=JAevTof1O79Uju7b1v/91VOGobtplfZ4Gg+2icRuQUDwqppZ16Q4MekwJpsx5FxIN
 1YUnv8s+CTG+b5SIvS3Viw8TISCGEj2vXeaFoh30uLbwbbTDKEPodgD8EDxpmgLKCp
 YadeFREomvqEAxjxdiR38gtz9Oukw8MowTKbckf8cHzqWkJUGrYNaUxQ61KP4hCaZj
 4L7OiBZ0EUgpH5paXzMjbl/w0HxE7LtNT623xFgwRNJoN99MmzJEdNoT9U0+GM0QcB
 NZxmO0RCfTIeqMa3dIFpqJ4fuqaj+6EGFV4BNP71+nF7pGDkcV2DBZo2b3Gj7UMtXa
 5dgV5Dpe+CbqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=JAevTof1
Subject: [Buildroot] [PATCH 2/2] package/gerbera: bump version to 3.0.0
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

https://github.com/gerbera/gerbera/blob/v3.0.0/ReleaseNotes.md

Removed patch which is included in this release.

Added optional dependency to libpqxx, depends on libpqxx using CMake as
build system.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gerbera/0001-fix_fmt_12.patch | 29 ---------------------------
 package/gerbera/gerbera.hash          |  2 +-
 package/gerbera/gerbera.mk            |  9 ++++++++-
 3 files changed, 9 insertions(+), 31 deletions(-)
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
index 3056ff11ac..8a83abaad0 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6a7ed1c73bd86bdddd76bcb6c4bcd2e42788a20eb1f3165e0ea9f456abccd3ed  gerbera-2.6.1.tar.gz
+sha256  d7934a2318f45330deb2ed1b589bd37b49f42f7929a9d11650349d17c998f920  gerbera-3.0.0.tar.gz
 sha256  cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index d2d68db686..340ae7fca0 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 2.6.1
+GERBERA_VERSION = 3.0.0
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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
