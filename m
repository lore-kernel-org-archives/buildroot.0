Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6EFC38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 08:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46AB0812D4;
	Tue, 25 Oct 2022 08:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46AB0812D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KIbLgoc1w8Xn; Tue, 25 Oct 2022 08:14:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D79CA812DB;
	Tue, 25 Oct 2022 08:14:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D79CA812DB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E9211BF2FC
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 08:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69CD4607FE
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 08:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69CD4607FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PB9UEtjaWIcv for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 08:14:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EE7E607F9
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EE7E607F9
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 08:14:13 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id b185so4933219pfb.9
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 01:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U6ptcfgZmNq/bicyRI68z2WSDtQvMkBe25oNxOqCCWQ=;
 b=F6pVgcMr1cqr5mOBmWy1Z5g5HNnNp7g6cNmN0cYL+hwy1edE09WdpuDgM1fSKmi2GA
 uxsiyJBKqojOsd1JCuFLVGwC30b9+4e1bRd8I/dcFol1+QU/BeriGO7IN+uDIYsN74mo
 sfNB/+y8S9WnOiha2foP3ysnhebsNt32zXRvepalk1tEV7qDEo2TjoN7/4PKNQkAcAM4
 7qTer5m0POl8apIsBHEwikzOtQEeS481PHXNAAWDIBvTGn5JPyABXG3OlfPONd3oM591
 p9Xf3VBdGtoNDsP2zNo10zxKKbgGX82cW31LI4HCt+jFcHDOu5G29VFdAqGjUbG+tTza
 RWow==
X-Gm-Message-State: ACrzQf2n9xwnf2TP98ZtVSeAQMFQS93KMXSA5klrZkjDsIADAoGH2DR7
 Q1kBfm4F2e8lopxi9MZxvgZfzLPo2a7pgLGkM/PH0qamRpcNTg==
X-Google-Smtp-Source: AMsMyM6xmMLxubcpzKCu73byddNeKAesF/SX1tCEog6Vgj5gaPGT3MgQsvQx67VVkgbKZVDtVRXft0R0HjL1Opc/PP0=
X-Received: by 2002:a05:6a00:1d06:b0:56b:ec38:27e9 with SMTP id
 a6-20020a056a001d0600b0056bec3827e9mr7109113pfx.71.1666685652463; Tue, 25 Oct
 2022 01:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <CA+_SqVb8PiTaw9o5KSTohDQ_Ym5aT4o8u8s_KiFZZ9M_nv8tNg@mail.gmail.com>
In-Reply-To: <CA+_SqVb8PiTaw9o5KSTohDQ_Ym5aT4o8u8s_KiFZZ9M_nv8tNg@mail.gmail.com>
From: Jesse Van Gavere <jesseevg@gmail.com>
Date: Tue, 25 Oct 2022 10:14:01 +0200
Message-ID: <CAMdwsN-Z81fu9G9ACu2HsRV4RtpRGvn+7tonvVRC4ntdL=-U9Q@mail.gmail.com>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U6ptcfgZmNq/bicyRI68z2WSDtQvMkBe25oNxOqCCWQ=;
 b=H+V5mlBW0gNeWtgLr0ZGShxdxYlJakACbZL8/fmpMillIZCJEylepgFfyomV3r+4v2
 m51jWi+mVCRrgID7nLkqmf1FY3Hr1j7gXn2PAmyk8KaE+dKajmUMhPd1pbazFFwS87Qp
 IpY4WKtAsqeZQ8DZTS6FMKNEpwmjF5WdT2pYShUNXSyUvQEmf16WW2ypLPhn0hbiaZax
 5nDBYULvBax8stC9ezgXa7iDyrQ0PNAhEYJv1oUMwd4B0OPWgQDbeiUKKd55qfqw7TWT
 AIMc43prhtspdRTSMe+U+QSOOUNOu4DQVMp7etqJyrn6pefLzt1Xi/2aqhj9s9dm3qyj
 5V5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=H+V5mlBW
Subject: Re: [Buildroot] QT6 Qmake
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============4109338215174513160=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4109338215174513160==
Content-Type: multipart/alternative; boundary="00000000000044734605ebd77e95"

--00000000000044734605ebd77e95
Content-Type: text/plain; charset="UTF-8"

 Op di 25 okt. 2022 om 09:33 schreef Angelo Compagnucci <
angelo@amarulasolutions.com>:
>
> Hello Jesse,
>
> I was trying to port qt6knx to qt6, the project is not converted to cmake
but still based on qmake.
> I was able to compile it on x86 using qt6 but qmake in buildroot QT6 is
somewhat broken, the following snip shows the differences between qmake for
QT5 and QT6:
>
> angelo@angeloc:~/DEV/BUILDROOT/br_qemu_arm$
/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/bin/qmake
-query
>
QT_SYSROOT:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot
>
QT_INSTALL_PREFIX:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr
> QT_INSTALL_PREFIX/raw:/usr
>
QT_INSTALL_ARCHDATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr
> QT_INSTALL_ARCHDATA/raw:/usr
>
QT_INSTALL_DATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr
> QT_INSTALL_DATA/raw:/usr
>
QT_INSTALL_DOCS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/doc
> QT_INSTALL_DOCS/raw:/usr/doc
>
QT_INSTALL_HEADERS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/qt5
> QT_INSTALL_HEADERS/raw:/usr/include/qt5
>
QT_INSTALL_LIBS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib
> QT_INSTALL_LIBS/raw:/usr/lib
>
QT_INSTALL_LIBEXECS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/libexec
> QT_INSTALL_LIBEXECS/raw:/usr/libexec
>
QT_INSTALL_BINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin
> QT_INSTALL_BINS/raw:/usr/bin
>
QT_INSTALL_TESTS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/tests
> QT_INSTALL_TESTS/raw:/usr/tests
>
QT_INSTALL_PLUGINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/qt/plugins
> QT_INSTALL_PLUGINS/raw:/usr/lib/qt/plugins
>
QT_INSTALL_IMPORTS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/imports
> QT_INSTALL_IMPORTS/raw:/usr/imports
>
QT_INSTALL_QML:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/qml
> QT_INSTALL_QML/raw:/usr/qml
>
QT_INSTALL_TRANSLATIONS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/translations
> QT_INSTALL_TRANSLATIONS/raw:/usr/translations
>
QT_INSTALL_CONFIGURATION:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr
> QT_INSTALL_CONFIGURATION/raw:/usr
>
QT_INSTALL_EXAMPLES:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/qt/examples
> QT_INSTALL_EXAMPLES/raw:/usr/lib/qt/examples
>
QT_INSTALL_DEMOS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/qt/examples
> QT_INSTALL_DEMOS/raw:/usr/lib/qt/examples
>
QT_HOST_PREFIX:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host
>
QT_HOST_DATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host
>
QT_HOST_BINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/bin
>
QT_HOST_LIBS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/lib
> QMAKE_SPEC:linux-g++
> QMAKE_XSPEC:devices/linux-buildroot-g++
> QMAKE_VERSION:3.1
> QT_VERSION:5.15.8
> angelo@angeloc:~/DEV/BUILDROOT/br_qemu_arm$
> angelo@angeloc:~/DEV/BUILDROOT/br_qemu_arm$
/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt6base/host/bin/qmake
-query
> QT_SYSROOT:
>
QT_INSTALL_PREFIX:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host
>
QT_INSTALL_ARCHDATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host
>
QT_INSTALL_DATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host
>
QT_INSTALL_DOCS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/doc
>
QT_INSTALL_HEADERS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/include
>
QT_INSTALL_LIBS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/lib
>
QT_INSTALL_LIBEXECS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/libexec
>
QT_INSTALL_BINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/bin
>
QT_INSTALL_TESTS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/tests
>
QT_INSTALL_PLUGINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/plugins
>
QT_INSTALL_QML:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/qml
>
QT_INSTALL_TRANSLATIONS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/translations
> QT_INSTALL_CONFIGURATION:
>
QT_INSTALL_EXAMPLES:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/examples
>
QT_INSTALL_DEMOS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/examples
>
QT_HOST_PREFIX:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host
>
QT_HOST_DATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host
>
QT_HOST_BINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/bin
>
QT_HOST_LIBEXECS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/libexec
>
QT_HOST_LIBS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/lib
> QMAKE_SPEC:linux-g++
> QMAKE_XSPEC:linux-g++
> QMAKE_VERSION:3.1
> QT_VERSION:6.4.0
>
>
> Any clue?
>
> I'm looking into fixing qmake for QT6 anyway
>
> Thanks!
> --
>
> Angelo Compagnucci
>
> Software Engineer
>
> angelo@amarulasolutions.com
> __________________________________
> Amarula Solutions SRL
>
> Via le Canevare 30, 31100 Treviso, Veneto, IT
>
> T. +39 (0)42 243 5310
> info@amarulasolutions.com
>
> www.amarulasolutions.com
>
> [`as] https://www.amarulasolutions.com|
Hello Angelo,

Yes this was one of the parts I couldn't get working initially for which I
opted to set it aside for the time being, I dreaded the day this would come
as it was a bit of a PITA!
As for why it doesn't work, you'll see that the qmake_xspec is linux-g++ in
qt6 and devices/linux-buildroot-g++ in your qt5 build, what was done in qt5
was that our own qmake device spec was made to work with the BR
compiler/flags, you'll see this in qt5.mk where the qmake command is
defined as

QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++

As for how to do it properly, some good reference here is
https://wiki.qt.io/Cross-Compile_Qt_6_for_Raspberry_Pi as this shows how
cross-compiling is now generally done and how they pass the device spec
during building for the target.
You can also look under the qt5base folder for qt.conf.in, qmake.conf.in
qplatformdefs.h, that together with QT5_INSTALL_QT_CONF in qt5.mk and
QT5BASE_CONFIGURE_CMDS in qt5base.mk (more specifically line 335-345)
This from what I remember is most if not all that is involved in building
the buildroot specific device spec to get qmake working, I hope that at
least gives you somewhere to start looking.

As for why I couldn't get it working myself at the time, I tried to
implement all of the things mentioned above, I had a device spec and the
files looked good, I passed it to the qt6 target building with
-DQT_QMAKE_TARGET_MKSPEC=devices/linux-buildroot-g++ and everything done in
qt5 to get it working was there (or so I thought at least), but in the end
there seemed to be some path issues where qmake was looking at the host qt6
instead of the target qt6 and I never really figured it out, the whole
host/target building of qt6 was quite the PITA in and of itself, but I'll
give it another crack since there's some interest, good to see someone
wants to pick it up too!

I do think I have some work related to this from previous attempts on one
of my dev branches, I'll keep in touch if I find something to send your
way, maybe it helps you to have some starting point.

Best regards,
Jesse

--00000000000044734605ebd77e95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">=C2=A0Op di 25 okt. 2022 om 09:33 schreef Angelo Compagnuc=
ci &lt;<a href=3D"mailto:angelo@amarulasolutions.com" target=3D"_blank">ang=
elo@amarulasolutions.com</a>&gt;:<br>&gt;<br>&gt; Hello Jesse,<br>&gt;<br>&=
gt; I was trying to port qt6knx to qt6, the project is not converted to cma=
ke but still based on qmake.<br>&gt; I was able to compile it on x86 using =
qt6 but qmake in buildroot QT6 is somewhat broken, the following snip shows=
 the differences between qmake for QT5 and QT6:<br>&gt;<br>&gt; angelo@ange=
loc:~/DEV/BUILDROOT/br_qemu_arm$ /home/angelo/DEV/BUILDROOT/br_qemu_arm/per=
-package/qt5base/host/bin/qmake -query<br>&gt; QT_SYSROOT:/home/angelo/DEV/=
BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgn=
ueabihf/sysroot<br>&gt; QT_INSTALL_PREFIX:/home/angelo/DEV/BUILDROOT/br_qem=
u_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/=
usr<br>&gt; QT_INSTALL_PREFIX/raw:/usr<br>&gt; QT_INSTALL_ARCHDATA:/home/an=
gelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux=
-uclibcgnueabihf/sysroot/usr<br>&gt; QT_INSTALL_ARCHDATA/raw:/usr<br>&gt; Q=
T_INSTALL_DATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/h=
ost/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr<br>&gt; QT_INSTALL_DATA=
/raw:/usr<br>&gt; QT_INSTALL_DOCS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/pe=
r-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/doc<=
br>&gt; QT_INSTALL_DOCS/raw:/usr/doc<br>&gt; QT_INSTALL_HEADERS:/home/angel=
o/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uc=
libcgnueabihf/sysroot/usr/include/qt5<br>&gt; QT_INSTALL_HEADERS/raw:/usr/i=
nclude/qt5<br>&gt; QT_INSTALL_LIBS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/p=
er-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib=
<br>&gt; QT_INSTALL_LIBS/raw:/usr/lib<br>&gt; QT_INSTALL_LIBEXECS:/home/ang=
elo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-=
uclibcgnueabihf/sysroot/usr/libexec<br>&gt; QT_INSTALL_LIBEXECS/raw:/usr/li=
bexec<br>&gt; QT_INSTALL_BINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-pa=
ckage/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin<br>&=
gt; QT_INSTALL_BINS/raw:/usr/bin<br>&gt; QT_INSTALL_TESTS:/home/angelo/DEV/=
BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgn=
ueabihf/sysroot/usr/tests<br>&gt; QT_INSTALL_TESTS/raw:/usr/tests<br>&gt; Q=
T_INSTALL_PLUGINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5bas=
e/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/qt/plugins<br>&g=
t; QT_INSTALL_PLUGINS/raw:/usr/lib/qt/plugins<br>&gt; QT_INSTALL_IMPORTS:/h=
ome/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot=
-linux-uclibcgnueabihf/sysroot/usr/imports<br>&gt; QT_INSTALL_IMPORTS/raw:/=
usr/imports<br>&gt; QT_INSTALL_QML:/home/angelo/DEV/BUILDROOT/br_qemu_arm/p=
er-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/qml=
<br>&gt; QT_INSTALL_QML/raw:/usr/qml<br>&gt; QT_INSTALL_TRANSLATIONS:/home/=
angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-lin=
ux-uclibcgnueabihf/sysroot/usr/translations<br>&gt; QT_INSTALL_TRANSLATIONS=
/raw:/usr/translations<br>&gt; QT_INSTALL_CONFIGURATION:/home/angelo/DEV/BU=
ILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnue=
abihf/sysroot/usr<br>&gt; QT_INSTALL_CONFIGURATION/raw:/usr<br>&gt; QT_INST=
ALL_EXAMPLES:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/hos=
t/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/qt/examples<br>&gt; Q=
T_INSTALL_EXAMPLES/raw:/usr/lib/qt/examples<br>&gt; QT_INSTALL_DEMOS:/home/=
angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-lin=
ux-uclibcgnueabihf/sysroot/usr/lib/qt/examples<br>&gt; QT_INSTALL_DEMOS/raw=
:/usr/lib/qt/examples<br>&gt; QT_HOST_PREFIX:/home/angelo/DEV/BUILDROOT/br_=
qemu_arm/per-package/qt5base/host<br>&gt; QT_HOST_DATA:/home/angelo/DEV/BUI=
LDROOT/br_qemu_arm/per-package/qt5base/host<br>&gt; QT_HOST_BINS:/home/ange=
lo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/bin<br>&gt; QT_HOST_L=
IBS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/lib<br>=
&gt; QMAKE_SPEC:linux-g++<br>&gt; QMAKE_XSPEC:devices/linux-buildroot-g++<b=
r>&gt; QMAKE_VERSION:3.1<br>&gt; QT_VERSION:5.15.8<br>&gt; angelo@angeloc:~=
/DEV/BUILDROOT/br_qemu_arm$<br>&gt; angelo@angeloc:~/DEV/BUILDROOT/br_qemu_=
arm$ /home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt6base/host/bin/qm=
ake -query<br>&gt; QT_SYSROOT:<br>&gt; QT_INSTALL_PREFIX:/home/angelo/DEV/B=
UILDROOT/br_qemu_arm/per-package/host-qt6base/host<br>&gt; QT_INSTALL_ARCHD=
ATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host<br=
>&gt; QT_INSTALL_DATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/ho=
st-qt6base/host<br>&gt; QT_INSTALL_DOCS:/home/angelo/DEV/BUILDROOT/br_qemu_=
arm/per-package/host-qt6base/host/doc<br>&gt; QT_INSTALL_HEADERS:/home/ange=
lo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/include<br>&gt; =
QT_INSTALL_LIBS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6=
base/host/lib<br>&gt; QT_INSTALL_LIBEXECS:/home/angelo/DEV/BUILDROOT/br_qem=
u_arm/per-package/host-qt6base/host/libexec<br>&gt; QT_INSTALL_BINS:/home/a=
ngelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/bin<br>&gt; Q=
T_INSTALL_TESTS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6=
base/host/tests<br>&gt; QT_INSTALL_PLUGINS:/home/angelo/DEV/BUILDROOT/br_qe=
mu_arm/per-package/host-qt6base/host/plugins<br>&gt; QT_INSTALL_QML:/home/a=
ngelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/qml<br>&gt; Q=
T_INSTALL_TRANSLATIONS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/h=
ost-qt6base/host/translations<br>&gt; QT_INSTALL_CONFIGURATION:<br>&gt; QT_=
INSTALL_EXAMPLES:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt=
6base/host/examples<br>&gt; QT_INSTALL_DEMOS:/home/angelo/DEV/BUILDROOT/br_=
qemu_arm/per-package/host-qt6base/host/examples<br>&gt; QT_HOST_PREFIX:/hom=
e/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host<br>&gt; QT=
_HOST_DATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/=
host<br>&gt; QT_HOST_BINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-packag=
e/host-qt6base/host/bin<br>&gt; QT_HOST_LIBEXECS:/home/angelo/DEV/BUILDROOT=
/br_qemu_arm/per-package/host-qt6base/host/libexec<br>&gt; QT_HOST_LIBS:/ho=
me/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/lib<br>&g=
t; QMAKE_SPEC:linux-g++<br>&gt; QMAKE_XSPEC:linux-g++<br>&gt; QMAKE_VERSION=
:3.1<br>&gt; QT_VERSION:6.4.0<br>&gt;<br>&gt;<br>&gt; Any clue?<br>&gt;<br>=
&gt; I&#39;m looking into fixing qmake for QT6 anyway<br>&gt;<br>&gt; Thank=
s!<br>&gt; --<br>&gt;<br>&gt; Angelo Compagnucci<br>&gt;<br>&gt; Software E=
ngineer<br>&gt;<br>&gt; <a href=3D"mailto:angelo@amarulasolutions.com" targ=
et=3D"_blank">angelo@amarulasolutions.com</a><br>&gt; _____________________=
_____________<br>&gt; Amarula Solutions SRL<br>&gt;<br>&gt; Via le Canevare=
 30, 31100 Treviso, Veneto, IT<br>&gt;<br>&gt; T. +39 (0)42 243 5310<br>&gt=
; <a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@amaru=
lasolutions.com</a><br>&gt;<br>&gt; <a href=3D"http://www.amarulasolutions.=
com" target=3D"_blank">www.amarulasolutions.com</a><br>&gt;<br>&gt; [`as] <=
a href=3D"https://www.amarulasolutions.com" target=3D"_blank">https://www.a=
marulasolutions.com</a>|<br>Hello Angelo,<br><br>Yes this was one of the pa=
rts I couldn&#39;t get working initially for which I opted to set it aside =
for the time being, I dreaded the day this would come as it was a bit of a =
PITA!<br>As for why it doesn&#39;t work, you&#39;ll see that the qmake_xspe=
c is linux-g++ in qt6 and devices/linux-buildroot-g++ in your qt5 build, wh=
at was done in qt5 was that our own qmake device spec was made to work with=
 the BR compiler/flags, you&#39;ll see this in <a href=3D"http://qt5.mk">qt=
5.mk</a> where the qmake command is defined as=20
<table cellspacing=3D"0" cellpadding=3D"0"><tbody><tr class=3D"gmail-vc_row=
_odd" id=3D"gmail-l29"><td class=3D"gmail-vc_file_line_number"><br></td>

<td class=3D"gmail-vc_file_line_text">QT5_QMAKE =3D $(HOST_DIR)/bin/qmake -=
spec devices/linux-buildroot-g++</td></tr></tbody></table>

<div><br></div><div>As for how to do it properly, some good reference here =
is <a href=3D"https://wiki.qt.io/Cross-Compile_Qt_6_for_Raspberry_Pi" targe=
t=3D"_blank">https://wiki.qt.io/Cross-Compile_Qt_6_for_Raspberry_Pi</a> as =
this shows how cross-compiling is now generally done and how they pass the =
device spec during building for the target.<br></div><div>You can also look=
 under the qt5base folder for <a href=3D"http://qt.conf.in">qt.conf.in</a>,=
 <a href=3D"http://qmake.conf.in">qmake.conf.in</a> qplatformdefs.h, that t=
ogether with=20
<span class=3D"gmail-pl-smi">QT5_INSTALL_QT_CONF</span> in <a href=3D"http:=
//qt5.mk">qt5.mk</a> and QT5BASE_CONFIGURE_CMDS in <a href=3D"http://qt5bas=
e.mk">qt5base.mk</a> (more specifically line 335-345) <br></div><div>This f=
rom what I remember is most if not all that is involved in building the bui=
ldroot specific device spec to get qmake working, I hope that at least give=
s you somewhere to start looking.</div><div><br></div><div>As for why I cou=
ldn&#39;t get it working myself at the time, I tried to implement all of th=
e things mentioned above, I had a device spec and the files looked good, I =
passed it to the qt6 target building with -DQT_QMAKE_TARGET_MKSPEC=3Ddevice=
s/linux-buildroot-g++


 and everything done in qt5 to get it working was there (or so I thought at=
 least), but in the end there seemed to be some path issues where qmake was=
 looking at the host qt6 instead of the target qt6 and I never really figur=
ed it out, the whole host/target building of qt6 was quite the PITA in and =
of itself, but I&#39;ll give it another crack since there&#39;s some intere=
st, good to see someone wants to pick it up too!</div><div><br></div><div>I=
 do think I have some work related to this from previous attempts on one of=
 my dev branches, I&#39;ll keep in touch if I find something to send your w=
ay, maybe it helps you to have some starting point.<br></div><div><br></div=
><div>Best regards,</div><div>Jesse<br></div></div>

--00000000000044734605ebd77e95--

--===============4109338215174513160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4109338215174513160==--
