Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731D4C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:20:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A23060EB4
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A23060EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AF0A403B7;
	Sun, 25 Jul 2021 21:20:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HlUYFkGSSM1M; Sun, 25 Jul 2021 21:20:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11D8F4018E;
	Sun, 25 Jul 2021 21:20:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0AEC21BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0734B6069D
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uRDb85BK3SvP for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:20:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5716860609
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:20:17 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id hp25so13187485ejc.11
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 14:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=LlShFRodwa2LsFlvCUOb6V9tpxvtQIj1sBajkEWqkd0=;
 b=LVIlPmqOLGXn3LGC1EyPShxBJ/VA4/DqhaaGgDfb/QnyE6l8k88ovribdkFeIcwaiM
 JfYXFXLjIAeOcb74GCq1jD30mir97l0Nawfa/Rfqfy9jfprk/XkXL1zT2qDPIncpFXAr
 Uv417vH0bsc1Vy+PxXROr6KXHUkKSgjx6bPVgxxQXU7Pvz089/XpqjRLqhnLSTErMRNR
 hQqE0kgBR8QfexxeuMehqx0Dv/8QG0Hs55s9Z2C4Nj49+TuoX67QDg1wHotM2jNQZVYj
 +e0KCYhHyF5zGYEkVoOnJmyBayEbOaQP0I2a4XLifaG50hSTc/Zs7W45MZfqkDDKJKIj
 2P0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=LlShFRodwa2LsFlvCUOb6V9tpxvtQIj1sBajkEWqkd0=;
 b=jBuQjoLE36amZwo6JMuU0mYCqmd6wn3lId8ZNar4HaFOY8Co1c1q/SFPmNx8oR6h27
 bIrH1Q/ekWwiBcbD1fQy9zn6EzMANxu2d6j+EfDtAt/smxLYo+0n9a7IPac19w10KI8w
 afeL2mLUfu9Or0d6e7hJQD8ZCWxurLHGU+xR0xpjyljSC0HroTDj7ydCDv/MPRt/6Mpw
 Kjled31M6M7zZCd5fPSSnPfA21cDV8taIUgVwYXVPKBl0qpZu9woFiWXCHrYmBx6nY9f
 WXwlKyS9aXlqay8ED3S6hGz5P2IoGqlLfkR/+w4TwNFIBipLU9YqXE35NiKdePXRF+H8
 cXtQ==
X-Gm-Message-State: AOAM531ptwXB+14UxAr2Q8249YQoVBQBG52KsvvshA8Rn3jL8ecmbMM1
 ysUdg/Z+cqGueNwTuWQkkGoxs2XurC9rgg==
X-Google-Smtp-Source: ABdhPJy5ISi5fwTVVEuIRX3J0eUYUUVW5yCDvvHwF2xvFUVULTB6tKPszFw2qL2oll8OarvVy2IznA==
X-Received: by 2002:a17:906:11d4:: with SMTP id
 o20mr3605309eja.329.1627248015577; 
 Sun, 25 Jul 2021 14:20:15 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id s10sm13641947ejc.39.2021.07.25.14.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 14:20:15 -0700 (PDT)
Date: Sun, 25 Jul 2021 23:20:13 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YP3VjWXUFOi25GcS@pevik>
References: <YP3GPccSpJbFMAgv@pevik>
 <20210725231404.4ec6afdb@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210725231404.4ec6afdb@windsurf>
Subject: Re: [Buildroot] [RFC] rpcbind: Remove
 0001-Remove-yellow-pages-support.patch
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Thomas,

> Hello Petr,

> On Sun, 25 Jul 2021 22:14:53 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:

> > I'm thinking about removing
> > package/rpcbind/0001-Remove-yellow-pages-support.patch patch.

> > It was originally added in 2012 in 8bc245da21 ("rpcbind: new package").
> > At the time constants YPBINDPROC_SETDOM, YPPROG, YPPASSWDPROG were missing in
> > rpcbind (added in 2015 in rpcbind commit 9e0c7ac ("configure.ac: Check for rpcsvc/mount.h").

> > I'll verify it, but I'll strongly suspect the only problem was in these missing
> > constants and very old libtirpc. Thus it should be working now.
> > Probably the best approach would be to disable legacy yellow pages in upstream,
> > I can ask for some configure switch. But if you're don't require it, I'd just
> > drop the patch which is not needed any more.

> > Patch was also somehow related to package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
> > (originally added as package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch),
> > which was removed in 883a33ece5 ("libtirpc: remove NIS patch") as not needed.

> Sure, if it all builds/works fine with a more recent libtirpc, I'm all
> fine with dropping this patch!
Thanks! I'll verify it and send patch or report if still needed.

Kind regards,
Petr

> Best regards,

> Thomas
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
