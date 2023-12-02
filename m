Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73C4C4167B
	for <buildroot@archiver.kernel.org>; Sat,  2 Dec 2023 22:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 731D640103;
	Sat,  2 Dec 2023 22:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 731D640103
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OGND5TsGel_8; Sat,  2 Dec 2023 22:38:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68FB2401CC;
	Sat,  2 Dec 2023 22:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68FB2401CC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E11301BF299
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 22:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B642241936
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 22:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B642241936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 15MtSPXADqrk for <buildroot@lists.busybox.net>;
 Sat,  2 Dec 2023 22:38:11 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 933E740996
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 22:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 933E740996
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3332efd75c9so1919342f8f.2
 for <buildroot@buildroot.org>; Sat, 02 Dec 2023 14:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701556689; x=1702161489;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yz1pclGfJcd+h9QVX9XISyAQ+hHgxq8kpm74Eykt3dA=;
 b=jjQQxPV7Sm0KVO8w5BlIb0g7i9h/7z7xqUfRwf2HqlC0HDJMZW3I1lY8C2xTYjonlf
 nKkQODhk5TkJNVZ+L4Zfeu1xVWoQK/PJB4WTyb2NB1mUjaB6nJVrCY4bVjBHZcV1e9QK
 kZNNVeumETTiAH1xQEu2Ecf9I9+c2sPpnhBCpmfNWL5V7zRCtDcIJTDTn46twE3a5LP7
 cC+sb9TdJviXi32YmtxU8QUY9d/fTPy69BSzIecVUZ0fhRZAhBpT2DMpULNGDRgiXBzp
 4gE2UnCnghOjKXDBtpAlHNAJPkbto/eXjnlyKob1uLgp8t5KPiTPJvOvddfdPYwd4zy1
 ZC8A==
X-Gm-Message-State: AOJu0YzYIAaa9oyx8nnBG1i2bnlf1w+wb4moouN7HgF918UB4/GeksfC
 HFtf7mxdnMAMJN88FrtSvFdLPrk3B8c=
X-Google-Smtp-Source: AGHT+IE9t4qBxiogvmBQvLC7AA/BwYjf2LSZSAQn1oiyNh10UzJEuf+zRtrWr1IBAN0Q8++GzbS0Yg==
X-Received: by 2002:a5d:6d85:0:b0:333:3cf5:4317 with SMTP id
 l5-20020a5d6d85000000b003333cf54317mr354294wrs.153.1701556688732; 
 Sat, 02 Dec 2023 14:38:08 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 x13-20020a5d490d000000b0033333ebd106sm4421382wrq.75.2023.12.02.14.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 14:38:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Dec 2023 23:36:33 +0100
Message-ID: <20231202223633.351154-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701556689; x=1702161489; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yz1pclGfJcd+h9QVX9XISyAQ+hHgxq8kpm74Eykt3dA=;
 b=BN/zZn+zWmlNmxrvp6aJItM4cqJzURSgTyvLDyLLzelskDtibqNpJ2Lcih6wXgdUwp
 qQcDEfyyWgWKbhrzZMD8i+pBdDAeI4Wm4iwEITEQmXCsOCLTw0dncIE/MwKRAwklAkMo
 MvLA3Yeutd3B+zsaThhnHLoeQudbVvour0eOAeV83/g3VIh+pTsEM+JomzSYkSPaV3Vo
 uwajWrIY3yfRUHfYUUqDRZUncpMb0DaGVUvbx5POCdCZADE4POtJFuP+kFHTl5Wd/rfu
 z1tYIuHCWmSKtVE4rdzYMxvl6GZisH82Z/henGS1i54TZIbH7KlloEE8d8102B/HpWjk
 nlRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BN/zZn+z
Subject: [Buildroot] [PATCH/next 1/1] package/leptonica: bump to version
 1.83.1
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/DanBloomberg/leptonica/compare/1.82.0...1.83.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/leptonica/leptonica.hash | 2 +-
 package/leptonica/leptonica.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/leptonica/leptonica.hash b/package/leptonica/leptonica.hash
index 1220fbbd6e..6511d6b410 100644
--- a/package/leptonica/leptonica.hash
+++ b/package/leptonica/leptonica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  155302ee914668c27b6fe3ca9ff2da63b245f6d62f3061c8f27563774b8ae2d6  leptonica-1.82.0.tar.gz
+sha256  8f18615e0743af7df7f50985c730dfcf0c93548073d1f56621e4156a8b54d3dd  leptonica-1.83.1.tar.gz
 sha256  87829abb5bbb00b55a107365da89e9a33f86c4250169e5a1e5588505be7d5806  leptonica-license.txt
diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index 8791b0c4c2..8eedf2fda9 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LEPTONICA_VERSION = 1.82.0
-LEPTONICA_SITE = http://www.leptonica.org/source
+LEPTONICA_VERSION = 1.83.1
+LEPTONICA_SITE = https://github.com/DanBloomberg/leptonica/releases/download/$(LEPTONICA_VERSION)
 LEPTONICA_LICENSE = BSD-2-Clause
 LEPTONICA_LICENSE_FILES = leptonica-license.txt
 LEPTONICA_CPE_ID_VENDOR = leptonica
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
