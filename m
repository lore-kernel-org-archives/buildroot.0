Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25328C624D0
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 12:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3B6460703;
	Wed,  2 Sep 2026 12:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgNXs93HDM4K; Wed,  2 Sep 2026 12:39:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788352761;
	bh=rfUx+0EYt8DfjobL5x4opiNXNAnwWejFjmjsWQ3rGiw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r08axRVtAl5OmrX6yr5a7MB+l+BHff2BZyJROY4QvmhJ4auBkt5BLc/k5n7O3yk2V
	 /WXNx38ZZRMGSCXRToTwHRZ6atMoCdlwOWULEl2Mo6wU6+g4oJuFYOKTDDSmMvx8cP
	 Pq7Qx+Xx3/npai1gWbTTXitjQoRA9MgtNES5GC0Ij0qH78g2FR5Qky4ZFZOcxhUmVt
	 bbsyf+jqMX2OLA1LOewzyvN6PO+QXIjKMkGWwNQRkCaChk76/M5cEsuLU1zxTOD//O
	 Yn0jRVFleRsGTMl47nvmfcL8cohiSUC7g3CLDrEx4paswF2BMfRiLxAnilqifJ7viE
	 4AyhTBV3+41rQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0078A60726;
	Wed,  2 Sep 2026 12:39:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 54B762FE
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 12:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44E4780EF9
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 12:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xkYZ9d5VneXY for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 12:39:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3ABE180EF8
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 12:39:17 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-49cca4ffdcfso6878815e9.0
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 05:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788352755; x=1788957555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=c1/SgZJehrUsK/FUA0iSwidcSZx1+IS+pHD0mGzemEk=;
 b=rHB2hIbb6/2CitbTfO4yBVDvNIvRtTdWP9oeUw9vgPfzbibGfFaME5hD9I1EoxD+lg
 NyBi0l3l4J7MO1Rbbi1PZdMdJaDec5pcwuLXkAWBEAKV2l/yjFD8JThYZTIX04Y1QEpp
 1wkzNawdq0zCKQr1auMYY5DJgFXK1a1PJwyLxsm/ZeUi3lSrRTlNGHlkg5gX4k7PVwrp
 oqVq3ZA5m3X/qr2mEHa03R6mcdrtv6i1NrpwfJwkZdGkmqYoJzMqYcdGdTrlPnFHlSV/
 HIBGGxFzummlfZNIRSRXv8bHcaxtDah3I9qiXUQJqVLpMe7/oPS4yDFB5KXRB4SrJTgO
 81nQ==
X-Gm-Message-State: AFuF++kJATRogYzBa7O1Tag4Pe7JArwQo6sV5aWP2mtxTmPY+aJC7gmD
 7bV3xNjPf9q8D+05WItNbs/1LCiLhq41Qv0gZbO0cJcWHRxY0B/8yTriB+OvvkLjKKHAqXxJ1/i
 I9R8pF8Q=
X-Gm-Gg: AR+sD13cVIrZOKWHdV/p7Ol5LKDYJiegellw4ZQHpEw9ROHuMzfx+797uIBoalCMJkI
 3U5ZzgEnzb5R421iOxcaZB4XrPzAythANebiHqmfiATtGf/48bGDKLipXpMdSnbxGJz89GW2ZDq
 HbkOG6tC7VzKzlM1PoSBzOiWX+dfygfLXJN6hpHDgMVEJv1tHPs4F15k4/6SknyuUhsYs8yOfJk
 ImcJV8RQOpmhNSlxHmckvDngXecrKYthBqYDiWaFKzbQNFkIv4zrNHitNsgnCEIl04rToU2wn5I
 hKORoBmp8jztcjxa6JX40S7d2XrNAr3IKSErEez9/kBKOCT1nQeJrrMp8GxObfhnEvFq21P5q5C
 mxAn8mxYYPvizH5jm9xXftxH8hOpiabQFbaaGBhWx0t/24M1dcQ65Y9eE9O6TIclpMpZO/viMcP
 POr5diIYiuxNGU6sFZSGWVQshfzVkVCkzmhZQ6fJGzOP8tbs3IJkgEMpLD85akqhnS6hIiIoI3W
 56dW/pM5eEijgOM
X-Received: by 2002:a05:600c:4f0b:b0:493:bd2a:93be with SMTP id
 5b1f17b1804b1-49ce581316dmr65168565e9.6.1788352755017; 
 Wed, 02 Sep 2026 05:39:15 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce7d04c69sm33653715e9.8.2026.09.02.05.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 05:39:14 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed,  2 Sep 2026 14:39:05 +0200
Message-ID: <20260902123905.192515-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902120533.175090-1-titouan.christophe@mind.be>
References: <20260902120533.175090-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 for 2026.05.x] package/{glibc,
 localedef}: security bump to v2.43-61
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following known vulnerabilities:
- CVE-2026-19499
- CVE-2026-77117
- CVE-2026-80489

(alternative to commit be382f6061216ca82a735d0992894c4e6fe5173a)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
Changes v1-v2:
    - Also bump version in localedef (forgotten in v1)
---
 package/glibc/glibc.hash       |  2 +-
 package/glibc/glibc.mk         | 11 ++++++++++-
 package/localedef/localedef.mk |  2 +-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 237b56ee48..cff188ab52 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  6c6ec86c66f0484c6916e849e20433ebc67869649c72a772cdf1bb6ca408d516  glibc-2.43-49-g8017bcfc4d9bd16083cb7f3d8eda7d07b4593b09-git4.tar.gz
+sha256  221a59fb35cad9435481bf7e79cbc4edd0ded70fb0ccf7e57d5478fb169dcdf6  glibc-2.43-61-g8dad0ee453a9bd9d24e55daba85e70915b29e19d-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 29b0639cb1..bdf26a0f95 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.43-49-g8017bcfc4d9bd16083cb7f3d8eda7d07b4593b09
+GLIBC_VERSION = 2.43-61-g8dad0ee453a9bd9d24e55daba85e70915b29e19d
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -61,6 +61,15 @@ GLIBC_IGNORE_CVES += CVE-2026-6238
 # Fixed by glibc-2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
 GLIBC_IGNORE_CVES += CVE-2026-6791
 
+# Fixed in glibc-2.43-54-713998bf001027c2507cb56f9d1c73e46a6bad0b
+GLIBC_IGNORE_CVES += CVE-2026-19499
+
+# Fixed in glibc-2.43-55-138c43f0180945b014e284a87b332d4d8237f537
+GLIBC_IGNORE_CVES += CVE-2026-77117
+
+# Fixed in glibc-2.43-56-3ad1bbd8f94a207efb108a38d434695eab8a1831
+GLIBC_IGNORE_CVES += CVE-2026-80489
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 026146bb09..ad7b809578 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE, and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.43-49-g8017bcfc4d9bd16083cb7f3d8eda7d07b4593b09
+LOCALEDEF_VERSION = 2.43-61-g8dad0ee453a9bd9d24e55daba85e70915b29e19d
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
