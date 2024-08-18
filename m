Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEB8C52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 17:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FAE940277;
	Sun, 18 Aug 2024 17:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 21A1tGhVyOJw; Sun, 18 Aug 2024 17:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7957B4027E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7957B4027E;
	Sun, 18 Aug 2024 17:11:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB8641BF299
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 17:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90E7E80E97
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 17:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yk6MbaoqTxM0 for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 17:11:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD78A80EEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD78A80EEA
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD78A80EEA
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 17:11:05 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a80ea7084e9so175469766b.0
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 10:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724001064; x=1724605864;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f6TGceaFXaELxoR5udUg4Xtg61jGuqIEzSfx17XG/xU=;
 b=g/4raNvfGqivQhEGs0RBedWFQ6BBEyRxr25etGumPRsqM6Pn2KvILsLmLFEXjF1GQX
 Iy9HEie59f6Rpgj1dwj3SyGg9gIT2n13+W99Lg9DFhRg2KuEAyZ7C77cNq0inpmAILSN
 EEtp47akqDaTWvS3eO2A4Ci8/tmGGZthpwdNt0TTjhkJB3bIskPUxmKiLlkuxc+zTMH4
 ofLtzNvCFW8F48kQDIUyAnbqzqoM3KhF2oZbiW1nQxUQuIiH30GIKFLbL07tDnNyJX+Y
 oaHYmW8NhAz/WlreAcAalD6gZjnJPAmXhcsM98WFfCVKPw6FEmuCgmJFfrQgMvq33lwe
 dqPw==
X-Gm-Message-State: AOJu0YzCLGDj7Mj7P10jajluP84MTWyrPz6tLrdr4lhtXZGic+Gr8iz9
 lY2reYJLoEZSSft2DOBBPqUAjoM1J8R1g6RuMGJ2Rme8IhAAXBpf8siK49+I
X-Google-Smtp-Source: AGHT+IG5KFYFu9crHyr62EA8WJibzYYoOiC2M/kJFdzFWKCgwWpo0CMPFa8ru2m4a+v3OHeWTWk7XA==
X-Received: by 2002:a50:c8cb:0:b0:5a0:e303:8f0f with SMTP id
 4fb4d7f45d1cf-5beca528f1emr6117087a12.10.1724001063002; 
 Sun, 18 Aug 2024 10:11:03 -0700 (PDT)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebbbe2623sm4628846a12.9.2024.08.18.10.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2024 10:11:02 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 19:10:54 +0200
Message-ID: <20240818171054.780381-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724001064; x=1724605864; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f6TGceaFXaELxoR5udUg4Xtg61jGuqIEzSfx17XG/xU=;
 b=Qs6LYpaAb5J8y3SRWOtIXubD4nhhT9NzdmCtwbmjaTN+PbOGQmEvVlxVCc6dIUPIbZ
 k0fV8crIQQo7t8+eGXHN2vX8hDhtf7f08HPEo1VF8gDaodx+QzLuH77xWF6NWYypJb5E
 9JAyazwRrKXueUCZ/4BS+5INjkVim8C1T3aiK/4toNyT405eL+NOAtVScdwU1A616/eA
 k91vLTHo9BfWQFe7LswAQVcJZJA+Bgo/zvR6h3m0Xi+akNWUKGxoJDlEtwaYxku9yl34
 K96hXwKCWxktZyd8DUZWPue/wA3XoreiEZDuT2D0Z8gAo2QHzeqYHXSZkqCNAFTEdj6n
 QbuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Qs6LYpaA
Subject: [Buildroot] [PATCH 1/1] package/libtirpc: bump version to 1.3.5
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/libtirpc/libtirpc.hash | 4 ++--
 package/libtirpc/libtirpc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
index 40e59f9bcb..b1113264ae 100644
--- a/package/libtirpc/libtirpc.hash
+++ b/package/libtirpc/libtirpc.hash
@@ -1,5 +1,5 @@
 # From sourceforge's info on download page:
-sha1  63c800f81f823254d2706637bab551dec176b99b  libtirpc-1.3.4.tar.bz2
+sha1  f5b209b2a7f3ffcdcff5b5b54fefc6a90ddec0d3  libtirpc-1.3.5.tar.bz2
 # Locally computed
-sha256  1e0b0c7231c5fa122e06c0609a76723664d068b0dba3b8219b63e6340b347860  libtirpc-1.3.4.tar.bz2
+sha256  9b31370e5a38d3391bf37edfa22498e28fe2142467ae6be7a17c9068ec0bf12f  libtirpc-1.3.5.tar.bz2
 sha256  17cf6098f95bdbb269f0bbc68e76c88fe20487ca7ec53f454923ab4256ecd2e7  COPYING
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 04196f2f7c..1020c512a0 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTIRPC_VERSION = 1.3.4
+LIBTIRPC_VERSION = 1.3.5
 LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3-Clause
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
