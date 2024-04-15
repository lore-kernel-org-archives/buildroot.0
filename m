Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A78C00A94
	for <buildroot@archiver.kernel.org>; Mon, 15 Apr 2024 17:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84B5B817BD;
	Mon, 15 Apr 2024 17:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZvJ7xf4EAhd; Mon, 15 Apr 2024 17:06:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE5A9814B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE5A9814B1;
	Mon, 15 Apr 2024 17:06:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3F981BF2C6
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 17:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FA1F814B1
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 17:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vmAdsOQGRLe7 for <buildroot@lists.busybox.net>;
 Mon, 15 Apr 2024 17:06:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4FE9F81497
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FE9F81497
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FE9F81497
 for <buildroot@busybox.net>; Mon, 15 Apr 2024 17:06:04 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-343b7c015a8so2841994f8f.1
 for <buildroot@busybox.net>; Mon, 15 Apr 2024 10:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713200762; x=1713805562;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fEtFYGatOW4iYwLlhLtOYKzF7hg6o/L5HHom6naM87s=;
 b=p7E7eQsqo9z36/ubHGoEeIaXGddjKYWwATZ+c3bHbG2Cwrgmdhi6ADCWQjQt+L4kwD
 W0zY+EzdjYRNxGT2QC0Ta3YJww0/Ha9YxJt6wJTDrPSfTxfi+TvhuiprZmCKGNoKO25d
 Birj1610WfVI8y6lf+7+1hiUbDdbqDkilOSfVXStb9A011JLuf4sEt3DCgERbpbJT/KL
 4ICz0LqZvyyF4Pb5h35IdmJAk+TfOXYpaQtddW2f8q0fQIvLd3kDcYIEs8OX8nUzfw8O
 I+CsXU0Nkmx3ol2khFuIahZQm7IalGmQr+RTZwqVkFh3BWIpuMC0WS37X/QauP3qN13O
 k4Kg==
X-Gm-Message-State: AOJu0Yz+EamxO8zhUkzOg8p7Gty2OSLcnsjIDQYaTLYnj7EOMGR80B4L
 i2PHPyj5TLDxNo1UaCvLpBVCYczHQJr2RK7kP5U5Xmar/ZpRfQv/1M5yibWiLaSbizkmtWXteWs
 =
X-Google-Smtp-Source: AGHT+IG8A+aAXkW1ZERqFXbRu4ccheFsu09K5ZTKJddNP6TNH1Wo7PyvsJT44EmqcKCl3hHEU2Bltw==
X-Received: by 2002:a05:600c:314c:b0:416:a731:3df5 with SMTP id
 h12-20020a05600c314c00b00416a7313df5mr7860506wmo.31.1713200762188; 
 Mon, 15 Apr 2024 10:06:02 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c314900b004161bffa48csm16992342wmo.40.2024.04.15.10.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 10:06:01 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 15 Apr 2024 19:05:56 +0200
Message-Id: <20240415170556.35245-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1713200762; x=1713805562; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fEtFYGatOW4iYwLlhLtOYKzF7hg6o/L5HHom6naM87s=;
 b=MhyzBn8vlCWozQhOuaYmSR8tV3im3iauLNtYKP0YxQIssEgN2sMPtzXi7ZOkThFjcJ
 NNr+8uxOzIQzoK6Dql/VvmUXJWMkwAgYGgT+DB8qDDOUs7hn+HttjIKKtk7vwFC0sCnB
 K7ViMs/OS8fXLQMgSILa6QmN50G2L+n9lqFjjjbNFLLrNeYJPblH670S0n/9ePepMkw2
 C/RiN29frzWfJMhrhbTt8x2FUE7LVlXixFLiRvtta31Tcjgy0XvC+d28UKPECTgVduoU
 LbseXiHxjVqiWn/Xk3Qgz5ANP3luCKwr62XxCCQzsRBG8dSVjPXBRlE5Y7afWbJJ29mf
 3D1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=MhyzBn8v
Subject: [Buildroot] [PATCH] package/libarchive: bump to version 3.7.3
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
 .../0002-autotools-do-not-add-iconv-for-Requires.private.patch  | 2 +-
 package/libarchive/libarchive.hash                              | 2 +-
 package/libarchive/libarchive.mk                                | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch b/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
index 338dad46e..3cbd30410 100644
--- a/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
+++ b/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
@@ -17,7 +17,7 @@ diff --git a/configure.ac b/configure.ac
 index 99bff20d1..f245d0c55 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -378,7 +378,6 @@ if test "x$with_iconv" != "xno"; then
+@@ -434,7 +434,6 @@ if test "x$with_iconv" != "xno"; then
      AC_CHECK_HEADERS([localcharset.h])
      am_save_LIBS="$LIBS"
      LIBS="${LIBS} ${LIBICONV}"
diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index 818113585..ab6813686 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,4 @@
 # From https://www.libarchive.de/downloads/sha256sums
-sha256  04357661e6717b6941682cde02ad741ae4819c67a260593dfb2431861b251acb  libarchive-3.7.2.tar.xz
+sha256  63e7a7174638fc7d6b79b4c8b0ad954e0f4f45abe7239c1ecb200232aa9a43d2  libarchive-3.7.3.tar.xz
 # Locally computed:
 sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 136f7a9c0..9c35856ff 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.7.2
+LIBARCHIVE_VERSION = 3.7.3
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
