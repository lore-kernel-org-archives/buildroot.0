Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD13C5516F
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 20:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 605F540CC0;
	Thu, 30 Jul 2026 20:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P174ogjiOkG1; Thu, 30 Jul 2026 20:01:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E63E40A0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785441691;
	bh=BKDm7CPsdKiNlfPGJ09r0RcYOlH0P66Ti89+8A04hxY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ik1WBqpDkK5xNRWOLCYES0UC5FFBcabqX/Kqfe54AZP/HtGdI7dPydZycJKG0wvpJ
	 xhnRr3EwajRhjn9jPMLAfO/SIKvnW4vvnnSUXso/obSh3Epba5IpiMqiE7xceVb/G5
	 pVx4fsYdvf1dhxWsxurlk9JpyklU71vvnmt6l/Ps0qPkjhwMQB7II1q2ZGhRIFaP0d
	 qGJHd/bo7gm/K1V3WDgVl1Lay0MqqmrCbpIPN0MQYKHxo7R0VoNNnjxF7eV7GJmOiZ
	 VvalOrt0JzviztkeTU0WHKl8M8n3zzlEdUeErlinfZQCb55USFCb13aou5gp8jdMJS
	 uvwj97Spv3zCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E63E40A0F;
	Thu, 30 Jul 2026 20:01:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 91AA1197
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 20:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 782D5400AA
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 20:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3FaXvMDn3fkz for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 20:01:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7C49040090
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C49040090
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C49040090
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 20:01:28 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-47f904e80eeso92809f8f.1
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 13:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785441686; x=1786046486;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=faPd5ZQrDizeYMQiUDxnraiV3wq0hCJwzF+YtbFbyvY=;
 b=c9IOM/6zCtwOAkBtD/Facpm+evAWSMNYyYO2GRmmn80DVkkWCbt1Jd3aBZPDTsI81C
 Nezl0uQ9IcfRAVex9Y5F4ldsrFBjYmEzodWDz1Kp2t3Kvb/SugWmwQDXbNwUNuMrOqzh
 d8Hw2V59/Rur3f9pIqZKhAFlf3inD9ZKrHPBCKl4toCZE2q+WO76kVumC4xF/2I68p+2
 XnJPJXsOoIsNCyExIDTJepDo77PX3292CX5yd8CQtI7ivSxHwMHJwS2TbgsK9R2p2s+u
 fPL/ZDrutb3KU9sPcDNxI+RU/nLhzCVE0u/+Uf1B+CYgGhJvGwuO6YpH9ScAXyC0u8Hw
 K48Q==
X-Gm-Message-State: AOJu0Yw3YAKkUETGScDmPuMC4VhqANJmaah9LjyJ9PZshnsxsbY+987d
 4QnxmJLXW9nqHuysRmteeDdsQkru5JJ4jFmH5nT0Ts3PPF86Kjl+Iyqd+2X7jKZo9UiBc8/nwzl
 KvZFn
X-Gm-Gg: AR+sD13ceqQLSo7esqZtVNUGiolAbeMvS78MlSuZrhHfXENsTGsZRwthXKP5rdsKFgN
 bTFBW1vXNKgaUH2hef4ZqC4WxycRRchgMDQU9sFOp1uLpPs8WgRav0hfk9dQL17Hs8an6ij8vGh
 MKyIsWjJQ0GH6HoiUOetfDisX/CIC4+I+APygp6RK/coveantAUB+XTNvja4nBvEeIepPWnlbis
 yIkMI4mdY29JwMZCKjLYnuVHsJpVDVosxDY4Ym8YUrOq9/mZb5dFIBHgqtpOmSTo78vHipM9qqw
 jPdDpiSwyRIzItPoCmzXlquivzAoI9V+GAERXPT1uIG0s2VguNNdGq+g6YOSI85VS2ecMMY/aWJ
 LHehjCp7uNPQ1pcw4R03rEdENXoKR5N9EVbPzsc/Hl6drIJhB9VL4m1yi/C5QZDGQbqKoLt49qD
 zDvoCpp6Eib51Qo1LF8uekGbo4VX/9rWxH0OpBfpmkqUHR5S5We0CNwFqyTLG6yh/TAPLR+Wnp0
 QN9/Z7/flkhOCBuI4yCl/6fJyzX0xbRCLaa0A/wGO0bZRWCJtgJHaYW9+PdxN6P2SQ6pr6WKxsQ
 l1L5kEP3ICandT+uCqE7aD5YFN9TOxDx7mueYry8O0gcnSQtBZWAOIgjqOv/cSK2
X-Received: by 2002:a05:6000:2dc2:b0:47f:93fc:2d32 with SMTP id
 ffacd0b85a97d-47fc81fddf9mr6270666f8f.40.1785441686290; 
 Thu, 30 Jul 2026 13:01:26 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fc892cc3asm9639387f8f.23.2026.07.30.13.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2026 13:01:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Julien Olivain <ju.o@free.fr>, linux-amarula@amarulasolutions.com
Date: Thu, 30 Jul 2026 22:01:17 +0200
Message-ID: <20260730200118.3547779-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730200118.3547779-1-dario.binacchi@amarulasolutions.com>
References: <20260730200118.3547779-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1785441686; x=1786046486;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=faPd5ZQrDizeYMQiUDxnraiV3wq0hCJwzF+YtbFbyvY=;
 b=lFXxrBRkWWPoSBQMedGrSVi7QG04ddMqs7JyFkXaPMuzfhEUukTZhwcPM+/r4pEzWa
 tbQmCVJaEccn1Le+vv7dDBKVxRGB9EoXi8mIiecP7g/DYw3sb6OZs4y6JRvEyOA/9LLI
 u4l9/ySY+gkQiuF5OCx2hiCCWch7u9l2L1Ags=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=lFXxrBRk
Subject: [Buildroot] [PATCH 2/3] package/armadillo: needs gcc >= 8
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

Upstream bumped the minimum required gcc version from 6.1 to 8.1 in
commit 84ec3ddf9fd3 ("bump minimum gcc version to 8.1"), so the build
now fails with "Compiler too old; need at least gcc 8.1" on older
toolchains.

There is no gcc 8.0.x release (the 8.x series starts at 8.1.0), so
BR2_TOOLCHAIN_GCC_AT_LEAST_8 is enough to express this dependency.

While at it, add the gcc version to the openblas-arch comment, which
only checked for C++ support and would therefore stay hidden on
toolchains that are too old.

Fixes: 597d5d10ec77 ("package/armadillo: bump to version 15.0.1")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
index 7a93343d41f8..7b66179fb829 100644
--- a/package/armadillo/Config.in
+++ b/package/armadillo/Config.in
@@ -1,19 +1,19 @@
-comment "armadillo needs a toolchain w/ C++"
+comment "armadillo needs a toolchain w/ C++, gcc >= 8"
 	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
-comment "armadillo needs a toolchain w/ fortran, C++, gcc >= 4.9"
+comment "armadillo needs a toolchain w/ fortran, C++, gcc >= 8"
 	depends on !BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS # otherwise, see comment above
 	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_ARMADILLO
 	bool "armadillo"
 	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS || \
 		(BR2_PACKAGE_LAPACK_ARCH_SUPPORTS && BR2_TOOLCHAIN_HAS_FORTRAN)
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # armadillo requires gcc >= 8.1
 	help
 	  Armadillo: An Open Source C++ Linear Algebra Library for
 	  Fast Prototyping and Computationally Intensive Experiments.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
