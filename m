Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9279CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 02:13:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22E92610E6
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 02:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22E92610E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD675613A0;
	Thu, 30 Sep 2021 02:13:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hLpL9kdVDPdQ; Thu, 30 Sep 2021 02:13:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 265706139B;
	Thu, 30 Sep 2021 02:13:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E075C1BF400
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 02:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD1BB6139B
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 02:13:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YITEvF9zxE3U for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 02:13:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51E90605FB
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 02:13:28 +0000 (UTC)
Received: by mail-vk1-xa2e.google.com with SMTP id f73so2116385vkf.6
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 19:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w/UXV1PK+Do6EqgL9QMEysIRuX4ME2JcwixvK3pBEuc=;
 b=VfmGMNa2qAnkbkgowrqO/x+56vXfZGKZGnMRwMssh6fGKLhH945m7ghbeFS8nwfpv1
 KuHGWL3VJx+QklQ/R+lVUY1W1/wEqKZfSe+gObIbYZGxEEMaeWsj/lGMlfxbZrwI4/x2
 MVj2HWSyZ3DSa3Gse8MfagjNygaRkmpBswJvouvNceCxqdH2+ksae6RfS7fMbB1CkB3X
 AKDp/EjOrq/4n+0M6yK1myXNL9SWECnXtpBAARx2cYUIW0TbpgEfvwVWdvp6IUyTj5hy
 8iEiK3q6NT4Z84oudaes7UqH5gCNV0v99SYk9AJo1W5XQFM/hhPs0C+UNrfcgf+UjH+0
 /Afw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w/UXV1PK+Do6EqgL9QMEysIRuX4ME2JcwixvK3pBEuc=;
 b=ZYmXaMr7eO4nHlryY0szR9cIj26d5tsc1Ao06eMcfJywEieu0U+GTjG9NX3VfUV9yA
 kpvXSHu15Y1NGym6yHdR5QaWfdifWT9a7ZA0a5wfF9DLkHlXkWwkuNs9lUtkgfUf7EHd
 S2qK2lFLdel1cymikzPqdk8rEoIPEkF2Q2vWotdo3Zn76Dm6oOik2XK+/HMdv7+VW4nE
 VpFTzvSEszMWkHBax/trb+32pkJxXQdE1S/MuGGKBiNKfR/kUs3bdvPAgMHlG83Yn19/
 5Kmnr1tavbtx1vtuy6dvFBZ02zXa3wHVyncNUsPU/2iYZvMi/4EZD5G8YjMWmgcKSoHH
 tQeQ==
X-Gm-Message-State: AOAM531CLwgZDq+jslGL/fwRx7VNwYSAmC44Sv+Vsy4JETSliCQrf9+T
 pHsagEJeK8y2eCDzlnKby09P968EDmXHUymBOl7EZMKaMV4=
X-Google-Smtp-Source: ABdhPJybUZXFu1ax2+DFJAbrGB3FVzLI6vjG2yZCWpJe8jZ2CeT2klUjTkjuy1DesOMuNE426ZlsxJEFXvMWfkaJHao=
X-Received: by 2002:a1f:b417:: with SMTP id d23mr1591622vkf.8.1632968007257;
 Wed, 29 Sep 2021 19:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU0DmMfBTdmnrD9UYxCqEJq6gbut6WJv3Nr5QKDe_UL3UQ@mail.gmail.com>
In-Reply-To: <CAJ+vNU0DmMfBTdmnrD9UYxCqEJq6gbut6WJv3Nr5QKDe_UL3UQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 29 Sep 2021 23:13:16 -0300
Message-ID: <CAOMZO5DZxRFKF=tnkHRk5wKzoRW2_F9py8onUk_5ppzz0S2nuw@mail.gmail.com>
To: Tim Harvey <tharvey@gateworks.com>
Subject: Re: [Buildroot] buildroot config for installing kernel and dtbs to
 rootfs?
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Tim,

On Wed, Sep 29, 2021 at 10:52 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
> Greetings,
>
> I see the buildroot has the ability to build dtb's from the kernel
> source (BR2_LINUX_KENREL_DTS*) but I haven't seen any configs that
> instruct buildroot to copy the dtb's or kernel image to the root
> filesystem.
>
> Is there a config for this and if not what do people usually do for this?

It is BR2_LINUX_KERNEL_INSTALL_TARGET=y.

configs/wandboard_defconfig is an example that selects
BR2_LINUX_KERNEL_INSTALL_TARGET=y
and install zImage and dtbs into the rootfs.

Regards,

Fabio Estevam
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
