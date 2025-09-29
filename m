Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2EFCAC5BE
	for <buildroot@archiver.kernel.org>; Mon, 29 Sep 2025 13:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83C6680F55;
	Mon, 29 Sep 2025 13:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 53DG_YZGx9Bx; Mon, 29 Sep 2025 13:08:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9222580F67
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9222580F67;
	Mon, 29 Sep 2025 13:08:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F2A16194
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 13:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D69F9405F4
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 13:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zsXSzV1nUhmI for <buildroot@buildroot.org>;
 Mon, 29 Sep 2025 13:08:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8E9074060D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E9074060D
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E9074060D
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 13:08:16 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-634cdb5ed4bso4936636a12.2
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 06:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759151294; x=1759756094;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uFQ+CmFtr2APBc2GGSg3JJ2uuATRnQkEKX/eaYMi5WY=;
 b=kQIm0rzCT9e44taBcikH5U6ptZ+BSUXFNjUTIGi2yMPOcwZ7lEkHQ0XodGUXFtjTvJ
 zE1jAd+jfsmd9l5wmjTpJ4I+RTpT7FJ6FjTAfGTUDbPts4PcFXFJXpSpcP6BOtlKFtE+
 5MhzJ9LdSja+Whpg7MaP2WHmIZKNMg0syyB/NHRGYVeeymqYfyA6ob4M5vTv8vjdTHPz
 0GWvTugiOM9eheKI/AV8ZMI3zs6HLKCEUSZaX1+d5y0oF+OgtUFe2ss5WVxahOSluvRf
 ySE21RXMv4ctAQVZQbEkZZt5ytNuSOFiX5Cw79g8kFkjrlv6+wk/5qd/xjVLXSxpV0L9
 UgcA==
X-Gm-Message-State: AOJu0YweCmWhRyiIzhKfpFqiFWkKI0ZrIoXiXvulTdzI1vTdXQ2rcEM/
 XKo2Wh5DjqjwC/AeYekP/s+zXay700/6uMf148Enu0Lh6rIICG5WHzgFDlUAPTjQMn6HgGo/J7x
 RLvHQ
X-Gm-Gg: ASbGnctJowvRwJh+2XDrYySHqoR9RywU6cZg7Fh4CAnDtRFNWly5MH0Nt+eG1yP5mHK
 nAu/cdWpdUnNZ4EVREWAmibvoWPoDpKQW0/NEQlW6aewhI/Xnv04XAKwX2zy9bXR4cJIHN0NMl4
 fsaOPeF1t+RmsAi4GdWAaw5L7ebxa4W2TiTLAAqXkLeMrcx7MPNMNegBwQ/WcAtttkfKK68tgT+
 T3BJvkWYUeJVGKlhJtg2eZg7rKagJH9oH4qs2E2HjBOCZIHx9ZlAjN02oX1takuXgoTnvFzkJ1B
 1VgdZue35+4bBSqoSuXCOFFko27LADhAXpi5ZBxDklKp3tfRiyh47gTFuk/RV4IL1wzRFP6oGfx
 E+rsz5lWhq+f+4EU6F3pfGZmt+n9A5SVN/kqk7fnVI9UqFjnjwQhWyREutpnqyidUGYl41UHQdc
 gz
X-Google-Smtp-Source: AGHT+IEvZATwTv4ZMcvMVgXz5kIgjNcab1JisY66LDDnjaCNRs3kT9tb/ODHB7UExVLIS1oXc2/zHA==
X-Received: by 2002:a05:6402:1ecd:b0:634:c4b5:5d7 with SMTP id
 4fb4d7f45d1cf-634c4b5067dmr10905787a12.34.1759151294277; 
 Mon, 29 Sep 2025 06:08:14 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([176.201.139.243])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a36508a9sm7767397a12.15.2025.09.29.06.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 06:08:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 29 Sep 2025 15:08:09 +0200
Message-ID: <20250929130809.1302298-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1759151294; x=1759756094;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uFQ+CmFtr2APBc2GGSg3JJ2uuATRnQkEKX/eaYMi5WY=;
 b=WnGVIcnYIz7bStAHzIwEqZUxAuA6tEAIBR4fbPI1DyG0lJoKMnPFgZrS8zGeRWxwsU
 vE2hFDzdHEUl4QZAdOZGAu8965pcLRTyE+VNO0AlmbHnH34VZTErcgSChFOdgO6SmMJB
 phuX4bkCY05C4L2s2LTgHxE9MSHs5zUgACYwQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=WnGVIcnY
Subject: [Buildroot] [PATCH 1/1] package/enet: bump to version 1.3.18
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

See:
https://github.com/lsalzman/enet/blob/v1.3.18/ChangeLog

Update file hash due to update license dates:
https://github.com/lsalzman/enet/commit/2662c0de09e36f2a2030ccc2c528a3e4c9e8138a

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/enet/enet.hash | 4 ++--
 package/enet/enet.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/enet/enet.hash b/package/enet/enet.hash
index 2643878ca941..88c19ff89711 100644
--- a/package/enet/enet.hash
+++ b/package/enet/enet.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a38f0f194555d558533b8b15c0c478e946310022d0ec7b34334e19e4574dcedc  enet-1.3.17.tar.gz
-sha256  77f94e3be39938801163844b8bf9a4f12badcc0da136e9886e7da14a816d74d3  LICENSE
+sha256  2a8a0c5360d68bb4fcd11f2e4c47c69976e8d2c85b109dd7d60b1181a4f85d36  enet-1.3.18.tar.gz
+sha256  a29cd246638974da7c6edf423a0a69d4a6f7d759940b7cfa9a2bc3442ac3834c  LICENSE
diff --git a/package/enet/enet.mk b/package/enet/enet.mk
index e2feb26b54da..71e6dad39aaa 100644
--- a/package/enet/enet.mk
+++ b/package/enet/enet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENET_VERSION = 1.3.17
+ENET_VERSION = 1.3.18
 ENET_SITE = http://enet.bespin.org/download
 ENET_LICENSE = MIT
 ENET_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
