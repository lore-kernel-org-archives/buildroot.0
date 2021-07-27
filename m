Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF66C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 20:38:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0F9960F57
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 20:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0F9960F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B203404C1;
	Tue, 27 Jul 2021 20:38:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1muZbOFWlovB; Tue, 27 Jul 2021 20:38:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9662F404F9;
	Tue, 27 Jul 2021 20:38:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 969D71BF860
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 20:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92569606AE
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 20:38:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lvbzmf0gXInm for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 20:38:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 600DF60605
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 20:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627418278;
 bh=EPGIU5OxPbx8XNIf8fK2gNE5JTgSbr1//VzVlQNMmu4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=hkkCO5x8ok2zx160Yh/QOKyhKvliU1IGrvM4BF5MFOosPF0RHkoIhApd4y3/CAxpB
 E3XXNEwlIyeW3Cgkv8CQQ1tJ045QaIRMc/BNJSJHoZzfNeh5yj+AaS/VXQJYR1xuZL
 Q2YLcB6j9WzaexTwgWHlrRKX0HFVFiy8qMQpz9bU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.64]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkYXs-1muPlb3N9y-00lzHc; Tue, 27
 Jul 2021 22:37:57 +0200
Date: Tue, 27 Jul 2021 22:37:56 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210727223756.51403153@gmx.net>
In-Reply-To: <20210720222702.66a8604d@windsurf>
References: <20210705191533.29763-1-ps.report@gmx.net>
 <20210720222702.66a8604d@windsurf>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:y7Czm4YbGdt0bZPczPby0OhHsk+RRGo6PYC8oZpYqvWbA91hz3v
 ZNo5jP2P6YaGz1e/DHYTYRCQZTE46HWIKQu5Vkot//uhBt/y5wF/VsRdesa8wvX6/wIX/aV
 GjX6uO0m6Hg2exy92HLp67iW7ZsGgkjVQzpAnYOTOSIthl8hcsCsvvDExSfxCBHBAu8ZmcW
 OzZwvXZg/QLgGPhiVtbHQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xoZ1aZ/9yMY=:1sknaQ71G7ojAUtLArWjmp
 /Gl38Wrh1mt6M7RpGmmhx9FtJVUHnHN0nDrM6nn9On3cUPVYlQ605kCbUF9pXEyBXrQCpbqFB
 UjiZCG3K+g7pihFJGZznHvJ/EC3+riSSMdu+uFCoOykGMx14SAb2J9aM2tuJ3guqR5TVL09zx
 W88cjG5kvOde+9DvfvPFyVJVISUIRgVO8ixwwoxCfiY7wlFg4dqDrMWpKoApcIroHu5d5psH7
 Px7tng50T6YLu5zYvn0iWw4c6k39EsyUdbKw0IU0JHjOq6Lr2MkxqVhKcnv7ESRuLXjLnc9du
 3WOPXoqcayunPVvaN4HhbStuNyUI2meE1QhkBcN4spv4/HrX4t0bQB+OLOUYH1Ekto2RCq4F7
 QFHAXCIzWOqVRvMhtXU7ZcwdloWfB9H5fMvNlsa5wlBBhw51EBeB4wrAznatN9Hn0MQv/3iTR
 aHYKO0QLB7XiWN3bFge1U5CUnaWiFDnqhdLZraFukMfp+dzurbE9SWsrrE4blxnY/4OHBPeIl
 bK0z9THkbNHMav+X7OX2/xTwCRBYrUbYAU/d06fY1aFqKuwrUUsm2wjduZ9PUEHpEbw3nU1NK
 bGosCxnxdZub1y1EqnlzTRkiBa0Jb5NzJeku9HJdS4GZCtdAS59IJUibXqGKRPVqN8cya0VCV
 Xjnph4rP4di4YrQlnu7FTo9iV9okFV5LJ9Wu7S5ZUVafHMj2SbpkVdrha+Yv2hk75aZGsrvZi
 Xw+7X1nBUzqYETXSn5r36Vk3Ql9wGaLaqhr8iB2z0LUG50bjaL0WvqOuDQztuz233lPtcz8zc
 lyYhgBrA+kq3uzhJQaOYFfdvkhB1yePyKzS8BzbrthPkLaTKCUsgcFCr3B6oVhcdn286m6pPz
 HhEkRpv45AXZvKKGjpg1dsAKIKlAuMOrZMZICKCtSqx+rZZvU7ZAedg5+ux6xsh7L4aRx5Kg4
 HnsarOqDaZn4hP0vSQeR321gygPhgxfL9eGbuvQSTBam8VvI5REwDMNnsDezuhbRd9n4XbIXj
 zDTO8N3a6gVDXx7xEE8LfRwzrvtLOvu57Jn2xTy0g3EqL5Okopr/DH3x4vM8tcLMizIFGftrp
 Z3uMAn9OniG3l1pOD9t1ec/8eC2QWiWChMX
Subject: Re: [Buildroot] [PATCH v1] package/rtl8812au-aircrack-ng: new
 package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Thomas,

On Tue, 20 Jul 2021 22:27:02 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Mon,  5 Jul 2021 21:15:33 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Add rtl8812au-aircrack-ng (alternative to rtl8821au), recommended
> > e.g. for Alfa cards ([1]) and as opposed to rtl8821au does not crash
> > in case of configured for IBSS mode and supports iw set freq command in
> > monitor mode.
> >
> > [1] https://docs.alfa.com.tw/Support/Linux/RTL8811AU
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  DEVELOPERS                                     |  1 +
> >  package/Config.in                              |  1 +
> >  package/rtl8812au-aircrack-ng/Config.in        | 10 ++++++++++
> >  .../rtl8812au-aircrack-ng.hash                 |  3 +++
> >  .../rtl8812au-aircrack-ng.mk                   | 18 ++++++++++++++++++
> >  5 files changed, 33 insertions(+)
> >  create mode 100644 package/rtl8812au-aircrack-ng/Config.in
> >  create mode 100644 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
> >  create mode 100644 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
>
> I find it very sad that we need an alternative driver for the same
> device... I've applied, but it would be good to see if this package
> could replace the existing rtl8821au package.

If I remember right the rtl8821au did work (better) for the AP/Station
case...but did not re-test as my interest/use-case (at the moment for the alfa
card) is IBSS and monitor-mode...

>
> Also, I'm confused about the naming: rtl8812au vs. rtl8821au. Are they
> for the same hardware ?

Yes, both detect and work with the alfa card...

>
> I wish there was more effort to push such drivers in the upstream
> kernel...

Definitely yes ;-)

Regards,
Peter

>
> Best regards,
>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
