Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE8CC25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 20:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25C4F41578;
	Tue, 16 Aug 2022 20:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25C4F41578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o-wQJJeih9yN; Tue, 16 Aug 2022 20:41:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4F1741299;
	Tue, 16 Aug 2022 20:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4F1741299
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C2E721BF2A2
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AACD5404F3
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AACD5404F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8neArURWjXdM for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 20:40:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4296E404C8
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4296E404C8
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 20:40:58 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id h27so4608354qkk.9
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 13:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc;
 bh=sK3qlzYvhsElFn41IzzdjsWRF8gytT6FRDjjco6pX48=;
 b=A8H2jQOFs4fZgHNUkU0RoqUCUjbWWEfTXWoCl/t/X2DQRXj+583yhZ/+sqQgmkAcED
 paFxqWgTHOtnlrlUnx0I3YMeKlKD49DtJ5ZFPe6RXfJ4eguAbVSTxprEVIv8OyhdnCv6
 GZRwZ57WbJlh3aCBUkHoXZRxHbmTSiJ/aJ1ndJBbYHCFUGS4TVzbH6Acu62Cu1/oQ7ls
 sgX/BtKUi1Eyf0WnyUt3l6HKWpclujZboIlHg90ZiLAC0T9BIQfNX32Lke9OBrFqv/MC
 VjLBm61IEI9I1mPF1v0yR2fRKM15fD5NftDYd97PsAAtZ6vygQQqMC7akB5J0BZDH9Pk
 6x0Q==
X-Gm-Message-State: ACgBeo3EeuadsUkP+rPfx2PHn1vtNgFzOWy2GBIgjtSJhVSfxKZUaRqW
 XC+QasgLZFla3PtAp+hhSq9nMw==
X-Google-Smtp-Source: AA6agR4m2oioQLATOBuFjW5kRsTXThEk887h0p5eZs/g+KeRMK5uP1pyHEJ4PdWdL1EDMjwBQ1fM4Q==
X-Received: by 2002:a05:620a:c44:b0:6b6:5c63:aebc with SMTP id
 u4-20020a05620a0c4400b006b65c63aebcmr16496210qki.170.1660682456856; 
 Tue, 16 Aug 2022 13:40:56 -0700 (PDT)
Received: from hefring ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 az30-20020a05620a171e00b006bb8b5b79efsm23363qkb.129.2022.08.16.13.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 13:40:56 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Date: Tue, 16 Aug 2022 16:40:54 -0400
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <YvwA1lYOHZXK0GvU@hefring>
References: <20220802133009.1282520-1-Ben.Wolsieffer@hefring.com>
 <b71a7617-3e26-14ef-6fe6-45e766924270@arm.com>
 <YvV2kelJpRw6erhZ@hefring>
 <7d0fcbf1-144e-b6d3-7b38-6caa3348703d@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d0fcbf1-144e-b6d3-7b38-6caa3348703d@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc;
 bh=sK3qlzYvhsElFn41IzzdjsWRF8gytT6FRDjjco6pX48=;
 b=cSO/BWsIZ8hWymHipj1oMzN08C6Sb1TMyOL8v3jzV58/0gCOnygpON5ASYryQYAtuS
 GvQDviQjHFGx5diQOIWVuUNBUAdFYrAfhmF0f15kqPO1uz7P53PyPOruh8sWUhG9FRG1
 XkLXbWv/gd9xQBbYsf1G61p/iMgNmfWgi4hRfnNsZOC4fN5rpFiqsbod8J1krUk0+JHM
 gEeLuE6bhGvTbwrJtFYFpcsRXXbVcbCvr0YKnIWeIGM1VuT2WYw8TO2IPReM+dAbr0Lg
 jAj2UI0NuEyUGvsoSd+J4HJgp0I13y8vY4R+M02w6+eEGET028N+jx6R3EMBYPaskX6p
 Q0XQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=cSO/BWsI
Subject: Re: [Buildroot] [PATCH 0/2] Add support for FDPIC binaries on ARM
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
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Aug 14, 2022 at 11:55:37PM +0200, Arnout Vandecappelle wrote:
> > 
> > I've been playing around with NPTL and FDPIC and it doesn't quite work
> > perfectly out of the box. Static libraries (linked into a dynamic
> > executable) crash when attempting to use TLS. In addition, the reason
> > static libraries are even being used is because libtool doesn't recognize
> > the target name and therefore thinks it can't build shared libaries.
> > 
> > There was a patch [1] submitted a few years ago to add the target to
> > libtool, but it looks like it was ignored. Unfortunately, we can't just
> > apply it in Buildroot, unless we want to run autoreconf on every
> > package. I'm working around this locally with a hacky hook to patch
> > configure scripts, but I'm not sure it is appropriate to upstream.
> 
>  This problem exists for a number of architectures. For that reason, we have
> a workaround: the LIBTOOL_PATCH_HOOK [1]. For any autotools package, we
> search for ltmain.sh files in the source, parse out the libtool version from
> it, and apply the appropriate patch from support/libtool/
> 
>  In other words, the solution is to extend the patches in support/libtool/
> with the missing architecture.
> 

In this case, the relevant file is libtool.m4, and this file gets
expanded into configure. Therefore, we either need a patch for configure
for each libtool version (like LIBTOOL_PATCH_HOOK), or use sed to patch
any matches against "linux*". I've been using the sed solution, which is
far simpler, but I'm not sure it is clean enough to be included upstream.

Ben

> 
>  Regards,
>  Arnout
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/pkg-autotools.mk#L60
> 
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
