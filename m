Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037A2C54EED
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 23:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59BBF813FC;
	Sun, 29 Jan 2023 23:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59BBF813FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G7245gT8dL-M; Sun, 29 Jan 2023 23:52:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A518E813BD;
	Sun, 29 Jan 2023 23:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A518E813BD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5460F1BF35C
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 23:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DD9740986
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 23:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DD9740986
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VhUswmqKD5b6 for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 23:52:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8B4940948
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8B4940948
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 23:52:00 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id dt8so5676261oib.0
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 15:52:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=clpqPCEzHdm1hGPEyVWzUv6h2jX9h0c6iY/M7+5SIh0=;
 b=n0hPHAC1KDjsWvfM4lK6NiDa9VZqVI1J6PBAQ76nzLCMql9y2s9gqvIGg0cBl1y704
 neoZncXo/ER+Hf4HbMf+rEBDfnIld5+XHVzdWiWJsd/G1bWV6lu4GwTS05RI0J3oEW9K
 5VJKHSuqcFgRZCncrBA8UWk1bN/f5Qhmbu6HXgTeh9owFEMsiegCvCcUHfrTLXpNYwPZ
 GJpPsDzcjJyv/1ZTey7TYN/lMc5djot9UXFXsSPvIIfqYGdFBTKpBfzlIKRHgJrRJOc7
 PxvqY+wIQuup3ZB8RD2BNNv/XfALxTdnmJm7/yHRMeJ1qv2akD3zlXjo4B32uA+p5wZW
 RqLg==
X-Gm-Message-State: AO0yUKVNe9h9p0Sx1gOJfYKof7RgdsQRudHPZdJ9dUZCec766cOfyuMR
 1rpIDq5VQogMOLRoSudfxFC2OTsHtg/5KcCMeDE=
X-Google-Smtp-Source: AK7set/v2sc37hCUeP/qM8/4qT11+8qHq8b2n3L5bILOYC5far9OTdA0NAeWguOqnwGQDj2xpKVGipPsIDvMJ8nnZUk=
X-Received: by 2002:a54:4002:0:b0:378:3f28:221f with SMTP id
 x2-20020a544002000000b003783f28221fmr86849oie.93.1675036319790; Sun, 29 Jan
 2023 15:51:59 -0800 (PST)
MIME-Version: 1.0
References: <20230127141058.2180747-1-james.hilliard1@gmail.com>
 <20230127141058.2180747-4-james.hilliard1@gmail.com>
 <20230129214649.GZ2632@scaer>
In-Reply-To: <20230129214649.GZ2632@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 29 Jan 2023 16:51:48 -0700
Message-ID: <CADvTj4oxTat+vFLLvU3dewO4tL9JZ5kLmho-m6XNxj+bm2prgg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=clpqPCEzHdm1hGPEyVWzUv6h2jX9h0c6iY/M7+5SIh0=;
 b=YdB5IncvX5Qwyc3rkZP1EdFV0wD8YF0/AG9r0qMoCqwWmgqM+Pc0Sj2LNK3EMB5Q5x
 sZ9yh4iE+UPwKcKRJIIoMX325nQ8PSMm651jy3THKmIWOJpoPhyYsWWdvjmJ1zYrRiO8
 MfkKfzejkYA1Egql2/eJ47mvOHxxVn2at77eQcgyGortchD+5asAKNiw+Fzk5JwDQsRb
 VDcoae/MdMiBSOg4iaZliLh6sgN7w6hLG4+/WeRLVKNsvFoq0K1Mb+aEHGLL5DioauO8
 F7ZxWUMadcx+Vlje+uIZDhC65x2++/xAJa9LH7HHmvGcsz6KmGLDf+X56y1xrxBud0TD
 lICQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YdB5Incv
Subject: Re: [Buildroot] [PATCH v4 04/13] package/gemmlowp: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Jan 29, 2023 at 2:46 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2023-01-27 07:10 -0700, James Hilliard spake thusly:
> > From: Stefan Hager <stefan.hager@ginzinger.com>
> >
> > This package is required by tensorflow-lite.
> >
> > Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
> > Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> [--SNIP--]
> > diff --git a/package/gemmlowp/gemmlowp.mk b/package/gemmlowp/gemmlowp.mk
> > new file mode 100644
> > index 0000000000..1a36fc48f7
> > --- /dev/null
> > +++ b/package/gemmlowp/gemmlowp.mk
> > @@ -0,0 +1,15 @@
> > +################################################################################
> > +#
> > +# gemmlowp
> > +#
> > +################################################################################
> > +
> > +GEMMLOWP_VERSION = 08e4bb339e34017a0835269d4a37c4ea04d15a69
> > +GEMMLOWP_SITE = $(call github,google,gemmlowp,$(GEMMLOWP_VERSION))
> > +GEMMLOWP_LICENSE = Apache-2.0
> > +GEMMLOWP_LICENSE_FILES = LICENSE
> > +GEMMLOWP_INSTALL_STAGING = YES
> > +GEMMLOWP_INSTALL_TARGET = NO
>
> Why not install to target? This needs a little explanations, even if
> it's only a comment above, like:  # Only installs headers

Yeah, it's another header-only library.

>
> Regards,
> Yann E. MORIN.
>
> > +GEMMLOWP_SUBDIR = contrib
> > +
> > +$(eval $(cmake-package))
> > --
> > 2.34.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
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
