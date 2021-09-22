Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67314C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:22:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2F2260FA0
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2F2260FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F14640121;
	Wed, 22 Sep 2021 19:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g0vn1bcSXrid; Wed, 22 Sep 2021 19:22:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F464405FC;
	Wed, 22 Sep 2021 19:22:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98A951BF321
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8806C414B2
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:22:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AMQcDy52Dhpj for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 19:22:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70F7841490
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 19:22:46 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id dj4so14190749edb.5
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 12:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ftf4/EDaj9K69tOeP6uqj4+/TMPposvBakqJwqUBdfc=;
 b=BV54q0vJZI5AZj5vp93DqyNCxi1kHoBubZLbt4QuhSps6a4OK0iJx+FjNl4/lpBptC
 u5JuVn2bHAe9/eR9upp0QlW2I9ar9VP3bItLZTy10XfdKrDVUl1Wp+MOLlZZ0aGpxNj/
 Wn/ZTBB+qoh+LkdfiNk4Rw3IjARigp2oUJkvPG1F/qudNMgsu8F20BdruoNthrm9bvUL
 7+8pLxWFRL/I+ec0LJjQh9iee9eAGlPiLO0cmV1u+ULcKOWErJ+wlBGMiC4qruFBtzne
 R+ipoB38azg2dRonOxuawfNH0pWFqKy5z3sgWDBJonH7HaHzhtJuEuhWVBM8rAEULNYm
 P2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ftf4/EDaj9K69tOeP6uqj4+/TMPposvBakqJwqUBdfc=;
 b=YBrCdu2nVgqDDeUokO3aOh9KTc8RxZrJer7diJsR/fR/S0eQ8OqZmSvjoEUx2B/Pai
 oGs0GHMLF3p+LnY1XEefkr/Wdrti7Qu6DEE1n2guTX5yJ3Mx9uLBZiEVh/ETnpE5+4VB
 64h6OndNTx8A8oYimWkhdJtSFP88RRa5SQEP0m/y3Exq9UCUVc40j+T6xeNGJm6v+eT+
 DjPMR/RLbV9zRMyBWcnkUwhg5OlqLUvrzEbnxeTvP9D6/ciEnvlyVfN/JnuezMY4m15i
 GOQ0WNW2VTFem0BP1CaUnryFj5y6BO25utY7xfS/1pwXo7unyqXfTuzXmIKCijfLclM3
 bssw==
X-Gm-Message-State: AOAM533qEIlISiLHr6mqsWW5CGDGDi6OrURHBzXh9Ht6IFuClwinUucq
 FeUiuE9F4BVguqJgT0sby0lZbv+KtCNmSA==
X-Google-Smtp-Source: ABdhPJxlVyiDS5B7MZ7+dtWOHyMn2LMqWgyIqz0XRYnaglW1r2Jbr0XzSorrX6cVOwpTv7cE0edYTw==
X-Received: by 2002:a50:8163:: with SMTP id 90mr1173767edc.198.1632338564497; 
 Wed, 22 Sep 2021 12:22:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k4sm1650253edq.92.2021.09.22.12.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 12:22:43 -0700 (PDT)
Message-ID: <b854f45d-6549-57b6-f51b-1eed760a6a69@mind.be>
Date: Wed, 22 Sep 2021 21:22:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20210922113110.1586-1-peter@korsgaard.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210922113110.1586-1-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/libsndfile: add security patch for
 CVE-2021-3246
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 22/09/2021 13:31, Peter Korsgaard wrote:
> A heap buffer overflow vulnerability in msadpcm_decode_block of libsndfile
> 1.0.30 allows attackers to execute arbitrary code via a crafted WAV file.
> 
> https://nvd.nist.gov/vuln/detail/CVE-2021-3246
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-ms_adpcm-Fix-and-extend-size-checks.patch | 40 +++++++++++++++++++
>   package/libsndfile/libsndfile.mk              |  3 ++
>   2 files changed, 43 insertions(+)
>   create mode 100644 package/libsndfile/0001-ms_adpcm-Fix-and-extend-size-checks.patch
> 
> diff --git a/package/libsndfile/0001-ms_adpcm-Fix-and-extend-size-checks.patch b/package/libsndfile/0001-ms_adpcm-Fix-and-extend-size-checks.patch
> new file mode 100644
> index 0000000000..edacbda01a
> --- /dev/null
> +++ b/package/libsndfile/0001-ms_adpcm-Fix-and-extend-size-checks.patch
> @@ -0,0 +1,40 @@
> +From deb669ee8be55a94565f6f8a6b60890c2e7c6f32 Mon Sep 17 00:00:00 2001
> +From: bobsayshilol <bobsayshilol@live.co.uk>
> +Date: Thu, 18 Feb 2021 21:52:09 +0000
> +Subject: [PATCH] ms_adpcm: Fix and extend size checks
> +
> +'blockalign' is the size of a block, and each block contains 7 samples
> +per channel as part of the preamble, so check against 'samplesperblock'
> +rather than 'blockalign'. Also add an additional check that the block
> +is big enough to hold the samples it claims to hold.
> +
> +https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=26803
> +Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> +---
> + src/ms_adpcm.c | 10 ++++++++--
> + 1 file changed, 8 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/ms_adpcm.c b/src/ms_adpcm.c
> +index 5e8f1a31..a21cb994 100644
> +--- a/src/ms_adpcm.c
> ++++ b/src/ms_adpcm.c
> +@@ -128,8 +128,14 @@ wavlike_msadpcm_init	(SF_PRIVATE *psf, int blockalign, int samplesperblock)
> + 	if (psf->file.mode == SFM_WRITE)
> + 		samplesperblock = 2 + 2 * (blockalign - 7 * psf->sf.channels) / psf->sf.channels ;
> +
> +-	if (blockalign < 7 * psf->sf.channels)
> +-	{	psf_log_printf (psf, "*** Error blockalign (%d) should be > %d.\n", blockalign, 7 * psf->sf.channels) ;
> ++	/* There's 7 samples per channel in the preamble of each block */
> ++	if (samplesperblock < 7 * psf->sf.channels)
> ++	{	psf_log_printf (psf, "*** Error samplesperblock (%d) should be >= %d.\n", samplesperblock, 7 * psf->sf.channels) ;
> ++		return SFE_INTERNAL ;
> ++		} ;
> ++
> ++	if (2 * blockalign < samplesperblock * psf->sf.channels)
> ++	{	psf_log_printf (psf, "*** Error blockalign (%d) should be >= %d.\n", blockalign, samplesperblock * psf->sf.channels / 2) ;
> + 		return SFE_INTERNAL ;
> + 		} ;
> +
> +--
> +2.20.1
> +
> diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
> index c955b9d088..ed9e8e3d14 100644
> --- a/package/libsndfile/libsndfile.mk
> +++ b/package/libsndfile/libsndfile.mk
> @@ -12,6 +12,9 @@ LIBSNDFILE_LICENSE = LGPL-2.1+
>   LIBSNDFILE_LICENSE_FILES = COPYING
>   LIBSNDFILE_CPE_ID_VENDOR = libsndfile_project
>   
> +# 0001-ms_adpcm-Fix-and-extend-size-checks.patch
> +LIBSNDFILE_IGNORE_CVES += CVE-2021-3246
> +
>   # disputed, https://github.com/erikd/libsndfile/issues/398
>   LIBSNDFILE_IGNORE_CVES += CVE-2018-13419
>   
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
