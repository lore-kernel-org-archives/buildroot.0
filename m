Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E57C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 10:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D12C542864;
	Thu,  6 Jan 2022 10:54:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id swkTRH2iN9eK; Thu,  6 Jan 2022 10:54:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28F1542868;
	Thu,  6 Jan 2022 10:54:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9524A1BF47D
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 10:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81D5182BE5
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 10:54:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CNqDS1x6PxN8 for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 10:54:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D60A81AC1
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 10:53:59 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id m20so1508874wmi.0
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 02:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=1flTovhv0SmwimxHCEDzbovjOMl+Pw/h7sIH9gP9Y5A=;
 b=YBdViLW3JgtsYxSVWuuXvbWOBdr4dan52nElxIqtoOW9Ciczfcu3xuT9ivX20Z7U1W
 ziN0u7fjhvmJq0msDGK4GKMmyKUzZeUf1LSTtMbOarS77Rm9t5jWHnslZ+rhm6lloOeA
 pjDSiRdTEYAOlIHecjh5IMyCHWxLXidkRdTZwaOygijBPHO5lZcJzuzu64YrEgu747uz
 34MuhUyU1QkIXf3IHL8H4hU8dpTUSilVHexp0oxoXaNjscchBZWJa8B2kUWUSvxde1rZ
 mYL+SD3p8cn3YqGyRYlZZ51dUdvOlUWXNGeo2Qg/OBvFmdBpBAbZxnZD7N3n3HYBPfSi
 Fxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1flTovhv0SmwimxHCEDzbovjOMl+Pw/h7sIH9gP9Y5A=;
 b=tEsQRp45EAb7CuKmhzzRDtxk8pnqgkJX/qQpZtDKMkR3TTpGyvh3bocajXT2T3E6jd
 xAZIIsPU1QDS2z8RAJMC/ByVuphDZhdMpDrKPmTpJlN4Gni0EM564xTXTxk/lvx6D2m6
 nGAO3tjWwZHwn1EHHwwWNMFHAwAoeEQO/F8UPn6wRX8nBHBBSR2rQsQeXLV30iguHZZF
 arpEQjpFrfziwH0hny+eqnDu40oR4rFB3c18nZHfM0A3e5wauzMVoZSHM9G1dAja0c4j
 h5f/MphnAzwxxYAtlqtNCdFGaLU+3t123NsAF5DiHYyDioWsB3PRxPrJd8Qn+hElSaH3
 n8EA==
X-Gm-Message-State: AOAM530gmEP8jtCjuxgjKXd8Zw2t9U4udV4K3HuRs1adpRpSKp1Ucxic
 TTokSic7Vo+CX4AJy2b9GUT6WwJmWDkL9iBp
X-Google-Smtp-Source: ABdhPJwkbKxqAZtoPXYJvne8uUlivGP0SY8F24yELqwRZpswkdePDYGGAmlTr3j6io6N6T6qGkWNlA==
X-Received: by 2002:a1c:f209:: with SMTP id s9mr6711212wmc.94.1641466437811;
 Thu, 06 Jan 2022 02:53:57 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id u3sm2169496wrs.0.2022.01.06.02.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 02:53:57 -0800 (PST)
Message-ID: <0e266f48-7464-84f1-e297-a5c6eb7d6f19@mind.be>
Date: Thu, 6 Jan 2022 11:53:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Markus Mayer <mmayer@broadcom.com>, buildroot@buildroot.org
References: <20200121230956.23129-1-mmayer@broadcom.com>
 <20200121230956.23129-2-mmayer@broadcom.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200121230956.23129-2-mmayer@broadcom.com>
Subject: Re: [Buildroot] [PATCH 1/1] system/Config.in: introduce pre-build
 script
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Markus,

On 22/01/2020 00:09, Markus Mayer wrote:
> We introduce the concept of a pre-build script that works similar to
> the already existing post-build and post-image scripts.
> 
> The pre-build script(s) are executed before the build commences. This
> allows a user to run some preperatory tasks prior to the build.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>

  Although the use case you presented in the cover letter is probably not a 
"good" one, as explained by Thomas, I'm pretty sure there are valid cases for 
having a pre-build script.

  I think in general it's actually better to have a wrapper script or Makefile 
around Buildroot, because that gives a lot more flexibility. Still, this 
proposal is symmetrical with the post-image script. And the overhead is 
negligible. So I applied to master after all.

  Regards,
  Arnout

> ---
>   Makefile         |  3 +++
>   system/Config.in | 10 ++++++++++
>   2 files changed, 13 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index a58ca7821d2d..9bf9f1aa05ee 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -579,6 +579,9 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
>   
>   .PHONY: prepare
>   prepare: $(BUILD_DIR)/buildroot-config/auto.conf
> +	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_PRE_BUILD_SCRIPT)), \
> +		$(call MESSAGE,"Executing pre-build script $(s)"); \
> +		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
>   
>   .PHONY: world
>   world: target-post-image
> diff --git a/system/Config.in b/system/Config.in
> index c8c5be40e096..7b890aed1abb 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -518,6 +518,16 @@ config BR2_ROOTFS_OVERLAY
>   	  They are copied as-is into the rootfs, excluding files ending
>   	  with ~ and .git, .svn and .hg directories.
>   
> +config BR2_ROOTFS_PRE_BUILD_SCRIPT
> +	string "Custom scripts to run before commencing the build"
> +	default ""
> +	help
> +	  Specify a space-separated list of scripts to be run before the
> +	  build commences.
> +
> +	  This gives users the opportunity to do board-specific
> +	  preparations before starting the build.
> +
>   config BR2_ROOTFS_POST_BUILD_SCRIPT
>   	string "Custom scripts to run before creating filesystem images"
>   	default ""
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
