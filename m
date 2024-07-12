Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36532C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3FE580DDE;
	Fri, 12 Jul 2024 22:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HASC_Dotd3_A; Fri, 12 Jul 2024 22:19:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A2CC80DDF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A2CC80DDF;
	Fri, 12 Jul 2024 22:19:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D2781BF427
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AD8E60633
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DB4hZWG2Naqe for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:19:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7707F60621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7707F60621
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7707F60621
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:19:08 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3679e9bfb08so1408250f8f.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720822746; x=1721427546;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lHYiTh5of0XGHRmQQWn1vUpF76z+h86xRwy8RPE2eKM=;
 b=vbNIgv08qlpTW1aSKSOY0vXaBQp5spp+zHxkwFjuQJFWYHPvYsgjpkJwOP0q9IsHGG
 vFpbt87V9NdtdQhPxm2Y0+UAzLFcrKoQivnd9I+FZbN9I+rplYROSFtTi4HV5cwdwz8h
 Fkr57WjUpyHVwo+hJM1AVPJK9za0+LXdrS/IgVIUYd5f8711uJ5soZhbAQFwuyHr/XD6
 WASiT+y3VVGtrUyQoF/NZc4B+YS5v05xofUNNJSbLERf+QlCrXLaCV857fU1mlOoPXt9
 yxzNclGN8WBCFXW0hRnMR4K6Wf/Hg0PYBAPjV4f3/srsJxNu7y6/OdmdfNfrSG7fm2kd
 QmhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUai9PFue+BD4gNY/Q0Ypjsi7b/8VqrY8PuY7qf57zIcUA7/92/WLcWSwT8dTEZLB95jF54RQkgrZ4B/ijsG3KUriy8v/BVTg==
X-Gm-Message-State: AOJu0YwoF2jkf4OwdBYvf7C3LqFrMMuHdzGGSbfqtQrsWLOUcbZuRwPG
 JS753EUa3iA//BEOvMeeihn6pDTs9hHy1/NkCD5wXRzpkxCZuDXcBVjss9Orr/Nlu8W3yIfV839
 5B0U=
X-Google-Smtp-Source: AGHT+IEW1cL3F4BUAIG1arfXiLPN3CF7b1suYx3BEHQ3XjVZUumw04XVGuWBcCDbnlxpBO8RAG7eBg==
X-Received: by 2002:a5d:5544:0:b0:366:ee81:b87c with SMTP id
 ffacd0b85a97d-36804ea0594mr2390939f8f.15.1720822746571; 
 Fri, 12 Jul 2024 15:19:06 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dabf3bdsm4283f8f.30.2024.07.12.15.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 15:19:06 -0700 (PDT)
Message-ID: <bea9085f-d16d-40a8-8ccf-b3f86605cfcd@mind.be>
Date: Sat, 13 Jul 2024 00:19:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
References: <20231118181308.55690-1-brandon.maier@collins.com>
Content-Language: en-GB
In-Reply-To: <20231118181308.55690-1-brandon.maier@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720822746; x=1721427546; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lHYiTh5of0XGHRmQQWn1vUpF76z+h86xRwy8RPE2eKM=;
 b=e36pa9+tOJdeiex2+gmH7G70a09EpNVRtmcSoA2WV/5FtXrH/KBqfVcDMxhu7fn0fc
 CvaBV2C+A2jm9hg/03ZzpZXPhB41iHf9KM8yTlm53JRo7YySl01CW8EstVaubvOUEMHs
 a+TBSdy3BMcNcVC/ibVwtla0dIQebDpzaRu3pwxivYbhGAQ4oKHSbSN/fTd3LXj25GHV
 PKjN14ERCaSBi6C/wJVXFp7kShv+r0HFVOupSg8bMNe3Lr2R5K03F54nLDoYpA6XopNG
 u8s+FV1LR+iVCvqosVC1p4DY0lGvf83gjhwJlkWvkVT3eWhnkI8ivfqy9I0uhtHr+vhl
 6LGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e36pa9+t
Subject: Re: [Buildroot] [PATCH 1/1] package/Makefile.in: add PARALLEL_JOBS
 to post-build/post-image scripts
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/11/2023 19:13, Brandon Maier via buildroot wrote:
> Post-build, post-image, and other build scripts may run some commands in
> parallel, for example to parallelize xargs, Makefiles, etc. Export
> PARALLEL_JOBS to these scripts so they can enforce the same job limits
> that other Buildroot packages use.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   docs/manual/customize-post-image.adoc | 4 ++--
>   docs/manual/customize-rootfs.adoc     | 1 +
>   docs/manual/debugging-buildroot.adoc  | 1 +
>   package/Makefile.in                   | 3 ++-
>   4 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/manual/customize-post-image.adoc b/docs/manual/customize-post-image.adoc
> index 5308093d06..4197cf6710 100644
> --- a/docs/manual/customize-post-image.adoc
> +++ b/docs/manual/customize-post-image.adoc
> @@ -28,8 +28,8 @@ different sets of arguments to each script.
>   
>   Again just like for the post-build scripts, the scripts have access to
>   the environment variables +BR2_CONFIG+, +HOST_DIR+, +STAGING_DIR+,
> -+TARGET_DIR+, +BUILD_DIR+, +BINARIES_DIR+, +CONFIG_DIR+ and
> -+BASE_DIR+.
> ++TARGET_DIR+, +BUILD_DIR+, +BINARIES_DIR+, +CONFIG_DIR+, +BASE_DIR+,
> +and +PARALLEL_JOBS+.
>   
>   The post-image scripts will be executed as the user that executes
>   Buildroot, which should normally _not_ be the root user. Therefore, any
> diff --git a/docs/manual/customize-rootfs.adoc b/docs/manual/customize-rootfs.adoc
> index d5d8b9288f..43ece5a332 100644
> --- a/docs/manual/customize-rootfs.adoc
> +++ b/docs/manual/customize-rootfs.adoc
> @@ -69,6 +69,7 @@ In addition, you may also use these environment variables:
>     - +BINARIES_DIR+: the place where all binary files (aka images) are
>       stored
>     - +BASE_DIR+: the base output directory
> +  - +PARALLEL_JOBS+: the number of jobs to use when running parallel processes.
>   
>   Below three more methods of customizing the target filesystem are
>   described, but they are not recommended.
> diff --git a/docs/manual/debugging-buildroot.adoc b/docs/manual/debugging-buildroot.adoc
> index f575fc48ee..b9068ead52 100644
> --- a/docs/manual/debugging-buildroot.adoc
> +++ b/docs/manual/debugging-buildroot.adoc
> @@ -41,3 +41,4 @@ The script has access to the following variables:
>     - +BINARIES_DIR+: the place where all binary files (aka images) are
>       stored
>     - +BASE_DIR+: the base output directory
> +  - +PARALLEL_JOBS+: the number of jobs to use when running parallel processes.
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 9fbe960759..796be6fda8 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -341,7 +341,8 @@ EXTRA_ENV = \
>   	BR2_DL_DIR=$(BR2_DL_DIR) \
>   	BUILD_DIR=$(BUILD_DIR) \
>   	CONFIG_DIR=$(CONFIG_DIR) \
> -	O=$(CANONICAL_O)
> +	O=$(CANONICAL_O) \
> +	PARALLEL_JOBS=$(PARALLEL_JOBS)
>   
>   ################################################################################
>   # settings we need to pass to configure
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
