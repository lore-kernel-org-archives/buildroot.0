Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA39CD4F3D
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 19:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BA6A418A0;
	Wed, 20 May 2026 19:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JjSA3QUVQW1j; Wed, 20 May 2026 19:33:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B8AC418A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779305619;
	bh=+r5odmz6Li0lBLPzCEj9XkD9vQ5AjYk0ZqDtq6N/Ww8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=fdlXk+lDy8vjiV+KxeSA/EV2IXcI+e0U3tkog1OzXxDhD34j8PM1zF9HveKGMrqCN
	 0CPfQhul5Y5S2Vg+QR5Xz+qfIGLiQGBpZ0GadakxqJZo9kI7st5EXG/pitncvg2K7n
	 1Vl8iKauSX2VpXwOCWRCEr+c/d4jRxU9KdxffxnQ0UZte5ywPM6h2usc2XanyA6+73
	 nmMar4Hqw6j4OtfXoBx8ilZmjPw7tPGNrYg4OkNQIn/5F81h5LkHIA5wYYHV+h43zK
	 ZCsenjiyoEKEL198scmA40fybLzB7RYcTdzd3cWtA0RKC3jJezU13/8kgm9e17Qd6X
	 doEk+U5Ppc8UA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B8AC418A2;
	Wed, 20 May 2026 19:33:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 56F8B265
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4929883EB4
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEgTz_D5fe9M for <buildroot@buildroot.org>;
 Wed, 20 May 2026 19:33:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 77E3B83EBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77E3B83EBB
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77E3B83EBB
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:33:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 75497B97C531; Wed, 20 May 2026 21:33:33 +0200 (CEST)
Message-ID: <c7204e1d-3d75-4738-90a5-0a7663d1d8ae@rnout.be>
Date: Wed, 20 May 2026 21:33:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260520180023.338276-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260520180023.338276-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779305613; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=pWQiZTYU34rF9qZppwA05d5AuaQwSU8xqFuXE0Xcn5A=;
 b=SEsX8DzdF1dXnqJIHyhJ9CEuvErOnk1Kd9qfJj124e96ZOf7FHRLHzvvdui01f56Pby03f
 oB1Fu9hSJqKXT0CrkDiI46fWb5+nkCFSLq2A6QsecnmvSaMTKFVdvsu1MFkaZhtx5RQdJ7
 C1uZ7HjO0rGmbeIu7goBE1DbdZSTcWPDi3EOPH4HD4xhJDMbH1qUEGlVJiJ7ALrD1HB+n+
 hOoKDwSNxgzcKmFRGyP8DHa+7SILaoSeVn12fRBL66Yy3MDUJwuMBBvIAqKubxUV6dhf2w
 tSoDxyVgoDbQMpEK5wo/Ik3BhoOq4VOApqddN92Acw2eg+Mb3AWm4FyoR0fBZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=SEsX8Dzd
Subject: Re: [Buildroot] [PATCH v2 1/3] package/libheif: security bump
 version to 1.22.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/05/2026 20:00, Bernd Kuhls wrote:
> https://github.com/strukturag/libheif/releases/tag/v1.22.0
> 
> Fixes the following CVEs/advisories:
> 
> CVE-2026-32738 (GHSA-7f2h-cmpf-v9ww) : Heap OOB Read / SEGV Crash via Zero samples_per_chunk in stsc
> CVE-2026-32739 (GHSA-j9g7-q9hv-gq8c) : Infinite Loop DoS in stts Sample Duration Lookup
> CVE-2026-32740 (GHSA-frfr-f3vg-2g6j) : Heap-Buffer-Overflow Write in Grid Tile Chroma Compositing
> CVE-2026-32741 (GHSA-j3w5-7whq-p37q) : heap buffer overflow in decode_mask_image()
> CVE-2026-32814 (GHSA-4m8r-34pg-rvwc) : Uninitialized Heap Memory Information Leak via Failed Grid Tiles
> CVE-2026-32882 (GHSA-hg7q-rjr2-8x46) : Heap Buffer OOB Read in overlay compositing due to wrong alpha stride
> CVE-2026-41069 (GHSA-p82x-fpmv-576r) : Out-of-bounds vector access leading to invalid dereference
> CVE-2026-41071 (GHSA-xj92-xjff-h8w3) : Heap buffer over-read in SampleAuxInfoReader via crafted HEIF sequence file with mismatched saiz sample count
> CVE-2026-47178 (GHSA-5x55-x5pf-9c6g) : Heap Out Of Bounds Write in unci subsystem
> CVE-2026-47247 (GHSA-2vh6-whr3-cmq3) : Heap Information Disclosure via Grid Image Gap + Uninitialized Pixel Plane Allocation
> CVE-2026-47251 (GHSA-p6q9-fhf2-vj9v) : Incomplete fix for CVE-2026-3949: integer overflow bypass in vvdec_push_data2
> CVE-2026-47254 (GHSA-wqjg-4x9g-6cvg) : Heap Buffer Overflow in Track::get_next_sample_raw_data() -- OOB Chunk Vector Access
> CVE-2026-47709 (GHSA-4h72-vqgp-9376) : NULL pointer dereference in heif_image_handle_get_image_tiling for malformed unci image missing ispe
> CVE-2026-47714 (GHSA-h4wm-6wwf-qvhx) : Integer overflow in inline mask size calculation causes undersized buffer allocation
> CVE TBD (GHSA-6x5f-qchq-cxqv) : heap OOB read in ImageItem_Grid::decode_grid_tile via irot-induced tile-coordinate underflow
> (GHSA-95jx-g5vf-cpp8) : Integer Overflow in SampleAuxInfoReader Offset Calculation
> (GHSA-p4r6-6972-g26m) : Incorrect byte-count initialization in BitstreamRange constructor allows container-boundary check bypass
> (GHSA-jh2w-m72q-q595) : Out-of-bounds read and assertion-based DoS in EXIF parsing (find_exif_tag / read32) with short EXIF TIFF payload
> (GHSA-9h96-c44j-jpq9) : Heap buffer overflow via uint32_t stride overflow in image plane allocation
> 
> Added upstream commit to fix build error with imagemagick which would
> be introduced by this bump.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied all 3 to master, thanks.

  Regards,
  Arnout

> ---
> v2: added imagemagick fix
> 
>   ...eif_properties.h-fix-bad_pixels-type.patch | 28 +++++++++++++++++++
>   package/libheif/libheif.hash                  |  4 +--
>   package/libheif/libheif.mk                    |  2 +-
>   3 files changed, 31 insertions(+), 3 deletions(-)
>   create mode 100644 package/libheif/0001-heif_properties.h-fix-bad_pixels-type.patch
> 
> diff --git a/package/libheif/0001-heif_properties.h-fix-bad_pixels-type.patch b/package/libheif/0001-heif_properties.h-fix-bad_pixels-type.patch
> new file mode 100644
> index 0000000000..69c5d170fe
> --- /dev/null
> +++ b/package/libheif/0001-heif_properties.h-fix-bad_pixels-type.patch
> @@ -0,0 +1,28 @@
> +From ef124f9988e57a06ad6d102c236d2bb4b82aef5d Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?=C8=98tefan=20Talpalaru?= <stefantalpalaru@yahoo.com>
> +Date: Wed, 20 May 2026 00:37:24 +0200
> +Subject: [PATCH] heif_properties.h: fix "bad_pixels" type
> +
> +Upstream: https://github.com/strukturag/libheif/commit/ef124f9988e57a06ad6d102c236d2bb4b82aef5d
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + libheif/api/libheif/heif_properties.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libheif/api/libheif/heif_properties.h b/libheif/api/libheif/heif_properties.h
> +index 9432bd46..0dec3a37 100644
> +--- a/libheif/api/libheif/heif_properties.h
> ++++ b/libheif/api/libheif/heif_properties.h
> +@@ -335,7 +335,7 @@ heif_error heif_image_add_sensor_bad_pixels_map(heif_image*,
> +                                                  uint32_t num_bad_columns,
> +                                                  const uint32_t* bad_columns,
> +                                                  uint32_t num_bad_pixels,
> +-                                                 const heif_bad_pixel* bad_pixels);
> ++                                                 const struct heif_bad_pixel* bad_pixels);
> +
> + // Returns the number of sensor bad pixels maps on this image (0 if none).
> + LIBHEIF_API
> +--
> +2.47.3
> +
> diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
> index 0daabcb5dc..b88784b309 100644
> --- a/package/libheif/libheif.hash
> +++ b/package/libheif/libheif.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/strukturag/libheif/releases/tag/v1.21.2
> -sha256  75f530b7154bc93e7ecf846edfc0416bf5f490612de8c45983c36385aa742b42  libheif-1.21.2.tar.gz
> +# From https://github.com/strukturag/libheif/releases/tag/v1.22.0
> +sha256  8bd20cfa3201997b8f63266cddfabea2e1481467d7f992e6a2595e0bec691fc2  libheif-1.22.0.tar.gz
>   # Locally computed:
>   sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
> diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
> index 77435dda5c..e47620b167 100644
> --- a/package/libheif/libheif.mk
> +++ b/package/libheif/libheif.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBHEIF_VERSION = 1.21.2
> +LIBHEIF_VERSION = 1.22.0
>   LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
>   LIBHEIF_LICENSE = LGPL-3.0+
>   LIBHEIF_LICENSE_FILES = COPYING

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
