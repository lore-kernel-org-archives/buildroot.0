Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94615C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:05:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DC9860F43
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DC9860F43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8B9483434;
	Sun, 19 Sep 2021 12:05:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hA_HJCQjFdTC; Sun, 19 Sep 2021 12:05:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 618058402C;
	Sun, 19 Sep 2021 12:05:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 034941BF2F3
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E61B4606AF
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id guXXggskGLtk for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 12:05:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4E9260615
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:05:43 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id c21so48955250edj.0
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 05:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=171Q6HDCkrNihgvuOorCzijx31qZCdW1V4s2fZAevho=;
 b=NNlDA6bSmLmi+ecQmQ9FTP/5XDVYw3vAfmAiPKtgCAOmRSG2fbsSCp1/EaHzjsAcl8
 O7j2pWCWcMnD5js+agNAoOLJ3lxQVBj1zSx3N6s3fhuhVtO2C3K50ZvhmQoCvhkbX2Tv
 B9YG9AHdMXoyL1GhlUaRG0FU6xgiQoSF+liIN60f79sZ7/s6wx81eUckD4/CA/oICoF9
 T5YGpmS4QZze0PrzZBDjEWCNL2IL7FL2a3cipmtKSr/SlJAk29ZOEOSPUUHo6mW4l7LY
 xzuiMMG37acLw5K+6ZKL9TBCobY0Pnm0J7kJ11kJiHEJ5i/zKnfpL2M0bdxjNpzIIyup
 vtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=171Q6HDCkrNihgvuOorCzijx31qZCdW1V4s2fZAevho=;
 b=lKuGFabutvZdgjCk58D4XSjry54tTZf+Egh41t17mC8xHIEb7i+tFEe9VdjY+E3k9H
 mq27vJ2K5lZ6BWXq5DSfvAV+vs4WEnXCSGlpbn5S6F948GsMsjyvGN/SuQmYpqUHMSuZ
 N7U+Xoz4cu6IAp9/8pkxGXfJGw8ehHNu/0yuK4KTUDCkdzs3fBAzQ6jXWUkZUE4XycPg
 OsL7X8Wk07pciLnW+U8f3CgRMc0UYdudOOtNuT4InroEGstLcVMBVD2DScaO6LlnSn6f
 z4I1IHOqtoE3Z1OFrzeWiMh8JcB9UE1nn2kHnBDL2M7AiwtZzcnchIQpV+a+xxR2gJTx
 D43A==
X-Gm-Message-State: AOAM533dCR83S/Z3bTDmfXiC4HuYN1OtVmkM1CLXEZ3IrU2OLjbI8/un
 B0BT2kf+lnkRTqJs5Jz8BCroydqovog5Pw==
X-Google-Smtp-Source: ABdhPJxCqUv2Syu0RWI8htc4Kyw8H9qqWU5hEnCaicvrHeHjEfMEjoHaZzKj6CFyVHppCMR6zax8tw==
X-Received: by 2002:a17:907:96a2:: with SMTP id
 hd34mr23317920ejc.113.1632053142032; 
 Sun, 19 Sep 2021 05:05:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x7sm1429099ede.86.2021.09.19.05.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 05:05:41 -0700 (PDT)
Message-ID: <89e7604f-3190-3e94-858f-d01e325dea9a@mind.be>
Date: Sun, 19 Sep 2021 14:05:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Leonid Yuriev <leo@yuriev.ru>, buildroot@buildroot.org
References: <20210906182343.339361-1-leo@yuriev.ru>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210906182343.339361-1-leo@yuriev.ru>
Subject: Re: [Buildroot] [PATCH] package/libmdbx: bump version to 0.10.3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 06/09/2021 20:23, Leonid Yuriev wrote:
> Signed-off-by: Leonid Yuriev <leo@yuriev.ru>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libmdbx/libmdbx.hash | 2 +-
>   package/libmdbx/libmdbx.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
> index c8a28ada34..7cc835a96a 100644
> --- a/package/libmdbx/libmdbx.hash
> +++ b/package/libmdbx/libmdbx.hash
> @@ -1,5 +1,5 @@
>   # Hashes from: https://github.com/erthink/libmdbx/releases/
> -sha256  745555704df76626a6612ad0c6bc6b1a66bfab98b9245b07dfb82640aa46d6fa  libmdbx-amalgamated-0.10.2.tar.gz
> +sha256  a8f2436c4d008886e044f568a22bda44329fb1c67f175d91a929ff8e2065340a  libmdbx-amalgamated-0.10.3.tar.gz
>   
>   # Locally calculated
>   sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
> diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
> index 60c5148625..76bd56dfd7 100644
> --- a/package/libmdbx/libmdbx.mk
> +++ b/package/libmdbx/libmdbx.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBMDBX_VERSION = 0.10.2
> +LIBMDBX_VERSION = 0.10.3
>   LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.gz
>   LIBMDBX_SITE = https://github.com/erthink/libmdbx/releases/download/v$(LIBMDBX_VERSION)
>   LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
