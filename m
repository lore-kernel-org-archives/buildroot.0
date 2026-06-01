Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D37CD6E60
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 20:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A559405B7;
	Mon,  1 Jun 2026 20:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LrXN5S1er40n; Mon,  1 Jun 2026 20:48:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7109640A6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780346880;
	bh=1P5M8l9LEs08UNFKsa4i2Z9T/UipJ7Hi1l1QS+OzKrM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o4o84dSdgB1e9lToqrsIWD7RkHTh46sie/7j2qyh8L1OlEwvMe6C8RgLGqJeqtDOt
	 gtaDET2K/pOK0GzLDxUgS/eDTSPFmQ3ZsYtkXb2vQOwMv4/6Qa/DgFIfEh5xx6JRWC
	 e85EEBWcXnWH4lLkaYVpehNZBIYPAOHBYkEJOz1Ic8bqCLIM4FZzPLkcHMJKLpkEEm
	 KxRunWldpjqS4MNHxpkKf0DMSPfMtcr9uoddSAA9Fa5cnDplMrDKaQOw7FJkecj8TH
	 XAl/HI0ZD0ESgSiyWeAU/GeeZZc9PBewnp6Ejuv9XbcFrbysOKfIa8sUt/7jk6KAPR
	 +gHdU9v0sNcGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7109640A6B;
	Mon,  1 Jun 2026 20:48:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 64776223
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55EB540A6B
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxX8xe_ev4Pz for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 20:47:58 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2AE60405B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AE60405B7
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2AE60405B7
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:47:58 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-39697a4e16cso6851751fa.3
 for <buildroot@buildroot.org>; Mon, 01 Jun 2026 13:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780346876; x=1780951676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1B1MhGZp4rYcS3vZw8smQ+a8Xmkb0Ls5qjHUbYDR8n4=;
 b=fmekIv6UzcGGsmx0Co8InVfadKhl1tFRAzj/QiovDe9+LKs65nO/3XYcNlQJzxHfeX
 HWV2lyWUnQq6LZnnzFkqY7CY3PHlz4gyNbnlJ4aIXJnq54Oh8ShYweiLuGrgFxyUH77j
 ztfMavujKigw62iKEElucfwu+vurouQ1NxC38vWqZ9Bxaisr5Kdxe+WOfp8oBXKUqD/b
 +tThhwdAICwiygBX4YQRijgLKVptkg+N53B28PXkHyGWamYeNesND8KAsCmqhKMgscIp
 EvVV2mrCYXv8fS0PGa21elrPv/DSfVS+yuSRhDbZC0DOxo73AhAjrQ28xc0kz7hIk17G
 Ql6A==
X-Gm-Message-State: AOJu0YzvkDjbbycuREPpdck3cMRlFR2Q54j70ZwYCuFmWiFWdJsdrg1O
 gLkqRikSTb+USD7xO8Hj1urEDllqQXPEt+jyworzxQZAQKrPrnwUhQF+nn5e85tha/56d3MVPv4
 RwQW3NxJEAg==
X-Gm-Gg: Acq92OFexLJQgXmwqTCFFG6YMk4ao5gie3su5F0kBL86cITD5fqyHH2ZzSuuVJdaIoC
 no3yE96ua2zC8M3YF8BqJYwLO8qZnDdzcEGzEGBnzh/4odBe+lOA16+Ju6K7WMJmeCG0WwGey9V
 y6OWZYR5Zj678LD039JD+Zb8TU6ZMfErddzCzBi6uzuMPucp8wU2hcmNdh8QRUcMqHCFpjwZmi4
 PRrKPP7drnU0Mipe6B7vpoCsTli+KHwJ1zEk9kVP2FsIrR8mm6O1aAuFd268KUNsFNjLY9540o5
 kQBDTdt9fdBdIH9i2aRk3UCmd9NRjQVdZ/WpwbTD2MGF9A/8LSE7zY6L0UpF0zSd13jwr5S1d9w
 iOe8fNU9YsqAXzXqmbykikxHZgA5UZpOs3rhpuBRODfFllAn3STnF560LuhNHRiBjPwBWqh4G2X
 DS05Ie39APYz5bQaqOmZ0gs8g7ED/qs3DaR7U8QwEJPxNGBfiujec+kYfD6b6elQ==
X-Received: by 2002:a05:651c:154d:b0:396:7a05:6eb0 with SMTP id
 38308e7fff4ca-3967a057d48mr24545851fa.2.1780346875901; 
 Mon, 01 Jun 2026 13:47:55 -0700 (PDT)
Received: from localhost (78-71-152-124-no2360.tbcn.telia.com. [78.71.152.124])
 by smtp.gmail.com with UTF8SMTPSA id
 38308e7fff4ca-39659c93943sm25531311fa.17.2026.06.01.13.47.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2026 13:47:54 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: John Ernberg <john.ernberg@actia.se>, John Ernberg <j@j-ernberg.se>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon,  1 Jun 2026 22:47:31 +0200
Message-ID: <20260601204735.888967-6-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601204735.888967-1-j@j-ernberg.se>
References: <20260601204735.888967-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1780346876; x=1780951676;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1B1MhGZp4rYcS3vZw8smQ+a8Xmkb0Ls5qjHUbYDR8n4=;
 b=vwytSZw562GP/Qp5h+A9CkPgMd2dC5h60IFLPr0qTsy4soDSxSbzEENDitrZ7R+/vn
 jt48pq/On3Ae7gTDPH5+qYu1EBl0NPxjHwin928Iker5NZQ/h2L2TrXj3Q8mrs04y41f
 bLB7kLsZx7xFG9BMDSRUcpjzchmpMs3lf6xCLYimGkTsbweXZGzV8JWKT5U8jIEYZ7Ic
 Ks1BfOiL+ZNt6git5rHzplO7tf2rf7Yw5gvImsLOqDiQXchVJLUS/GuI7s30vFMG+J78
 w4RLyy8K39YT9wYMhaD4qWAvifaoa4pGjV6Ky9cTpbeGUMvAYLt3g5AYgn2AlrLPqUaV
 RH0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=vwytSZw5
Subject: [Buildroot] [RFC PATCH 5/9] package/libcamera-apps: Only enable EGL
 if both epoxy and xlib_libX11 are selected
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

Since release 0.2 of the rpicam-apps these dependencies have been required
if enable_egl=True is given to meson. [1]

The dependency check was broken since commit 3fac163b9315
("package/libcamera-apps: bump to version 1.1.0") in early 2023.

Link: https://github.com/raspberrypi/rpicam-apps/commit/c8351a09174f143424884081a69b6dd8018f4ba3#diff-a2468a39040f9f883e5b03e1523dd4e73fd43ad9ea87f600772477b890cdd655L18-R22
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>

---

RFC: I can't figure out if this is the correct way to do this kind of check.
---
 package/libcamera-apps/libcamera-apps.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index df7be41496..eea6e98c00 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -36,10 +36,8 @@ else
 LIBCAMERA_APPS_CONF_OPTS += -Denable_libav=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_XORG7),y)
-LIBCAMERA_APPS_DEPENDENCIES += \
-	$(if $(BR2_PACKAGE_LIBEPOXY),libepoxy) \
-	$(if $(BR2_PACKAGE_XLIB_LIBX11),xlib_libX11)
+ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_LIBEPOXY)$(BR2_PACKAGE_XLIB_LIBX11),yyy)
+LIBCAMERA_APPS_DEPENDENCIES += libepoxy xlib_libX11
 LIBCAMERA_APPS_CONF_OPTS += -Denable_egl=enabled
 else
 LIBCAMERA_APPS_CONF_OPTS += -Denable_egl=disabled
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
