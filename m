Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE7DC0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 10:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4143F60F1D;
	Tue, 25 Jul 2023 10:32:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4143F60F1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZfxMmVJl4M5X; Tue, 25 Jul 2023 10:32:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BA7260F3C;
	Tue, 25 Jul 2023 10:32:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BA7260F3C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 735071BF59A
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 10:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C38281CE7
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 10:32:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C38281CE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N_KZwiJz_Omy for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 10:32:06 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38ADE81CAF
 for <buildroot@busybox.net>; Tue, 25 Jul 2023 10:32:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38ADE81CAF
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3175d5ca8dbso1782153f8f.2
 for <buildroot@busybox.net>; Tue, 25 Jul 2023 03:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690281124; x=1690885924;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IiBfKazH2LKm6dzzHStjGTHpmJsskm/LAl/y9i+ejgQ=;
 b=Lt0SxxDgQW+dYkRVVFq6PG+Z2uKLWxOxoKGAMFGVvXEvNFT/Pi8w0x/+VVU9wiQMjc
 NKmtYbISE2lF546XFACB1BDtuH7nGsj0luN87aA5SLiGjaM+kSRGwRIxiDEyy9zdzuTL
 abMCtNdy2qbZegPXiMVFyygJoZOQvZkx07wdBwaTBzf3+ZIeTXW/+LlvTTAOLkDXyMez
 XbixBHkmjGWM5gL9nIXod2s+KIOAMhHvHA8Kqh2o0q414r1olgqeQ/F+pjfO5/wiopq8
 zRsLMOXLOjXLUfW666VWQV/WE+RnOHfK82zC3ZaIj6sihg6oo91MKVLnQLfSGM8XIkae
 oQoQ==
X-Gm-Message-State: ABy/qLapK+Kiov2pvamzo9LBJOLPHiLAgFVClayYT0xPKfA8aJSWhVd9
 wZEG4qsQrjib7GntWWF5fFuRp3Xndes=
X-Google-Smtp-Source: APBJJlF3GDfojCG8ycxnSxgwMr1mOoAQEsbPO/lIK92/rcK/cpKFBS2jl3uyBxG/mlbjLCkopPyk9A==
X-Received: by 2002:adf:fe4e:0:b0:30f:b7b4:3e55 with SMTP id
 m14-20020adffe4e000000b0030fb7b43e55mr8505635wrs.19.1690281123555; 
 Tue, 25 Jul 2023 03:32:03 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5d4742000000b003063a92bbf5sm16040723wrs.70.2023.07.25.03.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 03:32:03 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 25 Jul 2023 12:31:57 +0200
Message-Id: <20230725103157.941537-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690281124; x=1690885924;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IiBfKazH2LKm6dzzHStjGTHpmJsskm/LAl/y9i+ejgQ=;
 b=mhyHzoq7eHcG3Yi/0cwugwua1ELWFOL3A0qQHxCsk9qBlnJRg05AHdIfo+R8scd/89
 pneB71QPYMJJEvihd/V6O0o4nB6q6sOMZOSOTNM/Ng1SdX9D2DmAu6UTs2a5fPMELcR7
 i/qq5L/TFYcQ8UbXHW8murFUQYrNpn0pMiUOcYNFcHMs5GISrj5TI7vvOK6ChD6SJQsh
 VOoHzwAULDn0X8KX/dU6+7yZEQ2NyBjfzlm4KZwcDeufKLLIEHT4qGupwwWjS/FamDVV
 7ZKwjNIZAgGAJXpiHJDR6wn1YR7MPRJ2Zi1HznMcODkatL2IXHHD6pc2+N29BrQ/w0/0
 8J9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=mhyHzoq7
Subject: [Buildroot] [PATCH] package/mbedtls: bump to 2.28.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 876cd7b77..a1d5d6e71 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.2:
-sha256  bc55232bf71fd66045122ba9050a29ea7cb2e8f99b064a9e6334a82f715881a0  mbedtls-2.28.2.tar.gz
+# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.3:
+sha256  bdf7c5bbdc338da3edad89b2885d4f8668f9a6fffeba6ec17a60333e36dade6f mbedtls-2.28.3.tar.gz
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 7a605ac5b..8f09fd72a 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.28.2
+MBEDTLS_VERSION = 2.28.3
 MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
