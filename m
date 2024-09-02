Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0F7CD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 20:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBE754030B;
	Mon,  2 Sep 2024 20:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZiTQJ30vLAn; Mon,  2 Sep 2024 20:40:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8955D40327
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8955D40327;
	Mon,  2 Sep 2024 20:40:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DAFEE1BF426
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6DDA80BF7
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3dIZlbDh_SWf for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 20:40:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85BC580B91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85BC580B91
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85BC580B91
 for <buildroot@busybox.net>; Mon,  2 Sep 2024 20:40:02 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-374c1963cb6so1343862f8f.3
 for <buildroot@busybox.net>; Mon, 02 Sep 2024 13:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725309600; x=1725914400;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8L+ArwKlBmTQGgU0+t1nBNi2adN2JJjUb2DJ1hWIBdI=;
 b=MxAhhUgDz5zZ50zWKjpbVycCy2KTuBGhQrg2WyQITI1LXU/kkiug8AQ5G/K+Le7Xu1
 Pv54v4o67hdwbMj14KZ1h+kd3k0vNny/4Z3EIYu16UITGQLZ/Df8PKavFsdjOp/jeSMi
 YR4vGxFwsTXA6nLWlQEijrJR8ffZjMK6rFz85Hw7Na6X8kGroa9aT6XCSywG6e04JQRl
 1mBYeznbFALLfsz8BjHIj5HUOyeFCN3g33pbHEcXPjJJqgLwke1uGIK2d4f6HKLqhAhV
 +aaCQmhB3lTShSzka1pQrn+AY5LePg0DIiqcHwtchtu+eKaZgkqylbL7IVY3rLcxAM/7
 BlGA==
X-Gm-Message-State: AOJu0YxUHtmldNqPw3FiC2rfhyeExLPXDMMiRanuRdODDucno1TDRjyc
 32hY1DzFcuvW1FcnjflJ50sU+LNTXbxg3M5kvWmWNGdYHA0xlH9MVsiEhFgyhuecU9VP/Erp/6r
 WaA==
X-Google-Smtp-Source: AGHT+IGf0U0JkJ43YKqXE4NC95MqUaSheRFK+NVawVrymCbR1/Jb6Mc29tyt1MQwQ2IKrF5TWRZo2g==
X-Received: by 2002:a5d:5d86:0:b0:374:b9a1:28f with SMTP id
 ffacd0b85a97d-374b9a10360mr5649563f8f.43.1725309600036; 
 Mon, 02 Sep 2024 13:40:00 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b61494bcsm9382690f8f.95.2024.09.02.13.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 13:39:59 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  2 Sep 2024 22:39:57 +0200
Message-ID: <20240902203957.2650291-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725309600; x=1725914400; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8L+ArwKlBmTQGgU0+t1nBNi2adN2JJjUb2DJ1hWIBdI=;
 b=BvRaZXLBaKvjwk85/vGZF9IGzhST6SiV5pIFk9FSd1KX2344W8VZTpR7ekSsBU6hOB
 sWwCh/Ydh746uFBkBoMnN9SZW0Py8tNpPTOHreKhMKg0LAs9BuXC1xodBMyB2vkRfAa5
 pfVqNtAvzgm/tePVtACAiAbDdkuhWzWpGuzZ7lXPTSjHvhiMZm43N9olq9ry6utjagMU
 UoFMaIjGn0Vqqp4zpj/neQgnku1HGA7jIYxtLL7PEwg7NAscK/yccKpH7FGtbP/mFayE
 ZGZn8fJWPI7jCFd31rIJ9ogGRuRWm/PRmuKsKyF8dS/NVUO3gIHPtHpQIDYgOd1Yz5Gh
 hy4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=BvRaZXLB
Subject: [Buildroot] [PATCH] package/slirp: bump to version 4.8.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/slirp/slirp.hash | 2 +-
 package/slirp/slirp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/slirp/slirp.hash b/package/slirp/slirp.hash
index 3f7abdee5..930e6aca5 100644
--- a/package/slirp/slirp.hash
+++ b/package/slirp/slirp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  358ce8b6ea59ec9deac937cc754f0115b992839e7b0cddf30ffb8f77dc21da82  libslirp-v4.7.0.tar.bz2
+sha256  1c2e3d30e41a055ed41f9d0b3234d0d143bc28f5ad84bb101413f830844df757  libslirp-v4.8.0.tar.bz2
 sha256  b28aecf4796a6a22054167f0a976de13d9db335669d37afd2dc7ea4c335e1e13  COPYRIGHT
diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index 2ad71f13d..6d44df8d7 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SLIRP_VERSION = 4.7.0
+SLIRP_VERSION = 4.8.0
 SLIRP_SOURCE = libslirp-v$(SLIRP_VERSION).tar.bz2
 SLIRP_SITE = https://gitlab.freedesktop.org/slirp/libslirp/-/archive/v$(SLIRP_VERSION)
 SLIRP_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
