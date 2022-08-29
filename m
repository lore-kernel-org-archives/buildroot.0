Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51436ECAAD2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 06:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEB2F405C6;
	Mon, 29 Aug 2022 06:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEB2F405C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pog9xe4tCxA4; Mon, 29 Aug 2022 06:18:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3E81404C8;
	Mon, 29 Aug 2022 06:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3E81404C8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 090291BF32A
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 06:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E536760797
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 06:18:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E536760797
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YZmNW2vImwg4 for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 06:18:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6FF66059D
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6FF66059D
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 06:18:49 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id h1so3746267wmd.3
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 23:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=mllmnbEA2WLZBBZdWYdvgV+WWxO06XN42mS0FxDhI6s=;
 b=Z/tR1TZ6Ce3pwvehVGpzQeqh54wpQnOpFVHpXUPJj+zaRL09Ydg3bQ2eWQLIGrk8ST
 FjWRPs6H5LnYtMjmnO/BNtMreN1PatyEUpJaotf+KylDn+29jz53T9O7dxVkkmtlx1VU
 ocnDS1vaxEv6wATkjcpkSMmsgX17Mo7Y6aN3LdMOa1PkdhWYQfarNmftrRVbmqZqL06s
 IL/BlWEXtGst1AGBCmRLR/JvqzyDkUCMRoG/miatfttbHnL+A72le3aV4Lsk8OpS1FFq
 qD747PQ18ACH9deH6WOJ1Fmb3FiZWoFecbOpyHHMeeaTZ4HSzQ2rp5y4L8Fq7nQ+eurf
 /spQ==
X-Gm-Message-State: ACgBeo2VBjbQ02N+qU5lQFXM0G/nihdegh8jiX+GhVLgzNLJvEvW4c8o
 kSaHYeHlGPvW+ZPNMbfBCexmTzBeOxE=
X-Google-Smtp-Source: AA6agR5c7OoHJ+60BBaJQipW1Wsvur1KwMNn37Eona9sgPxWVkUWhbJLteTyu3xK1xlQ5FYx6YMy6A==
X-Received: by 2002:a05:600c:15c5:b0:3a5:b800:3c53 with SMTP id
 v5-20020a05600c15c500b003a5b8003c53mr5835265wmf.176.1661753927729; 
 Sun, 28 Aug 2022 23:18:47 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 p17-20020a5d6391000000b0022511d35d5bsm6177132wru.12.2022.08.28.23.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 23:18:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 08:18:42 +0200
Message-Id: <20220829061842.40771-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=mllmnbEA2WLZBBZdWYdvgV+WWxO06XN42mS0FxDhI6s=;
 b=LVWY1HYupC61pijTTiu4vmzx3yvu6ahfw/Uid4DTzW7Cz16ES71FUZxCXTxBfV+3ue
 vTTl1jOrTWIz1jSL4yLCm2MagofUgGw/yyTvVQQBixlFg0CTVDQYK8eQO65wpqggf2f+
 b2oS3Y7FjJLtSlf2WiIXx1bCar/2hXZhHoCVDx6XDbUh2j87mUbFHvoNkglzKAyjRmui
 SojxFxNufVQJpo+ocRSFoSVqeDYnp8dVkbe3VL13Zmpt0alNXmy+LB/JJYQYwh3P0Fo3
 c9pocfMpTnEvePBEA8HytAO43cz+VxlPUA6+yZDVa5vPpPhoB8v+ogr541PT7wnF+AYZ
 RibQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LVWY1HYu
Subject: [Buildroot] [PATCH 1/1] package/tcpreplay: security bump to version
 4.4.2
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

Fix CVE-2022-25484, CVE-2022-27416, CVE-2022-27418, CVE-2022-27939,
CVE-2022-27940, CVE-2022-27941, CVE-2022-27942, CVE-2022-28487,
CVE-2022-37047, CVE-2022-37048, CVE-2022-37049

https://github.com/appneta/tcpreplay/releases/tag/v4.4.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tcpreplay/tcpreplay.hash | 4 ++--
 package/tcpreplay/tcpreplay.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
index 32bfd219d4..97c2e7ee34 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://github.com/appneta/tcpreplay/releases/download/v4.4.1/tcpreplay-4.4.1.tar.xz.asc
+# https://github.com/appneta/tcpreplay/releases/download/v4.4.2/tcpreplay-4.4.2.tar.xz.asc
 # using key 84E4FA215C934A7D97DC76D5E9E2149793BDE17E
-sha256  51f70ed14be5913f19c25cdfa530e98c14cedab1c76fbdd26eca7b61b57344f2  tcpreplay-4.4.1.tar.xz
+sha256  91585c247b108ed3c10d3546d18f6a467d44229c9988c97736f953af69a6f438  tcpreplay-4.4.2.tar.xz
 sha256  07cf5e92d475287a7d1663b33097f40cae5adf03ed8920fcd4374e3dfb48c8ad  docs/LICENSE
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index f228882ecc..65eb908932 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.4.1
+TCPREPLAY_VERSION = 4.4.2
 TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
 TCPREPLAY_SOURCE = tcpreplay-$(TCPREPLAY_VERSION).tar.xz
 TCPREPLAY_LICENSE = GPL-3.0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
