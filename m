Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E189C36010
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 19:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E23785166;
	Fri, 28 Mar 2025 19:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mOITaa6Z5ctt; Fri, 28 Mar 2025 19:57:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5515585638
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5515585638;
	Fri, 28 Mar 2025 19:57:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65EDE12A
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 19:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F9EA4F28A
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 19:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YC7DkN6Jo7S8 for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 19:57:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=francois.dugast.foss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 93BA14F268
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93BA14F268
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93BA14F268
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 19:57:46 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso24278545e9.1
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 12:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743191865; x=1743796665;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9f1qFUXassvQqmvVQ6kkUXRggOdMp/kT/TKE5Ap52HE=;
 b=amb+twyDycRWwhM4HLOKo+3KZrd9CNZYVgXqmucSU5tPM7zXhbMUvF49yB6cD+AGLM
 0lI+z2Du+Y88D3HlyRwcxD+w9ewdUHTISuTYod53AzN0LSMUTz1NBiZbupw8yJ6bPQ54
 scSHHM2t7a3issByUSBCICdWgraiiix6me4+vaIXFFtaxDyJlKk7vHBkuqiSd2r64WA+
 1ghUsmMcBxaqIPgc3VKXNgVhlzKnhh0hSLydjjj9V/FFjvxQ4R2NpnnX+YQaQVszG3Gz
 WhVGzDIVMlywMk8/778aJg0/UJpoC1hDzKmnI+tow/yyDVq9U2DiXe63NQ6BLySQC08M
 koVw==
X-Gm-Message-State: AOJu0Yz3NOVX2JuQKTDnhIQeEvgpwbpqsPGaJndM49076/Yl3NiIQFK8
 b2MTZs43Imn70x3P5dKteP2gXhlnIFDACdsgtQmiKY2uzqBHJcRvM0uXZA==
X-Gm-Gg: ASbGncs/uc0SfUni1jB3fXx9WCz/QQT9eaXZR66i7P6yHpouCNRnYVHKAYLjUpGxKRI
 CLSUdWrZ0lAr2sf6mW0igQ/Qka9IVWsrRwjrWh5WCwWxw3E4zO1s4RGwpwhuuFeS6DaFN2RqPs6
 e6wRa8XCIHghK+SiZtRvhv6GjxNY2aqTvFEZ5DBCtvvNorNO0gtX8olCKIyWJbcJ0e9nzeMASWW
 crK02tYXyUTHKKFm6DWm0YW2e8Mq51figsixdXl4I1A9c6jaVngH0xXG4rj+CDEpbri5KaBrnvB
 RrdFAG5LaW2mkLBODWEcxnNDtJms+cU+nY+lfX06tWB2waKK+dGejz2Bpsm8OCQb7JHzuJbtXfM
 Sy8AZWRGrmkH9YzB32EVu62DnUVgGGMKTHaTBfLI=
X-Google-Smtp-Source: AGHT+IG9CVzmi5kSQOe3IFIcnTIOTXYmYs49lya5jNEjN1h1D3pEkYQKykPw5Can345yunPXxuV1lQ==
X-Received: by 2002:a05:600c:4705:b0:43c:fffc:7855 with SMTP id
 5b1f17b1804b1-43db6249861mr8642385e9.15.1743191864301; 
 Fri, 28 Mar 2025 12:57:44 -0700 (PDT)
Received: from comet.lan (lfbn-ren-1-1629-205.w86-253.abo.wanadoo.fr.
 [86.253.181.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e0dcsm3552272f8f.64.2025.03.28.12.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 12:57:44 -0700 (PDT)
From: Francois Dugast <francois.dugast.foss@gmail.com>
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>, ju.o@free.fr,
 Francois Dugast <francois.dugast.foss@gmail.com>
Date: Fri, 28 Mar 2025 20:57:37 +0100
Message-Id: <20250328195741.3921731-1-francois.dugast.foss@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743191864; x=1743796664; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9f1qFUXassvQqmvVQ6kkUXRggOdMp/kT/TKE5Ap52HE=;
 b=bLX87FNAoy1RJwDcFNTeKrMhRQyw5FF5eHt2rZre6q2D5S5cfuoo2GTTX7hgKPpHA5
 F2lMbYwgQ2rn7wbDrWgqWUGFTZKUPbJaap97j/5piOmogdxNWLFhL3V2rulOHbEk5TzI
 BChXV/JL+gyFlNp+KNoXlyzjoU2+ZAiwe5QtxT3Ryuaybhh3REXv2UZknqXkhjW/oGvB
 2F32LMQ/PObEr8ILcjo1gdbC8pRxYj8DtYZmw61M39MEju2wWFVjvwSRPQLBhZF+/raw
 zJ9J/CW04MVbrWaBEuAhDTIoaCV4JthrHDmIbt9XgcGiHlYnsdYyBn9o16Js2wBrJRph
 6uYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bLX87FNA
Subject: [Buildroot] [PATCH 0/4] Add support for the HiFive Unmatched board
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

Hi,

This is an updated version of the previous series [1] to add support
for the HiFive Unmatched board based on recent kernel and u-boot.

v2: Fix warnings reported by check-package, set versions for the
    kernel and uboot, add cleanup for the Hifive Unleashed

Cheers,
Francois

Francois Dugast (4):
  board/sifive/hifive-unleashed: fix shellcheck warning in post-build.sh
  configs/hifive_unleashed: extract common configuration
  configs/hifive_unmatched: new board
  configs/hifive_unleashed: enable BR2_DOWNLOAD_FORCE_CHECK_HASHES

 .checkpackageignore                           |   2 -
 .../genimage_sdcard.cfg                       |   0
 .../genimage_spi-nor.cfg                      |   0
 .../linux.config.fragment                     |   0
 board/sifive/common/post-build.sh             |   2 +
 .../patches/linux-headers/linux-headers.hash  |   2 +
 .../hifive-unleashed/patches/linux/linux.hash |   2 +
 .../patches/opensbi/opensbi.hash              |   2 +
 board/sifive/hifive-unleashed/post-build.sh   |   2 -
 board/sifive/hifive-unleashed/readme.txt      |   2 +-
 board/sifive/hifive-unmatched/boot.cmd        |   4 +
 .../patches/linux-headers/linux-headers.hash  |   2 +
 .../hifive-unmatched/patches/linux/linux.hash |   2 +
 .../patches/opensbi/opensbi.hash              |   2 +
 board/sifive/hifive-unmatched/readme.txt      | 100 ++++++++++++++++++
 configs/hifive_unleashed_defconfig            |  14 +--
 configs/hifive_unmatched_defconfig            |  46 ++++++++
 17 files changed, 173 insertions(+), 11 deletions(-)
 rename board/sifive/{hifive-unleashed => common}/genimage_sdcard.cfg (100%)
 rename board/sifive/{hifive-unleashed => common}/genimage_spi-nor.cfg (100%)
 rename board/sifive/{hifive-unleashed => common}/linux.config.fragment (100%)
 create mode 100755 board/sifive/common/post-build.sh
 create mode 100644 board/sifive/hifive-unleashed/patches/linux-headers/linux-headers.hash
 create mode 100644 board/sifive/hifive-unleashed/patches/linux/linux.hash
 create mode 100644 board/sifive/hifive-unleashed/patches/opensbi/opensbi.hash
 delete mode 100755 board/sifive/hifive-unleashed/post-build.sh
 create mode 100644 board/sifive/hifive-unmatched/boot.cmd
 create mode 100644 board/sifive/hifive-unmatched/patches/linux-headers/linux-headers.hash
 create mode 100644 board/sifive/hifive-unmatched/patches/linux/linux.hash
 create mode 100644 board/sifive/hifive-unmatched/patches/opensbi/opensbi.hash
 create mode 100644 board/sifive/hifive-unmatched/readme.txt
 create mode 100644 configs/hifive_unmatched_defconfig

-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
