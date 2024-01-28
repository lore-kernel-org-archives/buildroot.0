Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A879C47DA9
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 13:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A97648272C;
	Sun, 28 Jan 2024 13:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A97648272C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lDm3q9SKC2T3; Sun, 28 Jan 2024 13:23:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3A5182BD6;
	Sun, 28 Jan 2024 13:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3A5182BD6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6251E1BF2C7
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 13:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3ACC5415A9
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 13:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ACC5415A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tn0vLlI58t2l for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 13:21:06 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F1CE4159F
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 13:21:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F1CE4159F
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e86a9fc4bso29070245e9.2
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 05:21:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706448064; x=1707052864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5P0ikWwWD6zuDU+OUhwqdZyCASt0Bq/2YXjnw1qcgls=;
 b=cWf0jJLbzmxrn5ef/UUeU1f71PbmYKK0E+HFjYa0IGSS/AqYRRPsRVt+SZV9kAvf8h
 zmtT6LuaFNSS/3M2UCLKOTYn85c/kx+a1tJw2L3V70ks+TTUVRBGFYQz5B2PVBOJml6i
 TA3RG4qN9ntebcFWEQvvKkSHYtbuRp4M9FEbV/Yi7lZZzh++7wfK1wh3St/DH+24mByM
 TH3cU/OBPbSMEx8HYptcJwOo6CmD5OHzLCLmtweS8YP4r3fc2htwe4UBsOEyKYf6Cxc5
 CzNonv5/m9X/BNAZbALJibVMVIuz/sgn1rekXppnFhQM1urOi8qx4Rw6fZwYWW9oDWH0
 q8vA==
X-Gm-Message-State: AOJu0YxNnJcc4UsjjagsbBprvhn0bSaMmdPh21FmmItSupymjLBXax17
 Meg5age7r8U487irGedXys3JhaTDJe7u12792324w4IB9pSwYErzxewC7cRO
X-Google-Smtp-Source: AGHT+IEadVXL0HNaFys1+O2eAGfCIlwPumDliCjAaVD/1a1M9Xfk0ABdC43kAwPx2bD0vNrIxw/P+w==
X-Received: by 2002:a05:600c:600e:b0:40e:f46d:ad35 with SMTP id
 az14-20020a05600c600e00b0040ef46dad35mr1406242wmb.36.1706448064053; 
 Sun, 28 Jan 2024 05:21:04 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 bv25-20020a0560001f1900b0033aec64ba7dsm747778wrb.78.2024.01.28.05.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jan 2024 05:21:03 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Jan 2024 14:20:59 +0100
Message-ID: <fc4857dac03f0017ce6dd7047225d8fade89c07f.1706448055.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706448055.git.yann.morin.1998@free.fr>
References: <cover.1706448055.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706448064; x=1707052864; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5P0ikWwWD6zuDU+OUhwqdZyCASt0Bq/2YXjnw1qcgls=;
 b=fsGoxW2hB0VIHIr62VGUM4/SaEFl5banETEUHLoJpX8rV3nod/qlKzglJzimeudw+c
 v18jeLZb247rNIbqVv37LrzDA1tRcrL56c+4fIWqepHkHAf/F5VdAlSAR1A1XgD7iax5
 uzSMWaLxYfqe14BkIvJELpGFnU0+gth2aeN8JvJTkK4z4ilnUz1E2SUNbpcQMCV0znQ6
 70WCDVsc11MeySc5oGwjo3Rg7TPxd0eWVVMcfbi3F/92EDmwljih6ncwjmbkqM2xoin2
 iBzZDVAfKuUQS/yKSTTtPo6DKGVKfv79N3ybiwqcRYMFD778hZF/MJqM9HWd2CaKoamC
 K+Xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fsGoxW2h
Subject: [Buildroot] [PATCH 10/10] package/atkmm: propagate dependency from
 at-spi2-core
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
Cc: Daniel Lang <dalang@gmx.at>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 2c3ca7bea1de (package/atk: remove package) forgot to propagate to
atkmm, the then just introduced dependency on !static from at-spi2-core,
causing unmet dependencies warnings (unfortuantely, not errors), such
as:

    $ KCONFIG_SEED=0xAFA763CA make randconfig
    WARNING: unmet direct dependencies detected for BR2_PACKAGE_AT_SPI2_CORE
      Depends on [n]: BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && !BR2_STATIC_LIBS [=y]
      Selected by [y]:
      - BR2_PACKAGE_ATKMM [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_7 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y]

Propagate the dependency now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: James Knight <james.knight@collins.com>
Cc: Daniel Lang <dalang@gmx.at>
---
 package/atkmm/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/atkmm/Config.in b/package/atkmm/Config.in
index 571d7e69ad..01b18e1e90 100644
--- a/package/atkmm/Config.in
+++ b/package/atkmm/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_ATKMM
 	depends on BR2_TOOLCHAIN_HAS_THREADS # at-spi2-core/glibmm -> libglib2
 	depends on BR2_USE_MMU # at-spi2-core/glibmm -> libglib2
 	depends on BR2_USE_WCHAR # at-spi2-core/glibmm -> libglib2
+	depends on !BR2_STATIC_LIBS # at-spi2-core
 	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_GLIBMM
 	select BR2_PACKAGE_LIBSIGC
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
