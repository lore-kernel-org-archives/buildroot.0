Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA0410ED64F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB70661357;
	Fri, 27 Mar 2026 10:02:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQi_TotcF-ha; Fri, 27 Mar 2026 10:02:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E447612D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605741;
	bh=Qu/ibXcK83s4OSiJ7EOU/lzCcepH9cqlo3XQCqxn2Lc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p5kA5VYk1MCOBsqLeefLDi464pISlYAcdSHlXyMDpeEg4sOE2wG88NuU9xJ0qk3t6
	 hhFZ4wnL47h+S9p0twoZ+GOMhw97CPlWkzqWCzQQdFcY0/hEPaGgbtIesnzCIkp+o/
	 /ANF5n0Nm2Cm6EQ9g23Ay2PEBj6Ms3WHkD/lumucFpnRZUeLYPinJYhlIjSvFjAEe5
	 9TX3SDLMublKsIueXI+1GhlXDnQzlROHCwXK7YHXRNup6WX64tK7sfpud9S0If1X/p
	 tF75BvkJLkdHl94Ga8vg5YE8KlKn6j3HirLOsMZIoPOWrhn03ZpQ/Oyx6UitBPZ71+
	 b/tszymOvPq9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E447612D4;
	Fri, 27 Mar 2026 10:02:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3C24249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D93AE416C3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SD9DO65Vdq04 for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:02:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18BD5416C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18BD5416C1
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18BD5416C1
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:17 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so17198465e9.0
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 03:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774605736; x=1775210536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FiaHOPzlmXEqEYHMOj6dI4yHqSR+dMp9yaopAXkhWJw=;
 b=PexJw0BK7Cb3nJL+95xoTNopMg44l6OOR2XQ1LiJ1kxtk9W35v5wk5a7XU8I2Js09j
 JOeILVR4zAVz0Rc6LNxxOs1eJAn+JWsLav/skVQm+L3jQiNMucnjMK/KTOlGm83Pno+G
 MpHhYzi5mwC970uvHHVh1aNDsHN3uAMwjeAfmRa5dgOuek+qFcAkRjA0PV5O/ev6G4ia
 mz6Q2nLPCLUAF74/PzB1TAuzgnOarK88usM75gG3mDk2GKiu4HLWq8LcWYTuduu95Bl7
 8XmAmw02uXgVQxOHqzHztm037B+g9md5qrdfwAKkSlCkb6ZfHaV+3Clbr3X/9kqsVi/2
 R2bQ==
X-Gm-Message-State: AOJu0YwbV0dBANbDT32mocNMvuSQ4EoV5meGjFTEdbB3BsnkOFIOX/56
 e4U1tW+/fTFJlxvx/zQgJRKCT8U3m5D1a24aCljhPuEIkdRRkQnJgY91PK7h5J3Gds8=
X-Gm-Gg: ATEYQzxxFSHUV2r/Ah5TG8u3XDXwtjPBX3ATpPdm3zlcjGIRtCyDCg5nXz+j1++5aNG
 JAJWEcxCEBvzeFvUvP9/zLj7Y5d89hP9LmP0fATjuQyx4AHVozYW4kkes5FjxwtaooVIgqaKOt4
 eAcUd8FEmd+fB8YwXVKqrFnDkAeqkTK5YbG8dM4VMVFSFM0Xxs2NAkNt0gvh7GuOkbaby99fbUW
 uuzae5VZMeX+4WGUk/SF2J0BfZVxLf43MGn8XbJMXZGVvX2NonwqDxUiVT7BMD/hBzbMfmI3f+9
 kNR6sCLapr1ROAzKEjoCQtnsQl8ZtrLkAM10Shew60FENdF/tkq3e0hj/ISfnVlV+cK/KH7cXVD
 UyJzqut2+oXdfXwNKKtg8p+VcmxTXzLQ142HUK1l6H6gCB8vkXn6tApHLzMAv3MgbIMT9Fx5jGU
 GbgsxqIWDfvmjUMZtW
X-Received: by 2002:a05:600c:8b2a:b0:485:3dfc:57c with SMTP id
 5b1f17b1804b1-48727f5fe97mr28401355e9.21.1774605735509; 
 Fri, 27 Mar 2026 03:02:15 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722c6b105sm155071185e9.1.2026.03.27.03.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 03:02:14 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 11:02:13 +0100
Message-ID: <20260327100214.45355-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316113716.208738-2-thomas.perale@mind.be>
References: <20260316113716.208738-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774605736; x=1775210536; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FiaHOPzlmXEqEYHMOj6dI4yHqSR+dMp9yaopAXkhWJw=;
 b=fKHyvSbKxA9D5xnJ0fzVur0LC9xfpk+Kiul15cnnQ6kjUXa4Iny//hg75jr3rqI/+T
 Tcprr8UMMxTfRxYkOXTtzhGQaJaCnwHNFS2csiLTGbGJs+GFLM6wwksFlFoq0niXY8mh
 us1joAZSIcyJ9IhDv9syv8vTZyJYrO3h38bP8UDtRzSGPXJCrxwSxvgGUBej+mGCaBU1
 5SDvMxDwO3iVxVhVLlBuquNmBXwB1PKzYcgC7uyR+366+zjWV7TsNg+em/RadRBagRw+
 +oHLgxtsWNa38ui1mLyDTnEPg1rBKyA94yrURSzsRKpnQAxgvOr+EcHHvwpXcc6H+isA
 yFUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fKHyvSbK
Subject: Re: [Buildroot] [2025.02.x,
 PATCH 2/3] package/libheif: patch CVE-2025-68431
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
> - CVE-2025-68431:
>     libheif is an HEIF and AVIF file format decoder and encoder. Prior to
>     version 1.21.0, a crafted HEIF that exercises the overlay image item
>     path triggers a heap buffer over-read in `HeifPixelImage::overlay()`.
>     The function computes a negative row length (likely from an unclipped
>     overlay rectangle or invalid offsets), which then underflows when
>     converted to `size_t` and is passed to `memcpy`, causing a very large
>     read past the end of the source plane and a crash. Version 1.21.0
>     contains a patch. As a workaround, avoid decoding images using `iovl`
>     overlay boxes.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-68431
>   - https://github.com/strukturag/libheif/commit/b8c12a7b70f46c9516711a988483bed377b78d46
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...x-wrong-copy-width-in-overlay-images.patch | 26 +++++++++++++++++++
>  package/libheif/libheif.mk                    |  3 +++
>  2 files changed, 29 insertions(+)
>  create mode 100644 package/libheif/0001-fix-wrong-copy-width-in-overlay-images.patch
> 
> diff --git a/package/libheif/0001-fix-wrong-copy-width-in-overlay-images.patch b/package/libheif/0001-fix-wrong-copy-width-in-overlay-images.patch
> new file mode 100644
> index 0000000000..4d845b2f90
> --- /dev/null
> +++ b/package/libheif/0001-fix-wrong-copy-width-in-overlay-images.patch
> @@ -0,0 +1,26 @@
> +From b8c12a7b70f46c9516711a988483bed377b78d46 Mon Sep 17 00:00:00 2001
> +From: Dirk Farin <dirk.farin@gmail.com>
> +Date: Tue, 11 Nov 2025 19:47:50 +0100
> +Subject: [PATCH] fix wrong copy width in overlay images (thanks to Aldo
> + Ristori for reporting this)
> +
> +CVE: CVE-2025-68431
> +Upstream: https://github.com/strukturag/libheif/commit/b8c12a7b70f46c9516711a988483bed377b78d46
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + libheif/pixelimage.cc | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libheif/pixelimage.cc b/libheif/pixelimage.cc
> +index f202c61049..84a8dd739e 100644
> +--- a/libheif/pixelimage.cc
> ++++ b/libheif/pixelimage.cc
> +@@ -1508,7 +1508,7 @@ Error HeifPixelImage::overlay(std::shared_ptr<HeifPixelImage>& overlay, int32_t
> +       if (!has_alpha) {
> +         memcpy(out_p + out_x0 + (out_y0 + y - in_y0) * out_stride,
> +                in_p + in_x0 + y * in_stride,
> +-               in_w - in_x0);
> ++               in_w);
> +       }
> +       else {
> +         for (uint32_t x = in_x0; x < in_w; x++) {
> diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
> index 8d91a109db..325502ad00 100644
> --- a/package/libheif/libheif.mk
> +++ b/package/libheif/libheif.mk
> @@ -23,6 +23,9 @@ LIBHEIF_CONF_OPTS = \
>  	-DWITH_REDUCED_VISIBILITY=ON \
>  	-DWITH_SvtEnc=OFF
>  
> +# 0001-fix-wrong-copy-width-in-overlay-images.patch
> +LIBHEIF_IGNORE_CVES += CVE-2025-68431
> +
>  ifeq ($(BR2_PACKAGE_DAV1D),y)
>  LIBHEIF_CONF_OPTS += -DWITH_DAV1D=ON
>  LIBHEIF_DEPENDENCIES += dav1d
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
