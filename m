Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89990C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:16:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5333860230
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5333860230
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 193D6403DD;
	Mon, 25 Oct 2021 20:16:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gMlXmsZ-WMKY; Mon, 25 Oct 2021 20:16:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DCED4014B;
	Mon, 25 Oct 2021 20:16:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1361D1BF870
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02A636089F
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:16:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ztv7cBRkep30 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 20:16:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45B1F605A6
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 20:16:31 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id y12so4717584eda.4
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 13:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=nVSdgnj1n/SXGf7clllisdKqSqVVsVG4RxOAiS3S094=;
 b=b+4/89o8mtXGIZuYaaXIv+Bb0QmYUZc/WQYz8mPn/W0Qwq+lHZasJOMzcCZefWQlPX
 QfBYyCZN8kZk0aIf1jJ9sf7bJoWJefUJiurDoUv5syev2rbG97rWlRdRSGyU1pVXtrJ9
 SVhsrdFiCOrPhrmaZMLm3cArUtcxMmkeztuBuiQXKrkShzRPuXAMKSCaxAL+ASOvVXTa
 Voz9mLWPCY3xU68BpjUdf9r7Jq2ju0VZjqbkBYARYYDUOmmqtlke53w6OgZbSGGqExRG
 iqh6iKajbleYK5fEtMZlZPd9+vVL0C3XYqp86nlS+eA76SP2JQkTkMa+VuxXOQqlueyL
 Gw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nVSdgnj1n/SXGf7clllisdKqSqVVsVG4RxOAiS3S094=;
 b=yGVTuw2zg1/zh2RNsyJaYi27LnK2LUU7R5koJ+y67/aoHzdFuFoQcs7CwPHgX7nAV5
 wn9uVTBqf7P7AE7OzVf0Q3UCOVot5KjIIXGPED3KAkjpUANVvZyr2WUB8ojdWBMfuFqJ
 3v11qqdnhV08mKSR4Mz3BViaOmQZuSbG2CSnySBy4vhgI2UBSvyJ9zziAJMoa4kwmoNF
 UyrsA7fP9dB9DdKcWc+p94BhnG5vQySm3m0ZEwRBTaxqajZXnMCnlfzDWh+tGFpMRiyX
 6QiVOpltb5qe96PA+XuE6wh8Edh8q5y/OW1M9zhLlOdW3SDnVdRt1vpAii+kDSacNB+n
 GaVg==
X-Gm-Message-State: AOAM532LCFqhYsDpsD0GEEFpc/bqmBqIT5AuqXwCi37Ju1QUn6tksHve
 FsEIZ0MBa8BncWbFkHDjvTU8Ng==
X-Google-Smtp-Source: ABdhPJzIuRTnxjwY8+fSQcJwS4quwZfjE2cCABrbxQcr+ssb5lTbKplDOqjuvOowo5CRTcLJ41cIjg==
X-Received: by 2002:a17:907:7f8b:: with SMTP id
 qk11mr11236343ejc.313.1635192989497; 
 Mon, 25 Oct 2021 13:16:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gs8sm1383793ejc.84.2021.10.25.13.16.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 13:16:29 -0700 (PDT)
Message-ID: <f8408e93-b551-0bd4-5bdd-2796b822678e@mind.be>
Date: Mon, 25 Oct 2021 22:16:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211018214558.1514616-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211018214558.1514616-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libunwind: don't override
 dependencies
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



On 18/10/2021 23:45, Fabrice Fontaine wrote:
> Don't override LIBUNWIND_DEPENDENCIES in a conditional
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libunwind/libunwind.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
> index abdec86761..5f6b87b9db 100644
> --- a/package/libunwind/libunwind.mk
> +++ b/package/libunwind/libunwind.mk
> @@ -16,7 +16,7 @@ LIBUNWIND_CONF_OPTS = \
>   	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cxx-exceptions,--disable-cxx-exceptions)
>   
>   ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
> -LIBUNWIND_DEPENDENCIES = libatomic_ops
> +LIBUNWIND_DEPENDENCIES += libatomic_ops
>   endif
>   
>   $(eval $(autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
