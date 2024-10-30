Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEB7D6B6DA
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 21:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BDDB60893;
	Wed, 30 Oct 2024 21:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iavl0Eb6Etnn; Wed, 30 Oct 2024 21:27:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04843608C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04843608C4;
	Wed, 30 Oct 2024 21:27:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 651DD5E4F
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 21:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FC42400F5
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 21:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rzp_LfoqyaXk for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 21:27:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF2B4400A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF2B4400A6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF2B4400A6
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 21:27:05 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-37d41894a32so169536f8f.1
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 14:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730323623; x=1730928423;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jBK46V1W34MTpaTGbsPI6LUnUKERs20aPZOz1xwWLbA=;
 b=Hfse+4D7YEKS8S6dhVHULlkSWKjuZw6vwXB3TJBR/r+4emUV+0o3nKajp/QV9MroHP
 U/30qwppDKx7RyKAzoAnGZke4A5gs4DtaHYNbobOlH/BbgTu06i9PVoumyvPlZC+2xYG
 UYdTbvOLg/kl5fyWqWxJM6bXIKTFgG0jeN8v8lTPEbm1x+arEK7eci2ng4c9/9tSIQSq
 Z6u2QG9F1wQFut5B6K1bTsieRwbT2m4gAIJ05OyDGC/QGWfdX2ijHqXJTYkPiGGXmB0h
 tLu9ycTUTigCrQGVTIDDG1rLKgEsKulKv7OE1SWxYxB1ZVgw52MDLlPab+EdBdbKQQTe
 DsZA==
X-Gm-Message-State: AOJu0Yw3xsebhieYAUpjLIm5L4TXWdD4r88OJcLKtX3B1JkPO1Bj2+Hp
 6meoCuZjbU3RD/xElkgikoJaNZe1GIFtbSRG2tEMYkM2bwZsoXYgW3AfxgfukUF4f6WJx5jpsC0
 v
X-Google-Smtp-Source: AGHT+IGLgbnY0hMbyp1E/hvdA73YxJsAK8MgSPsXWsKVlfMsKGlBZFHK5TcvLwR39Cj2JzDTWdtAng==
X-Received: by 2002:a05:6000:401f:b0:37c:ccba:8c93 with SMTP id
 ffacd0b85a97d-381c145e818mr90107f8f.11.1730323623180; 
 Wed, 30 Oct 2024 14:27:03 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c113dd95sm123225f8f.83.2024.10.30.14.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 14:27:02 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed, 30 Oct 2024 22:27:00 +0100
Message-ID: <20241030212700.2517051-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730323623; x=1730928423; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jBK46V1W34MTpaTGbsPI6LUnUKERs20aPZOz1xwWLbA=;
 b=jq28YAsEcwC8f+pCA0Y4NHfkxoiY3OByFMiwGs6uzehLOym67wmJl/+RcXSO/fwoYb
 hzfyxC8CJskmn8JxTmUPLgtJ5RNpVqD2CG0AHzK8bmFNP9E9Od6ZVrwzkoRQVgbS+ST8
 BQbTLPMH7TXLkmc3r9Sk+d4/rx+LsoZgk3HG8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=jq28YAsE
Subject: [Buildroot] [PATCH] package/checksec: fix download
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

checksec-2.7.1.tar.gz archive was replaced or regenerated by upstream
sometime between the 22 September 2024 [1] and the 29 September 2024
[2].

diffoscope report no changes in extracted files exept a different
top directory name (checksec.sh-2.7.1/checksec-2.7.1):

  --- checksec-2.7.1.tar.gz a0d7a444d4603fb3d62fa25ef678e544ef39fa7b3c9bd5d22f1a8c526152cdde
  +++ checksec-2.7.1.tar.gz eba0616f4033385d6093608a2a2aad3c2debb847d6778c87346f89c80946684f

  Files identical despite different names
  --- checksec-2.7.1/ChangeLog
  +++ checksec.sh-2.7.1/ChangeLog

Use the git hash of the 2.7.1 release to use a different archive name
than the checksec-2.7.1.tar.gz archive previously released.

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/7888799855
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/7948006849

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/7948006849

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/checksec/checksec.hash | 2 +-
 package/checksec/checksec.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/checksec/checksec.hash b/package/checksec/checksec.hash
index 856662b193..4ca3867114 100644
--- a/package/checksec/checksec.hash
+++ b/package/checksec/checksec.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  eba0616f4033385d6093608a2a2aad3c2debb847d6778c87346f89c80946684f  checksec-2.7.1.tar.gz
+sha256  59a351ac9b552a817329f2d2c1cd8ee76f6cf2ad8916e8eea56310154c0e31fc  checksec-181cdfa84893a5d72695944efabfa5b56687379c.tar.gz
 sha256  55154b4be6dfcb3ff29d1e3648d0d07b3943a5fcc3af7c2e0e799b074734f722  LICENSE.txt
diff --git a/package/checksec/checksec.mk b/package/checksec/checksec.mk
index c1170e822e..51a05c2a6b 100644
--- a/package/checksec/checksec.mk
+++ b/package/checksec/checksec.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-CHECKSEC_VERSION = 2.7.1
+# git hash of 2.7.1 release.
+CHECKSEC_VERSION = 181cdfa84893a5d72695944efabfa5b56687379c
 CHECKSEC_SITE = $(call github,slimm609,checksec.sh,$(CHECKSEC_VERSION))
 CHECKSEC_LICENSE = BSD-3-Clause
 CHECKSEC_LICENSE_FILES = LICENSE.txt
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
