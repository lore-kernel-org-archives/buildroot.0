Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0AAD3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 11:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3015280FF9;
	Mon, 29 Dec 2025 11:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jClsePZg8RuD; Mon, 29 Dec 2025 11:04:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2445F80F2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767006269;
	bh=fEWp0DGPvzaL+Jv25Jljey2ktYFo5EqICHxXa+PMIuQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fonJgrpZD0/K7YNzLpWC6DLllvrXwYcFWcfd8Lv4t1STGtK8ZYigGIilaXZ4YG5LW
	 3/9kA5gbapl3rA7UP3aad+cLCMfY6DB6xPh7mveRmVNV1JjfB2A7rdTx2jTQ4ISYnE
	 k9sxPzC73ar0pfk4P2IYOiUtBT7xohsCpUA6uXrPq/Fzy7MPjLG49TvM7u2gKHzoUI
	 0BwDsb7YsE2YKxRaAYanIM0GAqi+deuFH/EsMhdjrCQZ8AqjfzBX9v7VsErHCf3x8+
	 j+1k470WxG0hc2mHh6Z2gtSPDh6izFgVhKriVyZ7xjw1+UxhSr2Dq/ZCGXKTxYWiKS
	 sjnTiSHfrfYAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2445F80F2F;
	Mon, 29 Dec 2025 11:04:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 78DD6D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 11:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B13E80F2F
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 11:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lv0EfWoefLru for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 11:04:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 791E980F27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 791E980F27
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 791E980F27
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 11:04:26 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-64b81ec3701so14137333a12.1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 03:04:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767006264; x=1767611064;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x6rOOa95tC3JczifQXb2myFkg8Fz0yR9Fjj4qwTlkug=;
 b=pXZ2+YRlgf4ZmUXy1SSQSaHfXcwGlAizBcDWf40HU4M4+bP8xAN8ht6T9Dmf34cVu7
 PsVmMEW3TYEDxnsaFwi2ZO1b5A9Y9o99Vp8UIDYKbG/wODwfToGF1fzBCrYSJXnbiWhe
 ynoLnFm4Hhn7PdpelszIgOwX0FfynaTWsMLDd9ZthIFhm7zSq8CD2eDQXK1U7M6cxZ1w
 iVkg+B+3GfCj23Z4BbYo4HfqYc9HM0nOAlrP/41SiUhGvOKB56gMWk/m5qKS1DidrKQq
 87S+QciRlKymDF+/Pjf/zX67eXPqvvFlIqqAeEW7NNKi9TcGMuQ2JYroPlj2VQotFd2s
 91aA==
X-Gm-Message-State: AOJu0Yzbuq3JHHgdq2wNV67NmvSDw+NBdZ3+Ogj+3HxbUIbEhTuqAJi7
 wGR2Zqv2pOecpqrSMGipdtB399tpY9GGMRhrjZzbqFwO1PqhT6H+8PKKxbjgj3cmfZBFijH3Lx0
 tW4et
X-Gm-Gg: AY/fxX4d9xaR3B3WNvWBs8hBWu7FKYSLIg+MXt+xsg8ee3PxTsppLKs9HWhF3xL7XMs
 ZVkD6ayES+v8d5r2VLK2UxoGC1O68NiDWZ6g4sfUPlYUj2fwkGIQhgnU3xyDHrkEyyA5jyeA7AI
 kh/3CoRFy2mIfeveJyfK8ncmPsgcXirb0ZXg6GYUhD+hTEqLQCbt6NRjgAJzyIMVRF38L2GiapP
 Kvvrfc7ELLklDelnyX42POTuFQc2qYmJFutx1KLh4mSx8+pE9jNww94vVxgYmGfJY+jt9pziZY6
 LC8N2KiEw3oOuLh9Q2qw9P4efLvilNZtu4P5TyJr/oPHstMEusVNS+nG3cZ7X+jJFSVv8cpE4M6
 67ume9JXQA6x7JHUHMs00IDltHU+T67FS0UgxDH7XXojHMo87hWsSmThHdaZyvregyJoGZA1E7j
 HwcUWUP2bky/Q532Xdr6mswnvIPRRZsjq77rJpnhWKcbYQ5GoUi6oMos91enkEbZeZvhqD/PJo/
 Y/d0qdqycE/uODUUNmaiA0USZhXnQ7JRXNcb0DiUpzCcij7TbRXFU3Yiop0K7vlL/RI1sbavMp5
 prfixyrnDvw=
X-Google-Smtp-Source: AGHT+IGrBYP/pfYilDCOqQxcUIwgTrrP1eXuhQCMGTo41aKjv5nUJhyoG4xE0Dt0zjIsYBktDtIvYw==
X-Received: by 2002:a17:907:7fa8:b0:b76:d880:398c with SMTP id
 a640c23a62f3a-b8037255548mr3310105266b.61.1767006263860; 
 Mon, 29 Dec 2025 03:04:23 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ad1e6dsm3342818366b.21.2025.12.29.03.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 03:04:23 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 29 Dec 2025 12:04:16 +0100
Message-ID: <20251229110416.56538-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1767006264; x=1767611064;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x6rOOa95tC3JczifQXb2myFkg8Fz0yR9Fjj4qwTlkug=;
 b=Afkv2AXlgSza+r2NluffHvTSU/ooWM0RW7oJyZVelFk6uH75oC4BC55IoKEHCFlvl0
 0LEQhNuB66f3ZzTSaUUYKwALGUo+SCe7oxe6Km+29RlZZ6LW7//cnXQ+RLlFp5/Aubno
 LR+LSmh+HYmTLBYxsE4Nhe3qrCJRN4oYpzbac=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Afkv2AXl
Subject: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.243
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

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.243

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index fa691255eeb9..274cf8fad25a 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  4eab6647c9e75e5900ee8981c80750b26493fe54d99708989c0e7ce08067484e  uuu_source-uuu_1.5.239.tar.gz
+sha256  dee3be0f337c631bf93232f5ea42440f07782ce005c9219a14731d66bbe83658  uuu_source-uuu_1.5.243.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 6ee06dab880b..74e244877761 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.239
+UUU_VERSION = 1.5.243
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/nxp-imx/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
