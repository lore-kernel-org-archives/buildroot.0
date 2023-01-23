Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82509C05027
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 08:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B82E4414C8;
	Mon, 23 Jan 2023 08:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B82E4414C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uy2pRsi_zCzA; Mon, 23 Jan 2023 08:34:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 998A3410B5;
	Mon, 23 Jan 2023 08:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 998A3410B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F4B51BF369
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 08:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A6EB414C3
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 08:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A6EB414C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id otWs3FmNW86C for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 08:34:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23C34410A8
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23C34410A8
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 08:34:32 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id mg12so28434267ejc.5
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 00:34:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fg8GhbV8NXHdVuaxXTLW8lZ4CslQlVWjQqLzRqXPWyU=;
 b=obc+nIu+9t6ByoNJ2xLL+XuiyrGx+6JFa5prFkn+Nh0fWVfoi9kJZmqNJ48dUxe6va
 xrVlSilBarJiiC319Xrc0uTOD42kfOat6IfgggSqzwu+NCkvb2FdlzVUB3laYe9pyXUv
 VNtG70N4NP50wy1eIkTRT1v0D+ZQKUKHaXEQh3ijA59XQgZ9V49oHCS/THC+5IhOj6R3
 eT+mRBVGfxPep+1cPbLLdkxQ2YgZc9kTzefzLP0QLhN6awmc7NI+VQ/xVO+kyuqvAyTj
 beEzLa4Y1ACbLHXKOk9xrB9dzA4zfjBvceLbYOysu7AZvJjJGY6xBQdAzfRQDaNa2kZF
 Siwg==
X-Gm-Message-State: AFqh2kqG8gDom5GuJcg8SG2xMKtF/lN4pOmNGcxlqecj4JIPsOpQpRF3
 bFFBjiUhbsXs5pGkQjozJNPwL8EUFaobfg==
X-Google-Smtp-Source: AMrXdXtesAUCKdhwtouhik+6TBEuBm2owpH6mvk4HC/+uEIb59AdthSBJpxfBSWFygtdULht3TY4LA==
X-Received: by 2002:a17:906:4557:b0:872:325b:6035 with SMTP id
 s23-20020a170906455700b00872325b6035mr21913236ejq.34.1674462869864; 
 Mon, 23 Jan 2023 00:34:29 -0800 (PST)
Received: from localhost.localdomain (82-209-154-112.cust.bredband2.com.
 [82.209.154.112]) by smtp.gmail.com with ESMTPSA id
 t1-20020a1709061be100b0086f40238403sm11986212ejg.223.2023.01.23.00.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 00:34:29 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Jan 2023 09:35:06 +0100
Message-Id: <20230123083508.3041367-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fg8GhbV8NXHdVuaxXTLW8lZ4CslQlVWjQqLzRqXPWyU=;
 b=LeLaoj8ZLwnspdLiPM54CON2Z3Cmv1FfPE6eUTD4n/Q4Fmk9hC/3RFz1JYgRJqcI94
 g4dTM5g7LGnB95I2Q7JdNoA2xmTOsC7mFgcoGZB41vVaGBR6I5MxBHQx/2Wp6P3bR96y
 NrqqDnoeXo0w46hr58zh5y8UehcBEx3yREiElpxNnbDwwlMbqiVc2A2p0oxoIQjUkhde
 BFhzkOwmwMVdyDl7T2GElY7NJIqfD01mpXuLBjoZB8OOtI3A7RKdx/uzaOdSholakgoJ
 h78t0YAcDcV/XZfTvJN74WQVXLn9kX7UAjwLytTi/CDVoACOf4QgL47TIO/LDTDflyuq
 9VOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LeLaoj8Z
Subject: [Buildroot] [PATCH 1/3] package/libcamera: bump to version 0.0.3
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

At the same time, change site to github in order to fetch the release
bundles.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 68c9c1f005..13f6c4d907 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  59318208a9c1b183cacaf5a7175568d8a9fa094f2dd8c9794269bb6e9636986e  libcamera-ba6435930f08e802cffc688d90f156a8959a0f86-br1.tar.gz
+sha256  af85008f4e8bf1dc70aba4e5612513371b016788cf3c83343cf2d02483bc64ec  libcamera-0.0.3.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 9c03d3a3b3..d00f076cea 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = ba6435930f08e802cffc688d90f156a8959a0f86
-LIBCAMERA_SITE_METHOD = git
+LIBCAMERA_VERSION = 0.0.3
+LIBCAMERA_SOURCE = libcamera-$(LIBCAMERA_VERSION).tar.gz
+LIBCAMERA_SITE = $(call github,kbingham,libcamera,v$(LIBCAMERA_VERSION))
+
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
 	host-pkgconf \
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
