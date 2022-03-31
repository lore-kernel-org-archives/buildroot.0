Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31A2C433FE
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 14:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CF9D6131B;
	Thu, 31 Mar 2022 14:51:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8dDXJF-BRLUZ; Thu, 31 Mar 2022 14:51:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9542D61315;
	Thu, 31 Mar 2022 14:51:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C1A681BF38C
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 14:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A87B441EA6
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 14:51:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=zx2c4.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k85p6Ppocpnj for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 14:51:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5D6141E9F
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 14:51:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5174A61A74
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 14:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95AC3C34111
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 14:51:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="hkEkGZZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1648738264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lzBrQbYefXNQ4cTGvwlitc04cUylIXDWDWpaFDsQvgA=;
 b=hkEkGZZFC3KwJaVjyZ7SN+ay7igOqTyuGv4gD5U8xuMzNh1bOAsSyVN7My7PERksFgr9Vp
 TyVRHOT9zpa8qubE6+2usw26CcemgvUu3zm5FfEHsQYmuwLQ0F6zG+KCy5JL/diI6csUTW
 HLagOp07MZ8hfD2mvMuhyNa1bnQpdqU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fc3c23e7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 14:51:04 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-2e592e700acso1020637b3.5
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 07:51:04 -0700 (PDT)
X-Gm-Message-State: AOAM5308Neq3LhCJmm75gRIsc71DHy0c6F2/SkY+FefDY3zYDG8irnNm
 YxBhlkrAUhwZoqSi8dbbMxZXC/9hGHMFTSEshpI=
X-Google-Smtp-Source: ABdhPJyxVxmsr5A+gVhDp81f51Z/fhaQpfk3LzmFVpzJsG9dbfyWKgtRfQ/HeDTrNwEJ7VCUPTeejG0stHGNUPoTBD4=
X-Received: by 2002:a0d:eb02:0:b0:2e5:9d37:58ba with SMTP id
 u2-20020a0deb02000000b002e59d3758bamr5242814ywe.231.1648738263630; Thu, 31
 Mar 2022 07:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220327202415.1248312-1-Jason@zx2c4.com>
 <20220329050401.110856-1-Jason@zx2c4.com>
 <871qyj8kpk.fsf@dell.be.48ers.dk>
 <CAHmME9oRxF66kB9U93zTXC9EQq4xYTABPrZ9y2dPfhReAZdTpQ@mail.gmail.com>
In-Reply-To: <CAHmME9oRxF66kB9U93zTXC9EQq4xYTABPrZ9y2dPfhReAZdTpQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 31 Mar 2022 10:50:53 -0400
X-Gmail-Original-Message-ID: <CAHmME9r62k=y8+HncT9DnZ=FwwZthF_0ipYzM4jfuSvSRO5EFQ@mail.gmail.com>
Message-ID: <CAHmME9r62k=y8+HncT9DnZ=FwwZthF_0ipYzM4jfuSvSRO5EFQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH v3] package/urandom-scripts: actually credit
 seed files via seedrng
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Mar 30, 2022 at 1:13 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > If this customization is left in, then it should ideally use the
> > existing (directory part of) URANDOM_SEED, which used to be how the
> > location could be customized for backwards compatibility.
>
> As mentioned, no tweaks go up to seedrng.git. That's sample code.
>
> I'm inclined to agree with James' assessment about this, that
> Buildroot needs it to be customizable. Happy to send a v4 of this
> patch adjusting the defaults to have paths similar to what was there
> before.

FYI, I just noticed the old code writes to the file
/var/lib/random-seed. The directory part is /var/lib. Therefore
/var/lib/seedrng/* shares that same directory part. So I think what's
there now fits what you want already? I'll leave that change out of
v4.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
