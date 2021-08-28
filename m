Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605DCC432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:54:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C18506054E
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C18506054E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CD204012A;
	Sat, 28 Aug 2021 15:54:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NAKfxy4MEBUg; Sat, 28 Aug 2021 15:54:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD238401B0;
	Sat, 28 Aug 2021 15:54:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C0191BF33B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D226426A6
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:54:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CmyQg0ALyK5h for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 15:54:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A38C940712
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 15:54:13 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id x6so7113152wrv.13
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 08:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vV0g8mBw1FGPgLzkNHEZ26wsb6Bavw2N96jLgMrvXnU=;
 b=CCRGGUurlTGQg6iaY+nZgDU6BusRTZsU7n2XzHUjmjvdC6mZoEgxjzmVe7C+a3MPCE
 MpKLKEFUDaCp33ms9GHhgJvNJ4BBqGaokFIePOdIUUDJM3TqTHmqymjlCG5AV27v7yAG
 dh+NwgMmjqJVnT8zRyi+IBvKsQG1D0CLkBFQML4K1k+O6U099RGZEN6XyBE+8b1ZDzvq
 5WoIUvRvQzFuejQwv8aVUVaBXxCUmU4SImTZy8Jixv35Sga0v0eosLHd495xeXZHdCBE
 6JPsa8nnFrCeRpyvgJqstFeGMM4Hg8QHB/+azSHjGfg9Ip/CW59V65cKIc5Af2ev73Ob
 +NXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vV0g8mBw1FGPgLzkNHEZ26wsb6Bavw2N96jLgMrvXnU=;
 b=mGkF5THL8AZ1NQIWnndNc7A5Tra3oInXu0X5ma8iVFYxHbK3jO79cnNUUSBgIRRdI1
 q+MBrTWrYIyXI2hVVKk04NBaJ5GJzZx/FTD+JVPOd4mEZNZ9VL65KUrfRIrsr7T4V0QC
 cx47XyBA7ZbfNaAIsTQcP2OODwNP/Uy+jpjSMthsdjPkWGWw8EdpaDBKDarPqxFU6vZI
 f3qHT2NBITixGM7O66JGt7UseOyHSYd8w0+mNHQZ1Xj1V54U0AEEIZv8/OqPKCnJBkiZ
 FAm3V4E7WnvXaY4vEokaMb4Br5miG1Jg983+LZ6/9GkiCtp/t0wM2kwtRK4HUcIvAgHJ
 pZtA==
X-Gm-Message-State: AOAM530PczAq0hZMd7LPtV8Xja7vn75TQbPmaD+n5oJH+4apFK8jIBv6
 GGtgkMhMiXGrpVi8Sf7sebMhPA==
X-Google-Smtp-Source: ABdhPJysvRblmZd16E6zhEDcH0TI75IbJ4sMIIg5fmQ8GPyFKDEPCFeIUX4fBHzuHEDyJ9M+Jhvs6g==
X-Received: by 2002:a5d:526a:: with SMTP id l10mr16232964wrc.279.1630166051987; 
 Sat, 28 Aug 2021 08:54:11 -0700 (PDT)
Received: from [10.73.0.168] ([213.219.130.152])
 by smtp.gmail.com with ESMTPSA id k17sm16263796wmj.0.2021.08.28.08.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Aug 2021 08:54:11 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210824070141.94164-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <94a1a849-0f2f-3811-ec02-75b847fee72e@mind.be>
Date: Sat, 28 Aug 2021 17:54:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824070141.94164-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d-demos: use
 BR2_PACKAGE_MESA3D_GBM
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 24/08/2021 09:01, Fabrice Fontaine wrote:
> Use BR2_PACKAGE_MESA3D_GBM introduced by commit
> b6c051acf787c804e732bc58ba8d7e440701a168
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to next, and the other two similar commits as well.

 There are a bunch of other packages still with a similar situation: kmscube,
qt5base, waffle, weston, xdriver_xf86-video-amdgpu. Of course, all of them
should be tested with DRI as well...

 Regards,
 Arnout

> ---
>  package/mesa3d-demos/mesa3d-demos.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
> index 4289acfffb..6b5262a2e9 100644
> --- a/package/mesa3d-demos/mesa3d-demos.mk
> +++ b/package/mesa3d-demos/mesa3d-demos.mk
> @@ -43,7 +43,7 @@ else
>  MESA3D_DEMOS_CONF_OPTS += --disable-vg
>  endif
>  
> -ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
> +ifeq ($(BR2_PACKAGE_MESA3D_GBM),y)
>  MESA3D_DEMOS_DEPENDENCIES += mesa3d
>  MESA3D_DEMOS_CONF_OPTS += --enable-gbm
>  else
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
