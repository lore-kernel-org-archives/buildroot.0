Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1FCC54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 08:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B5FC611D2;
	Fri, 16 Sep 2022 08:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B5FC611D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LF9490oXMO_a; Fri, 16 Sep 2022 08:14:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 386F66101A;
	Fri, 16 Sep 2022 08:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 386F66101A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF71F1BF2BD
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 08:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAB1A40B22
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 08:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAB1A40B22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VDFimDbF9CNT for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 08:14:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D58840147
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D58840147
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 08:14:46 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id f14so33377246lfg.5
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 01:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xSPWNUARMen0SMv1FFPUlibwqWjU5oYkIa0u1CVijT4=;
 b=D67zu949Q0ObdcXjfWF9OcW8QO+/g89102G8yFrHgZAEc63kqPslzEV+a2E70qk0hO
 hzQK6+8nI7hprgZm413iyvH2eU2gazKwocxrU/lYCn3uRJA0sFW9JRlwLKxgWXZEidu6
 G7OZ0Ft1uZo3wRlyGK7U0W+AF7KiPkCERYPibYlxIh4zpJrXgK1M9kc071VBrZ+4BpGx
 8uuVo4jeh0VCKJBqX/IBTuRYm4LxP/9sFJwV1oD+dNe2vXQJG9OEPmVHrKkSQuvI2a5H
 osdmb4rxHi74wh3xXJWg8h1e/VWXUcyUDsTBbRJAVMYwmZHSwAn+zMtDuI0d2QzgswPU
 otiQ==
X-Gm-Message-State: ACrzQf3KagcRI6jROxa1E6s+3NNW6mmchT/NJEXJ69wsLq3tMPcOaADs
 KHQ0z5lyn9/V3PgjuaH5ClZeWsfE2zduYe1Ung0=
X-Google-Smtp-Source: AMsMyM55cEFwgV+NktPonPuiK0cKCzo93p6Q8MevxHIz7cFAjNH3wyX1iCn1TYYTlkjukP/lw/XqfA5v5QJ0Ydy5lWE=
X-Received: by 2002:a05:6512:2621:b0:491:10ba:321a with SMTP id
 bt33-20020a056512262100b0049110ba321amr1180258lfb.187.1663316083263; Fri, 16
 Sep 2022 01:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <CA+QDH8LdmJBt4O_PfN+gGgZXWgdvOrVrpf3S=qfFbhh+BY+mWg@mail.gmail.com>
In-Reply-To: <CA+QDH8LdmJBt4O_PfN+gGgZXWgdvOrVrpf3S=qfFbhh+BY+mWg@mail.gmail.com>
From: Federico Pellegrin <fede@evolware.org>
Date: Fri, 16 Sep 2022 10:14:31 +0200
Message-ID: <CAM6O0ZghM+=7z3fz6AsbJkQmnpr7MhdzfZNHZk2XDvcN0-zVEA@mail.gmail.com>
To: Oliver H <oliver0189.htex@gmail.com>
Subject: Re: [Buildroot] Adding *.so lib to buildroot
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
Content-Type: multipart/mixed; boundary="===============6193635222280001464=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6193635222280001464==
Content-Type: multipart/alternative; boundary="0000000000004ace6a05e8c6f4af"

--0000000000004ace6a05e8c6f4af
Content-Type: text/plain; charset="UTF-8"

Hello Oliver,
I could suggest:
1) You can make your support external library a "package" in buildroot (so
buildroot will also build and install it) (see any directory in package to
see how they are done, then of course you can have a custom local one) (see
for example:
https://buildroot.org/downloads/manual/manual.html#adding-packages)
2) You can add a post build script (see BR2_ROOTFS_POST_BUILDSCRIPT) that
just copies your premade artifacts in the filesystem before the images are
done.

Hope that helps,
Federico

Il giorno ven 16 set 2022 alle ore 09:38 Oliver H <oliver0189.htex@gmail.com>
ha scritto:

> Hi,
>
> I am working on a project to debug the linux kernel with qemu. I generate
> the rootfs with buildroot.
>
> Problem is when qemu is started with the kernel and with init process (a
> simple program with pthread). The kernel boots and no problem with
> debugging.
>
> When running, the init process (a program that uses an external library)
> stops booting with an error (function not implemented). So since the
> external library is not included in the buildroot rootfs I assume the error
> persists.
>
> The external library is built and *.so lib files are generated. Question :
> Is it possible to add directly the *.so file to generate the rootfs with
> the library included. Please suggest methods to handle this.
>
> Thank you,
> Oliver
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000004ace6a05e8c6f4af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Hello Oliver,</div><div>I could sugges=
t:</div><div>1) You can make your support external library a &quot;package&=
quot; in buildroot (so buildroot will also build and install it) (see any d=
irectory in package to see how they are done, then of course you can have a=
 custom local one) (see for example: <a href=3D"https://buildroot.org/downl=
oads/manual/manual.html#adding-packages">https://buildroot.org/downloads/ma=
nual/manual.html#adding-packages</a>)</div><div>2) You can add a post build=
 script (see BR2_ROOTFS_POST_BUILDSCRIPT) that just copies your premade art=
ifacts in the filesystem before the images are done. <br></div><div><br></d=
iv><div>Hope that helps,</div><div>Federico<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il giorno ven 16 set=
 2022 alle ore 09:38 Oliver H &lt;<a href=3D"mailto:oliver0189.htex@gmail.c=
om">oliver0189.htex@gmail.com</a>&gt; ha scritto:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi,<div><br></div><div>I=
 am working on a project to debug the linux kernel with qemu. I generate th=
e rootfs with buildroot.</div><div><br></div><div>Problem is when qemu is s=
tarted=C2=A0with the kernel and with init process (a simple program with pt=
hread). The kernel boots and no problem with debugging.</div><div><br></div=
><div>When running, the init process (a program that uses an external libra=
ry) stops booting with an error (function not implemented). So since the ex=
ternal library is not included in the buildroot rootfs I assume the error p=
ersists.</div><div><br></div><div>The external library is built and *.so li=
b files are generated. Question : Is it possible to add directly the *.so f=
ile to generate the rootfs with the library included. Please suggest method=
s to handle this.</div><div><br></div><div>Thank you,</div><div>Oliver</div=
><div>=C2=A0</div></div>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--0000000000004ace6a05e8c6f4af--

--===============6193635222280001464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6193635222280001464==--
