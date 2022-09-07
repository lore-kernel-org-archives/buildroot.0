Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C60C38145
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 22:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D04883EB2;
	Wed,  7 Sep 2022 22:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D04883EB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ItZUCwQhv32E; Wed,  7 Sep 2022 22:51:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECD6C83EA9;
	Wed,  7 Sep 2022 22:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECD6C83EA9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6F661BF255
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 22:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA66E83EA9
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 22:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA66E83EA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CJueFrCkCtm2 for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 22:51:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6521E83EA8
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6521E83EA8
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 22:51:35 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 202so14943225pgc.8
 for <buildroot@buildroot.org>; Wed, 07 Sep 2022 15:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=6czUvL4OgfGZ30e/N3WXkgRc4tS8fdf42+mTgh7NuhE=;
 b=hH893hWPn7pi9IPBPcu6Zh9nioqZCih3otlxpZh6mkwaXSmESfGJszTz/1V8ad3DPT
 wc0LUUBNIpRGd5Ih4GFpWD83rV+dWw0TzT3pLvEkKybBcsaT18t201Tb6Wn3wKdNxcWf
 2K0aVj37NW9Et5//SRtR6xQ3ejQCUyugLx9ULy0g+IoY8DiRhAeeVqquRkta8jgPPwQJ
 DAdrdooSir8GHDinipDnQWxz2HIBC5ihxySZzDeRv3+gUt1U6dbLjkgaeYbaTd2RnQYP
 SOvB/pkEP5c0KkcxNC5cpJxqmTicImKyB8U48raFh9kxbPY5JroU9fonNysY6/Pog2vE
 GkLA==
X-Gm-Message-State: ACgBeo0UyM7sYkNINicT0sn8qNuCJ68jQ8m+JXw6FT+H10JMgXfxaUSy
 NW4NUSpvGqsP4bkORNQ3cXoArQi9HcFHffEmCjclLEjV1Dg=
X-Google-Smtp-Source: AA6agR4zj3OcnswYqs1TMLqrKmNW1XFj1mKwlFsB/hCZAopkOAz0o9zNmqeeF4uRFBCkZ4ykXrwkjqCkgqRelIolXx8=
X-Received: by 2002:a05:6a00:228a:b0:53e:a46d:aa38 with SMTP id
 f10-20020a056a00228a00b0053ea46daa38mr2059397pfe.79.1662591094673; Wed, 07
 Sep 2022 15:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220905202002.4183680-1-james.hilliard1@gmail.com>
 <20220906072158.GM1490660@scaer>
 <CADvTj4rCFTZOm0MA+Ph7u8DmjPqgJw39oXqWoxPLWmERRCJrPg@mail.gmail.com>
 <09be7323-3af8-2fa2-2d45-16d3d92e1c13@mind.be>
In-Reply-To: <09be7323-3af8-2fa2-2d45-16d3d92e1c13@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 7 Sep 2022 16:51:23 -0600
Message-ID: <CADvTj4pk0+0fQbFarBZ5vfoAjBHz1UJhJzEAyLJounQns7Exbw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=6czUvL4OgfGZ30e/N3WXkgRc4tS8fdf42+mTgh7NuhE=;
 b=nBlygEY+EW39b7RSzb08Q1sYfvSGZji8I6KMYKAJ3Rb0HMjD5Rl+pEAJ2G8W0yw+kg
 FcfGV/Qp5eq4ru6XqnOHGX10sQ6YbhcLdwPZ6IIhEl/HfyF1SIrlqoKlhwiThdLD4ICJ
 Fzz/esY7zHlUG585VBRz4Ii9M6H+Lb15DDghfvVqb63PZnQi0ia4EprpJl01pnHuHDGe
 WameNTgJ/B9KjnJDl1T0xI6ck4yxaiJrqIAMOlhtIgZch7gw/HTMwRDzHoJDN90wlSdI
 ly5zANNnQ8h85HKo6T9zMfBKni7EtZwtYU+PR4rEDtS98ZGR+UHI5U4eJwSwRe/x57ZB
 4ZUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nBlygEY+
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: unexport TARGET env variable
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

On Wed, Sep 7, 2022 at 6:42 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 06/09/2022 23:15, James Hilliard wrote:
> > On Tue, Sep 6, 2022 at 1:22 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >>
> >> James, All,
> >>
> >> On 2022-09-05 14:20 -0600, James Hilliard spake thusly:
> >>> If set this can may break package builds in some cases such as the
> >>
> >> So, this is very probabilistic: 'can' and 'may'! ;-)
> >
> > Well I think the breaking behavior depends on what TARGET is set to.
> >
> >>
> >>> host-icu build.
> >>
> >> Can you provide an actual error message and an explanation on how that
> >> actually fails?
> >
> > I had set this in my env(for some non-buildroot compiler testing), and noticed
> > it broke buildroot builds unless cleared:
> > export TARGET=bpf
> >
> >>>> host-icu 70-1 Building
> > PATH="/home/buildroot/buildroot/output/per-package/host-icu/host/bin:/home/buildroot/buildroot/output/per-package/host-icu/host/sbin:/home/buildroot/bin:/home/buildroot/.local/bin:/home/buildroot/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
> > PKG_CONFIG="/home/buildroot/buildroot/output/per-package/host-icu/host/bin/pkg-config"
> > PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
> > PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
> > PKG_CONFIG_LIBDIR="/home/buildroot/buildroot/output/per-package/host-icu/host/lib/pkgconfig:/home/buildroot/buildroot/output/per-package/host-icu/host/share/pkgconfig"
> >   /usr/bin/make -j33  -C
> > /home/buildroot/buildroot/output/build/host-icu-70-1/source
> > cd ./config; \
> >      /usr/bin/make -f pkgdataMakefile
> > rm -rf config/icu-config
> > rebuilding config/icucross.mk
> > rebuilding config/icucross.inc
> > /bin/bash ./mkinstalldirs lib
> > /bin/bash ./mkinstalldirs bin
> > /usr/bin/install -c ./config/icu-config-top config/icu-config
> > rm -rf pkgdata.inc
> > chmod u+w config/icu-config
> > mkdir lib
> > mkdir bin
> > LC_ALL=C /usr/bin/sed -f ./config/make2sh.sed < ./config/Makefile.inc
> > | grep -v '#M#' | uniq >> config/icu-config
> > config/icu-uc.pc updated.
> > config/icu-i18n.pc updated.
> > /usr/bin/make[2]: Making `all' in `stubdata'
> > LC_ALL=C /usr/bin/sed -f ./config/make2sh.sed < ./config/mh-linux |
> > grep -v '#M#' | uniq >> config/icu-config
> > cat ./config/icu-config-bottom >> config/icu-config
> >     (deps)     stubdata.cpp
> > chmod u-w config/icu-config
> > Note: rebuild with "/usr/bin/make VERBOSE=1 " to show all compiler parameters.
> > make[3]: *** No rule to make target 'bpf', needed by 'all-local'.  Stop.
> >
> >>
> >> I've looked at the icu source code, and all I could see are plain
> >> assignments and references to TARGET. Variables assigned in a Makefile
> >> are supposed to take precedence to variables from the environment, so I
> >> am not sure I can see how that can actually fail...
> >
> > I assume it's not actually assigned in the makefile then?
>
>   It's conditionally assigned:
>
> ifneq ($(ENABLE_STATIC),)
> TARGET = $(STUBDATA_LIBDIR)$(LIBSICU)$(TARGET_STUBNAME)$(ICULIBSUFFIX).$(A)
> endif
>
>   There are a couple of Makefile.in where it's defined like that....
>
>   This does look like a very icu-specific thing though, so I think it should be
> fixed in icu.mk itself, by setting TARGET= in the _ENV.

Set to empty like this?
ICU_CONF_ENV += TARGET=""
ICU_MAKE_ENV += TARGET=""

>
>   Regards,
>   Arnout
>
>
> >
> >>
> >> See for example commits which describes the actual reasons it fails:
> >>      20ca008d0266 unexport TERMINFO to correct ncurses behavior
> >>      2e32330c4a49 Makefile: unexport O
> >>      d3910057c6ae Makefile: unexport 'DEVICE_TREE' environment variable
> >>      6cff741ebaf7 package/ccache: do not force colored diagnostics
> >>
> >> Regards,
> >> Yann E. MORIN.
> >>
> >>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >>> ---
> >>>   Makefile | 1 +
> >>>   1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/Makefile b/Makefile
> >>> index bd0b906cde..a82a22a276 100644
> >>> --- a/Makefile
> >>> +++ b/Makefile
> >>> @@ -427,6 +427,7 @@ unexport GCC_COLORS
> >>>   unexport PLATFORM
> >>>   unexport OS
> >>>   unexport DEVICE_TREE
> >>> +unexport TARGET
> >>>
> >>>   GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
> >>>
> >>> --
> >>> 2.34.1
> >>>
> >>> _______________________________________________
> >>> buildroot mailing list
> >>> buildroot@buildroot.org
> >>> https://lists.buildroot.org/mailman/listinfo/buildroot
> >>
> >> --
> >> .-----------------.--------------------.------------------.--------------------.
> >> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> >> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> >> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> >> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> >> '------------------------------^-------^------------------^--------------------'
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
