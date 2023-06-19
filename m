Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2DAEB64DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 19:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FB674154C;
	Mon, 19 Jun 2023 19:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FB674154C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vU2s69BgrSem; Mon, 19 Jun 2023 19:36:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60764401F3;
	Mon, 19 Jun 2023 19:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60764401F3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E5F11BF2E4
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74DE9401F3
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74DE9401F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TkNy043lU5VR for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 19:36:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BBFE40022
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BBFE40022
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 19:36:36 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-51a2de3385fso5268178a12.0
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 12:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687203394; x=1689795394;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=35yo2J9ejFNcy2fz03oWSaKPCNIVth1nnPXjYBQ/Oao=;
 b=BPdeWls0M7e6agJp7mgbEHnvb8z9PFgWnjcuZCNH4+rTp/Nc7IpuGAnbgadGj4cqDp
 Oo2ZB4nU4KT9DFxKnlZEamv/56RxiRsdhEXMwpJmfMCkQGfFZZar0dxhym8YDTMF10+r
 +nRW+575Y0Bf733CbUJOcRW9QG3DpJE6Y3xyGNbs1XhgWIfEjmnVkEWTrCMOnuZMvLz1
 GTAJN35xeT76rVEFSJTR51+Ej2K5appqb9xohcWbrCHBwO6Zh6VHMg78H04etFWSJAC7
 wHyXouPjCJGTIYSXvo9Slm9dNwQ8tsYXcNAjbMHP8ksODlGUlR/F7pvPk9pbJmPHjgag
 SQHA==
X-Gm-Message-State: AC+VfDx9ermr6jKM9VMPnWzZM8qTttGSg9a3IwsGgGEejC89WqLih2BH
 BZhRrkydlMLaj5sljym+X7qm+xAdIaimHyMGkig=
X-Google-Smtp-Source: ACHHUZ7i2FGlbvPk5EV/Ki7tCnwIwS8VLKY9w/xkoXHD6VSTZg6rnbXka8feE8R3qopAiB+F+B/J5Q==
X-Received: by 2002:a17:906:dacb:b0:94e:e6b9:fef2 with SMTP id
 xi11-20020a170906dacb00b0094ee6b9fef2mr9023990ejb.67.1687203394616; 
 Mon, 19 Jun 2023 12:36:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 lu32-20020a170906fae000b00988e12d0316sm108165ejb.101.2023.06.19.12.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 12:36:33 -0700 (PDT)
Message-ID: <475502ab-509c-90d4-3822-24d2aa529b5b@mind.be>
Date: Mon, 19 Jun 2023 21:36:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20230619172046.744739-1-bernd@kuhls.net>
In-Reply-To: <20230619172046.744739-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687203394; x=1689795394;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=35yo2J9ejFNcy2fz03oWSaKPCNIVth1nnPXjYBQ/Oao=;
 b=exBV8v0k4dxKicpLMQo/NVeLIoFYYOTaIG8nDjJAhKn8a882ZnZ1EhP9ZvD2dyljEo
 Q8HeiWrIYowYcnHjTQ/tgwi9eKHkV3cuvf/mCQg1AJg6eVJ05/viBzr1IOMjSSbkUMbm
 5zW09+nMwbPxXnAPw2EEkS2IsQ/SMhQw7/C+4SlY41Cgn6NNflFPSclTXkT9dJyFiCIh
 vyN7kqD9ils/VHvhXWu93kXvtVT0qQ9T42hSxAHv1byYo/qIXld46v5bQHOorZPr7JbW
 E43gjzYk/lEMp0o8C+Pjg+Q8o6truZlPjURbk/70CbV802cdHMX7xbmIs7eXcXjka5Lz
 QrpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=exBV8v0k
Subject: Re: [Buildroot] [PATCH 1/1] package/check: switch to cmake
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/06/2023 19:20, Bernd Kuhls wrote:
> The autoconf-build system fails to properly detect vsnprintf
> 
>      checking for vsnprintf... yes
>      checking whether vsnprintf is C99 compliant... no
> 
> which leads to a build error
> 
>      snprintf.c:495:1: error: inlining failed in call to 'always_inline'
>       'rpl_vsnprintf.localalias': function not inlinable
> 
> Building with cmake fixes the problem:
> 
> -- Looking for vsnprintf
> -- Looking for vsnprintf - found

  I also mentioned why CHECK_REMOVE_CHECKMK can be removed.

> 
> Fixes:
> http://autobuild.buildroot.net/results/e55/e5562513226de902dae642526165b1555a540144/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/check/check.mk | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/package/check/check.mk b/package/check/check.mk
> index ccffd08ee3..d3977154df 100644
> --- a/package/check/check.mk
> +++ b/package/check/check.mk
> @@ -10,12 +10,6 @@ CHECK_INSTALL_STAGING = YES
>   CHECK_DEPENDENCIES = host-pkgconf
>   CHECK_LICENSE = LGPL-2.1+
>   CHECK_LICENSE_FILES = COPYING.LESSER
> -CHECK_CONF_OPTS = --disable-build-docs
> +CHECK_CONF_OPTS = -DBUILD_TESTING=OFF -DINSTALL_CHECKMK=OFF
>   
> -# Having checkmk in the target makes no sense
> -define CHECK_REMOVE_CHECKMK
> -	rm -f $(TARGET_DIR)/usr/bin/checkmk
> -endef
> -CHECK_POST_INSTALL_TARGET_HOOKS += CHECK_REMOVE_CHECKMK
> -
> -$(eval $(autotools-package))
> +$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
