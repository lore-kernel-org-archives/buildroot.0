Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F54CDB482
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C829541503;
	Sun, 15 Oct 2023 20:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C829541503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Tl6KSn_gnzl; Sun, 15 Oct 2023 20:14:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD6C4414CF;
	Sun, 15 Oct 2023 20:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD6C4414CF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 672161BF83B
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D9FA80B89
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D9FA80B89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IDnZXJeU2772 for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:14:44 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67AED802B9
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67AED802B9
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53e04b17132so6068817a12.0
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 13:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697400882; x=1698005682;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TFZKY4iJwz8aUtob+zzyh4MaTfZ0zAMiVrdBg9omiXo=;
 b=HMPsc4BrOUBt86QkWyxWqPtroF/qjymiyAEXM1gzs9BjE4GBy8BjdWmbP69XAR/xDU
 rHA6ijMUcoI2dfnAz3Ar3pT03fODkkGgjYSn0PonoM3X+2m5+WAvpJfGjAEKGbFstIr1
 CamhM2B8Hdt5qX5kZvVW0T7oG58OtwLTuvHIXKee+wXVDKleUjCZihdNVjALJLNF468v
 KUH23kSp0TtN2WE/W6uSWZxMY+KcMQqD0v1p+dJ/c/mhSW4zmNgXtki0HFBBHQvFjMCp
 dA5wNnskYPGf87er795ILNWsi3OV7JXPnR9uYO1XpdddpY0IE8krfV1IuBSsXECeexe+
 f7sw==
X-Gm-Message-State: AOJu0YwzDqqhEfzzbY1pxELZ/NZKhwBbPvECygEvDzQjTrZwSM/4L37k
 PZEr7qxDmzNf4DVCHKEdMbExpE89fWc6DsotysE=
X-Google-Smtp-Source: AGHT+IHkMLpfFln9KaSjYXBEX4Y2D3QMvioM3eyBD7uPYgMC5uWbK5T6LbAJlW3zH1guOG6ya/hN7Q==
X-Received: by 2002:a17:907:9716:b0:9c3:d356:ad0c with SMTP id
 jg22-20020a170907971600b009c3d356ad0cmr1299325ejc.24.1697400882521; 
 Sun, 15 Oct 2023 13:14:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a17090651c200b0099cb0a7098dsm2786233ejk.19.2023.10.15.13.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Oct 2023 13:14:41 -0700 (PDT)
Message-ID: <3b608e07-d48b-ee86-6806-efc1c023046c@mind.be>
Date: Sun, 15 Oct 2023 22:14:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
References: <20231015063648.1360322-1-troglobit@gmail.com>
In-Reply-To: <20231015063648.1360322-1-troglobit@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1697400882; x=1698005682; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TFZKY4iJwz8aUtob+zzyh4MaTfZ0zAMiVrdBg9omiXo=;
 b=giGu3S1Zk3TQcGRrDCRx3y5MtnHx6V1Igcq1ztVaROnR4N2Uk+9Y7xFHltavIVdHr1
 /2U/xqXov/gXZW/wDJBTf0EjbSo7bnKrSyqlZMD046pU5/sGh3BJVMgx3pT6qOKwQ8Cw
 cvsidAus78DBVEreOHnWiwtgrKc7GpZQKT1+EdsvXpLy2vOqjLAmaTerjl7yx5MT1jhE
 t2i9NRwAZPWRLkf41Ed1bqvGSZf6kacafqcBMTf+iePsNuMN5EaqHWKH3yVP0Ktv4aT2
 cxw4kpXVdlOOr8xWHjtT/StAKu2zbrtYDO+kPznddxrzU8DhrDHa0lCKdaImTUxtbuyT
 8D8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=giGu3S1Z
Subject: Re: [Buildroot] [PATCH 1/1] package/inadyn: bump to v2.12.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/10/2023 08:36, Joachim Wiberg wrote:
> New features and DDNS provider support (IPv64.net), but also a lot of
> fixes to regressions introduced in v2.11.0, e.g.:
> 
>   - dynv6.com not working at all, regression in v2.11.0
>   - Regression in DDNS provider names, introduced in v2.11.0:
>     - dyndns@3322.org
>     - dyndns@he.net
>     - default@dynv6.com
>     - ipv6tb@he.net
> 
>  From https://github.com/troglobit/inadyn/releases/tag/v2.12.0
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/inadyn/inadyn.hash | 2 +-
>   package/inadyn/inadyn.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
> index 94af9f87b7..eb5249e371 100644
> --- a/package/inadyn/inadyn.hash
> +++ b/package/inadyn/inadyn.hash
> @@ -1,5 +1,5 @@
>   # Upstream .sha256 from GitHub
> -sha256  9ddac7b6b0a1ed372c6cb5afaec6bea927ab539db02c8536dd10d73bd1d37c95  inadyn-2.11.0.tar.gz
> +sha256  38fe00f20b293e64a89efc85f766ff40f0be3bcf9c3ed68b842104540a60806e  inadyn-2.12.0.tar.gz
>   
>   # Locally computed
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
> index 3e346fd769..fa2eedc1f3 100644
> --- a/package/inadyn/inadyn.mk
> +++ b/package/inadyn/inadyn.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -INADYN_VERSION = 2.11.0
> +INADYN_VERSION = 2.12.0
>   INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
>   INADYN_LICENSE = GPL-2.0+
>   INADYN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
