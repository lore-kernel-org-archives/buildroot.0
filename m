Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE78CD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 20:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC169402ED;
	Mon,  2 Sep 2024 20:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Dc7Dn9QasS3; Mon,  2 Sep 2024 20:34:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BB544030B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BB544030B;
	Mon,  2 Sep 2024 20:34:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5027F1BF426
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C2BC80BCF
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z1zQu-ENUhw8 for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 20:34:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 03C5080BAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03C5080BAA
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03C5080BAA
 for <buildroot@busybox.net>; Mon,  2 Sep 2024 20:34:21 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42c2e50ec13so22100705e9.0
 for <buildroot@busybox.net>; Mon, 02 Sep 2024 13:34:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725309259; x=1725914059;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cXhKkhLcPleGG7fnlsiRFJy26BYJVCJgWbMJVq3qHIo=;
 b=W3gSQGkZkHS0JhhD2keJlpZy1p06zm0YzgvphQiO05AxFoO2zBIsjNUwtxhL3/yHp8
 MOPBihoAFE0ZuMGjBZHzZlwtHCRZbxkjuoSPMfvXDv8V4rwx4TPprUffOkuvrsTymXSv
 lNc0Hmr6J/lRsXfyCUqb54m5FMLBl/i2jgCGggZxYdBmlNwnE11pHiEn+7B1POKrv34e
 dODqbP80gQEVIirjHtm0hcE/4mxXfOwst/lhyNY4UgzvG7gsGHeI2XibooaHfQ5gq19y
 gRqDmMCb3N31NijszLCYnwaex9X5XWb8vV4tIn8hifInfE6mQWihgTacKuksaOYzhtNA
 QIXw==
X-Gm-Message-State: AOJu0YwNaDnTuRnY085KAjN3YLvDBJJAh4OYa6Xuku2ZlXfdqvg+7Zcp
 HfqFu9GgXsU5aDII+vn8jeP69A6EWV9KX5rgCyfEOglUDyAvLNUuNkwqIYWy3lpQ9c+oUTwu847
 NOA==
X-Google-Smtp-Source: AGHT+IELtfko0V4emh9zgTtqIcNED1ZPxc3D09bqjgYxJ5O+Y72DzuSBgUSrtbZlnlzo2vRYHE2x9A==
X-Received: by 2002:a05:6000:511:b0:367:4d9d:56a5 with SMTP id
 ffacd0b85a97d-374a9652e5dmr7362283f8f.44.1725309258901; 
 Mon, 02 Sep 2024 13:34:18 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ef812cbsm12363974f8f.83.2024.09.02.13.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 13:34:18 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  2 Sep 2024 22:33:58 +0200
Message-ID: <20240902203405.2649359-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725309259; x=1725914059; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cXhKkhLcPleGG7fnlsiRFJy26BYJVCJgWbMJVq3qHIo=;
 b=jPN0RNkD0Ej+CVHFym0AsSg7FgpL8MwdZhn3MGYFDw+styLsxrWFfPbxJgm6/4vkgv
 9LUzfWmNePTtD98rhmtd0Fzv0O91Ty4xMgbuO1KYxnwyB4lUQURsuM8s2DQgUxte2+tO
 A2smWhM4NMGBniSGvmU7PxV6BpqEQECiI/R8WgDko6ki9doQPMJZmP4DbvYgeN5DofcF
 19Sx+azUyGnirbc5b0VCONmWDWb4NGR6MJ6debLyWwri4shaxBfliuViKOB5LdKfBYbr
 JfXQX1T9OAyyk49oS1OM32A4czBVCN5xF6dPYhY7FSMYHQp7FqbG+PBL3RldJUsk9exo
 tquA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=jPN0RNkD
Subject: [Buildroot] [PATCH] package/libgpiod: bump to version 1.6.5
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
 package/libgpiod/libgpiod.hash | 2 +-
 package/libgpiod/libgpiod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index 6647b77c5..969ff4b8f 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  7b146e12f28fbca3df7557f176eb778c5ccf952ca464698dba8a61b2e1e3f9b5  libgpiod-1.6.4.tar.xz
+sha256  ae280f697bf035a1fb780c9972e5c81d0d2712b7ab6124fb3fba24619daa72bc  libgpiod-1.6.5.tar.xz
 # Hash for license file
 sha256  ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index e7ff15561..f669643b3 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -6,7 +6,7 @@
 
 # Be careful when bumping versions.
 # Dependency on kernel header versions may change.
-LIBGPIOD_VERSION = 1.6.4
+LIBGPIOD_VERSION = 1.6.5
 LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
 LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
