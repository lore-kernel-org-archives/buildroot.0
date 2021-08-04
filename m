Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59762C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:28:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4D7560238
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4D7560238
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ABBA40679;
	Wed,  4 Aug 2021 20:28:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ApixgEdKC9nc; Wed,  4 Aug 2021 20:28:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D71A040673;
	Wed,  4 Aug 2021 20:28:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A7EAB1BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 970B040673
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LKzuYrcK73l5 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:28:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 474224066E
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:28:40 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id y12so5159799edo.6
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 13:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7p2Uc9WbeVq9myGJyC+US2vALkxKLdBN56hMcq1XjO8=;
 b=XS/ARVTNoXgdHKJJcfo6M7WCSoR4tGK7nYWXbhYE0jxl3Qfd+1NmZi/xbnptfkufjx
 OaxSmeAL3qr8vkvI4xJKR+jdTLWcE2Xk6cyTxL99tZBg4pTz3Fllvzb6XPUpamanVV9X
 sfVVw2k/aLIHG332DKgVStm5l7t5k1TuZPNShcMAbYf7D0HtnC60SjXwbKGksu/NttLj
 a50vtjfvJmywz6DS8Yiv6b2v1KOf7y/t5d+HI/ZSFEZ/o06IeyqqrI4yMpVE1LO2RYZD
 bblj76pVMH+8mK8fArnDNHWTGOwHU6rVzJDTwEGI4rxzDbB9waXaytwUNDjr7rPbJ9st
 xLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7p2Uc9WbeVq9myGJyC+US2vALkxKLdBN56hMcq1XjO8=;
 b=fJJ1Ran8rjHrb8iS6pALevD748Jn0yG0CSqGMFrF/HJrv8mBBCzt0vGzzGphuy+x6N
 VWKM+fH9F0Ss3mMK75B85yDlIaygTPZfvh4q55sjKilUUgi6rvbD32ZM9muCY6LcSGex
 VDEcdt7SyQ354yVQm6F6aWX34vxehbub0XtfDclDvTWCHFICgv88mpTw0K9XQXwDC+bG
 qfIYwz8IYUhU3TokPeuZ0kGER49ewNA04AKZMbTegJ3tfccHB3doImgirVJKHMWwuRiP
 D2D10w5pgggOtjvT/n7uLDyIPqpHeLcrbA4ekfW+zAK16obRmPwwCYYWJyPEqRSKNshn
 Ha7Q==
X-Gm-Message-State: AOAM5308aKCrEvZySWDZiDEhWH+JFc3awsw3In3hniR4Thz8TQXdMnNK
 wKB87XSs4G6Ecxwbwq+4cJv7Gw==
X-Google-Smtp-Source: ABdhPJy5Xi40IocrZF4iddtOrmLj5boNBbGsYHtODnuKScNK3nELy0Qb3o9aKNedYcFkL625jq/S3Q==
X-Received: by 2002:a05:6402:1395:: with SMTP id
 b21mr1762728edv.119.1628108918476; 
 Wed, 04 Aug 2021 13:28:38 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id c28sm967430ejc.102.2021.08.04.13.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 13:28:38 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20210803084245.2740449-1-giulio.benetti@benettiengineering.com>
 <20210803084245.2740449-3-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <d9f6c6d8-566f-0d84-f935-58130ab7fde8@mind.be>
Date: Wed, 4 Aug 2021 22:28:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803084245.2740449-3-giulio.benetti@benettiengineering.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 2/2] package/pixman: fix build failure due
 to gcc bug 101737
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
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

 Hi Giulio,

On 03/08/2021 10:42, Giulio Benetti wrote:
> The pixman package exhibits gcc bug 101737 when built for the SH4
> architecture with optimization enabled, which causes a build failure.
> 
> As done for other packages in Buildroot work around this gcc bug by
> setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_101737=y.
> Also let's add PIXMAN_CFLAGS and pass the Codesourcery work around CFLAGS
> to it for consistency like we do for the rest of the packages.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b20/b20869bbb48edb1f0a847ea9e2e1a0462d6350be/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/pixman/pixman.mk | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
> index d99005ecb7..6fab539593 100644
> --- a/package/pixman/pixman.mk
> +++ b/package/pixman/pixman.mk
> @@ -44,12 +44,20 @@ ifneq ($(BR2_iwmmxt),y)
>  PIXMAN_CONF_OPTS += --disable-arm-iwmmxt
>  endif
>  
> +PIXMAN_CFLAGS = $(TARGET_CFLAGS)
> +
>  # toolchain gets confused about TLS access through GOT (PIC), so disable TLS
>  # movhi	r4, %got_hiadj(%tls_ldo(fast_path_cache))
>  # {standard input}:172: Error: bad expression
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII),y)
> -PIXMAN_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DPIXMAN_NO_TLS"
> +PIXMAN_CFLAGS += -DPIXMAN_NO_TLS
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101737),y)

 I believe Thomas's experiments showed that it only occurs under -Os. So I think
we should do this conditionally under BR2_OPTIMIZE_S, and use -O2 rather than -O0.


 Regards,
 Arnout

> +PIXMAN_CFLAGS += -O0
>  endif
>  
> +PIXMAN_CONF_OPTS += CFLAGS="$(PIXMAN_CFLAGS)"
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
