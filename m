Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F89CC282EC
	for <buildroot@archiver.kernel.org>; Sat,  8 Mar 2025 06:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB22F84789;
	Sat,  8 Mar 2025 06:13:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6JaNRNJ_VcZP; Sat,  8 Mar 2025 06:13:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEA4C84787
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEA4C84787;
	Sat,  8 Mar 2025 06:13:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1233171F
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 06:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E21BB4179E
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 06:13:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9OTzkkYhUrE for <buildroot@buildroot.org>;
 Sat,  8 Mar 2025 06:13:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com;
 envelope-from=kanakshilledar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 46C4D4179C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46C4D4179C
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46C4D4179C
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 06:13:26 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2ff6ce72844so603836a91.2
 for <buildroot@buildroot.org>; Fri, 07 Mar 2025 22:13:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741414406; x=1742019206;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=viBbkKTBGbZ/uquDJPcKjGB806+a8xpZEpiaK8AQcqY=;
 b=PSKqp4meQoc8Tv8dopPprGgjg0JVu93DHIadO+HpVH+4ATmDj/D5aWa4K/EyTGJSd/
 ODUIe45pMtoWHwvNdlU/n72OTjNE1OPeQJufcBghA3irzpneQxaSpzuwUvhOlsgpo4T4
 uhdYhaZIVcVBjphhLZDoMt7hfgMhYCBcqDUR24mQo3WY80OroK2dYW3+SKsocNGxF3b/
 M0bLgxmMdLKs+PJ6pYJXgCjtmQknjczAeo3WS0qJlD77fE4jrC4kebfoO4HJixpRyV3a
 llZEbB5Pi/rkb8WEhXcoIBiEmFZwEmBwO0pIt8D6Tsvv/IzZYlwLTGvYZjMK6tI0bn7i
 0Dmw==
X-Gm-Message-State: AOJu0Yw7ZEfWo6MandrgvrJ65j1Ce8A+jsXOep5OHiLbWyCbKvOch4QH
 dxNJEnyEDsJ+w6EZ+uJ4mnXDZ/2FRFzxHoBgCEcln0JkQkURsgqvZ+s993Zf
X-Gm-Gg: ASbGnctEhAbtD8rE/xNXrdex9ets56BLFBynoRPxUIaovyZ9Qcms0MkoTvhYEGX3ot1
 2NGD4K9pvi8dKFmgo61B2TeKyuOwHPe0/P7y2Lw/Y59HGlZw5XVTBRl/tEui/3OzK4ljEpffKsx
 NjkevgpgURjLg3Kx2vl9vRxq+T2QX3SiJFVev/xjUQ73FE8CpkdKYiTfakvWB/IYrNrI3LrnhO6
 Wm++WH6zuJK0RwH382UvjFAHa62DRa1JWUrcE3M6k7c66Fr9+pMPVGa9VuSROR2vn81SnWHKa35
 x/Ws5MrHOIOtJwO31UxEQUaNQDaX++eU/cUk0aSXlglG7PYAXawiNCwOwYs=
X-Google-Smtp-Source: AGHT+IHQW/B0+CreTLpASEv9JQqm2S9P2nE+NPmWTwawdW1uaEsNmbRXLW1IzY1lW2nIftBw1QGrow==
X-Received: by 2002:a05:6a00:c96:b0:732:2923:b70e with SMTP id
 d2e1a72fcca58-736beb50cabmr1066300b3a.0.1741414405852; 
 Fri, 07 Mar 2025 22:13:25 -0800 (PST)
Received: from ga401ii.. (n235.ucndns.in. [103.183.91.235])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-73699da011asm4189922b3a.84.2025.03.07.22.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 22:13:25 -0800 (PST)
From: Kanak Shilledar <kanakshilledar@gmail.com>
To: buildroot@buildroot.org
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kanak Shilledar <kanakshilledar@gmail.com>
Date: Sat,  8 Mar 2025 11:42:44 +0530
Message-ID: <20250308061245.1774235-2-kanakshilledar@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741414406; x=1742019206; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=viBbkKTBGbZ/uquDJPcKjGB806+a8xpZEpiaK8AQcqY=;
 b=SzeVm//GpnulxGKlMizcz19qrwuaUHqTFyK+N5AZxgZdVqtU8ROfmdvzKA8LaBBp98
 qdSqNqFvRiajzj1xpx4lOnlXJb+WTZTKqvzkxaP/SEk0oulojlTYwnFleqtqwCdC/qhw
 m5QpTHmk2YXGFpozi0jzpq8r4n75c6I+FwtaCQbGgP4LOe8SCKfci4XqHXSTp5YOam1n
 IAFn9NgDv0RtABPAi820jl8zTc/r4/qI6hpdOo/0Udqk6GB9g5aPkQvnCKBj6M3Og34v
 9uAMKMEQO+885YnlHvDfi/f0CRZR9hj/CiAaGO6haLvDuPyfP4KJ6uLrE+5sAHDAs6JS
 ts0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SzeVm//G
Subject: [Buildroot] [PATCH 0/2] Add support for LicheePi 4A
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

These set of patches add support for LicheePi 4A board.
LicheePi 4A is a RISCV SBC based on TH1520 SoC from Sipeed.

These patches include the necessary changes to enable booting
and basic functionality on this board.

The first patch adds the propreitary binaries required
by TH1520 for booting, these include binaries for audio as well
as WiFi.

The second patch adds the board configuration files.

Wiki: https://wiki.sipeed.com/hardware/en/lichee/th1520/lpi4a/1_intro.html


Kanak Shilledar (2):
  package/sipeed-lpi4abin: add licheepi4a boot bins
  configs/sipeed_licheepi_4a: add new board

 .../sipeed/licheepi_4a/extlinux/extlinux.conf |  4 ++
 board/sipeed/licheepi_4a/genimage.cfg         |  9 ++++
 board/sipeed/licheepi_4a/post-image.sh        | 25 +++++++++
 board/sipeed/licheepi_4a/readme.txt           | 54 +++++++++++++++++++
 configs/sipeed_licheepi_4a_defconfig          | 40 ++++++++++++++
 package/Config.in                             |  1 +
 package/sipeed-lpi4abin/Config.in             |  5 ++
 package/sipeed-lpi4abin/sipeed-lpi4abin.hash  |  2 +
 package/sipeed-lpi4abin/sipeed-lpi4abin.mk    | 30 +++++++++++
 9 files changed, 170 insertions(+)
 create mode 100644 board/sipeed/licheepi_4a/extlinux/extlinux.conf
 create mode 100644 board/sipeed/licheepi_4a/genimage.cfg
 create mode 100755 board/sipeed/licheepi_4a/post-image.sh
 create mode 100644 board/sipeed/licheepi_4a/readme.txt
 create mode 100644 configs/sipeed_licheepi_4a_defconfig
 create mode 100644 package/sipeed-lpi4abin/Config.in
 create mode 100644 package/sipeed-lpi4abin/sipeed-lpi4abin.hash
 create mode 100644 package/sipeed-lpi4abin/sipeed-lpi4abin.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
