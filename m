Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C41C9C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 09:16:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F02260F14
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 09:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F02260F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21F2382AEF;
	Tue,  7 Sep 2021 09:16:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xmcLSUDzu_Ml; Tue,  7 Sep 2021 09:16:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 813A582AB9;
	Tue,  7 Sep 2021 09:16:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF0791BF2F2
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 09:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDD02405C0
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 09:16:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qHspgH6n9EiZ for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 09:16:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31DF340410
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 09:16:16 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id z2so18272306lft.1
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 02:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9nUJwGyp1ieCUECIX8iDaS0jj0NKUpfl2bshbutb4Gk=;
 b=pRPxGMt0ECaiLrvN5AYhxut8UaOiiokBDFSAdrvWP2lo2x6sTSJLT6x9IRAp8Znsej
 bK0u/EkxPG23nh6QqnAgtuUW0Z7n6ijGwagEpmBDGihuaJzuvI++F3MLFQTRyH/Nwkeu
 kUEwhlf9hcUG2yQdEb0PY65qpBCqezlYoC/CNdQA5yHPHUshn9oZrB4n5zGCJ1haIILi
 r3si1jVOswqKUxMoDn/sFokkUvU7UIeYFCWTHiThOlDpS3meg7PQ9onpOrmHLxJAAfMa
 eE0sZySjs3jQLux9vk6nEF7Wa/60zx7LKXJIuTg3V9S+D8pp8JpBq81bOhuOwz3vqXwM
 6DIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9nUJwGyp1ieCUECIX8iDaS0jj0NKUpfl2bshbutb4Gk=;
 b=qjg1Dl3X+wbOWqHnKpVD6vGd1vPAOh9ZIe+jDP0lgodHCma0LGF4A1kKOEnc94e0WO
 HSsXIgeJ4kjA71kozSJSGIelM9ON9TcTYts0s85onTeA+z39SKH6hfYe3zdRACm5Df87
 U8Vq27b+C0R2gSWRYpfLPAYfRgvKRKLlH413oYBoQkXkjITge86euCxSmwtNg7ny79mA
 maYhNP1N27LI2ZX4GY+zBjjo1Apn+UQgMkh9CmP6gJ0ePan2OSl1zr8Khs1Kb6v0k1cI
 mMMye7sXfccTg6uVueSJNgbsaQBfHaVJScSsbqnTnOj0Xh49dlOsJ/gE0ZIvQMeAVI6k
 MfAg==
X-Gm-Message-State: AOAM533UToT/j8WZBtQEdWM0OYFDd4uatRL/dScRIepYHalBz8j5rZC2
 7e8N4x8canw3WwMsCFlXTWCCtBoEU+Hvx6jMT9zR0ph4Ff4=
X-Google-Smtp-Source: ABdhPJysMgEOYQCnXPOSI62llDsYFXavq7uvSFWqt+vF4zjncDvM+l5xRMikbg3npo1t3K2HIc69DxEe2oNrKLk2euQ=
X-Received: by 2002:ac2:5f0a:: with SMTP id 10mr11930808lfq.14.1631006173993; 
 Tue, 07 Sep 2021 02:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210906094214.6142-1-heiko.thiery@gmail.com>
 <20210906094214.6142-3-heiko.thiery@gmail.com>
 <5a4dbac30a8e7546394c6f6969c602d3@walle.cc>
In-Reply-To: <5a4dbac30a8e7546394c6f6969c602d3@walle.cc>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 7 Sep 2021 11:16:02 +0200
Message-ID: <CAEyMn7aJqGiyh9y-u-v5Bp6yAA+ZLQnJqM98JduiME6-8hmbeA@mail.gmail.com>
To: Michael Walle <michael@walle.cc>
Subject: Re: [Buildroot] [PATCH 2/3] boot/uboot: copy ATF bl31 binary to
 uboot package dir
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabio Estevam <festevam@gmail.com>, Xavier Roumegue <xroumegue@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Michael,

Am Mo., 6. Sept. 2021 um 12:23 Uhr schrieb Michael Walle <michael@walle.cc>:
>
> Am 2021-09-06 11:42, schrieb Heiko Thiery:
> > If the U-Boot image is to be built with binman and the ATF binary is
>
> btw TF-A is the new name for ATF ;)

Good to know. But for consistency I have used the ATF naming.

-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
