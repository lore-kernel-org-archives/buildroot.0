Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F245C4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 13:39:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5910D60FA0
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 13:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5910D60FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BFC760605;
	Mon,  2 Aug 2021 13:39:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fjDAe7Zblef9; Mon,  2 Aug 2021 13:39:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B99FA606D9;
	Mon,  2 Aug 2021 13:39:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 144451BF59F
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 13:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02AB1606D9
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 13:39:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zzfLLzcvOs7w for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 13:39:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A314860605
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 13:39:10 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id nd39so30961127ejc.5
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 06:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0g7pUQHUXg/H9EzbXuH6Yx2D1v2L5MGTL2ujr7TbuJQ=;
 b=KEcOnagGe3I85UU46d8WHKKwoiYvDEkKKo5v/Y+g1Wiz8eSiIIaUL+ZrchekYgMVrn
 L7d4Q7Gpl3KlbjmsG5NlyJFRjOthel1s+oelin/ABUdqmVaKgOXt+DxlQwLuxcnUtUzt
 l8qVH76exZHesCzmBbqf2E6bjndP0NcBComByj/VmPXT7oTxQT7K6klrWDy2oqZMxxEL
 u5BddZzliEtE2wKxew01xPQ+nCb2WAjgQV52qOogPN4hsLFoKs++mTqTb3PnPbn7wL5u
 k5+AdDfKrSM7G4g463gKHcip9DkWE384dnlVtX4rruU2pFvZMbypp5q27DxHQqS4bn9S
 nniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0g7pUQHUXg/H9EzbXuH6Yx2D1v2L5MGTL2ujr7TbuJQ=;
 b=ldx6O8VmgX9uk8JlqMyzcuGJy3+wZnglqD22sbH/qGp97e6zH9/5KeZ4hxVr+dhtpe
 Fx4EAq070MWaXhEhe4gE/gMlUfYNAOvD6ziGlQAUNWmnKPwFp9HjQ+SBNR75R0Y88VSN
 eBSWIfLNI7fbuEDz5JeSbjkuLei2M7927r8qhMu/Je3ZPF07fC3IKLwwqvzeVo1xusfW
 pH+4sG2dAnCxM/vduBCdw1nstquDdkOxhpLhnK/mEhgsGzFSr+omytNBUEn2V1JkLpjo
 qhnwbKJN0n+3ymDPQ1uxuplK9DvxdvT5UKcX7e87XHh4SxsReADxMkCpl1EPEZqeQR6K
 pL3Q==
X-Gm-Message-State: AOAM530fBbi18NKgCnYUYOmZCOfk+8WHHePe/W1hAB35szRfAQRkVq1M
 PFIANi8qaEGTsYXZiHzXhjFeBQ==
X-Google-Smtp-Source: ABdhPJynCQwOllChDHFaM5Lcs5zkBv/JmASQT/z4JQS6S6DObFXqpjmZK6sh+vJwxGsrvOUs8Kh4dQ==
X-Received: by 2002:a17:907:2bd0:: with SMTP id
 gv16mr16143570ejc.49.1627911548940; 
 Mon, 02 Aug 2021 06:39:08 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id o16sm6101486edv.91.2021.08.02.06.39.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 06:39:08 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20210731185600.2238723-1-thomas.petazzoni@bootlin.com>
 <20210731185600.2238723-2-thomas.petazzoni@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <c4cf4b06-4c1d-c7b2-29a0-20bb64633d8b@mind.be>
Date: Mon, 2 Aug 2021 15:39:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210731185600.2238723-2-thomas.petazzoni@bootlin.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 2/3] package/binutils: default to version
 2.36.x
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 31/07/2021 20:55, Thomas Petazzoni wrote:
> Now that we have added version 2.37, it's time to use the 2.36.x
> series as the default version.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/binutils/Config.in.host | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> index 6190ee4d97..91ce209583 100644
> --- a/package/binutils/Config.in.host
> +++ b/package/binutils/Config.in.host
> @@ -7,7 +7,7 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
>  
>  choice
>  	prompt "Binutils Version"
> -	default BR2_BINUTILS_VERSION_2_35_X if !BR2_arc && !BR2_csky
> +	default BR2_BINUTILS_VERSION_2_36_X if !BR2_arc && !BR2_csky

 You forgot to update the default in binutils.mk.

 Regards,
 Arnout

>  	default BR2_BINUTILS_VERSION_ARC if BR2_arc
>  	default BR2_BINUTILS_VERSION_CSKY if BR2_csky
>  	help
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
