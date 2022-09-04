Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8697C6FA82
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 20:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 098984088A;
	Sun,  4 Sep 2022 20:03:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 098984088A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cqKcAnh4y17v; Sun,  4 Sep 2022 20:03:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF3E440339;
	Sun,  4 Sep 2022 20:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF3E440339
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F2DE1BF303
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 20:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0403D40339
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 20:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0403D40339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0-jYrKH8LGQ9 for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 20:03:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1C4E40338
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1C4E40338
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 20:03:13 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id q21so1317251edc.9
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 13:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ziR0jQPqiWQ03haU85EURjZPeK1qpOGxycDv1llXMis=;
 b=jH1G0nGRv5rQAefYb6GTlSIKZjl/kmcGGKc+u2s5os/kYDQmnhNdk3Cj8YspdnO+rF
 QjdGryGF8LRAjrCEMvagNXlL8R91A1adu7pwj2dT8JnWaep4qy30ZKjWxOIgV0JuDs4f
 +k2+zziOcqtPnlXhT+a4yOgprqMD7uo6nCPrHr3baKDl425DPSOqMqN5sW4B6y9gtxet
 qWhBV4nmxKmX2eGbRSPmCwmra+DetCdjxkwhcxpzJrccPb+TR/jilLB2Ikd6LT9qTK0d
 SFag1DwPoIlcwOVyfugSt6uCUHCciZVNQGm9te/b09OVKwJYt5okdzZ6G6SlM69NpLZ1
 fSYg==
X-Gm-Message-State: ACgBeo1AWOtXQIosM+cgaO1UiZZ3hP0Aqs9TZ+jsgswmMVdE1WU1CHMs
 d3kVFs6hIPhZ+PO+/HFfE8iTfmR3i3AJVx0a
X-Google-Smtp-Source: AA6agR6YFMtq2Ynh/yAQj9RqyCXTD2RTi/78Pflt//691Sqax+CjnulaT4uyGPWxoFzl+uMs4ovJEw==
X-Received: by 2002:aa7:d150:0:b0:44e:3c06:d719 with SMTP id
 r16-20020aa7d150000000b0044e3c06d719mr4123836edo.265.1662321791994; 
 Sun, 04 Sep 2022 13:03:11 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 e13-20020a17090681cd00b0073d7d9deb73sm4116275ejx.68.2022.09.04.13.03.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Sep 2022 13:03:11 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id fy31so13357031ejc.6
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 13:03:10 -0700 (PDT)
X-Received: by 2002:a17:906:da85:b0:741:40a7:d08d with SMTP id
 xh5-20020a170906da8500b0074140a7d08dmr30029038ejb.263.1662321790814; Sun, 04
 Sep 2022 13:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220904191010.200822-1-christian@paral.in>
 <20220904194138.GA1490660@scaer>
In-Reply-To: <20220904194138.GA1490660@scaer>
Date: Sun, 4 Sep 2022 13:02:59 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pXVEsdxhtuwNNqm-kdE_XdLwjbQLDWNGE4k7=_qrWzgA@mail.gmail.com>
Message-ID: <CA+h8R2pXVEsdxhtuwNNqm-kdE_XdLwjbQLDWNGE4k7=_qrWzgA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ziR0jQPqiWQ03haU85EURjZPeK1qpOGxycDv1llXMis=;
 b=T276luUwJztupwJXe11TUJHobO9ZbrbEvvXv58AA82SZ4yJCeaci03tIONayHR7YSW
 KiMow9fOaXNJ1roFytzcVPkPLfj4MYA74BbQwv+ZHIdID8APf8h5H5oAey4uN1x7vklr
 0MwMtBClwuo8rigrDMOj+JCB8Y37BrgLrLlZ8uC6p2FbWFWr33pBhl5XBtSWn9rR66kj
 Dx4WT1a8nd4o+1+XRhVwOB0WcSmebOHnL/+7Na4qouww4Vj6FqNlC+M9NnTtTNt6YMuA
 Z+EfY+Y2LsXNGF+lv60+mnSv4MdcwgwpsAeJDaWyKCRzec7QpP49BZxRUdgMQDAs5zHa
 E63g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=T276luUw
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump to
 version 2.10.0
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Sun, Sep 4, 2022 at 12:41 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Christian, All,
>
> On 2022-09-04 12:10 -0700, Christian Stewart via buildroot spake thusly:
> > Docker Compose v2 is a CLI plugin loaded by docker-cli.
>
> So, if it is a plugin for docker-cli...

I thought about doing that, with docker-compose in a sub-menu under DOCKER_CLI.

But given that historically it was a separate package, and people may
not necessarily realize it's a plugin,

I instead decided to just `select BR2_PACKAGE_DOCKER_CLI` if
DOCKER_COMPOSE is enabled.

Do you want me to re-submit it with the plugin style instead?

Thanks,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
