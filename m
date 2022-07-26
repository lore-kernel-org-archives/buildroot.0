Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3437C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 17:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 352044174B;
	Tue, 26 Jul 2022 17:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 352044174B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8g74FP9gmWG4; Tue, 26 Jul 2022 17:18:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36AA84174A;
	Tue, 26 Jul 2022 17:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36AA84174A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 971381BF9B4
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F18C408B0
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F18C408B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gLdgF2t1Vgy2 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 17:18:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CD6F40990
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1CD6F40990
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 17:18:24 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 s10-20020a4ab54a000000b00435f410bbacso679981ooo.9
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 10:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gB/dcTfCawySpfZfGAdVJiE1xh5T1ND2WfyUGjao0X4=;
 b=HOyn6E8YN4lCJBnzjYMNXkvOsjPF86pKTDomOY5Q65BuGySKeUeT71FzdWa2JmgWpn
 cA+l3yxWeYiiALHB1UtmUrRd+52ynBY5OETUeuur80SHdlpK64zcP+sJ7xH622K9l5NS
 cniN8oXz0TQNlCjwCnn0ultzaivHcd9UjDyabSWdiv8vI0r5OYHSk+Gu+HkSuTnqJv+V
 4sm4hlyQXcZ4tG2EkMeRC7nR3kYk8Zk0ek4unYdqVQiqgXxtageBEsZbG1mcXpRrMXNj
 V96tS/npAkV0CkGcCXNbIzSpsmUAUleTgIYQIXQpfSsJ+cZn+pMH9XjbZFBm8QCPaTM9
 hFFA==
X-Gm-Message-State: AJIora9x57zHO9smiMo0NjJFiygVLdP1GRHT+jdFqOSRU35ka5GBzLfD
 ugl7GNF/w7yoGXRul3WsumiODZNeQs7BUKVAJXMJCMJ49ZHccA==
X-Google-Smtp-Source: AGRyM1tnoy+wA/5CKLUqqqghepPovD3ldJoTZKzXR/omjSbuYwwhq0WNfZnA1VvZKr3B+zVjhw6X4TRsjrGwTAPMWIg=
X-Received: by 2002:a05:6820:180b:b0:435:9610:e9ac with SMTP id
 bn11-20020a056820180b00b004359610e9acmr6170082oob.14.1658855903032; Tue, 26
 Jul 2022 10:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220726063400.2321251-1-james.hilliard1@gmail.com>
 <20220726084726.GI3168@scaer>
 <CADvTj4oJCWJ2Pq4US_QAo34sSi_w6LZqt-t=w_v78VvviVfRfg@mail.gmail.com>
 <20220726162818.GM3168@scaer>
In-Reply-To: <20220726162818.GM3168@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 26 Jul 2022 11:18:11 -0600
Message-ID: <CADvTj4qD68Ans+OyCopSZoEuxawWKa+pY-a3uGvqZJeLLD6FcA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=gB/dcTfCawySpfZfGAdVJiE1xh5T1ND2WfyUGjao0X4=;
 b=mJouVULbrDC88lLhReyTHeDpxO1iu6mkpRrGS7B+zrGIskZ/6HC/cNXpAXG1vw02Gv
 XqJP3GrBPxs+WCiUT/dUEjR8BQK2MbVsxVc3OG4Y1nTIqjPXqqNfIFURcKb5Xk8VO74R
 xSkh0QeK1hBmeoFWSfNcSY9981qspDVu77D7Z1v1ex5rGP3fPnvZVNZRSZjtwQE9G5ua
 7/+jGJE4Sqt6j/7pbqbzp/5Wwp7gZ9DXeMXxizPbupkgJUKOqUhr8JguyKst2JmYneDv
 2uKxa7nznOqNJQqFauy2IUmmxBUGImuPJj4bgpnpnJYvrHEy+DMZVW+328CINpaBotdh
 T/iw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mJouVULb
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: set cpp_rtti option
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Jul 26, 2022 at 10:28 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2022-07-26 09:31 -0600, James Hilliard spake thusly:
> > On Tue, Jul 26, 2022 at 2:47 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > On 2022-07-26 00:34 -0600, James Hilliard spake thusly:
> > > > This needs to be set based on BR2_PACKAGE_LLVM_RTTI being set.
> > > BR2_PACKAGE_LLVM_RTTI is a sub-option of llvm, so it somehow means
> > > that llvm should be a dependency of mesa3d, which your patch does not
> > > add.
> > It's an optional dependency.
>
> I know. But how does it make sense to add BR2_PACKAGE_LLVM_RTTI without
> a dependency on llvm?
>
> And note that mesa3d does not use the fact that llvm is enabled, to
> enable its llvm support; one has to explicitly request it with
> BR2_PACKAGE_MESA3D_LLVM.
>
> > > But we already have a conditional dependency on llvm, so this nex rtti
> > > option should be a sub-condition of BR2_PACKAGE_MESA3D_LLVM?
> > Setting -Dcpp_rtti=false when llvm isn't used is harmless, it seemed clearer
> > to just have the single independent conditional for BR2_PACKAGE_LLVM_RTTI.
>
> If you have a configuration with:
>
>     BR2_PACKAGE_LLVM=y
>     BR2_PACKAGE_LLVM_RTTI=y
>     BR2_PACKAGE_MESA3D=y
>     # BR2_PACKAGE_MESA3D_LLVM is unset
>
> Then llvm support is not built in mesa3d, yet your code would cause us
> to pass -Dcpp_rtti=true, which does not seem to make sense.

I think I did it this way in case llvm gets pulled in as a transient dependency
down the line.

I mean -Dcpp_rtti=true is still technically accurate when
BR2_PACKAGE_LLVM_RTTI=y even if BR2_PACKAGE_MESA3D_LLVM isn't
set, it's just unused internally by mesa3d in that case I think.

Having it separate from BR2_PACKAGE_MESA3D_LLVM seems to make
things less likely to break in the event of llvm getting pulled in as
a transient
dependency in the future.

>
> So, I think we want that to move to the existing condition, like so:
>
>     diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
>     index 96520e2efd..980faced31 100644
>     --- a/package/mesa3d/mesa3d.mk
>     +++ b/package/mesa3d/mesa3d.mk
>     @@ -48,6 +48,11 @@ ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
>      MESA3D_DEPENDENCIES += host-llvm llvm
>      MESA3D_MESON_EXTRA_BINARIES += llvm-config='$(STAGING_DIR)/usr/bin/llvm-config'
>      MESA3D_CONF_OPTS += -Dllvm=enabled
>     +ifeq ($(BR2_PACKAGE_LLVM_RTTI),y)
>     +MESA3D_CONF_OPTS += -Dcpp_rtti=true
>     +else
>     +MESA3D_CONF_OPTS += -Dcpp_rtti=false
>     +endif
>      else
>      # Avoid automatic search of llvm-config
>      MESA3D_CONF_OPTS += -Dllvm=disabled
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
