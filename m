Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C59BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 13:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B82341934;
	Sat, 23 Jul 2022 13:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B82341934
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oMoVx1Mu1RQc; Sat, 23 Jul 2022 13:15:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7082141712;
	Sat, 23 Jul 2022 13:15:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7082141712
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 305E81BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1737941712
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:15:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1737941712
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cWuaJgk9OzOk for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 13:15:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD522416FD
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD522416FD
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:15:49 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id c72so5838890edf.8
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 06:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xGLto/Me3sFw2WfWOUKKfwa38utKNT936N14b6UCTpc=;
 b=IyJJoUahcwS0PpkdsyQMxNbIZ34eO+QNXPgTGB1vxcBhL9I+L0XcJCullOvd+jsbWP
 TcMwACVbaYWIZLgbNdAnlHdNUiM4+NA1rlz8LFtVAM3iwt63xdyc+8m8SZm1YOyNxYP9
 09vweQjwPC5EJASoVRZNvGNQLezyiy9sQ+oD2Vlf0/RbVywapBTr/VynP9jvDgI+iXRY
 y6o2DTDTnqqgmlI85t/lvIYw8S10KgBni/Na5NHQLlYoTyva0aazlsNx4EhxbwvH/fOs
 L8f9uFDkWoPBVMrnAWeAyS0TcajHRl+5FYpirVx1iAZ7oyMFVxCJX9N5ri6NpiSekZ/b
 Uicw==
X-Gm-Message-State: AJIora835dxgVLvDD5tjpU8piCx8rT4bRUpktE74Djr4Dqjq61hRzPJM
 o8UCHu+rvs3l8VLOzaKXGo8O3r5yS0Tja/1d6+k=
X-Google-Smtp-Source: AGRyM1t2q4Fi5hbofUYZzsOReE7IwXm+Xg8WNbrU6hDoqCTCZDQWHgVyCG0x1p7s9NqmjUL/S2Ssizhf5dPZfcoyEhA=
X-Received: by 2002:a05:6402:27d2:b0:43b:dffd:684c with SMTP id
 c18-20020a05640227d200b0043bdffd684cmr2229243ede.328.1658582147766; Sat, 23
 Jul 2022 06:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220722100920.00132969@windsurf>
 <CAMo8BfJ+AdrewRkuZzMq+_4w6=A-7SkC16MXneWkTHJ+i_=Crw@mail.gmail.com>
 <20220722141750.0311355d@windsurf>
In-Reply-To: <20220722141750.0311355d@windsurf>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 23 Jul 2022 06:15:51 -0700
Message-ID: <CAMo8BfJvP-Jkz2EWci9cq4ctdQ5p5pLOVOAeEZwj2BLfmyihwQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=xGLto/Me3sFw2WfWOUKKfwa38utKNT936N14b6UCTpc=;
 b=iC7zypm4mNuBWAwrpqJPoWfC6FGrz066Vu+9N9sJFlYX21K4VeDfbY4HoWoILIoYhE
 33948WvGX5TnK9mqDr+GxSUkGqKsHCt+s9g9f0IHPAojzXnkiXWxsOiYTVc04Jq8Sf3k
 hzY9I+bShIxppN+N7bpLt8XkDI0+Hb4nd6sR6/0yETv5vw4HJARBD4kWL4/fIeKFIc8X
 fu0my3sAGarXvxKTeNkKKivpl3GO+m8V6SarzjS+GlZMPLVEJ/MNqullN8Gf0OeWotCD
 Gx7E8vHfHiHHc00OsPwvHx+NRHKGiu9p5+TRBijOREL8S1YkRK+gBsdCx6Goe2dPbtxe
 Z7Tw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iC7zypm4
Subject: Re: [Buildroot] uclibc-ng build failures on Xtensa
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Fri, Jul 22, 2022 at 5:17 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> On Fri, 22 Jul 2022 04:24:16 -0700  Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> > > And the default is BR2_XTENSA_LITTLE_ENDIAN, while normally for
> > > BR2_xtensa_fsf, the endianness is BIG.
> > >
> > > Which configurations are supported?
> >
> > When BR2_XTENSA_CUSTOM is selected BR2_XTENSA_OVERLAY_FILE
> > must be specified and selected endianness must match the endianness of the
> > configuration in the overlay file. Empty BR2_XTENSA_OVERLAY_FILE is
> > equivalent to fsf and it is big endian.
>
> Hm, OK. So what should we do from a testing point of view? Disregard
> any testing of the BR2_XTENSA_CUSTOM case?
>
> It's kind of weird to have BR2_XTENSA_LITTLE_ENDIAN be the default if
> the default is actually big endian (when there is no overlay file).

I agree.

> What do you think of:
>
> diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
> index 45ad2dc487..a69964f515 100644
> --- a/arch/Config.in.xtensa
> +++ b/arch/Config.in.xtensa
> @@ -31,7 +31,7 @@ config BR2_XTENSA_OVERLAY_FILE
>  choice
>         prompt "Target Architecture Endianness"
>         default BR2_XTENSA_LITTLE_ENDIAN
> -       depends on BR2_XTENSA_CUSTOM
> +       depends on BR2_XTENSA_CUSTOM && BR2_XTENSA_OVERLAY_FILE != ""
>
>  config BR2_XTENSA_LITTLE_ENDIAN
>         bool "Little endian"
> @@ -43,7 +43,9 @@ endchoice
>
>  config BR2_ENDIAN
>         default "LITTLE"        if BR2_XTENSA_LITTLE_ENDIAN
> -       default "BIG"           if BR2_xtensa_fsf || BR2_XTENSA_BIG_ENDIAN
> +       default "BIG"           if BR2_xtensa_fsf
> +       default "BIG"           if BR2_XTENSA_CUSTOM && BR2_XTENSA_OVERLAY_FILE = ""
> +       default "BIG"           if BR2_XTENSA_BIG_ENDIAN
>
>  config BR2_ARCH
>         default "xtensa"        if BR2_xtensa
>
> i.e basically: don't choice the endianness choice when the overlay file
> is empty, and enforce the fact that the endianess is big when
> BR2_XTENSA_CUSTOM with an empty overlay file.

This looks reasonable, yes.

> > > Is there something to fix here, or
> > > we just need to disallow the usage of little endian?
> >
> > Little endian xtensa configurations are well supported, see e.g.
> > configs/qemu_xtensa_lx60_defconfig that uses the dc233c core.
>
> I see there are quite a few overlays at
> https://github.com/jcmvbkbc/xtensa-toolchain-build/tree/master/overlays
> for well-known cores. Would it make sense to have explicit support for
> some of them in Buildroot? At least having support for one of the
> little endian cores seems useful to increase the testing coverage.

Maybe dc233c then, it's been the standard xtensa core for linux so far.

-- 
Thanks.
-- Max
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
