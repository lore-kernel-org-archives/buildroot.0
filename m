Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC87C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 16:47:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 002C5610FC
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 16:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 002C5610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEEF483B43;
	Thu,  5 Aug 2021 16:47:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lW108mpNiRuA; Thu,  5 Aug 2021 16:47:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 078AE83B39;
	Thu,  5 Aug 2021 16:47:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A92791BF574
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 16:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5149404CD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 16:47:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O7V0WBzL4ZIJ for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 16:47:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CE9F404B4
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 16:47:34 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id oz16so10637780ejc.7
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 09:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z+k3FnaSHdMI4uaPX6ws4H5PWg2F03Uu1Y8Km6NI2vk=;
 b=UUJT3vLk3td3cWcJNlJpAI6uFjQh7AMwFPAspP0mHfRR+e+CwOwinO8+RqjXfLHfN6
 DiUjUhdjHOvMZFBoK3Vavg+ueVE68dY48kI2hsnAV8H9y1DQ/r6r5I5xc+xhq4eJhI5U
 xldMCTGH6rUW0xjkP5E/KWeRbRxciaFu4D7YGf5+dxckiSsJkZtXDiQyYdbdnJ1epICb
 PlISYkh9VEKmsMwz9yIzBcwca+hUNPZnBFoZJKFt1eY/vqaUNFV+/k4v0PLpJQAv8dZ2
 BwrokJ4jk03XZ79TfGkWTzrIdJCZXUTUA9BLGWVCIGANRmMzzZyBT5o3MPF3q4f8bJK+
 gEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Z+k3FnaSHdMI4uaPX6ws4H5PWg2F03Uu1Y8Km6NI2vk=;
 b=gKLSiI376IZ7I/pHT4yZI812pzK4HwuLi5MFsheTYWYOQk3cLnInasm7fJyyI/04nq
 5Ko0Y3ogqpPdIXoIBXB5q392LTlvSPnFO3cn/LLlaetcrPUhuC10pGcyqiVqAYu6d0bn
 pMZebsyZ2/+yFNFNIHyTvPbgHS9VdEkwJpg5vxnj3JyIfa4HarLTCY9Spd2xvvyd8PD2
 queXkVQ4HYz9PEC8OVUjCUsGeu8/Kx/WtuujmFUCpXkQqBT8MFmzk3Z+mHvwsOWVScMq
 JomafFDBVP5jNqyPYK3l23M9xMiVDyvCQ5uU7S4qiMfzXIQ6QXuRfPZL6ZzJPKD/AIeb
 wr1A==
X-Gm-Message-State: AOAM5304J58tcC3oCpxgvByOyziDYRXT6kiV36gNEzhhSq+oLyfd484n
 sLGOq7FH2mdR5JWvYClewwux3w==
X-Google-Smtp-Source: ABdhPJx1EceDOZFO1R2bfY2Y8/gdfPjkIe8HRp2MqAGa3IGSHY8Wmfu9kYLbvcx+mgjxW3Ks12ssbQ==
X-Received: by 2002:a17:906:5911:: with SMTP id
 h17mr5916251ejq.440.1628182052769; 
 Thu, 05 Aug 2021 09:47:32 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id nb39sm1882071ejc.95.2021.08.05.09.47.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 09:47:32 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210804095129.931129-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <93da1337-57a9-8d58-8107-b14a5a174d49@mind.be>
Date: Thu, 5 Aug 2021 18:47:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804095129.931129-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/luaossl: requires DES support
 in openssl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 04/08/2021 11:51, Fabrice Fontaine wrote:
> Enable DES in openssl to fix build failure raised since commit
> a83d41867c8d69a77d5cd0a665aa216af5340359
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3e043f992f81ba1e7ad7a2c64d73425e074301a2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/luaossl/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/luaossl/Config.in b/package/luaossl/Config.in
> index d8763e76a3..f84c59f2a0 100644
> --- a/package/luaossl/Config.in
> +++ b/package/luaossl/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_LUAOSSL
>  	bool "luaossl"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
>  	help
>  	  luaossl is a comprehensive binding to OpenSSL for Lua 5.1,
>  	  5.2, and later.
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
