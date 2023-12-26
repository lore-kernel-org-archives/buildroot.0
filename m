Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDC1C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 20:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD492409B5;
	Tue, 26 Dec 2023 20:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD492409B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ia6VlIF0z-wy; Tue, 26 Dec 2023 20:34:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8930409DB;
	Tue, 26 Dec 2023 20:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8930409DB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 02E721BF591
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF55960BC2
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:34:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF55960BC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Us3pElPn1bma for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 20:34:30 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B323260B90
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 20:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B323260B90
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33666fb9318so4532912f8f.2
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 12:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703622868; x=1704227668;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sFdF9vFS+yqBNk9iJ/3ppp9mrAJLH5JYg/laWfPzAdY=;
 b=B3mpDZbZqjcmHfqeqDIOLmXCn5qqFnEY9fUizvAdJZui4sjhMamdSeS9Ml31HljAp3
 9jsQlB6Nqa09iPnUdlm2t5zoLP6h0f/TYX05Bl+ajLWuKnkZiVmBYzv4dReEIWKBE3bD
 hUUkk15E/hiYrNr+ToUe9oRIZBd3K6ryCJqFLjflpKuypJAHCfCnUvYQymaOQ8+1qoeW
 GXUL2HUH17cAShC44bI4e2Bogxj3l3k/lAzvPxgdjGNhCRNoJ25DgZsnXzK34RdjNVLz
 Q3v21sVvTeSmFyCro8PeSgz/XLdCzFRb/ol6kgv0ldd5oXDtdyPlQeacePMXN7RR5gw3
 vvjA==
X-Gm-Message-State: AOJu0YwGZKlZHhe8+jOOmYyPOlnPglkOflV+Bm4Ua4pxqgDdXEI2pVmn
 lx1qKMSnrMphwj1BpgykIDmDIFQHpao=
X-Google-Smtp-Source: AGHT+IEsaooGStZI0h99T1JMavpPyOPDybUaHLAPko7M6pSCksOv4RJBlcqYJfVidmJkMqi4ZsQ8Eg==
X-Received: by 2002:a05:6000:1003:b0:336:6ba1:556d with SMTP id
 a3-20020a056000100300b003366ba1556dmr3732603wrx.84.1703622867658; 
 Tue, 26 Dec 2023 12:34:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g3-20020a5d4883000000b00336e32338f3sm2105901wrq.70.2023.12.26.12.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 12:34:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 21:34:23 +0100
Message-ID: <20231226203423.1243592-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703622868; x=1704227668; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sFdF9vFS+yqBNk9iJ/3ppp9mrAJLH5JYg/laWfPzAdY=;
 b=AaNQHszqZQR9v2XLTrTy8I4Pr58QlnzRDlPUYG+ywHkvXbXpWtgO6eGioqSyXfEErM
 bnO5w5K4jRtMZ0eY19dbgM6jwgAwyN5zGFVZPynr8WVQR0AWw1t2GX2VWnLFSgFq9wmZ
 tTc2YkUNg2OWecFchcd8p/JiLgj8QjuqbJ/+S3gw0gK9wSH8oYWZJoKOAdlc8A9lhdGz
 VO4a24O79Fy8O5SYsnhQ9LfsFSe2lWq1Srn+daFLLyNkzfNmUOUTLTN4UUGvWDL9RCHd
 PN1kjuoeb+Mf5+WHFxwuKLdTJgpouBomjv66dCO14wru4h98BBvFfDN+kQQ2kpKjli97
 5mkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AaNQHszq
Subject: [Buildroot] [PATCH 1/1] package/squid: security bump to version 6.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- Fix CVE-2023-50269: This problem allows a remote client to perform
  Denial of Service attack by sending a large X-Forwarded-For header
  when the follow_x_forwarded_for feature is configured.

https://github.com/squid-cache/squid/security/advisories/GHSA-wgq4-4cfg-c4x3
https://github.com/squid-cache/squid/blob/SQUID_6_6/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-ESI-build-with-libxml2-v2.12.0-1600.patch | 32 -------------------
 package/squid/squid.hash                      |  8 ++---
 package/squid/squid.mk                        |  2 +-
 3 files changed, 5 insertions(+), 37 deletions(-)
 delete mode 100644 package/squid/0001-Bug-5328-Fix-ESI-build-with-libxml2-v2.12.0-1600.patch

diff --git a/package/squid/0001-Bug-5328-Fix-ESI-build-with-libxml2-v2.12.0-1600.patch b/package/squid/0001-Bug-5328-Fix-ESI-build-with-libxml2-v2.12.0-1600.patch
deleted file mode 100644
index fcbdcc1749..0000000000
--- a/package/squid/0001-Bug-5328-Fix-ESI-build-with-libxml2-v2.12.0-1600.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From c9b3edc1396925aa7eca3d3cc6c798806286a974 Mon Sep 17 00:00:00 2001
-From: bkuhls <bkuhls@users.noreply.github.com>
-Date: Sun, 26 Nov 2023 15:09:21 +0000
-Subject: [PATCH] Bug 5328: Fix ESI build with libxml2 v2.12.0 (#1600)
-
-    Libxml2Parser.cc:147:40: error: invalid conversion from
-    'const xmlError*' to 'xmlErrorPtr' {aka 'xmlError*'} [-fpermissive]
-
-libxml2 recently made xmlGetLastError() return a constant object.
-
-Upstream: https://github.com/squid-cache/squid/commit/c9b3edc1396925aa7eca3d3cc6c798806286a974
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/esi/Libxml2Parser.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/esi/Libxml2Parser.cc b/src/esi/Libxml2Parser.cc
-index f03752885..236a37433 100644
---- a/src/esi/Libxml2Parser.cc
-+++ b/src/esi/Libxml2Parser.cc
-@@ -144,7 +144,7 @@ ESILibxml2Parser::lineNumber() const
- char const *
- ESILibxml2Parser::errorString() const
- {
--    xmlErrorPtr error = xmlGetLastError();
-+    const auto error = xmlGetLastError();
- 
-     if (error == nullptr)
-         return nullptr;
--- 
-2.43.0
-
diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index a163bd9ad3..4a8ea5d550 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v6/squid-6.5.tar.xz.asc
-md5  da2797d899cf538fab7f504fdf3c18bf  squid-6.5.tar.xz
-sha1  07a08394625948750264778c82e19cf24ea7cb1f  squid-6.5.tar.xz
+# From http://www.squid-cache.org/Versions/v6/squid-6.6.tar.xz.asc
+md5  5a41134ee1b7e75f62088acdec92d2ca  squid-6.6.tar.xz
+sha1  f05e06a9dd3bf7501d2844e43d9ae1bd00e9edcc  squid-6.6.tar.xz
 # Locally calculated
-sha256  5070f8a3ae6666870c8fc716326befb0a1abe8b5ff3a6f3932cbc5543d7c8549  squid-6.5.tar.xz
+sha256  55bd7f9f4898153161ea1228998acb551bf840832b9e5b90fc8ecd2942420318  squid-6.6.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index c1477b1adf..3a9edac71e 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 6.5
+SQUID_VERSION = 6.6
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v6
 SQUID_LICENSE = GPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
