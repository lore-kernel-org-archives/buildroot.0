Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389A0C28B25
	for <buildroot@archiver.kernel.org>; Sun,  9 Mar 2025 13:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AACB820AE;
	Sun,  9 Mar 2025 13:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RjH696jvEGMi; Sun,  9 Mar 2025 13:02:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54342820B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54342820B3;
	Sun,  9 Mar 2025 13:02:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CB5FDC
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 13:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FD49600BB
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 13:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eT2vEOf0cjzw for <buildroot@buildroot.org>;
 Sun,  9 Mar 2025 13:02:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com;
 envelope-from=kanakshilledar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 20743605F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20743605F7
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20743605F7
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 13:02:49 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2fc92215d15so931655a91.1
 for <buildroot@buildroot.org>; Sun, 09 Mar 2025 06:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741525369; x=1742130169;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NVt/Lr0DqE3dYzAdgFgOQXWPyW1iq8kkCb97gtSc7fc=;
 b=bBppOMqACSviO+vNWZOkGzddEzlYeAGO2zDHu6jXVE4rgdJKarw7BtbZZLEikOanSV
 vMC8/fMx/Osf9JVCdJn/BGWJ+wzox0GqzZYdFuD0Q7YSo21iEw8BDJ9zDHwUYgKk7Vn9
 +JUcqY5Z8+7/4tsQ/RJTeRkFbVahpyyFCBnQApkG4aj9wiQxG4m0DzmFt8jmtcDRO3SL
 BTghFe320bPnhJBvBsigIxTLRpFNtVz2AFLDaBGjJva/uBwUp0scf0soeQhxDt5+ObtG
 IRtDjHL+j4Yp1oJqHqv65SlH8RuWCa8OjosU4xq73MWhJAT9HYd6Aj9qkwtyDad4UB52
 4Z+Q==
X-Gm-Message-State: AOJu0YzcC/cAoJVfYG8ie/VTZT2OOmEdkXXvUsZcIKv5rC1qi2fMAcoq
 r0sN6M0YMe65WC3U3XWr3ado1n4gFtA9QYKydQnYiSFyu6JNnOt4gNTh/YtD
X-Gm-Gg: ASbGncsMx57W+vISOm4Cx++BsYDYt/d390wrMu5ccTjONov2XGM00rC0bW1ujNdtCi9
 vvIixwpvsEM2OMp+bXyxfc6OH8lw4OgBeWX+nUWXS9Jo/JjnF/rVQ56FD4nEAgF26svXLjJRoYD
 RQg2F08KveWeGs9uBd8md8cCvYP1L7ilGMU5vJm2LupYW76mkDL7t2avaO6/F3kg1SbVX9hW4sx
 YQGvV+AYhhdqk0hoK/KMVaKORUAs5hoMF/92hw6V94iv7vbHeZMewSY3xdLT6WoVB0ht3lobhBn
 niSJ2OaopgrxAY36BqUN1OXOkMA164U3EjWhzGD7TRtKAoNeIe3SeO1LsTLK
X-Google-Smtp-Source: AGHT+IFC3N/tjEmcZkJJpEKJdQGfWXgQbD4TN0HHZeSJvPi0Y5piwDxspqNNE7RDnqJkC7Z+Ln8H0Q==
X-Received: by 2002:a05:6a00:1256:b0:736:5547:567e with SMTP id
 d2e1a72fcca58-736bee07d3dmr3046450b3a.4.1741525369212; 
 Sun, 09 Mar 2025 06:02:49 -0700 (PDT)
Received: from ga401ii.. (j254.ucndns.in. [103.155.210.254])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-736dae80528sm43377b3a.133.2025.03.09.06.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 06:02:48 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
To: buildroot@buildroot.org
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Kanak Shilledar <kanakshilledar@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun,  9 Mar 2025 18:32:29 +0530
Message-ID: <20250309130230.1520839-2-kanakshilledar@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741525369; x=1742130169; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NVt/Lr0DqE3dYzAdgFgOQXWPyW1iq8kkCb97gtSc7fc=;
 b=XPWyVipnfWhVtYwDbCZekn9xBu+KZlDsek1yaW8volW1c/g0YyzOGMqJO0QLttl41q
 4fN5l9IqKx14rkBVNPM7OY9CRGx7GNS3ijTUb3GZAFy2tACyUZl2cU5+CiBSxieUAADm
 p89uU98Qctk1xrWz0JzuCFKycHFtyPKjOSOyk5FAfeuzIy6RlnM4yIdter1tRM/KQYj5
 YUKAThB3scMlpNE7G63x4GInF4jUPSVhfiHtzdMOZQvfDjSEHNU2A0o8ky5plvpQl4AO
 lzdMd3JTyxoor6uISpM3v/NnEhUdL4rSQggcYJFoqWlLfqA1hp3ACNYzGqdW+0eMopLo
 hePA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XPWyVipn
Subject: [Buildroot] [PATCH v2 0/2] Add support for LicheePi 4A
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

 DEVELOPERS                                    |  5 ++
 .../sipeed/licheepi_4a/extlinux/extlinux.conf |  4 ++
 board/sipeed/licheepi_4a/genimage.cfg         |  7 +++
 .../patches/linux-headers/linux-headers.hash  |  2 +
 .../licheepi_4a/patches/linux/linux.hash      |  2 +
 .../licheepi_4a/patches/opensbi/opensbi.hash  |  2 +
 .../licheepi_4a/patches/uboot/uboot.hash      |  2 +
 board/sipeed/licheepi_4a/post-image.sh        | 25 +++++++++
 board/sipeed/licheepi_4a/readme.txt           | 54 +++++++++++++++++++
 configs/sipeed_licheepi_4a_defconfig          | 42 +++++++++++++++
 package/Config.in                             |  1 +
 package/sipeed-lpi4abin/Config.in             |  5 ++
 package/sipeed-lpi4abin/sipeed-lpi4abin.hash  |  2 +
 package/sipeed-lpi4abin/sipeed-lpi4abin.mk    | 26 +++++++++
 14 files changed, 179 insertions(+)
 create mode 100644 board/sipeed/licheepi_4a/extlinux/extlinux.conf
 create mode 100644 board/sipeed/licheepi_4a/genimage.cfg
 create mode 100644 board/sipeed/licheepi_4a/patches/linux-headers/linux-headers.hash
 create mode 100644 board/sipeed/licheepi_4a/patches/linux/linux.hash
 create mode 100644 board/sipeed/licheepi_4a/patches/opensbi/opensbi.hash
 create mode 100644 board/sipeed/licheepi_4a/patches/uboot/uboot.hash
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
