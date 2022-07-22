Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4978EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 20:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 900B960F3A;
	Fri, 22 Jul 2022 20:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 900B960F3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MExBm61nwTvZ; Fri, 22 Jul 2022 20:15:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 806D660EA5;
	Fri, 22 Jul 2022 20:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 806D660EA5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D7C21BF3DE
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2BE6409D3
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2BE6409D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OnrOGwtfxXIX for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 20:15:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7251640104
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7251640104
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 20:15:30 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id bu1so7898984wrb.9
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 13:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=izLiPajDdg+lCz7JDB4WuuAzwPd0rP+xM5rlfjqLJDM=;
 b=kyCD0759CE4cIQBpt2GzDsDYdm5J+zshH1eyunGyU/ugiLbh8AmBWkI2eXSMDsWkKD
 o+AVYsNctTM4Jqui5mJyWAeK7stxjo3q3BQFgmx5VtvqIxljHG8t36GkoQauayAbY7Cq
 yrPdYoG1Vj5GScYdbn2ZB4TdAhyVRT4srDowBzIKUgGouryYO/9pjuVuFHHlXeCEJmVc
 fGTSfECY8vXn58WGkB1b5mblxI9/rCSqD0eiU1tct7YxRaZYk/+TG7mpFUwh416WLk9I
 INhTs0Mlq/XTZ2dyl3Aqw7NCzfLmQNW1wYdKSt8/LH1XF+lA2EgHFXgiaAPq9UuGUFvP
 aSjw==
X-Gm-Message-State: AJIora84A2DkyYGqWou2CkCzDdNWr2iOBazc0kFoeCfljQpNXhfU62Up
 rJCDNr6jGXr2bLVZVrfsYaFgBA==
X-Google-Smtp-Source: AGRyM1vF3EzYux9B7J+HU+g6PoKnf7+eKd/FkikRZ9syBsIvzz2r/bBkk31i+19vO8cR2nJYRgoNxQ==
X-Received: by 2002:a05:6000:1d86:b0:21d:6433:1455 with SMTP id
 bk6-20020a0560001d8600b0021d64331455mr983480wrb.514.1658520928266; 
 Fri, 22 Jul 2022 13:15:28 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d548a000000b0021e6c52c921sm995924wrv.54.2022.07.22.13.15.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 13:15:27 -0700 (PDT)
Message-ID: <e1ca5f07-7169-d7b7-452e-9a1c50937f0f@mind.be>
Date: Fri, 22 Jul 2022 22:15:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Ritvik <ritviktanksalkar@gmail.com>, buildroot@buildroot.org
References: <CAJxTgFw=_ztH8CWEC8-Fwy1Q+eUtVV26iqw99+v6YNKBwjE85g@mail.gmail.com>
 <20220715154532.02a18e7f@windsurf>
 <CAJxTgFyTmLxM57mUC5c6w8WH8ZDiiuG+zHm4SkcPadCvwTbCgw@mail.gmail.com>
 <CAJxTgFw0R0nSBjgXO9T6ZpacUQ2xfAMqWXLsK-V9pPrJNi5REg@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAJxTgFw0R0nSBjgXO9T6ZpacUQ2xfAMqWXLsK-V9pPrJNi5REg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=izLiPajDdg+lCz7JDB4WuuAzwPd0rP+xM5rlfjqLJDM=;
 b=GQsHr6miXFv/OI+JTLnRkv2UTBelqGQYZqGjG4DGQ//Zado8JuRb4xR158fYrZxz0a
 9BFdidJRtH6O+GxQRLLLVpMrXW7NR4BAHKuItl00MVMncLwiBKw5nsXqrekTIQyGmQA3
 CR0pQOMpvdTW8gO5fSzED9M/RkaP2NXRBErupf56JMSeCUYO1bZ4Pc7qu15X3ajQFxTu
 lobKxBeb2pUt3gHw7WG8GSDQv11ir6E4czkQ9eibydTEm3W4mtXlVv4q1L9p2AeEpMka
 LMVwv3qUthiz4mYaypb2h83jA9PbrrcVRGgefneA3gziRb1QlKvou6Q8zJFQr6/BrGIS
 YIEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GQsHr6mi
Subject: Re: [Buildroot] Fwd: Buildroot failure due to undeclared variable
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



On 15/07/2022 18:25, Ritvik wrote:
> 
> ---------- Forwarded message ---------
> From: *Ritvik* <ritviktanksalkar@gmail.com <mailto:ritviktanksalkar@gmail.com>>
> Date: Fri, 15 Jul 2022, 19:51
> Subject: Re: [Buildroot] Buildroot failure due to undeclared variable
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com 
> <mailto:thomas.petazzoni@bootlin.com>>
> 
> 
> Hello Thomas,
> 
> The problem I see is supposedly arising while building 
> `output/build/xenomai-3.0.10`. If that doesn't seem to help, please let me know, 
> I will try to create a config which can reach the build process of xenomai-3.0.10.

  Xenomai Cobalt and kernel versions are typically tightly related. You should 
probably use Mercury instead. But even then you would have to use an RT kernel 
(although recent kernels will at least *build* correctly).

  Regards,
  Arnout

> 
> Warm Regards,
> Ritvik Tanksalkar
> 
> 
> 
> On Fri, Jul 15, 2022 at 7:15 PM Thomas Petazzoni <thomas.petazzoni@bootlin.com 
> <mailto:thomas.petazzoni@bootlin.com>> wrote:
> 
>     Hello,
> 
>     On Fri, 15 Jul 2022 18:44:32 +0530
>     Ritvik <ritviktanksalkar@gmail.com <mailto:ritviktanksalkar@gmail.com>> wrote:
> 
>      > I have been trying to build the latest version of buildroot (2022.02.3) on
>      > ubuntu 22.04 (ec2 server), a thing to note would be that I wish to install
>      > literally every extra package that buildroot offers as part of it's target
>      > packages, so I checked every box of all packages and libraries of every
>      > category in the target packages. I also selected the linux kernel as some
>      > packages needed that as a dependency. My installation is stuck at an error
>      > apparently related to linux kernel's cobalt xenomai x32 syscalls stating
>      > that `__COBALT_X32_BASE` is undeclared. I am attaching a screenshot for
>      > reference. Any help in this regard would be highly appreciated.
> 
>     Thanks for your report. Since enabling all packages doesn't really make
>     a lot of sense, and would make reproducing your issue very long, could
>     you try to provide a small Buildroot configuration that exhibits the
>     issue?
> 
>     Best regards,
> 
>     Thomas
>     -- 
>     Thomas Petazzoni, co-owner and CEO, Bootlin
>     Embedded Linux and Kernel engineering and training
>     https://bootlin.com <https://bootlin.com>
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
