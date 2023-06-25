Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CCFEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 13:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C181A81372;
	Sun, 25 Jun 2023 13:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C181A81372
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 59POOeRLONQX; Sun, 25 Jun 2023 13:53:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 019CA8132E;
	Sun, 25 Jun 2023 13:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 019CA8132E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E73E1BF3BA
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 689648132E
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 689648132E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M-uX4_sLPwHW for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 13:53:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1832180E35
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1832180E35
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 13:53:32 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-51cff235226so2687220a12.0
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 06:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687701211; x=1690293211;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GIuRItTZcL9+KGaijUPRMSaquHxEhavfwb3Ihi0WDDg=;
 b=Hq2HlyVkAPN3pPME48ZfPS/EZk54ZgMJgE1ym496DmCD4vzQjuZBpWS4YWkjKxN6vO
 ArMo+hBklk+YtjNRNynfrR8/DRQQ7PvNFfo7OdS6DfzmVZFkmJTFqEB/eEYGrhSjIZlM
 F5Wo7HQLfR6jGWF2OresBduuchKCRrDPMTGomIAevjAbHWGLusmpjjltCWQx4quE9m6Y
 rGnhJkb7DQifdp8UigYuy7zBtxUdsdzGg4D5ptjHcEUIFiPtOoyFLBT4s555eJXd9SXI
 inBKT22XtneEH7RS7m4FtF/UolAhjvjwmrUhoh16/lICLKFvTqsEug+EX/Ck5NEN8Szq
 E1Yw==
X-Gm-Message-State: AC+VfDwd8ANap7v0rRTDL4XI8fSGOhRYkJw5uwWHbZC6eEK/i6rNlI0p
 QbWpsESHYnXzdywe8q7qhimcKw==
X-Google-Smtp-Source: ACHHUZ4z2TujnYC4/XGSvgXv7UTVdHNhZ53jOocC6lrcELsfQxWAMZWSPz/ooelWHqKq3YUozJm7iw==
X-Received: by 2002:a05:6402:35c5:b0:51b:fd09:9ec1 with SMTP id
 z5-20020a05640235c500b0051bfd099ec1mr5491407edc.0.1687701211254; 
 Sun, 25 Jun 2023 06:53:31 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 f25-20020aa7d859000000b0051d946ae298sm724504eds.69.2023.06.25.06.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 06:53:30 -0700 (PDT)
Message-ID: <3b8e58c6-e3ec-402d-3eab-b6c65b51da22@mind.be>
Date: Sun, 25 Jun 2023 15:53:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Oleg Lyovin <ovlevin@sberdevices.ru>, buildroot@buildroot.org
References: <20230625124848.1423168-1-ovlevin@sberdevices.ru>
In-Reply-To: <20230625124848.1423168-1-ovlevin@sberdevices.ru>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687701211; x=1690293211;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GIuRItTZcL9+KGaijUPRMSaquHxEhavfwb3Ihi0WDDg=;
 b=ElVHbhZZoOKc6LfqVTmYJ1GoNLup/fd3lG+Hb8S2/XtVdgrCcqF52uA/I2vRu1x0n0
 rStAxBuqhgsnMBRe9u/1Wk3/hDB/Do4Se2vSx8GNalzA+sJz9B+aHOxllHOYsCNd8OxE
 GC9kHE7dvVBD7yYhjhIk2spyyVzlggw1NLKil/mVe4YrdgoKWMIlmkP5djMbDHIDAO6t
 k5VEo+miC/+AD2mQzlLqZYS+AjjdxJZGliGePiqHOuPWlHE0KPVA/pt+sQiH8K4dDvQK
 ynKzEKVD2tR6TsgnjEdVMfqMXOR+UY8hiygcu1vHCRVsO0Sj8piex2Zc7Y6sfHtiNTL1
 OC9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ElVHbhZZ
Subject: Re: [Buildroot] [PATCH 1/2] package/libcgroup: bump to version 2.0.3
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
Cc: olegartys@gmail.com, sdfw_system_team@sberdevices.ru
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/06/2023 14:48, Oleg Lyovin via buildroot wrote:
> https://github.com/libcgroup/libcgroup/releases/tag/v2.0.3
> 
> Also remove redundant LIBCGROUP_SOURCE definition.
> 
> Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libcgroup/libcgroup.hash | 4 ++--
>   package/libcgroup/libcgroup.mk   | 3 +--
>   2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libcgroup/libcgroup.hash b/package/libcgroup/libcgroup.hash
> index 70671212ef..65b98d94e2 100644
> --- a/package/libcgroup/libcgroup.hash
> +++ b/package/libcgroup/libcgroup.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/libcgroup/libcgroup/releases/download/v0.42.2/libcgroup-0.42.2.tar.bz2.sha256
> -sha256  18939381324d418e11be4f5fdca37b01652c18917bfaf1f6b0c505f157e18d07  libcgroup-0.42.2.tar.bz2
> +# From https://github.com/libcgroup/libcgroup/releases/download/v2.0.3/libcgroup-2.0.3.tar.gz.sha256
> +sha256  b29b5704de3d0fadf199fe4e17eeeaecba7f0dd1b85569c96eec37c7672e3026  libcgroup-2.0.3.tar.gz
>   
>   # Hash for license file
>   sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
> diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
> index 156b066162..fb0b646c51 100644
> --- a/package/libcgroup/libcgroup.mk
> +++ b/package/libcgroup/libcgroup.mk
> @@ -4,8 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBCGROUP_VERSION = 0.42.2
> -LIBCGROUP_SOURCE = libcgroup-$(LIBCGROUP_VERSION).tar.bz2
> +LIBCGROUP_VERSION = 2.0.3
>   LIBCGROUP_SITE = https://github.com/libcgroup/libcgroup/releases/download/v$(LIBCGROUP_VERSION)
>   LIBCGROUP_LICENSE = LGPL-2.1
>   LIBCGROUP_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
