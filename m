Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C860ECAAA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 21:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1ED1416C5;
	Tue,  6 Sep 2022 21:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1ED1416C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0XdN62NQUYWB; Tue,  6 Sep 2022 21:15:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB4CD4169E;
	Tue,  6 Sep 2022 21:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB4CD4169E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6CBE1BF2CA
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 21:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9ECA960B29
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 21:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ECA960B29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0atQkN_70lAo for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 21:15:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 493EE60AF6
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 493EE60AF6
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 21:15:25 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id fs14so7781757pjb.5
 for <buildroot@buildroot.org>; Tue, 06 Sep 2022 14:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=W8KeNrNTPs0cYdyZs5NP/cnxZTtF75LfQ6B0NVIKx9U=;
 b=HcAc/WaBRZcYsNdbf/OKfXfKtURimO+QhhEF3f2VBY+RWGNsEnNaKiDivdkl4mPzhP
 eIySwE460y3A84XqghSDmqHa7JhH+88grtlysyKI6m/Q96VrS9g0TOhRVIzJjHTqNPGr
 djh8ouNX9ip/NcP9ZPC/1IBb4V7va0cTq3AV/eTu8mPXHgbgRO0h3O4Z4gR5ZS5uUtLe
 zAVVOYOnTH70FL+0VRwH5I9iPuc7yBzd30rlAF76XLHzYjjA0VFtGR0pTVBFU+qQOuTv
 6VrGpvKrC1yos5HeapkSGqxds8kDd5FBZklCk5eTR4FFHkm8XOMzmGmtNgFePNch4q5N
 ioMg==
X-Gm-Message-State: ACgBeo22QjoZ56AxcATWM9R0TOiZZsdQrMFgVcdOtCimcSQB05pSzZHM
 V+dMDD+yOcgDPHRRKSNjLhhkXjIZMiG2V1BOc2BuXKE5O7k=
X-Google-Smtp-Source: AA6agR5U7jNYoNC6Tf9XuuHOF8SXnQEW+71tAjp4fRDJQJmKYO9c8E3LiPBL8EFd4Liz2W8Xz9WpBpjKAAZBIbUtxzk=
X-Received: by 2002:a17:90b:3a8e:b0:200:5585:4099 with SMTP id
 om14-20020a17090b3a8e00b0020055854099mr14535517pjb.70.1662498924592; Tue, 06
 Sep 2022 14:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220905202002.4183680-1-james.hilliard1@gmail.com>
 <20220906072158.GM1490660@scaer>
In-Reply-To: <20220906072158.GM1490660@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 6 Sep 2022 15:15:12 -0600
Message-ID: <CADvTj4rCFTZOm0MA+Ph7u8DmjPqgJw39oXqWoxPLWmERRCJrPg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=W8KeNrNTPs0cYdyZs5NP/cnxZTtF75LfQ6B0NVIKx9U=;
 b=LLtP75oDwG7+1OUOIxNrgeCMsb5rQ/UclQvHIyaShg9QkrTvvSd2ZTJXEO3a+0DX0T
 ZxU1gYGO/f1PB6803vZZN+2u6ZYZhRkGyJ4Vh8YQoVzxp8MpsbMoF6VKe3h2ywpcDSLV
 479QmuOdZPSklz0BbBmB/g0gryleKhqDeZgvHemtHCw/ZVUQ0M9MLRz7FzSBVfQu7g3H
 yUzUKgbfmMQCz+M/vDpt/Q7X6vY4Wnvr9s+iI6zs+0Uk9M4rOIDAxa1BkcZ/8y2imkHZ
 fyqpD9Dx1Nwry4RV2RHipfGFrsHkUacEHxx1zwdKdDfwEFnxRT6ksv/pRVvi9V3SkzNV
 UGLQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LLtP75oD
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Sep 6, 2022 at 1:22 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2022-09-05 14:20 -0600, James Hilliard spake thusly:
> > If set this can may break package builds in some cases such as the
>
> So, this is very probabilistic: 'can' and 'may'! ;-)

Well I think the breaking behavior depends on what TARGET is set to.

>
> > host-icu build.
>
> Can you provide an actual error message and an explanation on how that
> actually fails?

I had set this in my env(for some non-buildroot compiler testing), and noticed
it broke buildroot builds unless cleared:
export TARGET=bpf

>>> host-icu 70-1 Building
PATH="/home/buildroot/buildroot/output/per-package/host-icu/host/bin:/home/buildroot/buildroot/output/per-package/host-icu/host/sbin:/home/buildroot/bin:/home/buildroot/.local/bin:/home/buildroot/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
PKG_CONFIG="/home/buildroot/buildroot/output/per-package/host-icu/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/buildroot/buildroot/output/per-package/host-icu/host/lib/pkgconfig:/home/buildroot/buildroot/output/per-package/host-icu/host/share/pkgconfig"
 /usr/bin/make -j33  -C
/home/buildroot/buildroot/output/build/host-icu-70-1/source
cd ./config; \
    /usr/bin/make -f pkgdataMakefile
rm -rf config/icu-config
rebuilding config/icucross.mk
rebuilding config/icucross.inc
/bin/bash ./mkinstalldirs lib
/bin/bash ./mkinstalldirs bin
/usr/bin/install -c ./config/icu-config-top config/icu-config
rm -rf pkgdata.inc
chmod u+w config/icu-config
mkdir lib
mkdir bin
LC_ALL=C /usr/bin/sed -f ./config/make2sh.sed < ./config/Makefile.inc
| grep -v '#M#' | uniq >> config/icu-config
config/icu-uc.pc updated.
config/icu-i18n.pc updated.
/usr/bin/make[2]: Making `all' in `stubdata'
LC_ALL=C /usr/bin/sed -f ./config/make2sh.sed < ./config/mh-linux |
grep -v '#M#' | uniq >> config/icu-config
cat ./config/icu-config-bottom >> config/icu-config
   (deps)     stubdata.cpp
chmod u-w config/icu-config
Note: rebuild with "/usr/bin/make VERBOSE=1 " to show all compiler parameters.
make[3]: *** No rule to make target 'bpf', needed by 'all-local'.  Stop.

>
> I've looked at the icu source code, and all I could see are plain
> assignments and references to TARGET. Variables assigned in a Makefile
> are supposed to take precedence to variables from the environment, so I
> am not sure I can see how that can actually fail...

I assume it's not actually assigned in the makefile then?

>
> See for example commits which describes the actual reasons it fails:
>     20ca008d0266 unexport TERMINFO to correct ncurses behavior
>     2e32330c4a49 Makefile: unexport O
>     d3910057c6ae Makefile: unexport 'DEVICE_TREE' environment variable
>     6cff741ebaf7 package/ccache: do not force colored diagnostics
>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Makefile b/Makefile
> > index bd0b906cde..a82a22a276 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -427,6 +427,7 @@ unexport GCC_COLORS
> >  unexport PLATFORM
> >  unexport OS
> >  unexport DEVICE_TREE
> > +unexport TARGET
> >
> >  GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
> >
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
