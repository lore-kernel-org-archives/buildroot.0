Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD06CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 14:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D74E140CE0;
	Fri, 15 May 2026 14:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VXXh7cffsb2r; Fri, 15 May 2026 14:33:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E169340CE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778855610;
	bh=KdLSdYCNQlZMSV/sASYU2OPSva3uBl42hmQMS7pHNtw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IqT1o3LOAmbGw4SzvWYlCstFhl98yaAt6L1LUh9saH4PZBk+noDsZAmFz8h27IdCw
	 VqGllIViafnbIkdHiHfU3YcdcbVFV3JDGHpIwW681sCoRLG/G21FgGmIfrEoozP/Vc
	 MTJCHPyWKLdeOy4M14xpcwoP1EO0727GdGT+6dhvddxUWJED58mGqHTx63Q5b8dfBl
	 hI458ZGxXhjGn+e6JzsVS3u9tI4x53rv1rQodGCE4/GGzdwhapj50LCNl1EMP+n0/+
	 CO2IIi1nhM8GVJbEzCw2pAy5dL5v+gm8yPgOv4PYDb/FacJnCYJnT7BbDGihSXW9DN
	 emnZhwuvntoaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E169340CE4;
	Fri, 15 May 2026 14:33:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 89A78E7
 for <buildroot@buildroot.org>; Fri, 15 May 2026 14:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A8E140E24
 for <buildroot@buildroot.org>; Fri, 15 May 2026 14:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77zYrQIDtU1H for <buildroot@buildroot.org>;
 Fri, 15 May 2026 14:33:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5677A40E70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5677A40E70
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5677A40E70
 for <buildroot@buildroot.org>; Fri, 15 May 2026 14:33:27 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-43d76dd4ee8so8589724f8f.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 07:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855605; x=1779460405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8FSBlxjPTDYILt9Tjk+hFZ9SQEahoLxfV3ylwvrmlNA=;
 b=Ij0zCSJm7a9wR0lxx0jHhCvM31KYguuggeX23+TiJmTuV7Kv8tHmXQFGs6WzaTtVft
 cNlYNci8enDaCz0oWysvbcd3X2Q5UKGbp9+kTCRBRjZdlf7XKU2KidboDFoIrgKZYcMY
 G7msEK3Vzup+QAov/82KMq6CRYZLcewXBkiNlas75DPwFnWckf9+sexSzkZ8Vh+I27rT
 Qtjf+qsnmlTSPHRs2tfbYp1GKWRWoRVlhXFuTUA0Mj+rl8lg+OKHEoWxrtA2Fjuy0iG3
 ttGGJVpJUIaDCagdZy3sxVyqgZKDPpErqpc1lGlh1Gz0hPrcEj89AhlFLDB5Cm+PCYtV
 Mh9Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+oyjvxGFzaLhm3JwBPLf3yUPSt/66Zg9OruBcHfgzZUiPXgcVPEKKXbFluEvCF43uRW3mKrvhdbg0=@buildroot.org
X-Gm-Message-State: AOJu0YzSXR+edPenCQjGVaMB570Fkz/rfKHYChMtqBlUuOJmXJKiqEV0
 hRQUz1ATh/hNWBpalhz8fv+ji88N0SibAYLnT9oaWZP2JJK9T79cH4wKUGhapRGQ6vA=
X-Gm-Gg: Acq92OHvcqzziNYjjZIJkH2V9l3xK9orxSvMMVvEZu0m/N6JWz1rrn+SRy4o0WP0qe5
 L4Nt3wQr0549F92WdgvlJ1dQQztb1VkFLEOQKRyl1ca6RKnAuSEg4veQm4BVw3TF2Rop+Yfnl+7
 yKe/qo6CgD7XjI7elfu67kaZDYw9d7svFGTyV/6IgokBwwOQFEHJA6CFgKutI3TxuKBYVEMjTeE
 Nz+BMHHQDLZAFUp44M8tT5eQjxpqqzUpby9r5Vv1rQX8rWVq1PFNSmLbd/09AefwWKFcv11A4x4
 S8JiA2afkkirzZTtSfdeAh86b5A/Nuhvnl1VkmbC65m82y+S1/KmC6LRRmIB03ooi/6aXhMUFCe
 C1qmrzx00naD4mfeCxvdKgDt3bh8igHDLtVJLf/8x/u+Q7QYZ5xj6BFXXSjBviRn/1EKA0OlUNg
 28YTSoWAWXVJK0u6UEanzvOtUFWhQSlaGOZOpCYeK/NGs5
X-Received: by 2002:a5d:588f:0:b0:43d:77e1:6a69 with SMTP id
 ffacd0b85a97d-45e5c5a4dbdmr5688163f8f.38.1778855605344; 
 Fri, 15 May 2026 07:33:25 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e767d0bsm13962927f8f.3.2026.05.15.07.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 07:33:25 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 16:33:24 +0200
Message-ID: <20260515143324.413499-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506101646.131940-1-buildroot@bubu1.eu>
References: <20260506101646.131940-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778855605; x=1779460405; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8FSBlxjPTDYILt9Tjk+hFZ9SQEahoLxfV3ylwvrmlNA=;
 b=S1sySNxMndY7SJy33RJAWpEZNcXTENSPAPiDI8eyf7jtE3T4wJlAuUAcDOnp6AkrsQ
 w58TxT5s6KkM9W4CyGsJKk0soWp1BIlkpm3Xd8L3f1OyAKQySfNHQViFhOi7MI2JZTy1
 YtHIgOufwytf39rysuhvJ9myDTUoA4GSHeeI+1Jhk1ZNGMYeyR6Yy48A9nrPKLcy/KsJ
 ecR31tXjsw/OHy1C4hqSKOcHoGC6NaxatmurGHkVEz/LBa/Q8kNW9KmJc72f7RIWsmRb
 QWqqNmHETjSjC+XzLGIad4fgNp9/TiGJiqj4xK9vD/mpMHhx+n7icuRz16mvcUoBlDff
 /tDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S1sySNxM
Subject: Re: [Buildroot] [PATCH 2025.02.x 1/2] package/gcc: bump 12.x series
 to 12.5
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
> Changes (linked from https://gcc.gnu.org/gcc-12/changes.html):
> https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=12.5
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.02.x. Thanks

> ---
>  .../0001-disable-split-stack-for-non-thread-builds.patch      | 0
>  ...02-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch | 0
>  .../0003-xtensa-add-.note.GNU-stack-section-on-linux.patch    | 0
>  .../0004-Remove-crypt-and-crypt_r-interceptors.patch          | 0
>  ...Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch | 0
>  ...libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch | 0
>  package/gcc/Config.in.host                                    | 2 +-
>  package/gcc/gcc.hash                                          | 4 ++--
>  8 files changed, 3 insertions(+), 3 deletions(-)
>  rename package/gcc/{12.4.0 => 12.5.0}/0001-disable-split-stack-for-non-thread-builds.patch (100%)
>  rename package/gcc/{12.4.0 => 12.5.0}/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch (100%)
>  rename package/gcc/{12.4.0 => 12.5.0}/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch (100%)
>  rename package/gcc/{12.4.0 => 12.5.0}/0004-Remove-crypt-and-crypt_r-interceptors.patch (100%)
>  rename package/gcc/{12.4.0 => 12.5.0}/0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch (100%)
>  rename package/gcc/{12.4.0 => 12.5.0}/0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch (100%)
> 
> diff --git a/package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/12.5.0/0001-disable-split-stack-for-non-thread-builds.patch
> similarity index 100%
> rename from package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch
> rename to package/gcc/12.5.0/0001-disable-split-stack-for-non-thread-builds.patch
> diff --git a/package/gcc/12.4.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch b/package/gcc/12.5.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
> similarity index 100%
> rename from package/gcc/12.4.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
> rename to package/gcc/12.5.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
> diff --git a/package/gcc/12.4.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch b/package/gcc/12.5.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch
> similarity index 100%
> rename from package/gcc/12.4.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch
> rename to package/gcc/12.5.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch
> diff --git a/package/gcc/12.4.0/0004-Remove-crypt-and-crypt_r-interceptors.patch b/package/gcc/12.5.0/0004-Remove-crypt-and-crypt_r-interceptors.patch
> similarity index 100%
> rename from package/gcc/12.4.0/0004-Remove-crypt-and-crypt_r-interceptors.patch
> rename to package/gcc/12.5.0/0004-Remove-crypt-and-crypt_r-interceptors.patch
> diff --git a/package/gcc/12.4.0/0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch b/package/gcc/12.5.0/0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
> similarity index 100%
> rename from package/gcc/12.4.0/0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
> rename to package/gcc/12.5.0/0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
> diff --git a/package/gcc/12.4.0/0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch b/package/gcc/12.5.0/0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
> similarity index 100%
> rename from package/gcc/12.4.0/0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
> rename to package/gcc/12.5.0/0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index bdf644f527..e6dc4a04ba 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -70,7 +70,7 @@ config BR2_GCC_SUPPORTS_DLANG
>  config BR2_GCC_VERSION
>  	string
>  	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
> -	default "12.4.0"    if BR2_GCC_VERSION_12_X
> +	default "12.5.0"    if BR2_GCC_VERSION_12_X
>  	default "13.4.0"    if BR2_GCC_VERSION_13_X
>  	default "14.3.0"    if BR2_GCC_VERSION_14_X
>  	default "arc-2023.09-release" if BR2_GCC_VERSION_ARC
> diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
> index 168c6643ce..720bf6595f 100644
> --- a/package/gcc/gcc.hash
> +++ b/package/gcc/gcc.hash
> @@ -1,7 +1,7 @@
>  # From https://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
>  sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
> -# From https://gcc.gnu.org/pub/gcc/releases/gcc-12.4.0/sha512.sum
> -sha512  5bd29402cad2deb5d9388d0236c7146414d77e5b8d5f1c6c941c7a1f47691c3389f08656d5f6e8e2d6717bf2c81f018d326f632fb468f42925b40bd217fc4853  gcc-12.4.0.tar.xz
> +# From https://gcc.gnu.org/pub/gcc/releases/gcc-12.5.0/sha512.sum
> +sha512  c76020e4c844b53485502cb8a4e295221c9d37487d66c9f4559031fb14c85de20602e6387310005386cb0ef25e55067d2cfef141423bb445f3b77e7456a23533  gcc-12.5.0.tar.xz
>  # From https://gcc.gnu.org/pub/gcc/releases/gcc-13.4.0/sha512.sum
>  sha512  9b4b83ecf51ef355b868608b8d257b2fa435c06d2719cb86657a7c2c2a0828ff4ce04e9bac1055bbcad8ed5b4da524cafaef654785e23a50233d95d89201e35f  gcc-13.4.0.tar.xz
>  # From https://gcc.gnu.org/pub/gcc/releases/gcc-14.3.0/sha512.sum
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
