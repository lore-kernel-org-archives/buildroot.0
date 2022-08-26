Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D00C0502A
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 21:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7457060A77;
	Fri, 26 Aug 2022 21:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7457060A77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3qEBMFwUfUg7; Fri, 26 Aug 2022 21:23:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF64560888;
	Fri, 26 Aug 2022 21:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF64560888
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10E001BF860
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 21:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF6BD60888
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 21:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF6BD60888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A-GU8HHelUf3 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 21:22:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 150276079E
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 150276079E
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 21:22:59 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id az27so3183187wrb.6
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 14:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=iYqGYc8qrNYAzs+hwVWjjZmm2xwYRP7bIeMYUhs9GNU=;
 b=NgEt7hzWYhz51VTaWSuh5OJsy2sSWhpJGCbNeAD0ZdqyE3y9I8uplBnz5ZY6yCgbpM
 hNNUOm/tBL5+NV0Zo6FcvSUpdREvpd40Div3bKBMZhuKEUifXRFrMeLgCjuLuSZjNnRt
 dLuiHVjMs5bZTuBSxWLohyvb40vM9sU+KASCgFDhm3kPKkZF+7gnTSufpOxl14q1vKPV
 +N8wxFhHF3Hd/9BRGxPD0L9yq7lxsaP4GO77PW738lCI9klFbO2JL9FSIQSD2ZvkyLe8
 DXePDXUJmHBrxi/phkDZo2QJgP1gps1xwDPy0BjosUhs/WCEBLg5UJ0Id1cE4VuTh1jE
 RbHg==
X-Gm-Message-State: ACgBeo1z2xOTxFBAJAnVnajMRwja0+fPD+j/yCSQi7xMbga51WwQzPsP
 NX484RghMvcy/Cz91ab2Ku4R0sfQo8A=
X-Google-Smtp-Source: AA6agR6obLiqCigRPIehh4LKRv5V/t9yKwpTIiX6axQ4Plzgq5NvwAya7KTOtR7o5+mr058/YL2ieA==
X-Received: by 2002:a5d:6da9:0:b0:225:59e4:1497 with SMTP id
 u9-20020a5d6da9000000b0022559e41497mr756890wrs.262.1661548977077; 
 Fri, 26 Aug 2022 14:22:57 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j2-20020a056000124200b0022537d826f3sm729510wrx.23.2022.08.26.14.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 14:22:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 23:22:54 +0200
Message-Id: <20220826212254.37425-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=iYqGYc8qrNYAzs+hwVWjjZmm2xwYRP7bIeMYUhs9GNU=;
 b=JFfqEiyNEIxSiUqeoGPZr+JG18bZmh1fW/5ENb5mWq40jjIuKMOY8oScoKEjrV4ubX
 KLdlNZCqacIX1uLaMl0655vkO6+cInaR2w8SoK4WT8KRLVj4czlc5CaJd5oYppR0GnNJ
 ANx8mBtMss5eX3N9zG1Yt4y3yU8rIhyX7eIDPRqXCAyEXrWC6DKMtr6HZWD9ujMnrcLz
 t7f+5PvfLGwnRyMThBFGgVZnWcIZVmY6QkTu2i4nYxMlcF2atDuX7M1MIPfex+WbucLu
 zShq+1rBLPe0YwVqp+vnmLM3z8AqtnpqbdPAp6QLElCUI5EnkGvGA8ZrlZ9rQY9IgMYg
 42MA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JFfqEiyN
Subject: [Buildroot] [PATCH 1/1] package/squid: security bump to version 5.6
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

Fix CVE-2021-46784: In Squid 3.x through 3.5.28, 4.x through 4.17, and
5.x before 5.6, due to improper buffer management, a Denial of Service
can occur when processing long Gopher server responses.

https://github.com/squid-cache/squid/security/advisories/GHSA-f5cp-6rh3-284w

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/squid/squid.hash | 8 ++++----
 package/squid/squid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index e18ed8961e..22c6db8c70 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v5/squid-5.3.tar.xz.asc
-md5  9249f30169ab6600e53b4f9b8129b3b0  squid-5.3.tar.xz
-sha1  d3a8310c725616fa7565d60f3bf8fdf5fa20b15a  squid-5.3.tar.xz
+# From http://www.squid-cache.org/Versions/v5/squid-5.6.tar.xz.asc
+md5  2f2201a18a0a727ab589d951ebe4f815  squid-5.6.tar.xz
+sha1  a01f47b3e9ff06245c894773de30bfd88ab14f65  squid-5.6.tar.xz
 # Locally calculated
-sha256  45178588df1311ded41ebadd632840c4d93a8d7f5f60e38e74acf2f1ae2f1715  squid-5.3.tar.xz
+sha256  38d27338a347597ce0e93d0c3be6e5f66b6750417c474ca87ee0d61bb6d148db  squid-5.6.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 3847fb49dc..86a0c714c6 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 5.3
+SQUID_VERSION = 5.6
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v5
 SQUID_LICENSE = GPL-2.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
