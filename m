Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A046C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:23:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12EDA61184
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12EDA61184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD59F60ADA;
	Mon, 20 Sep 2021 19:23:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BMNNGB-4dsE9; Mon, 20 Sep 2021 19:23:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5188D608FA;
	Mon, 20 Sep 2021 19:23:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 484CA1BF955
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 344C7401B6
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:22:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rnIpJXpZDjN for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 19:22:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 148C54012E
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 19:22:38 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id v22so60673349edd.11
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 12:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=BljFY1S7uopVOZh/K4Sl4EhTJOCp3K+kYQE1OusQIBQ=;
 b=Yi5YgVV5dVt8VidfSmRhzYBCxoKRrG+JvG9FQ4RRT6rbWeMXFD+ac/esNaqark3pFA
 0Mh7mFrlkQOotgFhy+MmlSgBkI6eUB6tbp6ffrmevZMi8xTsLBhtjwLXSUcBzxkUHYBY
 m/fFpb8RrSNVM4jqP50oRBa1+NNVs+nBKtx3LnG2m4NKiKc8Z/14ECUGOW1ZNzUusrpu
 +7iL/RyqI59O18vrfe5AMfZHhRQBfKn85zddqfgr0+z+d/moFC7Cu8jktdiHyjFCgmXu
 36+AFoUfPnTP0SWXBjil6Si8XqssDkWPnfFfTXYF/YnMjnXI8gBhhYvZASCPgjVcyfG6
 lNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BljFY1S7uopVOZh/K4Sl4EhTJOCp3K+kYQE1OusQIBQ=;
 b=oSHFU9L4OTyQOfJY1jrjlGIxHiE5Pny3Dp0adpO9AHPt7yFOiDWmQzyQMSE9gaLF/e
 Cn5A7t32iqd/gVAQD0n4TuqOuPuuRYWywov/5sh1D1mn6KHzEV3CNLUEJ2buVBb1Zm47
 MysOkWP6fT1EiD1MzAqRD54/NdQy2fCbvvF5MI0CHcTCmNc4C+cFLOMv76NJnyxtxPaP
 u9y98T15RETgBWDSgXjJbH2rOvDXifwILWv/g6IqZ4rf0+ob0FFrHxp7NSXngfO3+kUn
 adgrMtjcWqlhWFuUG+Vkat4eA7BvjosC+T/0OPsNnsCSvWV0qho4AV/PUV9Y5O4dQ6CV
 n0OA==
X-Gm-Message-State: AOAM5316qo0t0cSrUwWbZKPNXcs4Byihv9MECMlapqZtfPxooJGLRT9m
 v215Qv4i86Kp1SHvZ3Vm9k5Kyy4jSfKIaA==
X-Google-Smtp-Source: ABdhPJyf7mtesOrDkHhg3Ru8O1UhNJbB7o6PfxEcAzl/CGt3qBng9FacDRK/gesUXROKdwwVFq7Osg==
X-Received: by 2002:aa7:c6c2:: with SMTP id b2mr30876283eds.353.1632165756279; 
 Mon, 20 Sep 2021 12:22:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ck10sm7300801edb.43.2021.09.20.12.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 12:22:35 -0700 (PDT)
Message-ID: <85cba527-d15d-a446-ea71-bc803062ac5e@mind.be>
Date: Mon, 20 Sep 2021 21:22:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210908201152.729124-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210908201152.729124-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/i2pd: bump to version 2.39.0
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



On 08/09/2021 22:11, Fabrice Fontaine wrote:
> https://github.com/PurpleI2P/i2pd/releases/tag/2.39.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/i2pd/i2pd.hash | 4 ++--
>   package/i2pd/i2pd.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
> index da44d51e1b..4eceddba0a 100644
> --- a/package/i2pd/i2pd.hash
> +++ b/package/i2pd/i2pd.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/PurpleI2P/i2pd/releases/download/2.38.0/SHA512SUMS
> -sha512  01e160394dc07621b3d236fcc13d78b46e109290f59dbb77f282c05f4d80fdfa01c9b062de5ca91d6d6e739beb8a5b6f731508b48d9483f1a132a93a71d88e6f  i2pd-2.38.0.tar.gz
> +# From https://github.com/PurpleI2P/i2pd/releases/download/2.39.0/SHA512SUMS
> +sha512  6b38e6e2e763e94ffe9d11eb2f9a0e9554560bb4fec95891240adf5bc0a9639f879dac4ff3712a9f8e00895b7bbeabc854887e61fe9f9755c33f96899e20aa76  i2pd-2.39.0.tar.gz
>   # Locally computed:
>   sha256  9c87aff490b272254d716475e3c4973f5f64af1d18f9f6962c1e61e252e1ad9a  LICENSE
> diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
> index e6df5ca34c..348311277d 100644
> --- a/package/i2pd/i2pd.mk
> +++ b/package/i2pd/i2pd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -I2PD_VERSION = 2.38.0
> +I2PD_VERSION = 2.39.0
>   I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
>   I2PD_LICENSE = BSD-3-Clause
>   I2PD_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
