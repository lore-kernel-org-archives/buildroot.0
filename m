Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C948BCCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F11A83E1B;
	Tue, 14 Oct 2025 18:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1E9Cv8ZLQAN; Tue, 14 Oct 2025 18:59:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94FEC83E1D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94FEC83E1D;
	Tue, 14 Oct 2025 18:59:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 79860294
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 604AA612F2
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BhARwZ8eDKif for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:59:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5A1B7612DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A1B7612DC
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A1B7612DC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:59:17 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-41174604d88so2603700f8f.2
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 11:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760468355; x=1761073155;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sc7zgCJnwA122vMCcrv4SkYF6lqCu1NuSc6PF4u2hIo=;
 b=R1LpiDfPylpwcaOFqaBghRcMmkgS7czh2FrVp0alen18l8+TGS17woihIKt83nrfDh
 l1tp3JzSJYOO1uSZndIqsbid5JVn9RT7f47ZIPR+ir15DzBY3lVcZdAvpo/zZRPHsHLA
 qR8LsdcXDzLDNo9qJnSTM57wE2gOvSv/GyEfV8riv8g4M0plvr1/eQo9kBrebKqmeyg+
 lqBhRZWCzRbW/lErBUvtht48nZDlixKyUWRcnbmdcLilyRbg9Cnv0tKBot2/Kze15m5F
 JeTKsUqZksPc8Te50anUm2C+S0OgmBffxAT3z75HKw5eZEXYw4ouH/8NFl6oqrxiEWsZ
 myaQ==
X-Gm-Message-State: AOJu0Yw0WqfkgJIVPpVS7EuaPGDVeXnckR4JAGOu8pUg8gB1QEbp8T5t
 Gw7Q3p9zuvD9jTwqvRpvT6AFcF8AFhol6vVkGBErbAUJPWOMGSS/0QD9km8tZ3Pw9BkUjCmdXIY
 lTRV4qs4=
X-Gm-Gg: ASbGncvuLqNtTpNd4jXO885UATV9C0skKxzoIF4dOSgQMFbTyKcm/Alyn/zziNBaB8v
 XwQD/a8ZxMpvkRlilSsMSpGq1B90HO+HO0ntwYceFlEcPAwy1nuhzdiwmqXDNM9xsrrwTUOLu43
 0+vwUIo5TTZNC/xWp0+h1G7J5gRFd+ZWMiBdBUzLVWI9hR4wVMFo/vc8m1BPA98jRlx0pDBJVyN
 uc74j1k1zy58N1tGae1r8GOWKlV2Y4Kk0U1rvbPMJNPr9qJFdT+0oOjz9F3kqKT7x9Oi4bczbyG
 pr3pCl7HTSYCq5KCQnpCQq2vivDGKsYXM2W/elBeXKAn0CBy0fqqhAGDE2iR0QrpjDLhLvJl/Z3
 LyejaUc+3pzaVFg+mISR+Z/Uch8Bp1sxkY06Ct+skCBAop8FTGzEcWkpYKNasnOiKSKvHlh5aZ9
 noJD8=
X-Google-Smtp-Source: AGHT+IEaqvX6iwMv4qmHrby4qOgBolCYYbOm1v+0iMqzFIP/DAzYpd1zRpO+qY1T372U4xJecs6GfQ==
X-Received: by 2002:a05:6000:2082:b0:3e9:2fea:6795 with SMTP id
 ffacd0b85a97d-4266e8de1damr18648295f8f.53.1760468354713; 
 Tue, 14 Oct 2025 11:59:14 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.97])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb497aea6sm253431705e9.4.2025.10.14.11.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 11:59:14 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 14 Oct 2025 20:59:10 +0200
Message-ID: <20251014185910.677375-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760468355; x=1761073155;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Sc7zgCJnwA122vMCcrv4SkYF6lqCu1NuSc6PF4u2hIo=;
 b=Qha9dLWE+YsBzUlYInchWc/XvWgbWNK7fMLHSmVKYmti9urXZ6w4SjH3jRvxioVX7P
 mNaIRjyFvzUbAeMQ01vlpzhpPshcvk3prj2kx5dOTMD1yZ3Kn24xDqzRWvWSfoDD1HFR
 K8Z0MYN7kjfdJpx99nMsvPj1PDrFPF2u9WoiU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Qha9dLWE
Subject: [Buildroot] [PATCH 1/1] package/iw: bump to version 6.17
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/iw/iw.hash | 2 +-
 package/iw/iw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iw/iw.hash b/package/iw/iw.hash
index e1e5ddd86888..1612bf68bc9c 100644
--- a/package/iw/iw.hash
+++ b/package/iw/iw.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
-sha256  3f2db22ad41c675242b98ae3942dbf3112548c60a42ff739210f2de4e98e4894  iw-6.9.tar.xz
+sha256  7d182e498289ab39b257da6780d562e415377107f50358ee5b55b8cfe40b1e33  iw-6.17.tar.xz
 # Locally calculated
 sha256  5932fb70481e128940168a5fdf133e6454293c0865c7e757874b235cb6daa2af  COPYING
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index f20d8f10652e..3cf7d294e43e 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IW_VERSION = 6.9
+IW_VERSION = 6.17
 IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = ISC
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
