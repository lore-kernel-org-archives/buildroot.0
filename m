Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2A3C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 17:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEAB24034B;
	Mon, 15 Jul 2024 17:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MI4cJISWvbRV; Mon, 15 Jul 2024 17:48:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ED1240542
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8ED1240542;
	Mon, 15 Jul 2024 17:48:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 665361BF408
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 17:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 604D740243
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 17:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYKx4k17-pec for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 17:48:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A6E9640205
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6E9640205
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6E9640205
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 17:48:40 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4277a5ed48bso33727335e9.2
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:48:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721065719; x=1721670519;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uBCDXtN38b6tehihjHb7YFnewPEVvgOx/LlRuMUSM8A=;
 b=ZUG1yp+wFoWqhfP/OCfy9z4cXZ/KRB7inntvyagB5vhj9v3ujypddNHv4rcyNrqTeG
 OV0FL7rcXRmW2A58tzKvf1SoJswfG+U6UlAtkyLjQkvFGLkBkCIfLeMCRdtfH8J7p5fk
 SbhQQQsqj6gSmLxHsG1jezxkH0urwStGZkR2+wtSLWGMVcQ56NX3pSMuuIfBXtErNKFU
 rRb2KicSYybSnHxV8Z7M2mbQ0xhwfl8VWSVJpWmk/xCL0ESgv49A5CcjKYpSQaxjI1Ky
 FXhzXZnnykXkswLTVZfLSJlbjp51frPmJT2CVb+4DmAZi28PzC8RGwpzz0d/G9o4ckfc
 WCrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXURAeTATn/0vBl+8K+Ade6rLiPrQk1fodk0zfjWbKVT2J2afYBjAdLPftgI7xVA0UE3mS7HtaQI7bp5P883IX3JqENEGbqrQ==
X-Gm-Message-State: AOJu0YyP9TGAKY6DDI/djHZIxsqWdQzNTdp9+jF5TzKa/sJa44C8QqVw
 O3jsjouABZbKtbjdLgq/Vl3ZELBy9HkIk9AfW2rdE4A0ErcsknHx6NqSUQIwbEk=
X-Google-Smtp-Source: AGHT+IG6/UnXCiu+8a4xATTG7ReBtjSt4wjERN9HqL9bolKaqyjBBzdSYZ42QC7R0MsqPa0EvObytg==
X-Received: by 2002:a5d:69c3:0:b0:367:9b8b:ca42 with SMTP id
 ffacd0b85a97d-3682408d619mr275852f8f.26.1721065718914; 
 Mon, 15 Jul 2024 10:48:38 -0700 (PDT)
Received: from [10.10.1.22] ([89.207.175.13]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dab3e71sm7007914f8f.12.2024.07.15.10.48.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 10:48:38 -0700 (PDT)
Message-ID: <6c8d181d-a540-4f60-8b9c-30e508fcd2a3@mind.be>
Date: Mon, 15 Jul 2024 19:48:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: carrier.nicolas0@gmail.com, buildroot@buildroot.org
References: <20230117110440.3405234-1-carrier.nicolas0@gmail.com>
Content-Language: en-GB
In-Reply-To: <20230117110440.3405234-1-carrier.nicolas0@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721065719; x=1721670519; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uBCDXtN38b6tehihjHb7YFnewPEVvgOx/LlRuMUSM8A=;
 b=I1WMMKSdFQ8/bHgrhyj1wxxC3OopmVqhWqYcj7v/p7zmVZTUZznn6jdpWxYxy7L6O1
 IHTujfpGmu20/ed143Jb2IQxKeBCh07LtaOL46K+krmVUH2THoyXXoc8TZVMA98in7W6
 WhLKwICkodXtol8KGCkJas4JujDOAVDkO55VT83fT1eme+0vhh83pIu4laiyaCS+GV/Q
 l1eJCUk/VATA+fVLuHVTjacBT4yPiLa/GpTZQRuv9SKlZ5rzItK8zwv3vqcwY00PFS6U
 y0kDS6bDQ9Ovb0Bs7DxMF8PImM8cdMd7/C2yc5Eu3Q/sXitl87141dfWrqJYJjlXosTU
 DP/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=I1WMMKSd
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: local and
 override support in legal-info
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Nicolas,

On 17/01/2023 12:04, carrier.nicolas0@gmail.com wrote:
> From: Nicolas Carrier <carrier.nicolas0@gmail.com>
> 
> Sources of packages which are using the 'local' _METHOD_SITE or
> which declare an _OVERRIDE_SRC_DIR are not archived when generating
> the legal-info target.
> This is problematic since those packages are the most likely to
> require being published, because it's highly probable that their
> sources have been modified.
> 
> This patch generates a tar.gz archive on the fly, containing the
> result of the rsync of the package's source directory, using the
> same arguments as during the preparation of a build.
> Note that is not possible to archive the builddir, since it may
> contain artifacts of previous compilations.
> 
> It is not possible to consider rsync as a "normal" download method
> either (which would have solved the initial problem), because if we
> do that:
>   * the DL dir's content would be altered improperly
>   * the rsync + tar gz overhead would be paid on compilation and is
>     significant, for example, for a linux kernel
>   * a hash file would be necessary, which would be a burden to
>     maintain, for sources frequently modified
> 
> Signed-off-by: Nicolas Carrier <carrier.nicolas0@gmail.com>

  I finally applied to master, with a number of changes still:

      - Drop the auxiliary variables: their use is contained within one code
        block and it's easier to read with being explicit.
      - Put it in an additional subdirectory .legal-info-rsync of the build
        directory, to reduce the chance of conflict with an existing
        file/directory.
      - Archive the directory (e.g. linux-custom) rather than its contents,
        so that it matches a normal tarball.
      - Use the mk_tar_gz function from download helpers to create a
        reproducible tarball.
      - Split long lines.

  There isn't actually much left of the original patch :-)
  See [0] for all the gory details.

  I hope this helps you!

  Regards,
  Arnout

[0] 
https://gitlab.com/buildroot.org/buildroot/-/commit/aacca7f0639bac6bb3fb262d0b1738c4387edeb0


> ---
>   package/pkg-generic.mk | 23 ++++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 2f8ba39edf..a8760f40d4 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -660,6 +660,12 @@ $$(error $(1) has local site method, but `$(2)_SITE` is not defined)
>   endif
>   endif
>   
> +# for legal-info sources archival
> +ifneq ($$($(2)_OVERRIDE_SRCDIR),)
> +$(2)_OVERRIDE_RSYNC_DIR = $$($(2)_BUILDDIR)/$$($(2)_BASENAME_RAW)
> +$(2)_OVERRIDE_RSYNC_ARCHIVE = $$($(2)_OVERRIDE_RSYNC_DIR).tar.gz
> +endif
> +
>   ifndef $(2)_LICENSE
>    ifdef $(3)_LICENSE
>     $(2)_LICENSE = $$($(3)_LICENSE)
> @@ -1146,13 +1152,16 @@ else
>   endif # license files
>   
>   ifeq ($$($(2)_REDISTRIBUTE),YES)
> -ifeq ($$($(2)_SITE_METHOD),local)
> -# Packages without a tarball: don't save and warn
> -	@$$(call legal-warning-nosource,$$($(2)_RAWNAME),local)
> -
> -else ifneq ($$($(2)_OVERRIDE_SRCDIR),)
> -	@$$(call legal-warning-nosource,$$($(2)_RAWNAME),override)
> -
> +ifneq ($$($(2)_OVERRIDE_SRCDIR),)
> +# Packages without a tarball: create one on the fly
> +	@echo "Package is of type local or override, archive sources"
> +	$$(Q)rm -rf $$($(2)_OVERRIDE_RSYNC_DIR) $$($(2)_OVERRIDE_RSYNC_ARCHIVE)
> +	$$(Q)rsync -au --chmod=u=rwX,go=rX $$(RSYNC_VCS_EXCLUSIONS) $(call qstrip,$$($(2)_OVERRIDE_SRCDIR))/ $$($(2)_OVERRIDE_RSYNC_DIR)/
> +	$$(Q)tar -zcf $$($(2)_OVERRIDE_RSYNC_ARCHIVE) -C $$($(2)_OVERRIDE_RSYNC_DIR) $$$$(ls -A $$($(2)_OVERRIDE_RSYNC_DIR)/)
> +	$$(Q)rm -rf $$($(2)_OVERRIDE_RSYNC_DIR)
> +	$$(Q)support/scripts/hardlink-or-copy \
> +			$$($(2)_OVERRIDE_RSYNC_ARCHIVE) \
> +			$$($(2)_REDIST_SOURCES_DIR)$$(sep)
>   else
>   # Other packages
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
