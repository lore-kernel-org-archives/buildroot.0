Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6541AC3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 224934032F;
	Fri, 12 Jul 2024 20:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3tT-BCe2QO3; Fri, 12 Jul 2024 20:48:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 920AA403C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 920AA403C1;
	Fri, 12 Jul 2024 20:48:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 295FD1BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 164EF400B9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNVDkS5YU9_A for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:48:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6E55B400A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E55B400A6
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E55B400A6
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:48:56 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2eebc76119aso27191361fa.2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720817334; x=1721422134;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5KUEwDWAeKiSNojs2LnqYUBTJjpR29nMHSu2SzDwjDo=;
 b=EmFNybNLHB1mzt1/jSdjWg3izZZML3Lx1GUjRmx7vd7TowDgwWAuEkTQG3Mp3vK+is
 BixL/3H3IpwG2QBvrTQgM02KMQwviN5Q/ws68JDZyqizu7hjqn+DI9T9t49nsRlOmeM5
 tXspZSvwqUqF4O1A+VMzftolFC20Rzaxora4RMTYr70Ps0HcBRLKaCTTPQBO/nse/1hY
 zYjjfjnXEpztEXoSmt0fMQjLQaJQDbSyJV0KAfm3SdXYJBSV7zHkFXWqSh6BTuKlyNUn
 pozncECU2Rd7VWOsn0KUBMdjGomHWtC027HJ4nTQ4Nu9mi2ZXGG+ndjVY16TSKrcAhnf
 1LLA==
X-Gm-Message-State: AOJu0YyOw6gs7lAzrLDwB6OKq4DelqrFaVVsdaSFFKGwoCjXnzHqFBd6
 tmT86/oZYn3sgdDErcBHG1dWMT5cVhiwWRklR0LtpUx+SbLf4lbxz+ay6FreD9azjHJr8FZGAiY
 bOJt0T2uceO11whoNrlSoDueMnHE=
X-Google-Smtp-Source: AGHT+IHuGGCGGBfzSdHUxb/ILt3UJI0JN2sgbedqrwLUwGRnsVfGycVniQXAL+DyTlRpmwpJP9cfyPss+Gda6l/OMT8=
X-Received: by 2002:a2e:8784:0:b0:2ec:4399:9c0f with SMTP id
 38308e7fff4ca-2eeb3054a10mr86318891fa.0.1720817334107; Fri, 12 Jul 2024
 13:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240704123452.3535612-1-heiko.thiery@gmail.com>
 <20240704123452.3535612-2-heiko.thiery@gmail.com>
 <911573ac-f0bf-4ceb-99b0-5d24dd1937bd@mind.be>
 <CAEyMn7anNnq2aH9EViFjY+ihnmwCXaWXMs9sJAYFBpH=q_WT+Q@mail.gmail.com>
 <CAEyMn7Ze=uM6Tf4TRe4-jzai-T7DD8MvT4t_YLjyQzzOzbYfKQ@mail.gmail.com>
 <18e34573-ea10-458d-9632-ee74d9590bb4@mind.be>
In-Reply-To: <18e34573-ea10-458d-9632-ee74d9590bb4@mind.be>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 12 Jul 2024 22:48:41 +0200
Message-ID: <CAEyMn7bjoOOSih1AqxOQkc5Mz1u2GykTPWD2+rJmyfUCHFWLLg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720817334; x=1721422134; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5KUEwDWAeKiSNojs2LnqYUBTJjpR29nMHSu2SzDwjDo=;
 b=fBQ9h0VzXWgC1IBBcbZMNIVngyeN/C5RwZRrAoPb57GaoE4tzFEN150gqQ9wolOJ32
 R7wgGrG+g4jXOCRP11tFE72ScPMihLi2mXPN9LVzXjGUfEPxghgDAePqfvsQJLKqOoF7
 P7aasLLcLGY7P2WWtjjfK2vGsFRoP4WxxR7+wp8M3fvY0CExbIaB2eomyDGLxoy2OWid
 PXQ4OQDRCbC1gnINJO5EX9mEKqaGLyHcIZvEVpMZ4B3TcqMkrKvRtgGEotLpLbTBXttA
 2iEoCF/l83QYV9kZ7M4D2gIHW1Yyz3MmLcmMzzzpBFpw0vWGlMnewQgsTbjzcBbfj5HZ
 31iw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fBQ9h0Vz
Subject: Re: [Buildroot] [PATCH v3 1/3] package/blake3: add new host package
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
Cc: Lance Fredrickson <lancethepants@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Fr., 12. Juli 2024 um 21:56 Uhr schrieb Arnout Vandecappelle
<arnout@mind.be>:
>
>
>
> On 12/07/2024 21:23, Heiko Thiery wrote:
> > Hi Arnout,
> >
> > Am Fr., 12. Juli 2024 um 21:08 Uhr schrieb Heiko Thiery
> > <heiko.thiery@gmail.com>:
> >>
> >> Hi Arnout,
> >>
> >> Am Fr., 12. Juli 2024 um 10:38 Uhr schrieb Arnout Vandecappelle
> >> <arnout@mind.be>:
> >>>
> >>>    Hi Heiko,
> >>>
> >>> On 04/07/2024 14:34, Heiko Thiery wrote:
> >>>> This package is used and required for ccache update.
> >>>>
> >>>> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> >>>> ---
> >>>>
> >>>> v2:
> >>>>       - on change
> >>>>
> >>>> v3:
> >>>>       - fix BLAKE3_LICENSE_FILES and corresponding hash values
> >>>>
> >>>>
> >>>>    DEVELOPERS                 |  1 +
> >>>>    package/blake3/blake3.hash |  3 +++
> >>>>    package/blake3/blake3.mk   | 20 ++++++++++++++++++++
> >>>>    3 files changed, 24 insertions(+)
> >>>>    create mode 100644 package/blake3/blake3.hash
> >>>>    create mode 100644 package/blake3/blake3.mk
> >>>>
> >>>> diff --git a/DEVELOPERS b/DEVELOPERS
> >>>> index 90d1a111ab..46fe3cd2e1 100644
> >>>> --- a/DEVELOPERS
> >>>> +++ b/DEVELOPERS
> >>>> @@ -1359,6 +1359,7 @@ F:      configs/kontron_bl_imx8mm_defconfig
> >>>>    F:  configs/kontron_smarc_sal28_defconfig
> >>>>    F:  configs/kontron_pitx_imx8m_defconfig
> >>>>    F:  package/altera-stapl/
> >>>> +F:   package/blake3/
> >>>>    F:  package/ipmitool/
> >>>>    F:  package/libnetconf2/
> >>>>    F:  package/libyang/
> >>>> diff --git a/package/blake3/blake3.hash b/package/blake3/blake3.hash
> >>>> new file mode 100644
> >>>> index 0000000000..2a00d19b02
> >>>> --- /dev/null
> >>>> +++ b/package/blake3/blake3.hash
> >>>> @@ -0,0 +1,3 @@
> >>>> +# sha256 computed locally
> >>>> +sha256  822cd37f70152e5985433d2c50c8f6b2ec83aaf11aa31be9fe71486a91744f37  blake3-1.5.1.tar.gz
> >>>> +sha256  6a94bedb8b707ed97f6e310d0d015ab14e0683ffa0a612b02958581b9cc9fc0e  LICENSE
> >>>> diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
> >>>> new file mode 100644
> >>>> index 0000000000..76e4e32e7a
> >>>> --- /dev/null
> >>>> +++ b/package/blake3/blake3.mk
> >>>> @@ -0,0 +1,20 @@
> >>>> +################################################################################
> >>>> +#
> >>>> +# blake3
> >>>> +#
> >>>> +################################################################################
> >>>> +
> >>>> +BLAKE3_VERSION = 1.5.1
> >>>> +BLAKE3_SITE = $(call github,BLAKE3-team,BLAKE3,refs/tags/$(BLAKE3_VERSION))
> >>>
> >>>    Why do you put the refs/tags here? It was necessary in one or two packages
> >>> because of a conflict with a branch name, but I don't think that's the case
> >>> here. I admit that there's a certain elegance to making it explicit that we want
> >>> a tag, but then we really should be doing that everywhere...
> >>
> >> You are right. I changed it to:
> >> BLAKE3_SITE = $(call github,BLAKE3-team,BLAKE3,$(BLAKE3_VERSION))
> >>
> >> I think this is what you expect.
> >>
> >>>
> >>>> +BLAKE3_SUBDIR = c
> >>>> +BLAKE3_LICENSE = Apache-2.0, CC0-1.0
> >>>> +BLAKE3_LICENSE_FILES = LICENSE
> >>>> +
> >>>> +# We may be a ccache dependency, so we can't use ccache; reset the
> >>>> +# options set by the cmake infra.
> >>>> +HOST_BLAKE3_CONF_OPTS += \
> >>>> +     -DCMAKE_ASM_COMPILER="$(CMAKE_HOST_C_COMPILER)" \
> >>>
> >>>    Why is this needed? And is it even a good idea? In pkg-cmake, this is defined
> >>> as -DCMAKE_ASM_COMPILER="$$(HOSTAS)", and HOSTAS is simply "as" without any
> >>> ccache. In fact, this changes it from "as" to "gcc" which I expect is not
> >>> correct at all...
> >>
> >> When not defining that I got the errror:
> >>
> >> [ 25%] Building C object CMakeFiles/blake3.dir/blake3_portable.c.o
> >> [ 37%] Building ASM object CMakeFiles/blake3.dir/blake3_avx2_x86-64_unix.S.o
> >> [ 50%] Building C object CMakeFiles/blake3.dir/blake3_dispatch.c.o
> >> Assembler messages:
> >> Fatal error: bad defsym; format is --defsym name=value
> >> make[3]: *** [CMakeFiles/blake3.dir/build.make:117:
> >> CMakeFiles/blake3.dir/blake3_avx2_x86-64_unix.S.o] Error 1
> >> make[3]: *** Waiting for unfinished jobs....
> >> [ 62%] Building ASM object CMakeFiles/blake3.dir/blake3_avx512_x86-64_unix.S.o
> >> Assembler messages:
> >> Fatal error: bad defsym; format is --defsym name=value
> >> make[3]: *** [CMakeFiles/blake3.dir/build.make:130:
> >> CMakeFiles/blake3.dir/blake3_avx512_x86-64_unix.S.o] Error 1
> >> make[3]: Leaving directory
> >> '/home/hthiery/sources/mainline/buildroot/output/build/host-blake3-1.5.1/c'
> >> make[2]: *** [CMakeFiles/Makefile2:83: CMakeFiles/blake3.dir/all] Error 2
> >> make[2]: Leaving directory
> >> '/home/hthiery/sources/mainline/buildroot/output/build/host-blake3-1.5.1/c'
> >> make[1]: *** [Makefile:136: all] Error 2
> >> make[1]: Leaving directory
> >> '/home/hthiery/sources/mainline/buildroot/output/build/host-blake3-1.5.1/c'
> >> make: *** [package/pkg-generic.mk:283:
> >> /home/hthiery/sources/mainline/buildroot/output/build/host-blake3-1.5.1/.stamp_built]
> >> Error 2
> >>
> >> So when changing to use gcc instead of as it works.
> >>
> >> I tried to build on my host and see that cmake sets the var
> >> "CMAKE_ASM_COMPILER=/usr/bin/cc". When overwriting it with as it also
> >> does not build.
> >
> > But unsetting -UCMAKE_C_COMPILER_LAUNCHER and
> > -UCMAKE_CXX_COMPILER_LAUNCHE is not required. So would remove these
> > two lines.
>
>   Huh? Those two are still needed because blake3 is a dependency of ccache so
> you can't build it with ccache as the launcher...

Ah yes .. I just build host-blake3 without ccache enabled for testing
my changes. So I will retest that ;-/

Thanks

>
>   Regards,
>   Arnout
>
> >
> >>
> >> --
> >> Heiko
> >>
> >>>
> >>>    Since you said you could respin this weekend, I will mark as Changes
> >>> Requested, but it's possible that your respin only has some commit message
> >>> changes of course.
> >>>
> >>>    Regards,
> >>>    Arnout
> >>>
> >>>> +     -UCMAKE_C_COMPILER_LAUNCHER \
> >>>> +     -UCMAKE_CXX_COMPILER_LAUNCHER
> >>>> +
> >>>> +$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
