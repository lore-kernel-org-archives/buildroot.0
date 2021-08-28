Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8500C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 11:47:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11F3660EE4
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 11:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11F3660EE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6C0383EB1;
	Sat, 28 Aug 2021 11:47:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2FNpWNWFHBLp; Sat, 28 Aug 2021 11:47:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 409A183EB2;
	Sat, 28 Aug 2021 11:47:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F0BDF1BF417
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 11:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBA82400CB
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 11:47:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7bl46h5Av82s for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 11:47:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CB564010D
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 11:47:43 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id q14so14614192wrp.3
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 04:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=II1h+cuojAtOvaFgiLQiESlSofrPVa8Pq51NhzY1x7w=;
 b=HvYFRSTbJ7KZAnSXwcq0YqiadeQjj4GwT8oUvkXfiYAOcaDphgajl6oQ/BrbI5ZRDG
 5+i4BMM296k5zPEHaXzRd/rk7lrx1bQrjk10YIAXgp53zC3FzaCSnxP+LjcnHfGzAPtA
 X8TGBCCOkVcUOVXyOJHd0cAlyjnSWhTYqQKxDBDxH98gcnWdhSWiL9G4iSuIywnHgUZh
 BpIt6/MEZB6403Kslgod6XgTudOUv6+7bb8v4ZY1/vdveR2UAZSe95WcOAQEvRB0B2OI
 0SZ/7Sximg5m5RQ3IzWA2bkRH1DXL91/P9tIoTEa5AywCJVDrCfccdPqa8W07s8n8yf4
 XYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=II1h+cuojAtOvaFgiLQiESlSofrPVa8Pq51NhzY1x7w=;
 b=MVbjcpC3OUWDAS2RmFrb5pknhL36gUK9kVczgNqWbfwM9lJyg6W+52Ofy6mWQSpJIu
 yuGWMhG+DXM95GQBK+uu9Y3OIQC+iEwrS4XcRFobKlapleCaOqwN6AjPZKDRA1juJaKc
 FA8LulcGyiyN9ok3oU99sWnpY4AdN/wF2fMzHx+zt44L8gNSJJLgO2UQxszf+n87gZsp
 MoRyfqGr3Mipe/QCvjsGn7brLwFF+QTDxpuYpd4IzMEOnWYVkGExm8EzcJtoSr2u3rPI
 m7febiNYBh4yCrMklHBryZAkAWG34A/bV6QoDL6FnDPuUplp0OgA+fWQ01DHcku/HGkb
 rDMw==
X-Gm-Message-State: AOAM533h3uvKJmB6cAZR28BuK+DAnCBZqdrWkLrn4aicLHyS8U+FWos0
 rnVirCiD4wRGpnttmCbclpcOsPoD32LgVA==
X-Google-Smtp-Source: ABdhPJw/c8nDb2087V/Jr2rtYkKMAc/VcDvog5vDgzRGQWi+uW4oWSuLYi2u5l0/pR9F+S1cDnJlPg==
X-Received: by 2002:a5d:6d8f:: with SMTP id l15mr15837028wrs.42.1630151262281; 
 Sat, 28 Aug 2021 04:47:42 -0700 (PDT)
Received: from [10.73.0.168] ([213.219.130.152])
 by smtp.gmail.com with ESMTPSA id g136sm4863368wmg.30.2021.08.28.04.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Aug 2021 04:47:41 -0700 (PDT)
To: Conrad Ratschan <conrad.ratschan@collins.com>, buildroot@buildroot.org
References: <20210827211426.77376-1-conrad.ratschan@collins.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <af866dec-70f5-fea2-3f59-01908afe35a6@mind.be>
Date: Sat, 28 Aug 2021 13:47:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827211426.77376-1-conrad.ratschan@collins.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/coreutils: Prevent overwriting
 of fakedate
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 27/08/2021 23:14, Conrad Ratschan via buildroot wrote:
> When BR2_REPRODUCIBLE is set and host-coreutils needs to be built, the
> fakedate script installed to `host/bin/date` will be overwritten by
> host-coreutils. Disable installing the `date` binary in host-coreutils
> when BR2_REPRODUCIBLE is set.
> 
> Signed-off-by: Conrad Ratschan <conrad.ratschan@collins.com>
> ---
>  package/coreutils/coreutils.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
> index 65234a113e..1bdfe2f9cf 100644
> --- a/package/coreutils/coreutils.mk
> +++ b/package/coreutils/coreutils.mk
> @@ -164,5 +164,10 @@ HOST_COREUTILS_CONF_OPTS = \
>  	--without-gmp \
>  	--enable-install-program=ln,realpath

 We were supposed already to only install ln and realpath, so this issue
shouldn't have happened to begin with. Could you investigate in a bit more
detail why this --enable-install-program doesn't seem to do the trick?

>  
> +# Avoid overwriting fakedate when creating a reproducible build
> +ifeq ($(BR2_REPRODUCIBLE),y)

 If there really is no way to get enable-install-program to work correctly, then
we should probably not make this conditional on BR2_REPRODUCIBLE anyway.

 Regards,
 Arnout

> +HOST_COREUTILS_CONF_OPTS += --enable-no-install-program=date
> +endif
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
