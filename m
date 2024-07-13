Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE359C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 05:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8751C60622;
	Sat, 13 Jul 2024 05:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RL1nepptZbZE; Sat, 13 Jul 2024 05:32:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B51C6062D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B51C6062D;
	Sat, 13 Jul 2024 05:32:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9AEA51BF847
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 05:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94B8240175
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 05:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hd2YerImCPaB for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 05:32:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 46D12400F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46D12400F5
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46D12400F5
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 05:32:12 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2eedebccfa4so5430531fa.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720848730; x=1721453530;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FBzcHYXgq7BR9SR9xXTzAz0rIy5/o6kZyYLW6OASvII=;
 b=YITdvxqu1ak8MjLZphsnEbkYL8sc3Wlqq7fMr/100qF8CGuRfXAyUR23I4dgfxwIxg
 pXHwt/+pBPs1AAKebE9sCKoi5dFLNsBZIJ13zuLGvbA9ePPz+8QZlJ/jOijXEaammdgc
 Hzz4+fRetgU++EU9LIaXuH+z9ts96rGUdv3tSxxCZKufVbmBsqA7SCaSlV0CZKqFlw7v
 dr7xkpXszht9xPDU6mhfiRekPkUZPCHiCaflOUvBufxEZumFpyNccNtAW40/HlfhNn1s
 7ZHHp3+6xbom5cSDQZ8zIUFumChpsaheciHN21lWMg4LpwFhZsLj4BrOgis8s+YKswWw
 b5Yw==
X-Gm-Message-State: AOJu0Yy29q30qljqWQ3wXzvHy/QhGzBlLDV8jqtxh8Qql7UWiwmlyZGG
 sfAr0tP7+JnXNfBXr2WO/OW84RniMUvW8wacpNLKMO29rlGg2mKugKBwm9KDTMGOUsorJ84lo+v
 mcTXc/XEDhHDquulerwHMfzQflRw=
X-Google-Smtp-Source: AGHT+IHQa8Sz9DwdSk+P/MlkVmMMTn0ynozNsAWn6Jc7zAGbV5VK4DwArcniLE4G/G9zQDL4ZelnJodUqoSVPoZXer4=
X-Received: by 2002:a2e:a792:0:b0:2ec:63f:fe91 with SMTP id
 38308e7fff4ca-2eeb3181609mr123102581fa.38.1720848729438; Fri, 12 Jul 2024
 22:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240704123452.3535612-1-heiko.thiery@gmail.com>
 <20240704123452.3535612-2-heiko.thiery@gmail.com>
 <911573ac-f0bf-4ceb-99b0-5d24dd1937bd@mind.be>
 <CAEyMn7anNnq2aH9EViFjY+ihnmwCXaWXMs9sJAYFBpH=q_WT+Q@mail.gmail.com>
 <96c4bf27-26a3-41aa-a7e2-3eeef8c9cfc1@mind.be>
In-Reply-To: <96c4bf27-26a3-41aa-a7e2-3eeef8c9cfc1@mind.be>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 13 Jul 2024 07:31:57 +0200
Message-ID: <CAEyMn7bNU37A5gxtz8D89ZKcPdbikjnzi55zr+FkbbgDUFrqTQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720848730; x=1721453530; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FBzcHYXgq7BR9SR9xXTzAz0rIy5/o6kZyYLW6OASvII=;
 b=giO+KnQyCDlptqXIIV8d6m7pzH/qP9nx503JQg2oFiQ2R7qZZGkNEqyTLgENS+lgQL
 xA883vwvPTagKHH6brlGhf0ikOjvu1kwaTcxCOQhN/8XWi2nuqMZmcG2xtjN04dt99ze
 HwoAf6CLP0pEWcOsCCOkalKoHIUX1hgFYITebUbLn6cHs3PjFKT5C37pU3HHd8mCz1Cg
 KwhtA8Gm03yLeXF9PNUNXw+oqy8jQF/BSyo1y4O3r1cjMZpuenUwchUdO/KBW2kba1na
 GCYAaorxViglTALI+Sw+yObbsGBRC03wFJkYQznfwtr7AM+25MC2HDA8zagL4IQfuA/L
 9L1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=giO+KnQy
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

Hi,

Am Fr., 12. Juli 2024 um 21:21 Uhr schrieb Arnout Vandecappelle
<arnout@mind.be>:
>
>
>
> On 12/07/2024 21:08, Heiko Thiery wrote:
> > Hi Arnout,
> >
> > Am Fr., 12. Juli 2024 um 10:38 Uhr schrieb Arnout Vandecappelle
> > <arnout@mind.be>:
> >>
> >>    Hi Heiko,
> >>
> >> On 04/07/2024 14:34, Heiko Thiery wrote:
> [snip]
>
> >>> +HOST_BLAKE3_CONF_OPTS += \
> >>> +     -DCMAKE_ASM_COMPILER="$(CMAKE_HOST_C_COMPILER)" \
> >>
> >>    Why is this needed? And is it even a good idea? In pkg-cmake, this is defined
> >> as -DCMAKE_ASM_COMPILER="$$(HOSTAS)", and HOSTAS is simply "as" without any
> >> ccache. In fact, this changes it from "as" to "gcc" which I expect is not
> >> correct at all...
> >
> > When not defining that I got the errror:
> >
> > [ 25%] Building C object CMakeFiles/blake3.dir/blake3_portable.c.o
> > [ 37%] Building ASM object CMakeFiles/blake3.dir/blake3_avx2_x86-64_unix.S.o
> > [ 50%] Building C object CMakeFiles/blake3.dir/blake3_dispatch.c.o
> > Assembler messages:
> > Fatal error: bad defsym; format is --defsym name=value
> > make[3]: *** [CMakeFiles/blake3.dir/build.make:117:
> > CMakeFiles/blake3.dir/blake3_avx2_x86-64_unix.S.o] Error 1
> > make[3]: *** Waiting for unfinished jobs....
> > [ 62%] Building ASM object CMakeFiles/blake3.dir/blake3_avx512_x86-64_unix.S.o
> > Assembler messages:
> > Fatal error: bad defsym; format is --defsym name=value
> > make[3]: *** [CMakeFiles/blake3.dir/build.make:130:
> > CMakeFiles/blake3.dir/blake3_avx512_x86-64_unix.S.o] Error 1
> > make[3]: Leaving directory
> > '/home/hthiery/sources/mainline/buildroot/output/build/host-blake3-1.5.1/c'
> > make[2]: *** [CMakeFiles/Makefile2:83: CMakeFiles/blake3.dir/all] Error 2
> > make[2]: Leaving directory
> > '/home/hthiery/sources/mainline/buildroot/output/build/host-blake3-1.5.1/c'
> > make[1]: *** [Makefile:136: all] Error 2
> > make[1]: Leaving directory
> > '/home/hthiery/sources/mainline/buildroot/output/build/host-blake3-1.5.1/c'
> > make: *** [package/pkg-generic.mk:283:
> > /home/hthiery/sources/mainline/buildroot/output/build/host-blake3-1.5.1/.stamp_built]
> > Error 2
> >
> > So when changing to use gcc instead of as it works.
> >
> > I tried to build on my host and see that cmake sets the var
> > "CMAKE_ASM_COMPILER=/usr/bin/cc". When overwriting it with as it also
> > does not build.
>
>   Hah, indeed, our setting of CMAKE_ASM_COMPILER is incorrect in pkg-cmake.mk.
> That's why it also had to be overridden in llvm.mk. Also, we don't have such a
> definition for the target, which makes me think that by default it just uses
> CMAKE_C_COMPILER (which is exactly what we want here).
>
>   Could you try to remove the definition from pkg-cmake.mk and see if that
> works? And then also remove it in llvm.mk. In separate patches, of course.

Indeed, when removing the CMAKE_ASM_COMPILER from pkg-cmake.pkg the blake3
and llvm package build without the need of setting ASM to gcc.

I will create a patch for that (pkg-cmake and llvm). But only i can't
explain exactly why the setting
in pkg-cmake is wrong. it would be good if you could improve the
commit message accordingly.

-- 
Heiko

>   Regards,
>   Arnout
>
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
