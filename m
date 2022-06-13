Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3088C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 21:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54EB3827F0;
	Mon, 13 Jun 2022 21:31:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1v9OAkINYg78; Mon, 13 Jun 2022 21:31:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88736827A0;
	Mon, 13 Jun 2022 21:31:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C713C1BF27C
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 21:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B549D408E0
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 21:31:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GcijKODkkB08 for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 21:31:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF24C40002
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 21:31:20 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 m16-20020a7bca50000000b0039c8a224c95so2886648wml.2
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 14:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=bWRXKgPnhqxfXZsvcuTBnjVrWKn7V7LNUx8GhgEu6SA=;
 b=a9pjcH+aJw04uuHwmBhhHJWBULeRIbSUYxUsnCGgxCs9/h5IvQCVHbzQUG2ZDUzeUW
 Vbird6TunscmhTt8XCtIra+01BL9I4TLmSay99xMj6DuIP44uOhh6CBm+cXZ3/8A9PoL
 QbAfoL+P0Pt/8qFs0INfU08VuyAzdoaL7E/qPJd/IvOO97K8GMyHcorLOkDjzQQtIkd6
 aCZD/S38P+v9fUR2+ZYuZXNHa81l8uU8kRmTTPtbISS289pSQ+BdxKlWqzYiK+Bhg3ir
 bKGN/2dJQLcJduToCkr0G5rDPEgBW5fCvztK/+EdivgRg0jWter4bj8cyBnvaVqp2bBB
 CfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=bWRXKgPnhqxfXZsvcuTBnjVrWKn7V7LNUx8GhgEu6SA=;
 b=S0I1967kYQ+Njd/bX9hglrYzpSEwGyXk8MOaaV/1enXY2sY8zgJpgJGdVi0pCmBc5u
 uVUm5zCqddBt9tLD4/PxOPXA0fbXtrm2+OtpDygxrqJh3F5yjJvaesH5AqqBh4VBDHRh
 9/rzJFGZmL6nIdbVF60z4vGP6PAdFoyioWBhB3Ch599quG7jiMXOSDZC2m2L/iCrA+iS
 3CtXT/dcxJzqBNu6AYXOMDw4Fbrb3hGp/OSYPHQTeOn73+pp09KrJIRone+s3VZQTDz8
 wyNjW++S+QbLaEcJghwatyV2NKqeBl1GNOZ+WqXgeKXFGQbyl70pqEg/2hGOkP/Q5EFl
 1vTQ==
X-Gm-Message-State: AOAM5330hXJOm3K7BAOh4o0Ar+Ui/21At53W65q47ubM4QhfSIOu8+OD
 +M3s8SpyXRpfdO7ZzjEQYLs=
X-Google-Smtp-Source: ABdhPJzONC70ikiwdtkVw1ey6gQw1AlQ/1RiHNFY2i5gZUqHfyD2A3MhaVDvRilWyuIqqNxylfvibQ==
X-Received: by 2002:a05:600c:3516:b0:39c:8091:31b6 with SMTP id
 h22-20020a05600c351600b0039c809131b6mr711372wmq.164.1655155878952; 
 Mon, 13 Jun 2022 14:31:18 -0700 (PDT)
Received: from pevik (37-188-191-82.red.o2.cz. [37.188.191.82])
 by smtp.gmail.com with ESMTPSA id
 v187-20020a1cacc4000000b0039749256d74sm14781714wme.2.2022.06.13.14.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 14:31:18 -0700 (PDT)
Date: Mon, 13 Jun 2022 23:31:15 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <Yqeso3ZYuZZatAfQ@pevik>
References: <20220606184320.8210-1-petr.vorel@gmail.com>
 <20220606184320.8210-3-petr.vorel@gmail.com>
 <5d4a4e2b-4d1d-88d6-4905-67083c154775@suse.cz>
 <024cf3d9-f9c1-80a4-8b06-799309912c7f@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <024cf3d9-f9c1-80a4-8b06-799309912c7f@jv-coder.de>
Subject: Re: [Buildroot] [LTP] [PATCH 2/2] kvm: Fix undefined reference to
 __stack_chk_fail()
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Martin Doucha <mdoucha@suse.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

> Hi,


> Am 6/9/2022 um 10:26 AM schrieb Martin Doucha:
> > On 06. 06. 22 20:43, Petr Vorel wrote:
> >> Some x86_64 buildroot toolchains (bootlin-x86-64-glibc,
> >> bootlin-x86-64-musl) try to link to __stack_chk_fail().
> >> -nostdlib is not enough, it requires also -fstack-protector.

> >> x86_64-buildroot-linux-gnu/bin/ld: /tmp/ccgBXEoR.o: in function `handle_page_fault':
> >> kvm_pagefault01.c:(.text+0x5d): undefined reference to `__stack_chk_fail'
> >> collect2: error: ld returned 1 exit status

> >> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> >> ---
> >>  testcases/kernel/kvm/Makefile | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)

> >> diff --git a/testcases/kernel/kvm/Makefile b/testcases/kernel/kvm/Makefile
> >> index 8d5193d8e..bce1a4eb5 100644
> >> --- a/testcases/kernel/kvm/Makefile
> >> +++ b/testcases/kernel/kvm/Makefile
> >> @@ -9,7 +9,7 @@ ASFLAGS =
> >>  CPPFLAGS += -I$(abs_srcdir)/include
> >>  GUEST_CPPFLAGS = $(CPPFLAGS) -DCOMPILE_PAYLOAD
> >>  GUEST_CFLAGS = -ffreestanding -O2 -Wall -fno-asynchronous-unwind-tables -mno-mmx -mno-sse
> >> -GUEST_LDFLAGS = -nostdlib -Wl,--build-id=none
> >> +GUEST_LDFLAGS = -nostdlib -Wl,--build-id=none -fstack-protector

> > We should use -fno-stack-protector here instead. Your patch probably
> > enables linking of libssp despite -nostdlib which we don't want. The GCC
> > stack protector may also break tests because bootstrap initializes stack
> > manually instead of letting GCC handle it.
> I can confirm, that adding -fno-stack-protector to GUEST_LDFLAGS fixes
> the linker error.

Thanks a lot for your input. Martin, thanks a lot for testing.
I also verified that -fno-stack-protector fix compilation, thus patchset merged.

Kind regards,
Petr

> >>  GUEST_LDLIBS =

> >>  FILTER_OUT_MAKE_TARGETS := lib_guest lib_host lib_x86



> Joerg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
