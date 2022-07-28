Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2922EC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 01:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBE52408D7;
	Thu, 28 Jul 2022 01:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBE52408D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PCYzX0dcsV-Z; Thu, 28 Jul 2022 01:48:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EF594089B;
	Thu, 28 Jul 2022 01:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EF594089B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCF331BF393
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 01:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B875560E9E
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 01:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B875560E9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zee2sKeKj-mg for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 01:48:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5F5B60EC1
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5F5B60EC1
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 01:48:26 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so704272fac.9
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 18:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nols+NE+Tdp8hjVMgQCu/1hff4V269QZAbi4+X/BxgE=;
 b=gkNlhWFdrZ0NzNCP9oZqlYAxhtDsaBRsRPnLaxdjTgurIxHJutl50FuoWW2CRiLFI0
 HydbfN4ohCFZ80oGeG++JKOVOWx6Zrasb2z1ncFSHda/WaVUPNrw5OW67gDdLOg3a2Zf
 Wcj2rdSIounubOgGW4SqG3BxAeOb3zvNRSLLeQWGqzvFgL7TEEeQ0SMuEK3390Q6Lwoe
 Iegrs84Es6H89wn5fk/pyG3nQbYVh6rtSgtP9ZkiEp4VXEW6elRdH4uhUmhLWbf0isrt
 mMPPOM6mdvfETpyWSqONfFJsYEaMObNnVfuenS2skpyWKP7scuY8aEdyxXypwR4H7T7E
 HBcw==
X-Gm-Message-State: AJIora/PU8SP8YYEs8PDCSWyQM388bCO7zPD4vi5jR7q7ANXiymiYPGn
 qsNAkJYf9teVAMeM+vesvTvXI1kEvJxsRDyoKaA=
X-Google-Smtp-Source: AGRyM1t1C6H+xVMXnyp+jqUz3Y6hffhoQa5ArduRG699+ZYhoNrDHFyais7fx5XuC5AeMDBAdI4G5O0K7QLl7yjm9vs=
X-Received: by 2002:a05:6870:8314:b0:10c:cc1a:57fc with SMTP id
 p20-20020a056870831400b0010ccc1a57fcmr3715566oae.153.1658972905622; Wed, 27
 Jul 2022 18:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220727071557.3434892-1-james.hilliard1@gmail.com>
 <20220727071557.3434892-2-james.hilliard1@gmail.com>
 <0b33098c-cdf6-d59a-0ee3-fc9821de53ba@mind.be>
 <CADvTj4qO6bzEjEG4Hs8Cy9McBqs0Vj4Pq37ZTw+h468OeCZLvA@mail.gmail.com>
 <20220727191855.GA1265196@scaer>
In-Reply-To: <20220727191855.GA1265196@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 27 Jul 2022 19:48:14 -0600
Message-ID: <CADvTj4qHOLX3cLsfc6Sc15-yJnKkjYFXLmQcRxhPapQOnbz0Vg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=nols+NE+Tdp8hjVMgQCu/1hff4V269QZAbi4+X/BxgE=;
 b=G+1SYiBN4AXAJAW5IGO9qAvCabZ/y6qTUOUMukbv80dEeUpEwUWWE68ecLvt/ArCOi
 vkQM61k01QsHS4QVkZ8J1Z6iFHHNiT87bNIodg0wENfkmUrzPY3MExC+Ma9IDQuqJRYH
 ibQlZRAqXu+hS11MjlKe79e8aQYhuEeAilBG9TJh7tRE01XseHsplhFIukHutesCNda+
 d2XnqZDBRBj3yRo0/9csr97L/2MlBQvxUJvWm8B0cKlJUVLJUwZsozQVmpQXRZUPDO4o
 ZLPSOr91n9+JBBl+IbHK3BsoL0SNWZ5rT+ZowRnjYYuSXDhXjXkIWy5Sm29FOTAsMalm
 b/wA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=G+1SYiBN
Subject: Re: [Buildroot] [PATCH v5 2/2] package/pkg-meson: use meson to
 build/install packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot <buildroot@buildroot.org>, Norbert Lange <nolange79@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jul 27, 2022 at 1:19 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2022-07-27 12:33 -0600, James Hilliard spake thusly:
> > On Wed, Jul 27, 2022 at 5:08 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> > > On 27/07/2022 09:15, James Hilliard wrote:
> [--SNIP--]
> > > > We need to set --pkgconfig.relocatable so that pkg-config files are
> > > > not generated with absolute paths which cause issues with per-package
> > > > directories.
> > >   This still doesn't explain how it is related to using meson rather than ninja.
> > > Are you saying that when calling ninja directly, PPD work perfectly fine, but if
> > > it's installed with meson, it doesn't? Then I'd really like to have a little
> > > more insight into what meson does to break it.
> > Well, the issue seems to be that without --pkgconfig.relocatable meson install
> > messes up the paths during install due to generating absolute pkgconfig paths
> > while ninja doesn't.
>
> But does that actually causes any real issue and build breakage?

Appears to break when using meson's install.

>
> For the non-PPD case, that should not be an issue, as the HOST_DIR (and
> STAGING_DIR, below it) are constant throughout the build.
>
> For the PPD case, we have a prepare hook that fixes the paths in all
> text files, see b06294e9897e (core/pkg-generic: fixup all PPD paths in a
> generic fashion). So this should be covered.
>
> For the SDK, there is a script that does something very similar to the
> PPD case, so again there should be no issue.
>
> What is it that you actually want to achieve with relative paths, that
> is currently broken with absolute paths?

Looks like the relocatable format works fine without meson's install:
https://patchwork.ozlabs.org/project/buildroot/patch/20220728014402.142320-2-james.hilliard1@gmail.com/

Although the cmake prefix fix is also needed:
https://patchwork.ozlabs.org/project/buildroot/patch/20220728014402.142320-1-james.hilliard1@gmail.com/

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
