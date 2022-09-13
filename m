Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7B8C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 18:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6221281551;
	Tue, 13 Sep 2022 18:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6221281551
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mxeOLiLyPZ9z; Tue, 13 Sep 2022 18:50:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B6B38135E;
	Tue, 13 Sep 2022 18:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B6B38135E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 403E41BF3EA
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 18:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B9AF60A89
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 18:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B9AF60A89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R_dFkLmEVVOd for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 18:50:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6A3060A47
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6A3060A47
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 18:50:14 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id e18so18962543edj.3
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 11:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=BmgfZvro4jDOgcy82iV6sf3ThrQxYIusDJ0vfPhx0l0=;
 b=rO0h6ERxesSOBBmN7h5RG87LAHE4E9Mp2BqXqB9wyMkxP+siPgblHasOLjIEaLxL5s
 7kNIfbqgRuVphtkhIJPvZSCbLYKXuLxWdqsuOWJI5hArFQAPsCC1Cd+kCfXWy4zN8r/O
 vBCZlondtrhpcyUJoUNbv6+Qd5/aS/dNsveCm/y4PPjwKLXPEIgOpAcRysBEQv+FDj4R
 Zl892hsajpoYtPQbdTvJCcty5i5DmuB0rhbwavLkN7aOkX0LAZSIUmek+7g2+II3vvoQ
 quXLD4IdQHSm7gLV7j5AvWkCsyXhV396rm9IDw9XfI3T2CsavujweJcj6Gz05KRvjDeG
 PZfg==
X-Gm-Message-State: ACgBeo0b+f8B3+dwFdzrIE+TEXjU0NYkjhC+8bgCozp5tL7G1mAXnume
 AymEJ+c8o5ZxP2fTeJ3Z2SAXnXZOc0CvzalZ
X-Google-Smtp-Source: AA6agR6kd6O8Z7u89ojSyURyfL0rkanWRKueMHHksEk91Zshs/DQC0t4tnSOeRO96l9edDxZC6+LWg==
X-Received: by 2002:aa7:d341:0:b0:44e:67f1:5a2d with SMTP id
 m1-20020aa7d341000000b0044e67f15a2dmr28520611edr.175.1663095012576; 
 Tue, 13 Sep 2022 11:50:12 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 g8-20020a17090669c800b0073d8ad7feeasm6361418ejs.213.2022.09.13.11.50.11
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 11:50:11 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id bj12so29563792ejb.13
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 11:50:11 -0700 (PDT)
X-Received: by 2002:a17:907:5ce:b0:730:bae0:deb with SMTP id
 wg14-20020a17090705ce00b00730bae00debmr23527312ejb.181.1663095011563; Tue, 13
 Sep 2022 11:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220725011322.1301684-1-christian@paral.in>
In-Reply-To: <20220725011322.1301684-1-christian@paral.in>
Date: Tue, 13 Sep 2022 11:50:00 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qVB_=GXWxpMKsh5A-LY=Q3hrC9-RNCCoL2p0saBUBhHQ@mail.gmail.com>
Message-ID: <CA+h8R2qVB_=GXWxpMKsh5A-LY=Q3hrC9-RNCCoL2p0saBUBhHQ@mail.gmail.com>
To: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Peter Korsgaard <peter@korsgaard.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=BmgfZvro4jDOgcy82iV6sf3ThrQxYIusDJ0vfPhx0l0=;
 b=ASgUEryn/nr0eDrKQn3EV1nnu1FJViWzRMlPCATmO8C+3//ay1W82y3E86DmVldodt
 yZxqTRctbD8/Nu6e+n+3LG6ghZEDT77Jy7GwbAvdXNws5sMoIXGDDWBevX755qK6xctP
 XtERf+oCRgexHFn2b+KkX8bAtakO4PTvHtNRS5D7rZcggvziHgCCEkkAbdhMN1Rkk8PE
 efclFHWqmUTI79d2MstMN6flRakGO05ydSB3aLVrPGFoGAldl570wzG5GGy4hS8WTZJh
 eZ0+pPkHK6aGw9vJOMos5xc42vpXVPHD4evUCmnZlrxHuRdDxEz59Tp0oL8vnnEWMojD
 ZXlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=ASgUEryn
Subject: Re: [Buildroot] [PATCH v3 1/1] package/go: use host compiler when
 go-bootstrap unsupported
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,


On Sun, Jul 24, 2022 at 6:13 PM Christian Stewart <christian@paral.in> wrote:
> The problem is that step 2 - build go-bootstrap - does not work on 64-bit arm.
> The Go compiler from 1.4.x is compatible with x86, x86_64, and arm (32 bit).
>
> This patch instead uses the host Go compiler to bootstrap host-go when
> BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS is not set. This is similar to how
> the host GCC is used to bootstrap the Buildroot toolchain.

I've integrated all the requested changes from v2 and v1 into v3, and
it's been in the "new" state for quite some time now.

Have been testing the patch extensively by building Buildroot on arm64
hosts and it works fine.

Does this look good to merge?

https://patchwork.ozlabs.org/project/buildroot/patch/20220725011322.1301684-1-christian@paral.in/

Thanks!
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
