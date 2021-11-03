Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5ACC433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 19:55:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C50E6008E
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 19:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C50E6008E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EB90404DA;
	Wed,  3 Nov 2021 19:55:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YQejAVzJ3LDg; Wed,  3 Nov 2021 19:55:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC10F404DB;
	Wed,  3 Nov 2021 19:55:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E4FA21BF3D1
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 19:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E21D380E9E
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 19:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WB_12cMmjz3Z for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 19:55:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8E4F80E8A
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 19:55:27 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id l12so1548373qtx.7
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 12:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pRuc4k2SKDBNf7UkMv45wDM/YkBtYY/SRmNUaCKMZVE=;
 b=U+KgAE7fgT09a7Qm3gHlMX06qhwPQzKeJAy3L0mOIR1xmKYB8lp20eaTG2NUhSEcnY
 cB7DJN0yJVY6Aado4WbLUO3NjLFUiZj2r1dx7bwCQ34xg8eManA6zwH0gyVJw09M/SzP
 FpdaZ6Q5fZkgImB0hCfiujrfwZNUteq3qrJ0cj2bNYtaDlqELy1KSP1OY67dZDmMqIER
 A7yto4A+9mdqxb09n/O9A69fNH4+8OnP91UmO9Bn8nwM+CnHoZjCXhHJxXUWNQ+SvnGd
 dumyLzFLCRFEWZYjvwC3cxNQ9n9z0tzzvYRdnNl986C1HfS7z12QClP38fg3HwgQc1Wm
 ANsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pRuc4k2SKDBNf7UkMv45wDM/YkBtYY/SRmNUaCKMZVE=;
 b=DBiNzrLvrok+H7YPnvkDvhQfFwov13Wky+l1ayyM54qDYrgXmTubb9fE/1lEruHkOg
 bJu8Z8SV5woJKYLGgxkM9K4QjYTBT1KAjWxy3q88wvZ6iXiDBaeaNVW3MVR0FZaPA0NT
 wYp0momsngIJOVbI+juoElnTAvtS/V9Ak3DAA/wzDqV1TRtvMdT7DZSNNiCAz8+PtRSL
 ILbwdDtMuGayt35fJutk1HjqEr+JUBkzrf3JvOnA4b7U79ci7l+BdnKMqgdzkowcLwjs
 W7fcwosDqgZKHIKtWClZR3ZTJO1nR7YKBTfdAuiZRmEuvw4nRAJbwhXm6hWiSwjbrBeH
 Fsqw==
X-Gm-Message-State: AOAM532tYlB+8KtJ4bS5EQUTgRARl0CjBvx9B0oD8s+xu3nzV3vZaIAs
 ICVQw3TCKG/6odxIsZy899xP5VL/cHk=
X-Google-Smtp-Source: ABdhPJwdALBIkvB/HA8xcy8ugZqV/Xlr1dVQuOIakKQvJx9mqH3Yco8JKzLl4RCiU0E/V7xddGfPmw==
X-Received: by 2002:ac8:5a96:: with SMTP id c22mr49547764qtc.266.1635969326415; 
 Wed, 03 Nov 2021 12:55:26 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id e14sm2449335qty.59.2021.11.03.12.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 12:55:25 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 12:55:18 -0700
Message-Id: <20211103195520.147558-3-aduskett@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211103195520.147558-1-aduskett@gmail.com>
References: <20211103195520.147558-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mender-artifact: bump to version 3.6.1
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
Cc: Mirza Krak <mirza.krak@northern.tech>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Other changes:
- Update license files hash due to the progressbar library changing versions
from v0.0.2 to v0.0.3

- Remove HOST_MENDER_ARTIFACT_BUILD_TARGETS = cli/mender-artifact as
commit a79edc3e7632f38de0dfeaa5a3c72567318e8079 removed the
cli/mender-artifact directory.

- Change -X main.Version= to
  -X github.com/mendersoftware/mender-artifact/cli.Version

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/mender-artifact/mender-artifact.hash | 6 +++---
 package/mender-artifact/mender-artifact.mk   | 6 ++----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index 175865bb67..27f18862bc 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256  8f5b69a6598dc071e6a0f2102dbd38a003e7db6be5794116d701531d6a740a46  mender-artifact-3.5.1.tar.gz
-sha256  0afbd1092d57f70da125041350363c3761802e807be80c7f1dfc005fea962b25  LIC_FILES_CHKSUM.sha256
+sha256  c46c305616cf53e65b786862addf04d97c388e451f11478886967b494c4ce5d9  mender-artifact-3.6.1.tar.gz
+sha256  ac23df36801aea6a28685b60a742f68f99d357e0d9973d5c36aa2e72599d8e2a  LIC_FILES_CHKSUM.sha256
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
 # following command:
@@ -10,7 +10,7 @@ sha256  0afbd1092d57f70da125041350363c3761802e807be80c7f1dfc005fea962b25  LIC_FI
 # Apache 2.0 licenses.
 sha256  b4acfcfa2a0ba1a8c82ec3965fbcee886cff8394ca4214e0ddac0a36beb1e05a  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/github.com/minio/sha256-simd/LICENSE
-sha256  f4a394d9345ba64dd2796dc552c31af99c4b686a46c0eeda6538038732f771a9  vendor/github.com/mendersoftware/progressbar/LICENSE
+sha256  8f5d89b47d7a05a199b77b7e0f362dad391d451ebda4ef48ba11c50c071564c7  vendor/github.com/mendersoftware/progressbar/LICENSE
 #
 # BSD 2 Clause licenses.
 sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor/github.com/pkg/errors/LICENSE
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index 8a77e67b8c..34d0cd9469 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MENDER_ARTIFACT_VERSION = 3.5.1
+HOST_MENDER_ARTIFACT_VERSION = 3.6.1
 HOST_MENDER_ARTIFACT_SITE = $(call github,mendersoftware,mender-artifact,$(HOST_MENDER_ARTIFACT_VERSION))
 HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
 HOST_MENDER_ARTIFACT_LICENSE_FILES = \
@@ -39,9 +39,7 @@ HOST_MENDER_ARTIFACT_DEPENDENCIES = host-xz
 # permission issues when cleaning.
 HOST_MENDER_ARTIFACT_GO_ENV = GOFLAGS="-mod=vendor"
 
-HOST_MENDER_ARTIFACT_LDFLAGS = -X main.Version=$(HOST_MENDER_ARTIFACT_VERSION)
-
-HOST_MENDER_ARTIFACT_BUILD_TARGETS = cli/mender-artifact
+HOST_MENDER_ARTIFACT_LDFLAGS = -X github.com/mendersoftware/mender-artifact/cli.Version=$(HOST_MENDER_ARTIFACT_VERSION)
 
 HOST_MENDER_ARTIFACT_BIN_NAME = mender-artifact
 HOST_MENDER_ARTIFACT_INSTALL_BINS = $(HOST_MENDER_ARTIFACT_BIN_NAME)
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
