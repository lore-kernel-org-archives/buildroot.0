Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334EFC4332F
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 16:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0B3A4019E;
	Sat, 31 Dec 2022 16:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0B3A4019E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5cY3z0p8UZJW; Sat, 31 Dec 2022 16:27:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCD8440327;
	Sat, 31 Dec 2022 16:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCD8440327
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7DD321BF47D
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57FB8403F5
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:26:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57FB8403F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q5O0-jCkK5Bw for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 16:26:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3564E403ED
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3564E403ED
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 16:26:56 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so16639612pjk.3
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 08:26:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z3S6Dhm/r26mI/1nRwDms6pllBwCIv+aPlcAXJ7fWnc=;
 b=68v/IG6Yx2UzacvUfH9I7rZuCUIadh2DwhpYIErtE8g1J3DigV65b2FKzrdoEdG+Zn
 PbDF4hBuG7uBttCgl29JnUqu7h0Ck2mvt1OXVBeoQxOatg7hIZBOi5kaKJ1PxX2xH4FZ
 pvTJwGkBBJ5IlJMP25mrRCokKHyvJ6Tf0mEJc3e/HgpJbR3/2rD0cvgelL3q+Qjx6CVr
 9abcGjNhlkdRIlO3ksyys0j9eiLWhLPPNe1cz2Y6l2FU11e09iRlkc6TlWyaG21JrhfG
 s4iQheOEZUpEQaecPXiv+9jFwUu8I2IfqsNzkSXeRKPARExsDJZASY1zLSgf/syB8DeA
 frRA==
X-Gm-Message-State: AFqh2koaOe4zsX2OzWWEmjyRZceWSDY6GndUv0BvM82pUaFhtFdKFwDC
 ybnqUP78fvR15DULok8aOPIkWjBLytrZsBZbHcE=
X-Google-Smtp-Source: AMrXdXsQzuM6aY2qutA1vTW3Upcm2mzHLjj/XkY/uahZf++foWhg9WWKRrXvibwDjoaLGG5INDJrqA==
X-Received: by 2002:a17:902:b710:b0:192:6429:440e with SMTP id
 d16-20020a170902b71000b001926429440emr27644846pls.34.1672504015968; 
 Sat, 31 Dec 2022 08:26:55 -0800 (PST)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com.
 [209.85.210.182]) by smtp.gmail.com with ESMTPSA id
 i18-20020a17090332d200b001897a8b537asm17082926plr.221.2022.12.31.08.26.55
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Dec 2022 08:26:55 -0800 (PST)
Received: by mail-pf1-f182.google.com with SMTP id k19so8486249pfg.11
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 08:26:55 -0800 (PST)
X-Received: by 2002:a63:2746:0:b0:478:eb77:2ce5 with SMTP id
 n67-20020a632746000000b00478eb772ce5mr1818460pgn.97.1672504014855; Sat, 31
 Dec 2022 08:26:54 -0800 (PST)
MIME-Version: 1.0
References: <20221231093425.237228-1-fontaine.fabrice@gmail.com>
 <20221231161439.GN2498764@scaer>
In-Reply-To: <20221231161439.GN2498764@scaer>
From: Aleksander Morgado <aleksander@aleksander.es>
Date: Sat, 31 Dec 2022 17:26:45 +0100
X-Gmail-Original-Message-ID: <CAA3JqEdCNdrj0ZxKX-Ucq=RsmKL_6RLR3VSPLofxMyS1BBD8dw@mail.gmail.com>
Message-ID: <CAA3JqEdCNdrj0ZxKX-Ucq=RsmKL_6RLR3VSPLofxMyS1BBD8dw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aleksander-es.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z3S6Dhm/r26mI/1nRwDms6pllBwCIv+aPlcAXJ7fWnc=;
 b=Z0uaGQE8ujgSYOotRT5PxJ6DpTkjUMOE1Tit4q/Ge28QwY4GhKtoSLwLSr+u7a7ms8
 uKHbihOCK2eeSRntB7mahO3yx3Gty+T/RrtmjfJBSLznAjDIJVDWuAsYBUwKo/9aS7fY
 orsieVWhBsWxy3HoCbmWgnKT+PK9x2DUGC90PEEABt8A6anK/uVYVsA3Kub2r0uevzVV
 9hOGryIOPFL6a8lL+3qR7gjbuy2odRlMjAO3jK4oLW9LZfYMopAwx3G07CgLbsXam2HS
 yDbbKsU7HMjDgRkV5exnmTENydDnCUMuCXYtAjOCCz2L2OeiH5KMPxXDLEhXtY/RY9vg
 3itw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aleksander-es.20210112.gappssmtp.com
 header.i=@aleksander-es.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Z0uaGQE8
Subject: Re: [Buildroot] [PATCH 1/1] package/modem-manager: fix static build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5772997485119377270=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5772997485119377270==
Content-Type: multipart/alternative; boundary="000000000000b0e55505f1222f59"

--000000000000b0e55505f1222f59
Content-Type: text/plain; charset="UTF-8"

Hey


>
> > Fix the following static build failure raised since bump to version
> > 1.20.2 in commit b95334b71fbdde0f7621b58ed35fa98df9e0966d:
> >
> > FAILED: src/ModemManager
> >
> /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/bin/m68k-linux-gcc
> -o src/ModemManager
> src/ModemManager.p/meson-generated_.._mm-daemon-enums-types.c.o
> src/ModemManager.p/main.c.o src/ModemManager.p/mm-auth-provider.c.o
> src/ModemManager.p/mm-base-bearer.c.o src/ModemManager.p/mm-base-call.c.o
> src/ModemManager.p/mm-base-manager.c.o
> src/ModemManager.p/mm-base-modem-at.c.o
> src/ModemManager.p/mm-base-modem.c.o src/ModemManager.p/mm-base-sim.c.o
> src/ModemManager.p/mm-base-sms.c.o src/ModemManager.p/mm-bearer-list.c.o
> src/ModemManager.p/mm-broadband-bearer.c.o
> src/ModemManager.p/mm-broadband-modem.c.o
> src/ModemManager.p/mm-call-list.c.o src/ModemManager.p/mm-context.c.o
> src/ModemManager.p/mm-device.c.o src/ModemManager.p/mm-dispatcher.c.o
> src/ModemManager.p/mm-dispatcher-connection.c.o
> src/ModemManager.p/mm-dispatcher-fcc-unlock.c.o
> src/ModemManager.p/mm-filter.c.o src/ModemManager.p/mm-iface-modem-3gpp.c.o
> src/ModemManager.p/mm-iface-modem-3gpp-profile-manage
> >  r.c.o src/ModemManager.p/mm-iface-modem-3gpp-ussd.c.o
> src/ModemManager.p/mm-iface-modem.c.o
> src/ModemManager.p/mm-iface-modem-cdma.c.o
> src/ModemManager.p/mm-iface-modem-firmware.c.o
> src/ModemManager.p/mm-iface-modem-location.c.o
> src/ModemManager.p/mm-iface-modem-messaging.c.o
> src/ModemManager.p/mm-iface-modem-oma.c.o
> src/ModemManager.p/mm-iface-modem-sar.c.o
> src/ModemManager.p/mm-iface-modem-signal.c.o
> src/ModemManager.p/mm-iface-modem-simple.c.o
> src/ModemManager.p/mm-iface-modem-time.c.o
> src/ModemManager.p/mm-iface-modem-voice.c.o
> src/ModemManager.p/mm-plugin.c.o src/ModemManager.p/mm-plugin-manager.c.o
> src/ModemManager.p/mm-port-probe.c.o
> src/ModemManager.p/mm-port-probe-at.c.o
> src/ModemManager.p/mm-private-boxed-types.c.o
> src/ModemManager.p/mm-sms-list.c.o -Wl,--as-needed -Wl,--no-undefined
> -Wl,-O1 -static '-Wl,-rpath,$ORIGIN/../libmm-glib'
> -Wl,-rpath-link,/home/autobuild/autobuild/instance-11/output-1/build/modem-manager-1.20.2/build/libmm-glib
> -Wl,--start-group src/libport.a sr
> >  c/libkerneldevice.a src/libhelpers.a libmm-glib/libmm-glib.so.0.9.0
> libqcdm/src/libqcdm.a libmm-glib/generated/tests/libmm-test-generated.a
> -Wl,--export-dynamic
> /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgmodule-2.0.a
> /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libglib-2.0.a
> -pthread -lm
> /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libpcre.a
> /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgio-2.0.a
> /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgobject-2.0.a
> /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libffi.a
> /home/autob
> >
> uild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libz.a
> /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libmount.a
> /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libblkid.a
> -Wl,--end-group
> >
> /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/11.2.0/../../../../m68k-buildroot-linux-uclibc/bin/ld:
> attempted static link of dynamic object `libmm-glib/libmm-glib.so.0.9.0'
> >
> > Fixes:
> >  -
> http://autobuild.buildroot.org/results/9803d593305df36c4a8d67aac2fb4c9a3120a072
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Upstream accepted your patch now, so I did an actual backport.
>

FYI, release 1.20.4 is also out and contains this patch

Cheers!

>

--000000000000b0e55505f1222f59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hey<br><br><div class=3D"gmail_quote" dir=3D"auto"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><br><br>
&gt; Fix the following static build failure raised since bump to version<br=
>
&gt; 1.20.2 in commit b95334b71fbdde0f7621b58ed35fa98df9e0966d:<br>
&gt; <br>
&gt; FAILED: src/ModemManager<br>
&gt; /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manag=
er/host/bin/m68k-linux-gcc=C2=A0 -o src/ModemManager src/ModemManager.p/mes=
on-generated_.._mm-daemon-enums-types.c.o src/ModemManager.p/main.c.o src/M=
odemManager.p/mm-auth-provider.c.o src/ModemManager.p/mm-base-bearer.c.o sr=
c/ModemManager.p/mm-base-call.c.o src/ModemManager.p/mm-base-manager.c.o sr=
c/ModemManager.p/mm-base-modem-at.c.o src/ModemManager.p/mm-base-modem.c.o =
src/ModemManager.p/mm-base-sim.c.o src/ModemManager.p/mm-base-sms.c.o src/M=
odemManager.p/mm-bearer-list.c.o src/ModemManager.p/mm-broadband-bearer.c.o=
 src/ModemManager.p/mm-broadband-modem.c.o src/ModemManager.p/mm-call-list.=
c.o src/ModemManager.p/mm-context.c.o src/ModemManager.p/mm-device.c.o src/=
ModemManager.p/mm-dispatcher.c.o src/ModemManager.p/mm-dispatcher-connectio=
n.c.o src/ModemManager.p/mm-dispatcher-fcc-unlock.c.o src/ModemManager.p/mm=
-filter.c.o src/ModemManager.p/mm-iface-modem-3gpp.c.o src/ModemManager.p/m=
m-iface-modem-3gpp-profile-manage<br>
&gt;=C2=A0 r.c.o src/ModemManager.p/mm-iface-modem-3gpp-ussd.c.o src/ModemM=
anager.p/mm-iface-modem.c.o src/ModemManager.p/mm-iface-modem-cdma.c.o src/=
ModemManager.p/mm-iface-modem-firmware.c.o src/ModemManager.p/mm-iface-mode=
m-location.c.o src/ModemManager.p/mm-iface-modem-messaging.c.o src/ModemMan=
ager.p/mm-iface-modem-oma.c.o src/ModemManager.p/mm-iface-modem-sar.c.o src=
/ModemManager.p/mm-iface-modem-signal.c.o src/ModemManager.p/mm-iface-modem=
-simple.c.o src/ModemManager.p/mm-iface-modem-time.c.o src/ModemManager.p/m=
m-iface-modem-voice.c.o src/ModemManager.p/mm-plugin.c.o src/ModemManager.p=
/mm-plugin-manager.c.o src/ModemManager.p/mm-port-probe.c.o src/ModemManage=
r.p/mm-port-probe-at.c.o src/ModemManager.p/mm-private-boxed-types.c.o src/=
ModemManager.p/mm-sms-list.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -=
static &#39;-Wl,-rpath,$ORIGIN/../libmm-glib&#39; -Wl,-rpath-link,/home/aut=
obuild/autobuild/instance-11/output-1/build/modem-manager-1.20.2/build/libm=
m-glib -Wl,--start-group src/libport.a sr<br>
&gt;=C2=A0 c/libkerneldevice.a src/libhelpers.a libmm-glib/libmm-glib.so.0.=
9.0 libqcdm/src/libqcdm.a libmm-glib/generated/tests/libmm-test-generated.a=
 -Wl,--export-dynamic /home/autobuild/autobuild/instance-11/output-1/per-pa=
ckage/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgmo=
dule-2.0.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem=
-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libglib-2.0.a -pt=
hread -lm /home/autobuild/autobuild/instance-11/output-1/per-package/modem-=
manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libpcre.a /home/au=
tobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-=
buildroot-linux-uclibc/sysroot/usr/lib/libgio-2.0.a /home/autobuild/autobui=
ld/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux=
-uclibc/sysroot/usr/lib/libgobject-2.0.a /home/autobuild/autobuild/instance=
-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sys=
root/usr/lib/libffi.a /home/autob<br>
&gt;=C2=A0 uild/autobuild/instance-11/output-1/per-package/modem-manager/ho=
st/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libz.a /home/autobuild/autob=
uild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-lin=
ux-uclibc/sysroot/usr/lib/libmount.a /home/autobuild/autobuild/instance-11/=
output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot=
/usr/lib/libblkid.a -Wl,--end-group<br>
&gt; /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manag=
er/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/11.2.0=
/../../../../m68k-buildroot-linux-uclibc/bin/ld: attempted static link of d=
ynamic object `libmm-glib/libmm-glib.so.0.9.0&#39;<br>
&gt; <br>
&gt; Fixes:<br>
&gt;=C2=A0 - <a href=3D"http://autobuild.buildroot.org/results/9803d593305d=
f36c4a8d67aac2fb4c9a3120a072" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">http://autobuild.buildroot.org/results/9803d593305df36c4a8d67aac2fb4c9a3=
120a072</a><br>
&gt; <br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank" rel=3D"noreferrer">fontaine.fabrice@gmail.com=
</a>&gt;<br>
<br>
Upstream accepted your patch now, so I did an actual backport.<br></blockqu=
ote></div><div dir=3D"auto"><br></div><div dir=3D"auto">FYI, release 1.20.4=
 is also out and contains this patch<br></div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Cheers!</div><div class=3D"gmail_quote" dir=3D"auto"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"></blockquote></div></div>

--000000000000b0e55505f1222f59--

--===============5772997485119377270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5772997485119377270==--
