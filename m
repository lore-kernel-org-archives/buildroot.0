Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC41AC04A95
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 08:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E821404EC;
	Tue, 25 Oct 2022 08:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E821404EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iEuw0hFyDrpv; Tue, 25 Oct 2022 08:37:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 379A240499;
	Tue, 25 Oct 2022 08:37:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 379A240499
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 038271BF2FC
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 08:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D23CA40220
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 08:37:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D23CA40220
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AWgk4VXsKA8K for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 08:37:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15EDE400C4
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15EDE400C4
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 08:37:00 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 101-20020a9d0bee000000b00661b54d945fso7232825oth.13
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 01:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YH7/FcE26bFNHAQfJzCYXwlqF5fJhy0els7TqP7RPPI=;
 b=XrxJJB8GOf+nwSUClPFW2d0NMAYUNcx/Dw/2NSl/kyT08qPlLT4Gmb95vF1cpnT29d
 B6H+z/zD+MPU2lvvI410mIwa+HMcoQ9dorarGZfUbHIdoUst5pNQWX88pOn4o1DSDfwg
 8mNd4xY+p3mkxs86TrSYnAYVe2gtU9L6HGmFsPyi22jGq4pzXyFUvEacQDxtCn6+pKY/
 inY6xpjrdA6qpdrJgV6DEQFFzE39EJXin8YqCpst0Pj4zKA8eEFmnLAI6YFQ+W52o0Mz
 n7B5+cz5vWL6D1Og0Sya9Ro7ferPntCsSyd95yqCBqQy7MetYE4nVXoVdVeEU2WXf/dm
 T5hQ==
X-Gm-Message-State: ACrzQf28JqWxKiwj687Dl8ySIKWsSYko1roukZNjcp0JuNSKKYFTDWd6
 Z6jQ0CCxWfSlEePGOpG+ivL9bASRK6oWOb1xQJu8otiTM64=
X-Google-Smtp-Source: AMsMyM5Ov1cVb/lYTxeYPTEhEgh7Jzx3/hEdgYO27vmDbgNN4YkeqTTc2GgV/FjzHeIleCzrQJBJMwRn7GMrIjWQYdY=
X-Received: by 2002:a9d:7d04:0:b0:661:b65c:63c8 with SMTP id
 v4-20020a9d7d04000000b00661b65c63c8mr18207312otn.384.1666687019004; Tue, 25
 Oct 2022 01:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <CA+_SqVb8PiTaw9o5KSTohDQ_Ym5aT4o8u8s_KiFZZ9M_nv8tNg@mail.gmail.com>
 <CAMdwsN-Z81fu9G9ACu2HsRV4RtpRGvn+7tonvVRC4ntdL=-U9Q@mail.gmail.com>
In-Reply-To: <CAMdwsN-Z81fu9G9ACu2HsRV4RtpRGvn+7tonvVRC4ntdL=-U9Q@mail.gmail.com>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 25 Oct 2022 10:36:22 +0200
Message-ID: <CA+_SqVZMma6C5mMaaVuMZ57j64-jwTEg4ZavHbrWKpv8B85mGg@mail.gmail.com>
To: Jesse Van Gavere <jesseevg@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YH7/FcE26bFNHAQfJzCYXwlqF5fJhy0els7TqP7RPPI=;
 b=Kmhu6hkgz47PpQdVcd4izvsQFwiKiGoAtOSO0ACnnNqKnKqlkCF6o4iD4dPekTDnfb
 2lpSomjR13l62Kqs4UJ5HatukUIOwltQlhJO3I49KCpupBPxHU6oLb3a4HEv26tFXQAQ
 AZWkXreWj/qf83+INY4Poy8GsROkpcpF84qyw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Kmhu6hkg
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
Content-Type: multipart/mixed; boundary="===============1030640086793263184=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1030640086793263184==
Content-Type: multipart/alternative; boundary="000000000000b84a2e05ebd7cf12"

--000000000000b84a2e05ebd7cf12
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 25, 2022 at 10:14 AM Jesse Van Gavere <jesseevg@gmail.com>
wrote:

>  Op di 25 okt. 2022 om 09:33 schreef Angelo Compagnucci <
> angelo@amarulasolutions.com>:
> >
> > Hello Jesse,
> >
> > I was trying to port qt6knx to qt6, the project is not converted to
> cmake but still based on qmake.
> > I was able to compile it on x86 using qt6 but qmake in buildroot QT6 is
> somewhat broken, the following snip shows the differences between qmake for
> QT5 and QT6:
> >
> > angelo@angeloc:~/DEV/BUILDROOT/br_qemu_arm$
> /home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/bin/qmake
> -query
> >
> QT_SYSROOT:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot
> >
> QT_INSTALL_PREFIX:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr
> > QT_INSTALL_PREFIX/raw:/usr
> >
> QT_INSTALL_ARCHDATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr
> > QT_INSTALL_ARCHDATA/raw:/usr
> >
> QT_INSTALL_DATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr
> > QT_INSTALL_DATA/raw:/usr
> >
> QT_INSTALL_DOCS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/doc
> > QT_INSTALL_DOCS/raw:/usr/doc
> >
> QT_INSTALL_HEADERS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/qt5
> > QT_INSTALL_HEADERS/raw:/usr/include/qt5
> >
> QT_INSTALL_LIBS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib
> > QT_INSTALL_LIBS/raw:/usr/lib
> >
> QT_INSTALL_LIBEXECS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/libexec
> > QT_INSTALL_LIBEXECS/raw:/usr/libexec
> >
> QT_INSTALL_BINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin
> > QT_INSTALL_BINS/raw:/usr/bin
> >
> QT_INSTALL_TESTS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/tests
> > QT_INSTALL_TESTS/raw:/usr/tests
> >
> QT_INSTALL_PLUGINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/qt/plugins
> > QT_INSTALL_PLUGINS/raw:/usr/lib/qt/plugins
> >
> QT_INSTALL_IMPORTS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/imports
> > QT_INSTALL_IMPORTS/raw:/usr/imports
> >
> QT_INSTALL_QML:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/qml
> > QT_INSTALL_QML/raw:/usr/qml
> >
> QT_INSTALL_TRANSLATIONS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/translations
> > QT_INSTALL_TRANSLATIONS/raw:/usr/translations
> >
> QT_INSTALL_CONFIGURATION:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr
> > QT_INSTALL_CONFIGURATION/raw:/usr
> >
> QT_INSTALL_EXAMPLES:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/qt/examples
> > QT_INSTALL_EXAMPLES/raw:/usr/lib/qt/examples
> >
> QT_INSTALL_DEMOS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/qt/examples
> > QT_INSTALL_DEMOS/raw:/usr/lib/qt/examples
> >
> QT_HOST_PREFIX:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host
> >
> QT_HOST_DATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host
> >
> QT_HOST_BINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/bin
> >
> QT_HOST_LIBS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/lib
> > QMAKE_SPEC:linux-g++
> > QMAKE_XSPEC:devices/linux-buildroot-g++
> > QMAKE_VERSION:3.1
> > QT_VERSION:5.15.8
> > angelo@angeloc:~/DEV/BUILDROOT/br_qemu_arm$
> > angelo@angeloc:~/DEV/BUILDROOT/br_qemu_arm$
> /home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt6base/host/bin/qmake
> -query
> > QT_SYSROOT:
> >
> QT_INSTALL_PREFIX:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host
> >
> QT_INSTALL_ARCHDATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host
> >
> QT_INSTALL_DATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host
> >
> QT_INSTALL_DOCS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/doc
> >
> QT_INSTALL_HEADERS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/include
> >
> QT_INSTALL_LIBS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/lib
> >
> QT_INSTALL_LIBEXECS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/libexec
> >
> QT_INSTALL_BINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/bin
> >
> QT_INSTALL_TESTS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/tests
> >
> QT_INSTALL_PLUGINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/plugins
> >
> QT_INSTALL_QML:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/qml
> >
> QT_INSTALL_TRANSLATIONS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/translations
> > QT_INSTALL_CONFIGURATION:
> >
> QT_INSTALL_EXAMPLES:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/examples
> >
> QT_INSTALL_DEMOS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/examples
> >
> QT_HOST_PREFIX:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host
> >
> QT_HOST_DATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host
> >
> QT_HOST_BINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/bin
> >
> QT_HOST_LIBEXECS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/libexec
> >
> QT_HOST_LIBS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/lib
> > QMAKE_SPEC:linux-g++
> > QMAKE_XSPEC:linux-g++
> > QMAKE_VERSION:3.1
> > QT_VERSION:6.4.0
> >
> >
> > Any clue?
> >
> > I'm looking into fixing qmake for QT6 anyway
> >
> > Thanks!
> > --
> >
> > Angelo Compagnucci
> >
> > Software Engineer
> >
> > angelo@amarulasolutions.com
> > __________________________________
> > Amarula Solutions SRL
> >
> > Via le Canevare 30, 31100 Treviso, Veneto, IT
> >
> > T. +39 (0)42 243 5310
> > info@amarulasolutions.com
> >
> > www.amarulasolutions.com
> >
> > [`as] https://www.amarulasolutions.com|
> Hello Angelo,
>
> Yes this was one of the parts I couldn't get working initially for which I
> opted to set it aside for the time being, I dreaded the day this would come
> as it was a bit of a PITA!
> As for why it doesn't work, you'll see that the qmake_xspec is linux-g++
> in qt6 and devices/linux-buildroot-g++ in your qt5 build, what was done in
> qt5 was that our own qmake device spec was made to work with the BR
> compiler/flags, you'll see this in qt5.mk where the qmake command is
> defined as
>
> QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
>
> As for how to do it properly, some good reference here is
> https://wiki.qt.io/Cross-Compile_Qt_6_for_Raspberry_Pi as this shows how
> cross-compiling is now generally done and how they pass the device spec
> during building for the target.
> You can also look under the qt5base folder for qt.conf.in, qmake.conf.in
> qplatformdefs.h, that together with QT5_INSTALL_QT_CONF in qt5.mk and
> QT5BASE_CONFIGURE_CMDS in qt5base.mk (more specifically line 335-345)
> This from what I remember is most if not all that is involved in building
> the buildroot specific device spec to get qmake working, I hope that at
> least gives you somewhere to start looking.
>
> As for why I couldn't get it working myself at the time, I tried to
> implement all of the things mentioned above, I had a device spec and the
> files looked good, I passed it to the qt6 target building with
> -DQT_QMAKE_TARGET_MKSPEC=devices/linux-buildroot-g++ and everything done in
> qt5 to get it working was there (or so I thought at least), but in the end
> there seemed to be some path issues where qmake was looking at the host qt6
> instead of the target qt6 and I never really figured it out, the whole
> host/target building of qt6 was quite the PITA in and of itself, but I'll
> give it another crack since there's some interest, good to see someone
> wants to pick it up too!
>
> I do think I have some work related to this from previous attempts on one
> of my dev branches, I'll keep in touch if I find something to send your
> way, maybe it helps you to have some starting point.
>

So we share the very same frustration I guess! I did exactly all the things
you mentioned, and I couldn't make it working. Let's try harder, then!

Thanks for your quick reply!


>
> Best regards,
> Jesse
>


-- 

Angelo Compagnucci

Software Engineer

angelo@amarulasolutions.com
__________________________________
Amarula Solutions SRL

Via le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 (0)42 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
[`as] https://www.amarulasolutions.com|

--000000000000b84a2e05ebd7cf12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 25, 2022 at 10:14 AM Jess=
e Van Gavere &lt;<a href=3D"mailto:jesseevg@gmail.com">jesseevg@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr">=C2=A0Op di 25 okt. 2022 om 09:33 schreef Angelo Compagnucci=
 &lt;<a href=3D"mailto:angelo@amarulasolutions.com" target=3D"_blank">angel=
o@amarulasolutions.com</a>&gt;:<br>&gt;<br>&gt; Hello Jesse,<br>&gt;<br>&gt=
; I was trying to port qt6knx to qt6, the project is not converted to cmake=
 but still based on qmake.<br>&gt; I was able to compile it on x86 using qt=
6 but qmake in buildroot QT6 is somewhat broken, the following snip shows t=
he differences between qmake for QT5 and QT6:<br>&gt;<br>&gt; angelo@angelo=
c:~/DEV/BUILDROOT/br_qemu_arm$ /home/angelo/DEV/BUILDROOT/br_qemu_arm/per-p=
ackage/qt5base/host/bin/qmake -query<br>&gt; QT_SYSROOT:/home/angelo/DEV/BU=
ILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnue=
abihf/sysroot<br>&gt; QT_INSTALL_PREFIX:/home/angelo/DEV/BUILDROOT/br_qemu_=
arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/us=
r<br>&gt; QT_INSTALL_PREFIX/raw:/usr<br>&gt; QT_INSTALL_ARCHDATA:/home/ange=
lo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-u=
clibcgnueabihf/sysroot/usr<br>&gt; QT_INSTALL_ARCHDATA/raw:/usr<br>&gt; QT_=
INSTALL_DATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/hos=
t/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr<br>&gt; QT_INSTALL_DATA/r=
aw:/usr<br>&gt; QT_INSTALL_DOCS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-=
package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/doc<br=
>&gt; QT_INSTALL_DOCS/raw:/usr/doc<br>&gt; QT_INSTALL_HEADERS:/home/angelo/=
DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-ucli=
bcgnueabihf/sysroot/usr/include/qt5<br>&gt; QT_INSTALL_HEADERS/raw:/usr/inc=
lude/qt5<br>&gt; QT_INSTALL_LIBS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per=
-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib<b=
r>&gt; QT_INSTALL_LIBS/raw:/usr/lib<br>&gt; QT_INSTALL_LIBEXECS:/home/angel=
o/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uc=
libcgnueabihf/sysroot/usr/libexec<br>&gt; QT_INSTALL_LIBEXECS/raw:/usr/libe=
xec<br>&gt; QT_INSTALL_BINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-pack=
age/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin<br>&gt=
; QT_INSTALL_BINS/raw:/usr/bin<br>&gt; QT_INSTALL_TESTS:/home/angelo/DEV/BU=
ILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnue=
abihf/sysroot/usr/tests<br>&gt; QT_INSTALL_TESTS/raw:/usr/tests<br>&gt; QT_=
INSTALL_PLUGINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/=
host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/qt/plugins<br>&gt;=
 QT_INSTALL_PLUGINS/raw:/usr/lib/qt/plugins<br>&gt; QT_INSTALL_IMPORTS:/hom=
e/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-l=
inux-uclibcgnueabihf/sysroot/usr/imports<br>&gt; QT_INSTALL_IMPORTS/raw:/us=
r/imports<br>&gt; QT_INSTALL_QML:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per=
-package/qt5base/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/qml<b=
r>&gt; QT_INSTALL_QML/raw:/usr/qml<br>&gt; QT_INSTALL_TRANSLATIONS:/home/an=
gelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux=
-uclibcgnueabihf/sysroot/usr/translations<br>&gt; QT_INSTALL_TRANSLATIONS/r=
aw:/usr/translations<br>&gt; QT_INSTALL_CONFIGURATION:/home/angelo/DEV/BUIL=
DROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux-uclibcgnueab=
ihf/sysroot/usr<br>&gt; QT_INSTALL_CONFIGURATION/raw:/usr<br>&gt; QT_INSTAL=
L_EXAMPLES:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/=
arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/qt/examples<br>&gt; QT_=
INSTALL_EXAMPLES/raw:/usr/lib/qt/examples<br>&gt; QT_INSTALL_DEMOS:/home/an=
gelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/arm-buildroot-linux=
-uclibcgnueabihf/sysroot/usr/lib/qt/examples<br>&gt; QT_INSTALL_DEMOS/raw:/=
usr/lib/qt/examples<br>&gt; QT_HOST_PREFIX:/home/angelo/DEV/BUILDROOT/br_qe=
mu_arm/per-package/qt5base/host<br>&gt; QT_HOST_DATA:/home/angelo/DEV/BUILD=
ROOT/br_qemu_arm/per-package/qt5base/host<br>&gt; QT_HOST_BINS:/home/angelo=
/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/bin<br>&gt; QT_HOST_LIB=
S:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt5base/host/lib<br>&g=
t; QMAKE_SPEC:linux-g++<br>&gt; QMAKE_XSPEC:devices/linux-buildroot-g++<br>=
&gt; QMAKE_VERSION:3.1<br>&gt; QT_VERSION:5.15.8<br>&gt; angelo@angeloc:~/D=
EV/BUILDROOT/br_qemu_arm$<br>&gt; angelo@angeloc:~/DEV/BUILDROOT/br_qemu_ar=
m$ /home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/qt6base/host/bin/qmak=
e -query<br>&gt; QT_SYSROOT:<br>&gt; QT_INSTALL_PREFIX:/home/angelo/DEV/BUI=
LDROOT/br_qemu_arm/per-package/host-qt6base/host<br>&gt; QT_INSTALL_ARCHDAT=
A:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host<br>&=
gt; QT_INSTALL_DATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host=
-qt6base/host<br>&gt; QT_INSTALL_DOCS:/home/angelo/DEV/BUILDROOT/br_qemu_ar=
m/per-package/host-qt6base/host/doc<br>&gt; QT_INSTALL_HEADERS:/home/angelo=
/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/include<br>&gt; QT=
_INSTALL_LIBS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6ba=
se/host/lib<br>&gt; QT_INSTALL_LIBEXECS:/home/angelo/DEV/BUILDROOT/br_qemu_=
arm/per-package/host-qt6base/host/libexec<br>&gt; QT_INSTALL_BINS:/home/ang=
elo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/bin<br>&gt; QT_=
INSTALL_TESTS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6ba=
se/host/tests<br>&gt; QT_INSTALL_PLUGINS:/home/angelo/DEV/BUILDROOT/br_qemu=
_arm/per-package/host-qt6base/host/plugins<br>&gt; QT_INSTALL_QML:/home/ang=
elo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/qml<br>&gt; QT_=
INSTALL_TRANSLATIONS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/hos=
t-qt6base/host/translations<br>&gt; QT_INSTALL_CONFIGURATION:<br>&gt; QT_IN=
STALL_EXAMPLES:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6b=
ase/host/examples<br>&gt; QT_INSTALL_DEMOS:/home/angelo/DEV/BUILDROOT/br_qe=
mu_arm/per-package/host-qt6base/host/examples<br>&gt; QT_HOST_PREFIX:/home/=
angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host<br>&gt; QT_H=
OST_DATA:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/ho=
st<br>&gt; QT_HOST_BINS:/home/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/=
host-qt6base/host/bin<br>&gt; QT_HOST_LIBEXECS:/home/angelo/DEV/BUILDROOT/b=
r_qemu_arm/per-package/host-qt6base/host/libexec<br>&gt; QT_HOST_LIBS:/home=
/angelo/DEV/BUILDROOT/br_qemu_arm/per-package/host-qt6base/host/lib<br>&gt;=
 QMAKE_SPEC:linux-g++<br>&gt; QMAKE_XSPEC:linux-g++<br>&gt; QMAKE_VERSION:3=
.1<br>&gt; QT_VERSION:6.4.0<br>&gt;<br>&gt;<br>&gt; Any clue?<br>&gt;<br>&g=
t; I&#39;m looking into fixing qmake for QT6 anyway<br>&gt;<br>&gt; Thanks!=
<br>&gt; --<br>&gt;<br>&gt; Angelo Compagnucci<br>&gt;<br>&gt; Software Eng=
ineer<br>&gt;<br>&gt; <a href=3D"mailto:angelo@amarulasolutions.com" target=
=3D"_blank">angelo@amarulasolutions.com</a><br>&gt; _______________________=
___________<br>&gt; Amarula Solutions SRL<br>&gt;<br>&gt; Via le Canevare 3=
0, 31100 Treviso, Veneto, IT<br>&gt;<br>&gt; T. +39 (0)42 243 5310<br>&gt; =
<a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@amarula=
solutions.com</a><br>&gt;<br>&gt; <a href=3D"http://www.amarulasolutions.co=
m" target=3D"_blank">www.amarulasolutions.com</a><br>&gt;<br>&gt; [`as] <a =
href=3D"https://www.amarulasolutions.com" target=3D"_blank">https://www.ama=
rulasolutions.com</a>|<br>Hello Angelo,<br><br>Yes this was one of the part=
s I couldn&#39;t get working initially for which I opted to set it aside fo=
r the time being, I dreaded the day this would come as it was a bit of a PI=
TA!<br>As for why it doesn&#39;t work, you&#39;ll see that the qmake_xspec =
is linux-g++ in qt6 and devices/linux-buildroot-g++ in your qt5 build, what=
 was done in qt5 was that our own qmake device spec was made to work with t=
he BR compiler/flags, you&#39;ll see this in <a href=3D"http://qt5.mk" targ=
et=3D"_blank">qt5.mk</a> where the qmake command is defined as=20
<table cellspacing=3D"0" cellpadding=3D"0"><tbody><tr id=3D"m_-194346185476=
2797629gmail-l29"><td><br></td>

<td>QT5_QMAKE =3D $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++</=
td></tr></tbody></table>

<div><br></div><div>As for how to do it properly, some good reference here =
is <a href=3D"https://wiki.qt.io/Cross-Compile_Qt_6_for_Raspberry_Pi" targe=
t=3D"_blank">https://wiki.qt.io/Cross-Compile_Qt_6_for_Raspberry_Pi</a> as =
this shows how cross-compiling is now generally done and how they pass the =
device spec during building for the target.<br></div><div>You can also look=
 under the qt5base folder for <a href=3D"http://qt.conf.in" target=3D"_blan=
k">qt.conf.in</a>, <a href=3D"http://qmake.conf.in" target=3D"_blank">qmake=
.conf.in</a> qplatformdefs.h, that together with=20
<span>QT5_INSTALL_QT_CONF</span> in <a href=3D"http://qt5.mk" target=3D"_bl=
ank">qt5.mk</a> and QT5BASE_CONFIGURE_CMDS in <a href=3D"http://qt5base.mk"=
 target=3D"_blank">qt5base.mk</a> (more specifically line 335-345) <br></di=
v><div>This from what I remember is most if not all that is involved in bui=
lding the buildroot specific device spec to get qmake working, I hope that =
at least gives you somewhere to start looking.</div><div><br></div><div>As =
for why I couldn&#39;t get it working myself at the time, I tried to implem=
ent all of the things mentioned above, I had a device spec and the files lo=
oked good, I passed it to the qt6 target building with -DQT_QMAKE_TARGET_MK=
SPEC=3Ddevices/linux-buildroot-g++


 and everything done in qt5 to get it working was there (or so I thought at=
 least), but in the end there seemed to be some path issues where qmake was=
 looking at the host qt6 instead of the target qt6 and I never really figur=
ed it out, the whole host/target building of qt6 was quite the PITA in and =
of itself, but I&#39;ll give it another crack since there&#39;s some intere=
st, good to see someone wants to pick it up too!</div><div><br></div><div>I=
 do think I have some work related to this from previous attempts on one of=
 my dev branches, I&#39;ll keep in touch if I find something to send your w=
ay, maybe it helps you to have some starting point.<br></div></div></blockq=
uote><div><br></div><div>So we share the very same frustration I guess! I d=
id exactly all the things you mentioned, and I couldn&#39;t make it working=
. Let&#39;s try harder, then!</div><div><br></div><div>Thanks for your quic=
k reply!</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div></div><div><br></div><div>Best regards,</d=
iv><div>Jesse<br></div></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-st=
yle:normal;font-variant:normal;text-decoration:none;vertical-align:baseline=
;white-space:pre-wrap"></span><span style=3D"font-size:10pt;font-family:Ubu=
ntu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:50=
0;font-style:normal;font-variant:normal;text-decoration:none;vertical-align=
:baseline;white-space:pre-wrap">Angelo Compagnucci</span></p><p dir=3D"ltr"=
 style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,=
0);background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wra=
p">Software Engineer</span></p><p dir=3D"ltr" style=3D"line-height:1.8;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&qu=
ot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:angelo@am=
arulasolutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>=C2=A0=
<br></span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot=
;,monospace;color:rgb(241,194,50);background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre-wrap">__________________________________</span>=
<span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace=
;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:Ubun=
tu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:500=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre-wrap">Amarula Solutions SRL</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">Via le Canevare 30, 31100 Treviso, Veneto, IT</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">T. +39 (0)42 243 5310</span><span style=3D"font-size:10pt;font-famil=
y:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:trans=
parent;font-weight:400;font-style:normal;font-variant:normal;text-decoratio=
n:none;vertical-align:baseline;white-space:pre-wrap"><br></span><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap"><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@=
amarulasolutions.com</a></span></p><p dir=3D"ltr" style=3D"line-height:1.8;=
margin-top:0pt;margin-bottom:0pt"><a href=3D"http://www.amarulasolutions.co=
m/" style=3D"text-decoration:none" target=3D"_blank"><span style=3D"font-si=
ze:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">www.=
amarulasolutions.com</span></a></p><div>[`as] <a href=3D"https://www.amarul=
asolutions.com" target=3D"_blank">https://www.amarulasolutions.com</a>|</di=
v></div></div></div>

--000000000000b84a2e05ebd7cf12--

--===============1030640086793263184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1030640086793263184==--
