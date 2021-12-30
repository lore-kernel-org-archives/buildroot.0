Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773D7C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 16:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05390404D4;
	Thu, 30 Dec 2021 16:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HcIOQJMHwcot; Thu, 30 Dec 2021 16:56:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA05740166;
	Thu, 30 Dec 2021 16:56:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF7351BF3CB
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE59E827C6
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:56:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vqHaiJLmoPZD for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 16:56:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB08081CA7
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 16:55:59 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 n10-20020a7bc5ca000000b00345c520d38eso13587488wmk.1
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 08:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E5U2UsYt8itPhwp+XvMxPSw9EbUZr8E3Mj3/sohZaQw=;
 b=Co1uut7CMjWNThEWMlwumm0O/pyQ7gQdOiQdc3uS/tAlgFkPbOguvV2vh+8A06is7y
 nRx6eIFBFTs3kKdai4RdFFlWzBIrOPnRRKUPeCydGHrLKWYBKz/+xJ1emQHue5iSJW0Q
 E0VPqzr174/uTkc8xpXpbxeCzVKCjyKP1Zf3u1dqLOttVcBl6V5gKwzQXSJCKO33W6Hj
 fXY06dRAdQ03BGfryjjlhllHqXGt33Byx1uNCtgyE6YX4A/sakxNqhMsjAQfhGpjziCh
 gZADJ7vlzzy1NPwXckYG2PzkakanPYY5xPLDI0TVARihTrfy+YdS3xfoeC5YI2yklDVM
 0ZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E5U2UsYt8itPhwp+XvMxPSw9EbUZr8E3Mj3/sohZaQw=;
 b=g2I/Ls9eSIswvMbN+OOVYhLn3pGzDQMBkujFG8aI01UIaYO6Irl/l5m8BBZRrem6FR
 RKWsueUQJkfl3UqWnL+APYgbe+a3Fvn+EYTsEXtpYAd/b+cDfVsoiK5tF2216q9+a0/G
 jSzlYalph8AJPg9fhKs7co3KI5BoiCWBM44enJDPcvS/7qHD1khd5ktdg6lfuVo8nA6Z
 rQm+oGLPET19mN3veqi++3DvHlDyRdpa47yy6whgi//bizETq+KRBVtoI+ZdG+oirwrO
 oYwHe2eHIvquLQ2WxolKJWxU4WCONczDhwwT9WPCEIEhevOYnbciFgxMjxOWs/knWOZL
 aE8g==
X-Gm-Message-State: AOAM530wjMQTqOF5LbpJ76gWR/iKjqbru7nAfjmw+oPaAmit9QBaQiHs
 +F0N5d+CdCPcRpMdSAOjM+m4D4UnyxE=
X-Google-Smtp-Source: ABdhPJxhF56aXUnSkSyahlx6pcbD7exKDfGFmZM5PdDZzsEAZRgwqTmV9DU+iABVoHvhnL/Ob/bivw==
X-Received: by 2002:a1c:9d14:: with SMTP id g20mr26718122wme.134.1640883357760; 
 Thu, 30 Dec 2021 08:55:57 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id n8sm26038276wri.47.2021.12.30.08.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 08:55:57 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 17:55:12 +0100
Message-Id: <20211230165512.2747364-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/owfs: bump to version 3.2p4
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
- Update indentation in hash file (two spaces)

https://github.com/owfs/owfs/releases/tag/v3.2p4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Fix-compilation-with-GCC10.patch     | 41 -------------------
 package/owfs/owfs.hash                        |  6 +--
 package/owfs/owfs.mk                          |  2 +-
 3 files changed, 4 insertions(+), 45 deletions(-)
 delete mode 100644 package/owfs/0001-Fix-compilation-with-GCC10.patch

diff --git a/package/owfs/0001-Fix-compilation-with-GCC10.patch b/package/owfs/0001-Fix-compilation-with-GCC10.patch
deleted file mode 100644
index 49b703ee28..0000000000
--- a/package/owfs/0001-Fix-compilation-with-GCC10.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 43a4bc6b750c37f585d03b14941f3633ed5348d8 Mon Sep 17 00:00:00 2001
-From: "Azamat H. Hackimov" <azamat.hackimov@gmail.com>
-Date: Tue, 9 Jun 2020 11:30:38 +0300
-Subject: [PATCH] Fix compilation with GCC10
-
-Fixed compilation with -fno-common, which enabled in GCC 10 by default.
-See https://bugs.gentoo.org/707438.
-[Retrieved from:
-https://github.com/owfs/owfs/commit/43a4bc6b750c37f585d03b14941f3633ed5348d8]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- module/owserver/src/c/owserver.c       | 2 ++
- module/owserver/src/include/owserver.h | 2 +-
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/module/owserver/src/c/owserver.c b/module/owserver/src/c/owserver.c
-index db29988e..2ed29161 100644
---- a/module/owserver/src/c/owserver.c
-+++ b/module/owserver/src/c/owserver.c
-@@ -36,6 +36,8 @@
- 
- #include "owserver.h"
- 
-+pthread_mutex_t persistence_mutex ;
-+
- /* --- Prototypes ------------ */
- static void SetupAntiloop(int argc, char **argv);
- 
-diff --git a/module/owserver/src/include/owserver.h b/module/owserver/src/include/owserver.h
-index 8be582f0..a257ed02 100644
---- a/module/owserver/src/include/owserver.h
-+++ b/module/owserver/src/include/owserver.h
-@@ -18,7 +18,7 @@
- #include "ow.h"
- #include "ow_connection.h"
- 
--pthread_mutex_t persistence_mutex ;
-+extern pthread_mutex_t persistence_mutex ;
- #define PERSISTENCELOCK    _MUTEX_LOCK(   persistence_mutex ) ;
- #define PERSISTENCEUNLOCK  _MUTEX_UNLOCK( persistence_mutex ) ;
- 
diff --git a/package/owfs/owfs.hash b/package/owfs/owfs.hash
index 4c6b15a4e1..e2c51077ac 100644
--- a/package/owfs/owfs.hash
+++ b/package/owfs/owfs.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 b8d33eba57d4a2f6c8a11ff23f233e3248bd75a42c8219b058a888846edd8717  owfs-3.2p3.tar.gz
-sha256 1f0527ab035eefb5197c68633d06f50f5077c719d82a99344702ceaca29150b9  COPYING
-sha256 8a6601b893d5784d931b2ede64a406fac463acfbb7014914e27de4d6e68457c3  COPYING.LIB
+sha256  af0a5035f3f3df876ca15aea13486bfed6b3ef5409dee016db0be67755c35fcc  owfs-3.2p4.tar.gz
+sha256  1f0527ab035eefb5197c68633d06f50f5077c719d82a99344702ceaca29150b9  COPYING
+sha256  8a6601b893d5784d931b2ede64a406fac463acfbb7014914e27de4d6e68457c3  COPYING.LIB
diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index 10543d3698..7c69a5251b 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OWFS_VERSION = 3.2p3
+OWFS_VERSION = 3.2p4
 OWFS_SITE = https://github.com/owfs/owfs/releases/download/v$(OWFS_VERSION)
 OWFS_DEPENDENCIES = host-pkgconf
 OWFS_CONF_OPTS = --disable-owperl --without-perl5 --disable-owtcl --without-tcl
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
