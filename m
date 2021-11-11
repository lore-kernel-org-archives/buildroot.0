Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED199C433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 11:22:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B23C60F51
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 11:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B23C60F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B67381518;
	Thu, 11 Nov 2021 11:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AMTeaYyKvSbI; Thu, 11 Nov 2021 11:22:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BD9E81773;
	Thu, 11 Nov 2021 11:22:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AEBB31BF39F
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 11:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C935400C8
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 11:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1RGYpdjRlkfH for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 11:22:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF0FD400A8
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 11:22:21 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d3so9199796wrh.8
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 03:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I1syHfTxixn8WwQ7Qen57kuXanhFW8wbCzYPT8K8yyE=;
 b=Q/yl7Y4kFbb1KYXldrCb6Eqa8sQzf1ARdf9wMnG4JyTi9JLCTnDoppZ+8pGmbNJmRC
 y8xoMr/ZxjX2mlIW8fBl7L4GnUvfFBwmUhNa2wowK/TS1+DQuJv2Lm5daqAdM2LNItZr
 IAtjMl8KQrx8p90w/ii0QaiCOSBoQ6PH15F5axmNV7AkBfmK08hzNc14HHtaQc5ElDry
 Z6KuN0z4s7vWuYx0OqVgwTOwalAHH7yux5HyI3wpD60jKcl2diMbIJ5eO4X30e9LceK4
 DqnW6/mPeLO0Uc9OFGpUphxJ7qEveRvol+HsPTMuWzJe9xwaGOtyoRbkuMuUGHBQJ2vD
 7UBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I1syHfTxixn8WwQ7Qen57kuXanhFW8wbCzYPT8K8yyE=;
 b=dhqJ/w77zWrTkIpjyxTpqmZnhjy484MkJGkzPVZLNO3Yyg5woV5aNpeMBvugcYmeBm
 APkf5ez/FcP5W4A7zsD0x3u2YWvsH5ye7N+IHymJL3/1/+YdmxQD7frR8TMztjlLJKVe
 /nsHbbF5Fxce4XVPXpQxbWITkedhgiV6YB1tGpXhJv8fVzhr/YuETOs9V0+ZZFGkh6Vt
 0wS3W7MvWTXj6a0Q52ZPj3V5Ch7UnIqf8XkqbFrdeelBo0TmbR4Uq4brxI7E1SPeMs7U
 0yISK7Nwi+8Ep+1dkbN/6nOcJBiAKPUUpQ1p/xNXwi3cD10VTZpmSENEXU+yPUm68FdS
 fsGQ==
X-Gm-Message-State: AOAM533HLH3QNHrygbgDdUI4Pmo4gf4BUBcMje2ut9f3C5kWpvVNgI5h
 Rdojoz5IeyZMzeZcJ3sgJx8=
X-Google-Smtp-Source: ABdhPJy3/IztYFl4wCG1sYJ2Pr4HqMRiJyd/6X0aN07YA4oO6RnvqhIzDiyxCFo3xN+MskeqM8KSBw==
X-Received: by 2002:adf:db47:: with SMTP id f7mr7819099wrj.113.1636629740051; 
 Thu, 11 Nov 2021 03:22:20 -0800 (PST)
Received: from camb691.localdomain (ozlabs.org. [203.11.71.1])
 by smtp.gmail.com with ESMTPSA id o8sm2570440wrm.67.2021.11.11.03.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 03:22:19 -0800 (PST)
Date: Thu, 11 Nov 2021 11:20:50 +0000
From: Cyril Bur <cyrilbur@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211111112050.593f2496@camb691.localdomain>
In-Reply-To: <20211111081339.GS2084998@scaer>
References: <20211011220025.7998-1-petr.vorel@gmail.com>
 <20211011220025.7998-3-petr.vorel@gmail.com>
 <20211028145212.36dcb38a@camb691.localdomain>
 <20211111081339.GS2084998@scaer>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC PATCH 2/3] make: Drop `type -p ...' fallback
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
Cc: Markus Mayer <mmayer@broadcom.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 11 Nov 2021 09:13:39 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Cyril, All,
> 
> On 2021-10-28 14:52 +0100, Cyril Bur spake thusly:
> > On Tue, 12 Oct 2021 00:00:24 +0200
> > Petr Vorel <petr.vorel@gmail.com> wrote:
> >   
> > > `command -v' is good enough as it's POSIX.
> > > For easier debugging previous problems removed separately.
> > >   
> > 
> > On doing some reading[1] I've discovered that this is a minefield.  
> 
> Hmm.. A very long history lesson. Thanks! :-)
> 
> > Having said that, I'm pretty sure what currently happens isn't
> > good either.
> > 
> > My only concern might be that theres old RHEL (its always RHEL ;))  
> 
> **jiggles**


I'll add that I have tried to test on the old RHEL VM that colleagues
insist on still using and the build doesn't work, no fault of BR though.
I suspect that all working directories are actualy mounted on top of a
FAT or some funky windows share (I can't see the underlying store) so
`cp -p ...` fails because the unlieing store (whatever it is) can't do
the correct permissions (educated guess). I can't remember which
package (I think perhaps libc) uses these copies so they fail.

Yes I did try to run out of a tmpfs but didn't have access to one big
enough.

I don't expect a fix, just thought I'd make you aware. Also, just to be
clear those problems are obviously nothing to do with this patch or
series!

> 
> > systems out there which could break. Some of my coleagues use old
> > RHEL VMs for their build machines. I'm going to try and see if I
> > can get access but I wouldn't hold up the patch waiting.
> > 
> > I've given this patch applied with the previous one a test and is
> > working fine on my system. I'm wondering if my tested by tag is
> > appropriate for the previous patch since I haven't tested it in
> > isolation.  
> 
> A tested-by tag is always welcome: it means some people were
> interested enough that they went off their daily lives and took time
> to test the patch.
> 

Glad to be of assistance.

Cyril

> Thaks!
> 
> Regards,
> Yann E. MORIN.
> 
> > uname -a
> > Linux 5.14.12-arch1-1 #1 SMP PREEMPT Wed, 13 Oct 2021 16:58:16
> > +0000 x86_64 GNU/Linux
> > 
> > make --version
> > GNU Make 4.3
> > Built for x86_64-pc-linux-gnu
> > 
> > /bin/sh --version
> > GNU bash, version 5.1.8(1)-release (x86_64-pc-linux-gnu)
> > 
> > [1]
> > https://unix.stackexchange.com/questions/85249/why-not-use-which-what-to-use-then
> > 
> > Tested-by: Cyril Bur <cyrilbur@gmail.com>
> > Reviewed-by: Cyril Bur <cyrilbur@gmail.com>  
> > > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>  
> > 
> > 
> >   
> > > ---
> > >  Makefile            | 22 +++++++++++-----------
> > >  package/Makefile.in |  6 +++---
> > >  2 files changed, 14 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/Makefile b/Makefile
> > > index 2317655272..81b7173974 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -284,12 +284,12 @@ HOSTAS := as
> > >  endif
> > >  ifndef HOSTCC
> > >  HOSTCC := gcc
> > > -HOSTCC := $(shell $(SHELL) -c "command -v '$(HOSTCC)' || type -p
> > > '$(HOSTCC)' || echo gcc") +HOSTCC := $(shell $(SHELL) -c "command
> > > -v '$(HOSTCC)' || echo gcc") endif
> > >  HOSTCC_NOCCACHE := $(HOSTCC)
> > >  ifndef HOSTCXX
> > >  HOSTCXX := g++
> > > -HOSTCXX := $(shell $(SHELL) -c "command -v '$(HOSTCXX)' || type
> > > -p '$(HOSTCXX)' || echo g++") +HOSTCXX := $(shell $(SHELL) -c
> > > "command -v '$(HOSTCXX)' || echo g++") endif
> > >  HOSTCXX_NOCCACHE := $(HOSTCXX)
> > >  ifndef HOSTCPP
> > > @@ -310,15 +310,15 @@ endif
> > >  ifndef HOSTRANLIB
> > >  HOSTRANLIB := ranlib
> > >  endif
> > > -HOSTAR := $(shell '$(SHELL)' -c "command -v '$(HOSTAR)' || type
> > > -p '$(HOSTAR)' || echo ar") -HOSTAS := $(shell '$(SHELL)' -c
> > > "command -v '$(HOSTAS)' || type -p '$(HOSTAS)' || echo as")
> > > -HOSTCPP := $(shell '$(SHELL)' -c "command -v '$(HOSTCPP)' ||
> > > type -p '$(HOSTCPP)' || echo cpp") -HOSTLD := $(shell '$(SHELL)'
> > > -c "command -v '$(HOSTLD)' || type -p '$(HOSTLD)' || echo ld")
> > > -HOSTLN := $(shell '$(SHELL)' -c "command -v '$(HOSTLN)' || type
> > > -p '$(HOSTLN)' || echo ln") -HOSTNM := $(shell '$(SHELL)' -c
> > > "command -v '$(HOSTNM)' || type -p '$(HOSTNM)' || echo nm")
> > > -HOSTOBJCOPY := $(shell '$(SHELL)' -c "command -v
> > > '$(HOSTOBJCOPY)' || type -p '$(HOSTOBJCOPY)' || echo objcopy")
> > > -HOSTRANLIB := $(shell '$(SHELL)' -c "command -v '$(HOSTRANLIB)'
> > > || type -p '$(HOSTRANLIB)' || echo ranlib") -SED := $(shell
> > > $(SHELL) -c "command -v sed || type -p sed") -i -e +HOSTAR :=
> > > $(shell '$(SHELL)' -c "command -v '$(HOSTAR)' || echo ar")
> > > +HOSTAS := $(shell '$(SHELL)' -c "command -v '$(HOSTAS)' || echo
> > > as") +HOSTCPP := $(shell '$(SHELL)' -c "command -v '$(HOSTCPP)'
> > > || echo cpp") +HOSTLD := $(shell '$(SHELL)' -c "command -v
> > > '$(HOSTLD)' || echo ld") +HOSTLN := $(shell '$(SHELL)' -c
> > > "command -v '$(HOSTLN)' || echo ln") +HOSTNM := $(shell
> > > '$(SHELL)' -c "command -v '$(HOSTNM)' || echo nm") +HOSTOBJCOPY
> > > := $(shell '$(SHELL)' -c "command -v '$(HOSTOBJCOPY)' || echo
> > > objcopy") +HOSTRANLIB := $(shell '$(SHELL)' -c "command -v
> > > '$(HOSTRANLIB)' || echo ranlib") +SED := $(shell $(SHELL) -c
> > > "command -v sed") -i -e export HOSTAR HOSTAS HOSTCC HOSTCXX
> > > HOSTLD export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE diff --git
> > > a/package/Makefile.in b/package/Makefile.in index
> > > 2ba4d8b381..4e993ecd5f 100644 --- a/package/Makefile.in +++
> > > b/package/Makefile.in @@ -4,7 +4,7 @@ endif ifndef HOSTMAKE
> > > HOSTMAKE = $(MAKE) endif -HOSTMAKE := $(shell $(SHELL) -c
> > > "command -v '$(HOSTMAKE)' || type -p '$(HOSTMAKE)' || echo make")
> > > +HOSTMAKE := $(shell $(SHELL) -c "command -v '$(HOSTMAKE)' ||
> > > echo make") # If BR2_JLEVEL is 0, scale the maximum concurrency
> > > with the number of # CPUs. An additional job is used in order to
> > > keep processors busy @@ -222,8 +222,8 @@ else
> > >  TARGET_STRIP = /bin/true
> > >  STRIPCMD = $(TARGET_STRIP)
> > >  endif
> > > -INSTALL := $(shell $(SHELL) -c "command -v install || type -p
> > > install") -UNZIP := $(shell $(SHELL) -c "command -v unzip || type
> > > -p unzip") -q +INSTALL := $(shell $(SHELL) -c "command -v
> > > install") +UNZIP := $(shell $(SHELL) -c "command -v unzip") -q
> > >  
> > >  APPLY_PATCHES = PATH=$(HOST_DIR)/bin:$$PATH
> > > support/scripts/apply-patches.sh $(if $(QUIET),-s)   
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot  
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
