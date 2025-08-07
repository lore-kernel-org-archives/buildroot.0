Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86440C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B29B80D5A;
	Thu,  7 Aug 2025 18:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3yDcxC4Xsd4; Thu,  7 Aug 2025 18:23:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28A5A80D17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28A5A80D17;
	Thu,  7 Aug 2025 18:23:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CC1E10A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E96040543
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbeFKcZY9Uxi for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:23:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7410540525
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7410540525
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7410540525
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:52 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b78294a233so1050576f8f.3
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591030; x=1755195830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fz05PFGH+7tOGrNEB1lEAK2rmxv7kGh94O6XilVUKbM=;
 b=d0871CE7LhO7XhXDLKmjV+jprG+l3pOCvdcB8bwi7+oFrMvFgq1KyFz8ypThSWs9cK
 0UZ70fAkDYIAH3e/tOuQpdfjZhsgXaEbf/gnud7lkSOMaQKnfFX2Ml4SIcVwsOhNfkqd
 zNpKGpqyjWgyob2HnZqNwCGC/7/Fb6SeiB1EnbKu59UU4DnFdilAOHclcMhUrjmZfxLS
 oGFevyD2Lql5KYGoAwplDi+PIiPEHX+MIbwoRmm3o6uPthvwtsOz8ZPZK13ORaBJss8D
 je45S3pto3y/lv3/4mjPXTLisIPaoP5zorpTR4pr7+8oXckFNXK+xo9FXsQJpiH3bBIM
 dbVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzQvnaVYFBp5D+vvBVAxmZY8VvI9vcm38my+dmddttrHkOPs2J0/p4wOA6J0Lyq3qsnFl4BuzQmsA=@buildroot.org
X-Gm-Message-State: AOJu0YySqJNhZmJmPo0Hftupr5zImctwS4Yqy//rlfjXAMwvPwN0Ei1u
 SL7wbZfjIyYzGIsqRMZ6+33PYU3Q1551yy2BD5rZbR5XcU7AzDeAV5Jpz+wEJtMMng1B3NV5hWV
 dEnCR
X-Gm-Gg: ASbGncvwrIPdDBWh2Te68W/65/dVSUHGMczfH7q7rkCh4gXBRWQWKk5fz5hkshOhgKz
 b5/oWdnuAeFYV2hgAWo1MLZA2PesdYU7cZ/LHz4nMqgrzaRGgKe5LcGtYL4v0tThLkigolhZUV0
 EEyYH8anKG+WtZXvqEoHlyvDhoRSTHnn0reI6/Ni9bLYRYtAjBmrBWZzSqJqzflLDfX6t5fngfH
 dKxvs5fbCufi8ni+9a8PYrhWeIPHsjrGp/N4vMTgwqyGXPBcsO54BG0MN3EHlwZUMgtkXBV4kNs
 rfR+Tt2dveoEnrPnPwNJCdcRBvg9GT/+dDifhzEa/oiTTCZFmttSdPnSWrdJJ43KTWsLCi1sDR+
 8n9jD/AMADokBPOMtpvIQ42MA
X-Google-Smtp-Source: AGHT+IF1rzr3UeH6eJ4AxFSycYSN5jegjEvVmAhoBn2cKVPoRb15IBAdRej1+WJujgxgbf/1Ckw7kQ==
X-Received: by 2002:a05:6000:402a:b0:3b8:ffd1:80d2 with SMTP id
 ffacd0b85a97d-3b900b4d494mr212674f8f.24.1754591030440; 
 Thu, 07 Aug 2025 11:23:50 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5885eb8sm104554105e9.29.2025.08.07.11.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:23:50 -0700 (PDT)
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:23:49 +0200
Message-ID: <20250807182349.723574-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250606212851.15883-1-kadambini.nema@gmail.com>
References: <20250606212851.15883-1-kadambini.nema@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591030; x=1755195830; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fz05PFGH+7tOGrNEB1lEAK2rmxv7kGh94O6XilVUKbM=;
 b=NP//7IPBlyqb9BN2F/y8AaY224sD4INe4YESO/62xpwJZ4EwkB1r96JhKHK9XcZkRi
 YQlSS0VuH9TpsV77FnmX7GbPHzUy6tcG4dz/o89gHUn55oQLNkuS8vHocpFgRJ50+G8F
 G+3MsxF3fdc7YGKxhjC/oFgcpVqMwY4Nm8eY4pvK6zFnSJ8PdNavWSHmVCl389rUqanL
 9S0UfwKkx/WWb+E0q6HdmeYRhnbs1mgWWgJJ6yyDC9nG1zaG7M1ByUVLmGxozJOrPzA+
 c6E91Tv+t/g1CRVGu4hIM97rD96frfRbkLldhGlitw9XojDSHTnFCe6UxDCnwxfhO3Bl
 T0Aw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NP//7IPB
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc: update to 13.4.0
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
> Release announcement:
> https://gcc.gnu.org/pipermail/gcc-announce/2025/000187.html
> 
> Changelog:
> https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=13.4
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  .../0001-disable-split-stack-for-non-thread-builds.patch      | 0
>  .../0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch          | 0
>  .../0003-Remove-crypt-and-crypt_r-interceptors.patch          | 0
>  package/gcc/Config.in.host                                    | 2 +-
>  package/gcc/gcc.hash                                          | 4 ++--
>  5 files changed, 3 insertions(+), 3 deletions(-)
>  rename package/gcc/{13.3.0 => 13.4.0}/0001-disable-split-stack-for-non-thread-builds.patch (100%)
>  rename package/gcc/{13.3.0 => 13.4.0}/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch (100%)
>  rename package/gcc/{13.3.0 => 13.4.0}/0003-Remove-crypt-and-crypt_r-interceptors.patch (100%)
> 
> diff --git a/package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch
> similarity index 100%
> rename from package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch
> rename to package/gcc/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch
> diff --git a/package/gcc/13.3.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch b/package/gcc/13.4.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
> similarity index 100%
> rename from package/gcc/13.3.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
> rename to package/gcc/13.4.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
> diff --git a/package/gcc/13.3.0/0003-Remove-crypt-and-crypt_r-interceptors.patch b/package/gcc/13.4.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
> similarity index 100%
> rename from package/gcc/13.3.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
> rename to package/gcc/13.4.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 496ead1e6a..83176684a1 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -71,7 +71,7 @@ config BR2_GCC_SUPPORTS_DLANG
>  config BR2_GCC_VERSION
>  	string
>  	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
> -	default "13.3.0"    if BR2_GCC_VERSION_13_X
> +	default "13.4.0"    if BR2_GCC_VERSION_13_X
>  	default "14.2.0"    if BR2_GCC_VERSION_14_X
>  	default "15.1.0"    if BR2_GCC_VERSION_15_X
>  	default "arc-2023.09-release" if BR2_GCC_VERSION_ARC
> diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
> index 00da7dd49b..76699a7b0f 100644
> --- a/package/gcc/gcc.hash
> +++ b/package/gcc/gcc.hash
> @@ -1,7 +1,7 @@
>  # From https://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
>  sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
> -# From https://gcc.gnu.org/pub/gcc/releases/gcc-13.3.0/sha512.sum
> -sha512  ed5f2f4c6ed2c796fcf2c93707159e9dbd3ddb1ba063d549804dd68cdabbb6d550985ae1c8465ae9a336cfe29274a6eb0f42e21924360574ebd8e5d5c7c9a801  gcc-13.3.0.tar.xz
> +# From https://gcc.gnu.org/pub/gcc/releases/gcc-13.4.0/sha512.sum
> +sha512  9b4b83ecf51ef355b868608b8d257b2fa435c06d2719cb86657a7c2c2a0828ff4ce04e9bac1055bbcad8ed5b4da524cafaef654785e23a50233d95d89201e35f  gcc-13.4.0.tar.xz
>  # From https://gcc.gnu.org/pub/gcc/releases/gcc-14.2.0/sha512.sum
>  sha512  932bdef0cda94bacedf452ab17f103c0cb511ff2cec55e9112fc0328cbf1d803b42595728ea7b200e0a057c03e85626f937012e49a7515bc5dd256b2bf4bc396  gcc-14.2.0.tar.xz
>  # From https://gcc.gnu.org/pub/gcc/releases/gcc-15.1.0/sha512.sum
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
