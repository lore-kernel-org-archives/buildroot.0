Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2D0C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 12:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A0BD41973;
	Fri,  1 Mar 2024 12:13:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 95Ow8w94DMoA; Fri,  1 Mar 2024 12:13:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8245B41954
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8245B41954;
	Fri,  1 Mar 2024 12:13:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 283681BF2EC
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 12:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15AFC60835
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 12:13:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i9zGRRStjZyx for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 12:13:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.179;
 helo=mail-lj1-f179.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C76C6064A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C76C6064A
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C76C6064A
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 12:13:01 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2d27184197cso25271671fa.1
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 04:13:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709295179; x=1709899979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oBjBFoqg0uCX0i/AnRWYGCvfBgUKOSlLaJKZisdzmKU=;
 b=Mvlghv7fMcycNX/88p8orBalvItfh8vatecCYeizYNvxBuCLIFrNgGFnmt1U+wOYwD
 g93Js4wik5NP/wWyXxJsNFyrGVpjlwfTdwDTva7LI8a27gJfpgZ1rzmJSJpEBL09abGz
 rKjqtY7As2dlM4nByr36sRG8hbkyxMVGow6nFaPOHvomDqUWWS77bwnE7iCzeHVhgb5V
 UwoXfCJBhcuTpJngXRB67CBk9DHqf9FxZZ/I0xbVfACyIL2KNZ9JjjCF7Vb/ff/nsqyx
 Y3ExvfUi0sp+C13h0lzd/G7SgnyQOsEPVOdHJJduWlUz0gfzMmVElQRDYrYhJsYP+NF/
 LzpQ==
X-Gm-Message-State: AOJu0Ywzkk0ipAvjF7LjbfOKNxmGBP8de2bYvyBSmSmR/G+F9rYlUCdB
 uuSC77nPsZWlgBv5i7A6zvlRgaF97P1wWdvRPFn0Yx/46TDYjrqkHlJd9f9I
X-Google-Smtp-Source: AGHT+IGQAXtIbFLHGBEz6d5zmI6dw0d2pYp3daWsM7LV4EKrhIcH00A2ebNqvyVgGw/jDTN1mOc/4Q==
X-Received: by 2002:a05:651c:1a07:b0:2d2:cb43:bc86 with SMTP id
 by7-20020a05651c1a0700b002d2cb43bc86mr1121544ljb.45.1709295178782; 
 Fri, 01 Mar 2024 04:12:58 -0800 (PST)
Received: from thomas-Precision-7670.barco.com
 ([2a02:a03f:eb68:2f00:21b0:b5e5:77b3:1dae])
 by smtp.gmail.com with ESMTPSA id
 jj2-20020a05600c6a0200b004120537210esm8189417wmb.46.2024.03.01.04.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 04:12:57 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 13:12:51 +0100
Message-Id: <20240301121251.52287-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301121251.52287-1-thomas@devoogdt.com>
References: <20240301121251.52287-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 2/2] package/sdl2: bump to 2.30.0
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
Cc: Michael Fischer <mf@go-sys.de>, Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes (2.28.x):
  https://github.com/libsdl-org/SDL/releases/tag/release-2.28.0
  https://github.com/libsdl-org/SDL/releases/tag/release-2.28.1
  https://github.com/libsdl-org/SDL/releases/tag/release-2.28.2
  https://github.com/libsdl-org/SDL/releases/tag/release-2.28.3
  https://github.com/libsdl-org/SDL/releases/tag/release-2.28.4
  https://github.com/libsdl-org/SDL/releases/tag/release-2.28.5

Changes (2.30.x):
  https://github.com/libsdl-org/SDL/releases/tag/release-2.30.0

The odd numbers are pre-releases and are therefore not mentioned
in this bump commit.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/sdl2/sdl2.hash | 4 ++--
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index 7a28d5efc8..95d2cf959f 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.28.5.tar.gz.sig
-sha256  332cb37d0be20cb9541739c61f79bae5a477427d79ae85e352089afdaf6666e4  SDL2-2.28.5.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.30.0.tar.gz.sig
+sha256  36e2e41557e0fa4a1519315c0f5958a87ccb27e25c51776beb6f1239526447b0  SDL2-2.30.0.tar.gz
 # Locally calculated
 sha256  9928507f684c1965d07f2b6ef4b4723d5efc2f6b4ab731f743a413c51c319927  LICENSE.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index eb5042e3cd..91f6585761 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.28.5
+SDL2_VERSION = 2.30.0
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
