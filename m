Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B236E7716F
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 21:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2989822B9;
	Wed,  4 Dec 2024 21:48:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4cy250MPwLIq; Wed,  4 Dec 2024 21:48:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A798283FBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A798283FBF;
	Wed,  4 Dec 2024 21:48:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E8CC1DD9
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8476A4064A
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cVzioQLrR0Xr for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 21:48:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 53651403FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53651403FF
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53651403FF
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:48:16 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-434a742481aso2352485e9.3
 for <buildroot@buildroot.org>; Wed, 04 Dec 2024 13:48:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733348894; x=1733953694;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vrr6Ob3Nmt0BeSjJZzxciQC2xY6cX25uOOaDqbmz/A4=;
 b=dYiTVmA9FMXpyTxd02W+oWTf8TFHMFScbKE+KAqO9u4Ki36S0leRKcZxJ+zT30G+ys
 RmlVd98CKFgqxi2zh3DdAMYs1iIBOr6d0JE2Ty+SGw+aSstWckonF9EzVVb/MuMTKsKS
 IxhaFfgGtDGG0pY5MmFlPMwmMy7M2GVBBLJqqK9IKL0dJySxA8CdY0k+GXR2AGQxcrkL
 SarpjI7xvwziw3Vglzn7ZYG97dt0sml9a91lUFz8f0LVsAhIEzp9y53BB6C6F9PEo1Sj
 Zpbf5jM+0wUWbttWPAanWr8jJbRQns5UKxbIh+rfrQYpg1abw1oOsdCz5HEq9HNEOKgz
 nrfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDd8IWGuv2ePXPBLaioOVYGRBs9IHl+QxmyRXYN4JYuGG1CUaijxkTYpCyWfeB5bxjeRhs72VAvXA=@buildroot.org
X-Gm-Message-State: AOJu0YzY20fA2xGzx5eLH0E/anwYiaHJvIE84daudRUbxak9FOwXI3ZB
 pGy+OG/IGa9TthdWbxg/Kf/fp2Wl1nOioL1WIvXG9VrGdI/wk9tP1JEVnSXQLP92vo6bmPKnbgT
 A
X-Gm-Gg: ASbGncsbyXvEk/vWT/DSBUnnl1Y/o1q/LTKdjJYAcDzhd7M/uRSCkudonrJx22lqC3E
 Q29WODTe42O8QyOKoPPgXuCjmYN58vep2rvsa4F88nLVa5RToh9GJXny5X7qCya/Br7opiT6nlC
 t3vzJmdl5G8nay/zdUzYTZqnraGqHprtG5P6ZGA7E0zxdcsyZogHqgEPyNKYXJljDcjCFsHAgwO
 wsHajhHs78tqkVdPQDO1UELZz4TPesIXpLX0BDrxiuwBuRAtFB/x7f05Ku0YtzJ/Pn2Ih024Vf7
 bxT8QzVGM+C2BZ4CxpRDf275oRJsFtEp7tptpjdGoGv+ztAHwdoX+fN8c9Bde0wYktUg5ypxZps
 x3qXx
X-Google-Smtp-Source: AGHT+IGaYp+lbltoNTPh6tRe7wdUUjcxjkKnONIj0yEikYLd9INzO1Kgpg4/fCsjwCce3cz5wsCYpA==
X-Received: by 2002:a05:600c:4452:b0:42f:823d:dde9 with SMTP id
 5b1f17b1804b1-434d0a03db2mr57647885e9.21.1733348894114; 
 Wed, 04 Dec 2024 13:48:14 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434da11387dsm405635e9.30.2024.12.04.13.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 13:48:13 -0800 (PST)
Message-ID: <43db1477-708a-44fb-8cf9-ef418d376045@mind.be>
Date: Wed, 4 Dec 2024 22:48:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20241204204806.159596-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB
In-Reply-To: <20241204204806.159596-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1733348894; x=1733953694; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vrr6Ob3Nmt0BeSjJZzxciQC2xY6cX25uOOaDqbmz/A4=;
 b=R6UfFJkKsZAiHvzQgwfDR5ZHynZYNOWcUjoH0RunVMxwvqHOQODA6tOFZ5Mx/21s+/
 nKo7aia0qBmnn7fOC/LboqmJifzH13iT9zcJF4zI6D3Q6T+u81U41eIUfrwK6za5eOMd
 BVhx1m2vS4hRpQ5EiYab5LOgHl0NYh9sFKOw6d3kx35iicm1Ya/RyD2GIfxDPkGdgjiJ
 UiwO6voMbUJHMY38KPfpqB66LLvhHi1yppZrLfth4hLu+p9iGGCdqrIXP0MPM6QKctl0
 9wWovRwSimkIDNWAYAxbN2GUikfmehVzAqbK67brypO1oYHsCzV3YZnNO4/Wwf7muI6T
 bhYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=R6UfFJkK
Subject: Re: [Buildroot] [PATCH 0/3] Fix two android-tools build issues
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/12/2024 21:47, Thomas Petazzoni via buildroot wrote:
> Hello,
> 
> The android-tools has been causing failures in the autobuilders pretty
> much every day for the past few months, so it was about time to fix
> those issues.
> 
> This patch series fixes the two most prominent issues:
> 
> - An issue related to u64 definition on powerpc64/mips64, which has
>    been occurring in the autobuilders since at least Feb 2021. This
>    patch should be backported to 2024.02.x.
> 
> - An issue related to GCC 14.x. Since the support of GCC 14.x is not
>    in 2024.02.x, this second fix is not strictly needed in 2024.02.x,
>    but also shouldn't be harmful.
> 
> A preparation patch converting the existing patch stack to be
> applicable with "git am" is proposed, as it was needed to preserve my
> sanity while working on the patch series.
> 
> Thomas Petazzoni (3):
>    package/android-tools: convert all patches to Git-formatted patches
>    package/android-tools: fix build issue on mips64 and powerpc64
>    package/android-tools: fix b64_pton() issue with GCC >= 14.x

  Series applied to master,thanks. Though I don't like the "we're too far from 
upstream" part too much :-)

  Regards,
  Arnout

> 
>   .checkpackageignore                           |  9 +-
>   ...-Fix-makefiles-for-out-of-tree-build.patch |  7 +-
>   ...0002-Fix-adbd-for-non-Ubuntu-systems.patch |  9 +-
>   ...0003-Adjust-base64-function-handling.patch | 96 +++++++++++++++++++
>   .../0003-Fix-build-issue-with-uclibc.patch    | 36 -------
>   .../0004-Fix-build-issue-with-musl.patch      | 25 +++--
>   ...efiles-use-pkgconf-to-get-libs-deps.patch} | 47 +++++----
>   ...006-Fix-build-on-big-endian-systems.patch} | 20 +++-
>   ...clude-cdefs.h-wherever-it-is-needed.patch} | 18 ++--
>   ...smacros.h-to-compile-with-glibc-2.28.patch | 42 --------
>   ...minor-major-build-failure-due-to-gli.patch | 59 ++++++++++++
>   ...les-for-out-of-tree-ext4_utils-build.patch |  4 +-
>   ...atch-for-openssl-1.1.0-compatibility.patch |  4 +-
>   ...stboot.c-reorder-functions-to-avoid-.patch |  4 +-
>   ...parse_read.c-add-missing-output_file.patch |  4 +-
>   ...s-make_ext4fs_main.c-disable-Android.patch |  4 +-
>   ...014-core-adbd-adb.c-open-code-capset.patch |  4 +-
>   ...b.c-include-correct-header-for-prctl.patch |  4 +-
>   ...s-make_ext4fs.c-define-__SANE_USERSP.patch | 68 +++++++++++++
>   19 files changed, 320 insertions(+), 144 deletions(-)
>   create mode 100644 package/android-tools/0003-Adjust-base64-function-handling.patch
>   delete mode 100644 package/android-tools/0003-Fix-build-issue-with-uclibc.patch
>   rename package/android-tools/{0005-Use-pkgconf-to-get-libs-deps.patch => 0005-makefiles-use-pkgconf-to-get-libs-deps.patch} (57%)
>   rename package/android-tools/{0006-fix-big-endian-build.patch => 0006-Fix-build-on-big-endian-systems.patch} (75%)
>   rename package/android-tools/{0007-include-cdefs-h-when-needed.patch => 0007-Include-cdefs.h-wherever-it-is-needed.patch} (71%)
>   delete mode 100644 package/android-tools/0008-Include-sysmacros.h-to-compile-with-glibc-2.28.patch
>   create mode 100644 package/android-tools/0008-usb_linux.c-fix-minor-major-build-failure-due-to-gli.patch
>   create mode 100644 package/android-tools/0016-extras-ext4_utils-make_ext4fs.c-define-__SANE_USERSP.patch
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
