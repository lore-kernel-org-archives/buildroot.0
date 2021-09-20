Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C2DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:23:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 628B0610A0
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 628B0610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F7DA60AFC;
	Mon, 20 Sep 2021 19:23:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YnH_FfpwDzsv; Mon, 20 Sep 2021 19:23:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BED460AF6;
	Mon, 20 Sep 2021 19:23:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 226751BF955
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D5D3401B6
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U1CgjUhXF2r3 for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 19:22:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECC744012E
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 19:22:50 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id g8so65515868edt.7
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 12:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=fXIwCr03nl5w81rmoWR+zg2qXkJ/vHuRCD0hmWmV5us=;
 b=JvgNfCwOeGgbrDGdhKeSMO44r2Hm0YVvf9ad1vulogONd5fUoYbMCl1TTSXRm+81JF
 HrLPxsTfxeJhnI6JMsvPVVL08FWTEYZ39YiLeT3zvDyU2/m/nKL2dVNzpBYtBkbB53rQ
 UmLq7GE/EP2lyPzN9VX1jvWEv9S5bihdJjvNfMa5mHQ4kYY9ScfPxVuzCImS0K1VTUId
 kSHEMUloKsylhC/ToBEW8dQ9pwVxNmOev952VJdiia6gGSXi6V03me5Ncu/A2U/Srhea
 rJdm2RAyj7rhE9PnaoOqh7jj8l57zXp+jGabcPLx6UggKsx0sP7L5Tcsu9MMPjFwWm6T
 3utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fXIwCr03nl5w81rmoWR+zg2qXkJ/vHuRCD0hmWmV5us=;
 b=2IcOoty7sctxNYJU1vnc+ADEYTXYjavvGi+znIr+OD6EDYkmKS7FdlRtweQYpfdAVd
 bWQLsRl/vZ6IOsSSSN7/ND9PHWIyPKQciAqEwt6kFLg4w7MOESUQysKBFIaAMnYWI+jP
 zLox8YNXUKEhZAE1tI2lcC4gAYIVxFZRnNk2TZhsRPu6AoIaRbiQb090Hxcaba0z9nwV
 dBXghI+DMhB/sKeoJyrQSRwSOmQQQIxezJ7ytVTowmbsPz2bCdnRXRQjB6sex4zaLxy0
 Go2QNL16p0AHGAxsNdLzM9rxKGkyxL6Q/+3DrDy/ttU84GZlpcJtD8oCFVqLgTmJH68Y
 DTNQ==
X-Gm-Message-State: AOAM533Ka4olAJ0wHA1BnqCHQZJqjj22rqFb9JVwYPMN1nE+nuSWBIzE
 6BOSxxB3/mUPCV2QJC1cmmm/dQ==
X-Google-Smtp-Source: ABdhPJxFXGCWYpOqZVvN4CQ1f3H/8tJ6iZkh1cnKrHfyy1ew5T8fv8p6eF/MhKWRcR78FYlgTr+iJg==
X-Received: by 2002:a05:6402:17d5:: with SMTP id
 s21mr31069084edy.377.1632165769221; 
 Mon, 20 Sep 2021 12:22:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id dk27sm7433535edb.19.2021.09.20.12.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 12:22:48 -0700 (PDT)
Message-ID: <bb685335-c42e-dfe4-075e-4aa4f165b721@mind.be>
Date: Mon, 20 Sep 2021 21:22:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210908195110.590900-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210908195110.590900-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/civetweb: bump to version 1.15
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



On 08/09/2021 21:51, Fabrice Fontaine wrote:
> https://github.com/civetweb/civetweb/releases/tag/v1.15
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/civetweb/civetweb.hash | 2 +-
>   package/civetweb/civetweb.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/civetweb/civetweb.hash b/package/civetweb/civetweb.hash
> index 0295e74da6..bdf6d77427 100644
> --- a/package/civetweb/civetweb.hash
> +++ b/package/civetweb/civetweb.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  d02d7ab091c8b4edf21fc13a03c6db08a8a8b8605e35e0073251b9d88443c653  civetweb-1.14.tar.gz
> +sha256  90a533422944ab327a4fbb9969f0845d0dba05354f9cacce3a5005fa59f593b9  civetweb-1.15.tar.gz
>   sha256  24d3d2aee56ae3cddcdf3392c1250877818108314233cf15f2bc9eb3ac298934  LICENSE.md
> diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
> index 40841285ef..33c3bfdf33 100644
> --- a/package/civetweb/civetweb.mk
> +++ b/package/civetweb/civetweb.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -CIVETWEB_VERSION = 1.14
> +CIVETWEB_VERSION = 1.15
>   CIVETWEB_SITE = $(call github,civetweb,civetweb,v$(CIVETWEB_VERSION))
>   CIVETWEB_LICENSE = MIT
>   CIVETWEB_LICENSE_FILES = LICENSE.md
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
