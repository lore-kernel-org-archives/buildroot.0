Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A431C4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA6D2405B8;
	Sun,  1 Jan 2023 23:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA6D2405B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OnxujaDBaIFR; Sun,  1 Jan 2023 23:39:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E215B402F5;
	Sun,  1 Jan 2023 23:39:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E215B402F5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F72E1BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1831F812BB
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1831F812BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id by2o935eRrNo for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:39:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B2678129A
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B2678129A
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:39:12 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-14fb7fdb977so25091314fac.12
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:39:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hd4OpCGRxLTc+rPOLTjZrQiSgRQzfh9+Kdr0+7Frx54=;
 b=ZaLqafehIigtFyRGSgM6TfRR+/qF/mAd5jOkpjBYvaOMvL2QErT268nPH/oU7EnSrL
 i81sFF5YwLwit9sZwliqMaseerXRCyI5DCQqUujnMEQ19ZTfeHC1Z4f+XxDgaAagJ/AR
 MHexTszl0y22fFBfZLw9I4x/fjIJO9SncOrGYfOQ0QHDVET2Df0rS2IwOJfv44senHM1
 D60zXY8dOPnoSxF034lzWTU4Dmv3Aw1w9MdBxoR0mCVofMC6La9zUNNJkQ4YonpnA96h
 snP1FJrNjMLUBuC3O5alqOyf0j5TmZjlqCfgQUpml3RG1kdsuQKA0AD7P8wQ5xZfYhu8
 9HNw==
X-Gm-Message-State: AFqh2kqDHnqLCR/XO6Ako4BanSj6Fpq/1PeaVotnyt3vMVWWdEAMc5fW
 o3HEp3SADQVZYzOYp/GL3SYinmd9Gx4=
X-Google-Smtp-Source: AMrXdXt6W3LPDHIAsJPfV3bZzW6sRWnKnOeB9wmoWi1v12fsxHHyrqKl8QWfSYmAEa0TtPYZP2tfpg==
X-Received: by 2002:a05:6870:814:b0:144:54b3:750 with SMTP id
 fw20-20020a056870081400b0014454b30750mr20176926oab.12.1672616351426; 
 Sun, 01 Jan 2023 15:39:11 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:10 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:28 -0300
Message-Id: <20230101233653.487175-5-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hd4OpCGRxLTc+rPOLTjZrQiSgRQzfh9+Kdr0+7Frx54=;
 b=Xg7GT8HsvFpNzhI3E6I+suBi2pMNdc/yktYmy+wycO2MkCZdzrQSky6HPLm0UHAaig
 gGIKUp76wAv6x2mtETCT09Jij0wJ53Fm74KMZybuRdJOu0RUCGj6GgQROJPbZ4zq+Lr0
 OnuoaQwM1ZCahhnK/sXa9fj6kSahCtFLLp0X+H58wN9sv/E39kk8RoOWKLdGUJlndVIH
 hCl2QgUyXTryDz0cjRBtnzPpGknl9FTicdfaNFj9WCNPWy5oozaL2Fm56xA+YKtzgTo9
 VxEdocmWGy+Wqu8Eqv5meO5dpaEOlnXxrKdmb+c5HK2W3OKgrlCQEe6Bj/WVcHG7UQek
 cOLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Xg7GT8Hs
Subject: [Buildroot] [PATCH 04/29] package/tinyxml: fix typo for
 TINYXML_CPE_ID_VENDOR
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Tested using this minimal config:
 BR2_x86_i686=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_PACKAGE_TINYXML=y
and these commands:
$ make pkg-stats
$ grep -A73 '"tinyxml":' output/pkg-stats.json > after

|--- before
|+++ after
|@@ -17 +17 @@
|-      "warnings": 1,
|+      "warnings": 0,
|@@ -20 +20 @@
|-      "cpeid": null,
|+      "cpeid": "cpe:2.3:a:tinyxml_project:tinyxml:2.6.2_2:*:*:*:*:*:*:*",
|@@ -49,2 +49,2 @@
|-          "error",
|-          "1 warnings"
|+          "ok",
|+          "no warnings"
|@@ -54 +54 @@
|-          "no verified CPE identifier"
|+          "CPE version unknown in CPE database"
---
 package/tinyxml/tinyxml.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tinyxml/tinyxml.mk b/package/tinyxml/tinyxml.mk
index d173254e31..8e706f1a1e 100644
--- a/package/tinyxml/tinyxml.mk
+++ b/package/tinyxml/tinyxml.mk
@@ -12,7 +12,7 @@ TINYXML_AUTORECONF = YES
 TINYXML_INSTALL_STAGING = YES
 TINYXML_LICENSE = Zlib
 TINYXML_LICENSE_FILES = README
-TINYXML_CPE_ID_VENDOT = tinyxml_project
+TINYXML_CPE_ID_VENDOR = tinyxml_project
 
 # 0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
 TINYXML_IGNORE_CVES += CVE-2021-42260
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
