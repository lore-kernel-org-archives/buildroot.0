Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44682C61DD9
	for <buildroot@archiver.kernel.org>; Sun, 30 Aug 2026 18:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4898060614;
	Sun, 30 Aug 2026 18:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ozk5Nh7HUcBg; Sun, 30 Aug 2026 18:08:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788113295;
	bh=UfXMQt9Y34FUC9F1I9WHDqhO+XgaEosbU6JPRnU2bsw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WCs4MJpOe56pw9RZg7vsgEFRX2IXVZaF6XUJPvNalMHMj4ZXtK3cTPOL7Ao2DRccc
	 kkBA0qJTH2f0Xl0/0+pCf3P31NhoTLuy6anlJWs8E5ACae+XbUPIMVO7un6mpo0obR
	 r9IQGBAc8TDRKf6XiYVUIpcboKrzrIx2HcZ9ii05hFc9gGJwXEA0LNp/fCNGv+KJly
	 10DhIazMLGstCfkOc8OPVl/Te7En8w9VWnzB0XBehAfzJ2U317myMPNsRVOs57ZgMw
	 i4JebKkdvrRsulTfY46EucDgTLuMZSuQSiZLGL24lkdryzGquo+wri3JLe+ZZ2+/7A
	 mYaJiSMXTUhqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A107605E5;
	Sun, 30 Aug 2026 18:08:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 91602F2
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 18:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77EBD4058E
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 18:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3RQAYP9FQ8lQ for <buildroot@buildroot.org>;
 Sun, 30 Aug 2026 18:08:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=jNV+4NvI
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62B024058A
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 18:08:12 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-4843c41f35bso102069f8f.0
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 11:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788113291; x=1788718091; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=UzJuoYfn2rB1qswpnysMIsH7STpmWaFOfEdLsORhVTY=;
 b=jNV+4NvIXHNgl76SgMMvhWDL25bHW0tPb9s9fusxEnIZzBG/ZK9v6lReXbi30cTtWt
 Ar4xujXb8PlxOfvBockQHVhYnw3Ee+ODY7ahR8Vq6mcotnhLyAgrgcFBRHwBCXCbvvIV
 PySicNA9dd1v0zPnzdLgJ6mUhZ/gvCBXs/0nlFkRX8n4M5LOXlzQIbndEg8w4z3EI/Ye
 nrMTo4N4kv0YUyUBnGytaQX2NGB0C+ntGCHarls9j9Zh1FPd3zE2kOL/p7+kCkruzXZ3
 Ib9a6bz75uapyCGHaL0nUuSvCLbUCHm4CWNsa+IU3welgepA57xZsVipadmj6zdVTiOt
 etcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788113291; x=1788718091;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UzJuoYfn2rB1qswpnysMIsH7STpmWaFOfEdLsORhVTY=;
 b=orHVuP0Z/nVXmr33p/+BJVhK+ue6fKtfh5D+SBwRmJyFHUwhpmb1bhX5tq42kXBMlM
 dR+M/Xr1NCCYxbGAIr/OdHxSMfN32K4usp3s0CJ7vu9RJKG2fsn5gg1LRyNoZ30fiFc+
 VXtIJoylWT15KRBzRtK3ToXT0/qcXk2G9MJMyxDL+lqD2QZiNmDojLIWIC/mLEJpTvaA
 KKcD8W30DBNjsMrIkypPRbb46EfkKIHCnEIZvROci2XbYqU7NjjuP0dB3+nJm7fJVU2t
 yxvy3sSvzZhlR2F6ze83kIPOG50o2k6/xjVbPkzrfC3m6rQED/MFi7R6kSzDVJKTHko7
 zXuw==
X-Gm-Message-State: AFuF++lL8bhjrTnz4oAz0h3U86+Q6VmTtRO6yInZnkwmFbMd5kltKyDZ
 BfqziTbHbwjsUPjmMFfvW/EW1DSYK2jBUAebMmis1ih1TgkhaFySDFbQXt74tQ==
X-Gm-Gg: AYBFou32qswDv+/xKtivS7s69oZkdzA7HjxlNzdoPHziAhWsjruPWmfrw3S+sw0ghJU
 NlCISO/S0lmMrTOMtC04zOJZllm6PwzSoL1mIO2w20NyLB6pOJjxICODX7tXO5+r4qDRE7g5eo5
 TLfFUogyr6i1gQs1n+3qT/JUuf97slEjWxyZ0jTQ0YO/Zrx6tJ+T0YwzSwXR4z2DZiys39WA9eb
 /Zigeuot9xmuClKN9uF6GykxLJ7ogXGTaL+YyU4bLfjszUUk1Z5rUKamoJ0DOVhMUUJh4CvxKis
 9i0RzU8GkL7d4OhcZrcE47BjR27EJ/UmvQVVpZnnNnQ0eSFa9iqhG60V8JieLuAvm6fXv7kzwrY
 BBFMA1Tq42uk5AcFLZubIJoKWCPHngkCZWCDAxvG2m7OSKF3t4pHZE5HY3DUBC18R4HuU2L/sEz
 eDIAQiJflI7z69bnAeIJET/UeScVp8liOVV17aKh8RQmfxz5tBWOD78PtL1GQFzvo1r3CBeNGFl
 YL+RHHIFjtea1krRN0NRWVODIY=
X-Received: by 2002:a05:6000:26c7:b0:482:e4bc:51a9 with SMTP id
 ffacd0b85a97d-48439794d83mr4863509f8f.4.1788113290582; 
 Sun, 30 Aug 2026 11:08:10 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbab3f16sm19237700f8f.1.2026.08.30.11.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2026 11:08:09 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Joachim Wiberg <troglobit@gmail.com>
Date: Sun, 30 Aug 2026 20:07:55 +0200
Message-ID: <20260830180758.97741-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mini-snmpd: bump to version 2.1
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

Fixes:
- Reassemble SNMP requests split across TCP segments, and drop
  over-large messages, by Noam Rathaus
- Fix encoded-length accounting for decoded OIDs, by Noam Rathaus
- Zero-fill memory from the internal `allocate()` helper
- Build the interface trap OIDs without a run-time format string
- Avoid needless variable shadowing under `-Wshadow`

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 package/mini-snmpd/mini-snmpd.hash | 4 ++--
 package/mini-snmpd/mini-snmpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mini-snmpd/mini-snmpd.hash b/package/mini-snmpd/mini-snmpd.hash
index d1e8f51f8e..937de891ad 100644
--- a/package/mini-snmpd/mini-snmpd.hash
+++ b/package/mini-snmpd/mini-snmpd.hash
@@ -1,4 +1,4 @@
-# sha256 from https://github.com/troglobit/mini-snmpd/releases/tag/v2.0
-sha256  851acf49a1a36356664af0a7a040fa31f75403eb26e03627eba188ee15d4854c  mini-snmpd-2.0.tar.gz
+# sha256 from https://github.com/troglobit/mini-snmpd/releases/tag/v2.1
+sha256  2f9936e4c62d1469a13e43611001b6ac36901ddb9809e3c7cb2297830615a6a1  mini-snmpd-2.1.tar.gz
 # Locally calculated
 sha256  8a43b895972a24567297f44f35dab0f5f9ed3b7db6dac0bf6094075b27ab9d56  COPYING
diff --git a/package/mini-snmpd/mini-snmpd.mk b/package/mini-snmpd/mini-snmpd.mk
index 9873ad2dee..157aabfb53 100644
--- a/package/mini-snmpd/mini-snmpd.mk
+++ b/package/mini-snmpd/mini-snmpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINI_SNMPD_VERSION = 2.0
+MINI_SNMPD_VERSION = 2.1
 MINI_SNMPD_SITE = https://github.com/troglobit/mini-snmpd/releases/download/v$(MINI_SNMPD_VERSION)
 MINI_SNMPD_LICENSE = GPL-2.0
 MINI_SNMPD_LICENSE_FILES = COPYING
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
