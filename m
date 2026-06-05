Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6C0CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2382D6114A;
	Fri,  5 Jun 2026 12:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V2KZ6n_Wxnbb; Fri,  5 Jun 2026 12:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27E0F61154
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663851;
	bh=Bs2rB+sOylosw6lm52iHHq5j8ELx0x3XnNsF2BuGoxk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V068roKPpCt1e9jK0Ku55QUdP3k92dlaKx5txvLZ/cjrgVCKGTHk03TOCdKwPoenl
	 lBSZJZn1Zb+oSnQS4L0EE26mK7fIGQjM62vj9FfXMlwuxY/4aWa4tRWG9FYeDcRHgB
	 XO4dVw3cYN0nugAn0P2+960UMBJzdWgdhlri+fa1fXKt90WzY5BTdW25SPHdnHm5g/
	 Jp1hLcaaZY6V1FXbWDfawlHgz9F9pXOvOE7wDdvRr2pBUzAF3D3O1Zsh3VOqHgld4d
	 ukd4BHLTlTuQY5ztSMHP7I+8re/RfXV1mg+OL14z7EWa5ORnz/+tLv0almVfso6zmn
	 KuNYhhZiiO4Eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27E0F61154;
	Fri,  5 Jun 2026 12:50:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40260388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 216CF61154
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lw5Uv9SePdDf for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A101161128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A101161128
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A101161128
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:45 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-490bc6a7958so18212145e9.1
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663844; x=1781268644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YjdDnpFd30gTuT46O4v+w6quhj5FlOk6mO1zMtGzxt8=;
 b=cvZNLbH9JCm9Ubiuhmixn/ArZ9g4t8VxXwnjAKZbFdlJb0PnUmwuGZrx5+wzGVDE+t
 kp+plYhDGy51uDuvaophRxCwus+SOCCBF2/v78DftueeDUy5oKQyvzyfCif3nWlmk758
 k+LDwgs0dF/WEUABBPI6G5MYuysKp6RNI0F4gFQXExyJzCCfSojSbaiZYyGm2CH89JeC
 hE3Rtin7Xq4KfLdZFS2iVNq6l5mKKnhBt+BC1YNRgT3sYmVQ+K3jyelgNL7P22nu+Cjo
 bAVjKxMD7nbE9bTdczhn9/32SBtIzMrd7IQVsbErybEoNSX6zva6dCiwLKKv8D60cW5W
 QF3A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8znPdTFSq2fWOAfTH3GSH2J1MpRHKQqwKaceW7P5U/jtYSqnRujzV26EjdafmM1SOmkJ3LVY0GwNI=@buildroot.org
X-Gm-Message-State: AOJu0Yz7uTiDfvuI7Mb4EwZgg8TBSd9ne7RkvCndhqX2m6wBAx2VGvPP
 RMKSwM1aoOGk9AI/x2rwKXGVIWo51k9mt40e7NXg7BpPvHQxcUTU59d2yRkF0tT3N74=
X-Gm-Gg: Acq92OH2T7hSbSDcDIaj5vBfC/1h7mXwoSCX74cwradtIPz9iTG/ynSOM2P6tcRbgcH
 Fu7XiP54aMrRlcEyJ2rTJJhMEfHsICuerV5womE/P0knQOt744yXOqHalNfsvC1z7IAU85Gyuq+
 81nevZJ6BAcGCjCfwqzb378+o1R3qXRI21vKtnQD9LL8WzUhzGcOrulM/mVzohFZUa/R/VTQApP
 hR6dxSlv8w/cGlUi9aEvL41SHY4HMou/Z63sb+3ydwnJToOP0nlWEFORl4//FyDqmFWuH5MOaKn
 yIlKNSEcXftKZBhrObIcXLxJQJWbXKKk7va6nyWl1duLkCe45fk11ZdKRkGYZAaJytTabHuJLXJ
 YQ6Sz15lqhHwch2CqwAL5zASLXHFJMaIErSwfJ0ndeTPrFrmpMipsnFEglTX6g0bqYmelhPwCaY
 V5sAo3aOAnu62IsP3P/9xEmu02Yg==
X-Received: by 2002:a05:600c:314e:b0:490:bb60:68ca with SMTP id
 5b1f17b1804b1-490c2cba7b8mr34461775e9.3.1780663843698; 
 Fri, 05 Jun 2026 05:50:43 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3c183asm155608675e9.6.2026.06.05.05.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:43 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:42 +0200
Message-ID: <20260605125042.274211-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526200641.939539-3-bernd@kuhls.net>
References: <20260526200641.939539-3-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663844; x=1781268644; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YjdDnpFd30gTuT46O4v+w6quhj5FlOk6mO1zMtGzxt8=;
 b=OnlraMaP56q7JK8w2eAfWkyt574536UlTy8uuNbZBPGzjcYkBW+/zGE2utpxFMz6Ux
 dlhIsUfhC1O89N8DkZ5WGalvUDJYcdRnLn2WEIT3dtnkJMVupMNTqW01MvAjNIjRz6Be
 aoo6cBPouTPc/ThT2uj/AQNj/44yKpDa0XqPtumrA84TkW3T40RhAfsQ/hfZ1VvrqNYx
 /QbkMX6wH9/6lIQWB+hqxz91SQlNIdAbXb337gMDRqSSuYBCqG/2gNkkXXyb+4XRlklQ
 fpVW5WMs7iHSOFVweHPm7hX2TLx7vxdg2+Wv5/KljKn9a45cMl4Ya4H14kePupmlAGSn
 PL/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OnlraMaP
Subject: Re: [Buildroot] [PATCH 3/4] package/libheif: security bump version
 to 1.22.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://github.com/strukturag/libheif/releases/tag/v1.22.2
> "Fixes missing heif_image_get_bayer_pattern_size() function."
> 
> https://github.com/strukturag/libheif/releases/tag/v1.22.1
> "Security
> - CVE TBD (GHSA-r7qj-cg5r-r6vf) - Wrapped icef compressed-unit range
>  check causes out-of-bounds read in uncompressed HEIF decoder
>  - (GHSA-5hqq-636x-r3cr) - Out-of-bounds write in inline mask region API
>                            when source mask exceeds declared region"
> 
> Removed patch which is included in version 1.22.1.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> Series passed Gitlab pipeline:
> https://gitlab.com/bkuhls/buildroot/-/pipelines/2554360744
> 
>  ...eif_properties.h-fix-bad_pixels-type.patch | 28 -------------------
>  package/libheif/libheif.hash                  |  4 +--
>  package/libheif/libheif.mk                    |  2 +-
>  3 files changed, 3 insertions(+), 31 deletions(-)
>  delete mode 100644 package/libheif/0001-heif_properties.h-fix-bad_pixels-type.patch
> 
> diff --git a/package/libheif/0001-heif_properties.h-fix-bad_pixels-type.patch b/package/libheif/0001-heif_properties.h-fix-bad_pixels-type.patch
> deleted file mode 100644
> index 69c5d170fe..0000000000
> --- a/package/libheif/0001-heif_properties.h-fix-bad_pixels-type.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From ef124f9988e57a06ad6d102c236d2bb4b82aef5d Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?=C8=98tefan=20Talpalaru?= <stefantalpalaru@yahoo.com>
> -Date: Wed, 20 May 2026 00:37:24 +0200
> -Subject: [PATCH] heif_properties.h: fix "bad_pixels" type
> -
> -Upstream: https://github.com/strukturag/libheif/commit/ef124f9988e57a06ad6d102c236d2bb4b82aef5d
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - libheif/api/libheif/heif_properties.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libheif/api/libheif/heif_properties.h b/libheif/api/libheif/heif_properties.h
> -index 9432bd46..0dec3a37 100644
> ---- a/libheif/api/libheif/heif_properties.h
> -+++ b/libheif/api/libheif/heif_properties.h
> -@@ -335,7 +335,7 @@ heif_error heif_image_add_sensor_bad_pixels_map(heif_image*,
> -                                                  uint32_t num_bad_columns,
> -                                                  const uint32_t* bad_columns,
> -                                                  uint32_t num_bad_pixels,
> --                                                 const heif_bad_pixel* bad_pixels);
> -+                                                 const struct heif_bad_pixel* bad_pixels);
> - 
> - // Returns the number of sensor bad pixels maps on this image (0 if none).
> - LIBHEIF_API
> --- 
> -2.47.3
> -
> diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
> index b88784b309..22697f307c 100644
> --- a/package/libheif/libheif.hash
> +++ b/package/libheif/libheif.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/strukturag/libheif/releases/tag/v1.22.0
> -sha256  8bd20cfa3201997b8f63266cddfabea2e1481467d7f992e6a2595e0bec691fc2  libheif-1.22.0.tar.gz
> +# From https://github.com/strukturag/libheif/releases/tag/v1.22.2
> +sha256  eea48e4841f83fbe51d029337ffd2d14512d0203015dad40b90213d872958af3  libheif-1.22.2.tar.gz
>  # Locally computed:
>  sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
> diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
> index e47620b167..4b23f1fda3 100644
> --- a/package/libheif/libheif.mk
> +++ b/package/libheif/libheif.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBHEIF_VERSION = 1.22.0
> +LIBHEIF_VERSION = 1.22.2
>  LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
>  LIBHEIF_LICENSE = LGPL-3.0+
>  LIBHEIF_LICENSE_FILES = COPYING
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
