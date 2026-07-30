Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8956C5516E
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 20:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4211060A6D;
	Thu, 30 Jul 2026 20:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDUcFbZ_AlKF; Thu, 30 Jul 2026 20:01:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D51060A44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785441687;
	bh=f7d7J3JyWosqJK5sW//TV7GMyaOGAbNa4BUo6rvToYA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S1B70uEMWZ1dF9Ojnzt8SCTkLOq04BgptLgjfAfiV49yf58bFs7GPa4pB7RRK3xK9
	 2YrlLiiy3/RHEhCsS4426ybFFWVN8IFugtk6gkso5O4FoJ8SnOm5qdNdjrVttjSFNZ
	 mAwuyW7uDJUempsroYfmv2Fgs3Qh0TFchjlxNb54/3sWkDrs9gDweVgCt32zEpBwM0
	 6Zoyg+SmzJtM0mMKejzzzITYLxKQHa6DjJHTS31VABEKX3g39SFJH4hTPsC6IVmgg8
	 EKHDQJ4xu9Nur5dOWCF5um3JsGLnZYbZofSdWJvQxPLhZUVUW1Qw2YJ9sgoXKmm4Kh
	 jOjjqupLSOC/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D51060A44;
	Thu, 30 Jul 2026 20:01:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6917369
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 20:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EF6660A44
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 20:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TaZOL7Vb_FWO for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 20:01:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 37C0F60626
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37C0F60626
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37C0F60626
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 20:01:24 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-471eeac43bfso89490f8f.3
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 13:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785441683; x=1786046483;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=c/iZAhMmMRsE3bMBsasgYTHTPbCISWTJamXdK30UsQU=;
 b=VszbqXq5koBe/syV5kP1286uMWh3iczsbgA/AVN7qzbtWQpyKzkDveK4iORqPbJZNV
 Ej0AYn+nM0uynzz5XQblSj36HpWsse+ML15LGAt4Mqfcvkr2nB+VnLIbwxijUqhGl0GZ
 H5l6qUIGULsUxZc0JK1lqYZ2GMS6ZR8QiFrYSQDg5VGRstq6I5FDkpEzNO1aN7I6v/EL
 CoqVyXBM4F4HTMnl9Ldp9Ui/bceiBYDq06UDv3V24CkmBO6UUXhmm9pF9bsQQjImUObe
 W/NpdsY5f23krORP4w8ucFtkQjmkyvNdZRPvH7S/c13oUBsKvgxAGJECTpPahQFw3hMg
 NSQw==
X-Gm-Message-State: AOJu0YxQxkX2MloXzhD1YR7epMgiX7NYPR8k9JRvvSqJ2RmbMFxbJy4F
 FhcH7ysbyhB0lTCgOu9ktN3/4R5xpLZb3iF9XUxPXaolLaG9pgD0B+eSxOVRwaqarAmdCdAkQ+e
 Wc+Qx
X-Gm-Gg: AR+sD128k1OgxLyixdygGAuvSkauTbBhAplS5ZCH6EfkDdeUHtuYY1M4OT6GPIRQlVt
 2SswVv2fb34Xq24Q/LP/SqQripYVeYXt/zwCZc49Hopd3qhwGJWgIUfaiefthkq8mDyd5xf8/vx
 6zpoEZwocUflRPTYZaekG1EtTxeaLdu1CoUaP7UzX66xvd7lBA3+Yv5ESK1WO2xdGttXt1gljfW
 1fErMlrtj68PFYXzQRa0JnI7luvthLQzVXnTI9UryWyS2rP3M1HMiOwy4mCLXz2Z2oC82eRFZ4s
 OUOdbCKyI1N+SWsamB7MwpkVbejvdZ3gTyKbA/HmO7pgr2PkAwNr3fY3UtjBgflB7oJt7Q4CqiW
 a0WRpMNoKBx1/38vbfBf9pQvgAWc2fTbifuJ5Q+NoQWTvmwai/Fbp55EpxqrK7fLhljrmA5lWub
 S0zRD/48ecLREv4T0sNqaeOMCO12P8bAWGkL4jdBVVUM1KMrbM6bhrZxApsPRPoOfL+SkSLzeaS
 5Ozprud3rosfJSm03mG+9oSHJVArl+DYz5y7PemqdOojJPKK0p7mcSa/0fA9NwRCkgL5ErsWvgw
 2sBcksB3+1IBShX7MTaZ9p+6NChsgME9R6oYmjoyYXFd6sdrt+j+FiFm53ocg7g4
X-Received: by 2002:a05:6000:2dc4:b0:472:fe1a:1ee9 with SMTP id
 ffacd0b85a97d-47fc81c42bdmr5973473f8f.20.1785441682797; 
 Thu, 30 Jul 2026 13:01:22 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fc892cc3asm9639387f8f.23.2026.07.30.13.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2026 13:01:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Julien Olivain <ju.o@free.fr>, linux-amarula@amarulasolutions.com
Date: Thu, 30 Jul 2026 22:01:15 +0200
Message-ID: <20260730200118.3547779-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1785441683; x=1786046483;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=c/iZAhMmMRsE3bMBsasgYTHTPbCISWTJamXdK30UsQU=;
 b=hgwLCnzyiZNlzOswO/F8DxTxJ+ovkzCqq2RTIckWr4LfKHHa2JHImtiM3wzSqgauUE
 UWHCTd6Ca1wZ7tY+OVfSQAdajHf0PpxCS07Ck7d9EnlZe1nUReHrz4T5LrLEISM+z5LQ
 kISg5yUrj+zDYkiHxkCMSp3n4SobpSF95Qq4Q=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=hgwLCnzy
Subject: [Buildroot] [PATCH 0/3] package/armadillo: bump to 15.4.2 and fix
 build failures
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

Upstream armadillo bumped its minimum required gcc version from 6.1 to
8.1, which makes the build fail on older toolchains with:

  Compiler too old; need at least gcc 8.1

Patch 2 adjusts the Config.in dependency accordingly, and patch 3 bumps
the package to the latest upstream release.

While testing this, I also hit a pre-existing openblas build failure on
mips64 n32 (openblas is an armadillo dependency), which is unrelated to
the armadillo changes but prevents testing the series on that
architecture. Patch 1 fixes it.

Tested with:

  utils/test-pkg -p openblas -a
  32 builds, 15 skipped, 0 build failed

  utils/test-pkg -p armadillo -a
  32 builds, 15 skipped, 0 build failed

The bootlin-aarch64-glibc-old (gcc 6.3) is now correctly skipped for
armadillo instead of failing to build.

Dario Binacchi (3):
  package/openblas: fix build on mips64 n32
  package/armadillo: needs gcc >= 8
  package/armadillo: bump to version 15.4.2

 package/armadillo/Config.in      | 10 +++++-----
 package/armadillo/armadillo.hash |  2 +-
 package/armadillo/armadillo.mk   |  2 +-
 package/openblas/openblas.mk     |  4 +++-
 4 files changed, 10 insertions(+), 8 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
