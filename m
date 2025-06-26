Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4EAC7EE30
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 776EA6130B;
	Thu, 26 Jun 2025 19:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUcmTfXGv_jf; Thu, 26 Jun 2025 19:54:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F2A46136C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F2A46136C;
	Thu, 26 Jun 2025 19:54:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 40F3F154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04B8641991
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f4slZAM6OqmN for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:54:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F29C4406FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F29C4406FA
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F29C4406FA
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:54:04 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a575a988f9so797679f8f.0
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967642; x=1751572442;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P/1alMeaDgq0B24nAS7r6UYI9Qm7GIYxrJdjqP+wCQU=;
 b=vdkYU3zFCrQw0QRGjR5Pyx17ydYwu54d1MUfEtLO+m1WNj+rAnUNEq64K1OVrzffJ3
 Qa2OUh9isBDw417Q4DFzQH3jN8YJz42QpSdTyQNN/PoOSKm5tnu90XE5BKbRaDGSZ1mm
 TSLzsoPD5v/lJLW8bM/0xlRncbhQHLz4i/3x2XZB6+q6AF0XicT1Tj9KKp0lr+0P8wHl
 zzH6o3C33ByVwdaM+bLNBCFOsKD2bEJhy/6e9x7yM0fNFDVSEorfi1TelWLXxvj9ePpI
 CuLKiOUBiRWP7+INm4kh1tjFPSFCmfuyqc3+UuKGBwjjeqtA4L6tpJiZ/ZQkcsD0/g81
 V1+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNDLFbIbPOBInsw8lb0+p+zcKHPwKhFVc1K8U6gp+WIAlP/+x0y1UWLgbFPRjPFYZSMPpeaz2TsMs=@buildroot.org
X-Gm-Message-State: AOJu0Yx/bYr6DW5CO8c6NLDGdL7PSaYuhwKnHorFuZtxC95ocN6g6s1P
 5VIDQn93JT+m13digNslTFE/7H0J6dQpyRQZBtBfnRfwIysz298rIenUzUtnL0IpWt4=
X-Gm-Gg: ASbGncuHDFzdYYjKKcZ1mkk1Ty67/EU2AXxOEfyXDTvo5+tHCF3fk9/iyuGnouVkDT/
 jQT2dz4RF4kigyeZjQOWZ4gto/DNgWdc/MTeaWYjQb0YbH9IAlWrwki6xPYd8q+FbTTIPQWPg5P
 F8MZR0UuLDMO9f7iZwkZzvlIvbGLyLwue36fdM3M2f/RSWPb9IoA892hmKhE6GL5xGYd9qCfqXn
 t0FaoKZlvrUksLF1Q70MKVo9p/Cb2oyqO0LHcFrVFe1iVQASjhEM8AKVOnYx0ViLcS7DMkbvgS2
 etsgwN+/xxQd+SAI5IWbqPlfdDnQo5TJvNN1s8qVvSe1aAY4zgv/ZbDe8PNtlMpMK/h0n9FZrM5
 ynQ8O4/4Z/1OC1UxKG0ddL3rzfnIZU7Gb
X-Google-Smtp-Source: AGHT+IH5ZYVyDesIyJR68USafJlgaf0mPCk2jQzxMlPLZ7mpsLqQoT9vTko9/M7k0kMdsyAH9cnQdg==
X-Received: by 2002:a05:6000:2d05:b0:3a4:e841:b236 with SMTP id
 ffacd0b85a97d-3a8ffcc9dbcmr500063f8f.33.1750967642501; 
 Thu, 26 Jun 2025 12:54:02 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e599bdsm696166f8f.84.2025.06.26.12.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:54:02 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:53:53 +0200
Message-ID: <20250626195353.15471-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617092107.417361-1-fiona.klute@gmx.de>
References: <20250617092107.417361-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967642; x=1751572442; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P/1alMeaDgq0B24nAS7r6UYI9Qm7GIYxrJdjqP+wCQU=;
 b=aH++NlQxOdJ2PrzTSsQrStiwCS/JV+KmZAjw5OY17QtkwMq/Lx+Oi+EPtRdULuYoPZ
 welzSfz6Bhw4mVko2wRR6rYLvtv5BfZruTIfx5fNZ9+qIsncnAMHnpphFgKt5VCbUyNm
 8TEr4njTVLZRDE8+GLAQhkQk2Gc2SCRS2s+FFo1puQTvaMho44rApEWgz6CFPr4iJJ+S
 1/dptOjAJS1dvzKlpToeuSssLmTPHvOhEEcgUTkhpT/SBLvCP4mNDRyeumkvruLWE10K
 sGS4dFE5T9uYo6Gf7XsLxRxWuKyhw2arMBNY7RUMMU5vF0DCbkj826nvskMH8juR2Xy+
 8z8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aH++NlQx
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: security bump version
 to 2.84.3
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
> Fixes CVE-2025-6052, see [1] (backport of "gstring: Fix overflow check
> when expanding the string" [2] to the stable 2.84 series).
> 
> [1] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4656
> [2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4655
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Applied to 2025.05.x. Thanks

> ---
>  package/libglib2/libglib2.hash | 4 ++--
>  package/libglib2/libglib2.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
> index bfa74f7505..9ed0b204ee 100644
> --- a/package/libglib2/libglib2.hash
> +++ b/package/libglib2/libglib2.hash
> @@ -1,4 +1,4 @@
> -# https://download.gnome.org/sources/glib/2.84/glib-2.84.2.sha256sum
> -sha256  88e960dd937057407d61fcb3b45a860704b25923c37ae2478b85f2ecb5a4021f  glib-2.84.2.tar.xz
> +# https://download.gnome.org/sources/glib/2.84/glib-2.84.3.sha256sum
> +sha256  aa4f87c3225bf57ca85f320888f7484901a17934ca37023c3bd8435a72db863e  glib-2.84.3.tar.xz
>  # License files, locally calculated
>  sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index 05f6ac0c20..7eda9742c1 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBGLIB2_VERSION_MAJOR = 2.84
> -LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
> +LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
>  LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
>  LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
>  LIBGLIB2_LICENSE = LGPL-2.1+
> -- 
> 2.49.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
