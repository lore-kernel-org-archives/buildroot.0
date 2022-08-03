Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F85EC19F2B
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 21:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02E2D60A77;
	Wed,  3 Aug 2022 21:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02E2D60A77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jdIlvP5xbfFi; Wed,  3 Aug 2022 21:04:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16252608B7;
	Wed,  3 Aug 2022 21:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16252608B7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D6761BF325
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 21:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68E75401D8
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 21:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68E75401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZhGFsCCit2aB for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 21:04:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9186540332
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9186540332
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 21:04:33 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id i7so13838645qvr.8
 for <buildroot@buildroot.org>; Wed, 03 Aug 2022 14:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zXeHGNsVGWPtwMMGqjwibF9kN6LiU7EjJOo8o300DSg=;
 b=lxyGHGqYm3eX5IoEjL5RsfDacwmU58mV4tW1wbyryuTjsDqiDn3YBu2Ohk0fqR+r04
 XMj66I8r2rp10t03xEOkvMEeqWFfkXBLgNTaQuGLG5sHM5W87anYh/e4ABM7l0zIfEhu
 fXjyq/kFvXK1m8V8MXRlmQN8Ospogsa/YUmeY00N2yR/Rtyg3NsFXJAUdd+UTeAFrtCe
 uQL37WYZOXhkbo9+JxbM+L/i4PW4oPDQToezAmt3l3jOs1YxIzi/LLb+mAy/gw1uPF7X
 kJ1RadjLZ6cy5ePQC13yzEf0xgTlZBH+URABOcchaJuc/RUU1Uy/bxxCF1qHvj1+CKyS
 yeug==
X-Gm-Message-State: ACgBeo37ry8rrRprXnTJbegZ7v3bcCz+lr/fIWsyktpQGvXcOTYLMk2W
 jO6aiDp6dc+dTNTbeSyk7EZW7g==
X-Google-Smtp-Source: AA6agR7XISWTbOfq/be3wiZWQnF3qWUZGhVXbu28APvCa95A3kWBGPb+HrSrMqugnBP71KmPB6fOOA==
X-Received: by 2002:a0c:9101:0:b0:473:9b:d92a with SMTP id
 q1-20020a0c9101000000b00473009bd92amr23504612qvq.17.1659560672381; 
 Wed, 03 Aug 2022 14:04:32 -0700 (PDT)
Received: from hefring ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 f36-20020a05622a1a2400b0031eb5342520sm3658706qtb.15.2022.08.03.14.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 14:04:31 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Date: Wed, 3 Aug 2022 17:04:30 -0400
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Yuri3sT/jSnhKBSs@hefring>
References: <20220802202142.1770838-1-Ben.Wolsieffer@hefring.com>
 <20220802202142.1770838-2-Ben.Wolsieffer@hefring.com>
 <20220803001203.3b341222@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220803001203.3b341222@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zXeHGNsVGWPtwMMGqjwibF9kN6LiU7EjJOo8o300DSg=;
 b=1hToJtNVV4imAMF9bwbEGoDIdMQBT638Pjj4aIQK+1MUlQrE5mb3TGqZGpZ2YpAtxN
 kvGo4IbL4DrtFlIxPL2Bjqhc1ea1PDV0VAWzjUDzC0y9vjpxfwZ4EAgzLirBMlg3BOjB
 irf8bVkLxTvP23QXHVpNlZJvl3m7wDya+DouKEpfC7PQNu6Ls10UXvlduEUo5j5VwhIw
 OISy+H/H+yIBWRQHgr2lXIV50uZZWou9HUZGMIPQR1KUapMfQ9m+npJ2z1ofIpKVhqgy
 SBBLviW8qWc4HwnhlIj3eeTqR4S2bXuRL2D+BT+gkT2G35Gc2oajSKRWLhsYerpHM6xg
 lS/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=1hToJtNV
Subject: Re: [Buildroot] [PATCH v2 1/4] Revert "arch: drop now useless
 support for FDPIC"
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Aug 03, 2022 at 12:12:03AM +0200, Thomas Petazzoni wrote:
> Hello Ben,
> 
> On Tue,  2 Aug 2022 16:21:39 -0400
> Ben Wolsieffer <ben.wolsieffer@hefring.com> wrote:
> 
> > @@ -418,6 +421,7 @@ endif
> >  choice
> >  	prompt "Target Binary Format"
> >  	default BR2_BINFMT_ELF if BR2_USE_MMU
> > +	default BR2_BINFMT_FDPIC if BR2_ARCH_HAS_FDPIC_SUPPORT
> 
> This default means that existing defconfigs for ARM noMMU, which
> currently use FLAT binaries will "automatically" switch to FDPIC.
> 

I didn't look too closely at this revert before, but yes, it probably
doesn't make sense to enable it by default when adding support for FDPIC
to an existing architecture.

> On another topic, I am wondering what happens with external toolchains?
> For example at https://toolchains.bootlin.com/releases_armv7m.html we
> have ARMv7-M toolchains that produce FLAT binaries. So probably it
> means that the toolchain-external-bootlin package needs to be amended
> to only offer the existing ARMv7-M toolchain when FLAT binaries are
> selected.
> 
> I haven't really thought of all the implications, but to me it seems
> like the case of external toolchains should be considered, to see what
> is the impact of the FDPIC support.

The fact that FDPIC requires a certain toolchain target unfortunately
means that the existing prebuilt toolchains can't support it. Perhaps I
should add a BR2_TOOLCHAIN_HAS_FDPIC_SUPPORT option?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
