Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071E4C369C7
	for <buildroot@archiver.kernel.org>; Thu, 17 Apr 2025 04:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 929DB849E3;
	Thu, 17 Apr 2025 04:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQaqQnmCsMOi; Thu, 17 Apr 2025 04:39:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACE13849E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACE13849E7;
	Thu, 17 Apr 2025 04:39:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65A5BB01
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 04:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BA9540D4B
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 04:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxqzMGbGm0fH for <buildroot@buildroot.org>;
 Thu, 17 Apr 2025 04:39:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7937B41336
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7937B41336
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7937B41336
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 04:39:12 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-736b0c68092so254965b3a.0
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744864752; x=1745469552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v3zhghLgENolJw0MsS3C/0MaRNeNVn3pL8ZAvfViG/k=;
 b=YvoiaL4yYuVLzkPlbsjtcWT4lpwzACno41fq/T90JZ5/y3zOZnvhQy3Hlkm//Vk6F3
 5zNEIEJorhE/2ksa+oKGqnhB5pipJ4hd8hDCiuOFyewRZB8ACsYIgUfGT1TAcXGkB5l6
 ZKAJtO5as9a+J6ZZJ1catCe9gTxS/o3Byhao8ZRG29D2PaLEJSdmr8TBoEJCoSC6kLQK
 o9KCw2r06lyEv44WDfjf55DE15R5IFVqw9izWRGK9JrRcY2naXfhOyzS8RWO5ZVjn+7k
 RFwQ3Jmpt9/EQfZZ16OJ8wAw4N4jiQWXx1Is/lKQgeOqZZI/6ypsaSs1zKIga2zvYANT
 FERA==
X-Gm-Message-State: AOJu0Yy2dr3biWyeaaq16dB6VARGmseLDsb9PbcP/oSv5R3xltXtOhpe
 pWD7Nvbh93OXpE4/VC624WI2dt0ERRbMcktmTC9gL77vG+QtNAqza/W8Xw==
X-Gm-Gg: ASbGncv/93Oy9/Uw5pon9VVMUib6DePcegeYtq2N5j7g7XelNDGInHtdCIodoE6Gv4H
 AbmnlHNLgvGh9bUIIQqPB6KpkfzDKfCQeDTdxLMZ3tv/Dvbhz/afoOZkUadYwvJc2IirkzUJk1x
 cQSWzApUaZSq4wJwgabIZD+yPk0LwJ+re4r11XoKNuG5pL+5koaG6LSz14VASIguqrmEebPnBg3
 Wh6/xk9Y5Wy3yZA26Flg9fiAHr5LAV8vPRm3q8LbS9HabEdVMvNVBDMh6dEDTnYwPPkfXWRQDiX
 qLoTwZxDRGtSuihdMuZUgw==
X-Google-Smtp-Source: AGHT+IHHy0fu5V4o2O4MRg5s3M59dpMB1/i2J8n8vBGNGG5kEWVajSwlZZ6gKqIbmzqII/sMxV3t0Q==
X-Received: by 2002:a05:6a00:aca:b0:736:5504:e8b4 with SMTP id
 d2e1a72fcca58-73c267d2f23mr6291114b3a.19.1744864751578; 
 Wed, 16 Apr 2025 21:39:11 -0700 (PDT)
Received: from ProgramPC.bm.local ([76.8.199.226])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd22f0ffcsm11299205b3a.117.2025.04.16.21.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 21:39:11 -0700 (PDT)
From: Lance Fredrickson <lancethepants@gmail.com>
X-Google-Original-From: Lance Fredrickson
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 22:38:44 -0600
Message-Id: <20250417043845.2171938-3-lancethepants@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250417043845.2171938-1-lancethepants@gmail.com>
References: <20250417043845.2171938-1-lancethepants@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744864752; x=1745469552; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v3zhghLgENolJw0MsS3C/0MaRNeNVn3pL8ZAvfViG/k=;
 b=NxEv9b5bn6RfnJXgCbyM2p1B5sXjS5vM4J1p/pGZQPk5ITyAFxOsLugBPFILrxeosq
 cqta9BATSdpZSdX+K2qtf7SItRvBJzRTbqaeruZe/g1V/Bd2Ba3RoCFOz5YyAI+LrM1V
 pwEtiIdeY729rn1i9GQUxsNyzRC9KTwEpcd6Nk+SZyCX7jVjrJGDM5Mp8Gdw/PTwXqnP
 zZZwpaT6BR8I3B79FNOoFMex0Wp6GDdRgTKN7S0WZ9ffxAcIAMiTU4CvYHlsl3zqP65Y
 XEaG2lyoXLZituSUiu5BScWp7Rni9LDTkOZ+7sdIFF+9pwqij5ZsA8nACyLlAZY2PJy/
 2a5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NxEv9b5b
Subject: [Buildroot] [PATCH 3/3] package/libuci: bump version to f3fc0b7
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
Cc: Lance Fredrickson <lancethepants@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Lance Fredrickson <lancethepants@gmail.com>

Changelog:

 - f3fc0b7 libuci: fix false positive warning on older gcc versions
 - 16ff0ba CMakeLists: add support for including ABIVERSION in the library version number
 - 047b2ef CMakeLists.txt: bump minimum cmake version
 - fb3c234 add support for an override config directory
 - 10f7996 file: Ignore config file with '.' in name
 - 5781664 remove internal usage of redundant uci_ptr.last
 - 3cda251 file: Fix uci -m import command
 - 04d0c46 uci: macro uci_alloc_element not in uci.h
 - ae61e1c uci: optimize update section in uci_set
 - 16e8a3b uci: fix memory leak uci_set on update section
 - b2f3417 uci: maintain option position in uci_add_list
 - 74f2797 uci: fix atomicity of uci_add_list
 - 47697e6 uci: fix use-after-free uci_add_list
 - 7e01d66 uci: optimize update option in uci_set
 - b7ceda9 uci: maintain option position in uci_set
 - 9b6605e uci: fix use-after-free uci_set on update option
 - f49a2fd delta: simplify uci_load_delta() by using a helper
 - 5de3871 cli: drop redundant uci_add_delta_path() call for -P
 - f84f49f cmake: Allow override of install directories

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
---
 package/libuci/libuci.hash | 6 +++---
 package/libuci/libuci.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libuci/libuci.hash b/package/libuci/libuci.hash
index cc04320331..1e429f8160 100644
--- a/package/libuci/libuci.hash
+++ b/package/libuci/libuci.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  d095dc7ff4714e33aa18ef3ea5d30f525a202d6997d7b13bd952da53818988d6  libuci-4b3db1179747b6a6779029407984bacef851325c-git4.tar.gz
-sha256  39e1cc18a36172fb80d9b37f0af77d78ae935bd8a020978a7895d9e76a24e112  cli.c
-sha256  69d4eea4de19d27014f3d6ed723081b4039700bfd73cd0a5e39e2c4f19a58c66  libuci.c
+sha256  d3b12df54f9faa69f0ff6d2a239fdcc30d64eda5269ddc882cf97677ea8cb066  libuci-f3fc0b76040685829191debc03edf72f486ae8ae-git4.tar.gz
+sha256  5bb12361838b588bb263ade8537f5ae1a5e62d54b0a8f0640489db8cc29831d8  cli.c
+sha256  bbc34ea5f391abc3b27416dc3c96b0f71f852c44210faf1cde0990218f68b13a  libuci.c
diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index 81e87aa5be..3c7e12baae 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUCI_VERSION = 4b3db1179747b6a6779029407984bacef851325c
+LIBUCI_VERSION = f3fc0b76040685829191debc03edf72f486ae8ae
 LIBUCI_SITE = https://git.openwrt.org/project/uci.git
 LIBUCI_SITE_METHOD = git
 LIBUCI_LICENSE = LGPL-2.1, GPL-2.0 (tools)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
