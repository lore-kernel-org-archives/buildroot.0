Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347CDC3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 09:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA54960FA4;
	Wed, 10 Jul 2024 09:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPXTxuCHUQ1W; Wed, 10 Jul 2024 09:37:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A844B60FCB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A844B60FCB;
	Wed, 10 Jul 2024 09:37:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 939591BF573
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 09:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 802B641305
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 09:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RvSRhEgpAVuU for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 09:37:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=jp.baltazar.mendes@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D7E41410D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7E41410D2
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7E41410D2
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 09:37:02 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e03d49ff259so4559874276.2
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 02:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720604221; x=1721209021;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KN1xeT84NoYPmeAa6hTtTyih0YAO0GVwjdD/7d8cerQ=;
 b=v8G5edjveU+ZLWPL6IflmBtRRXF00ZBPzRM1kWH/3PENtrmV2NMz3dABC3373g3Cop
 opp1zscb1wwVNqLCfN0azcvhdREEr8LNC+WdGipctKEQNTOrfCkmqFiiPzoe3Vz1g6BC
 BrWoIdFe5dr9MkLq8RHmqVrFVn7le1fz/NxAlHch1gq5aQWF/p4SJvCV2mzWuewrlnpE
 9/fIq/PD5wbt3CwLh8JF5XyA4DNyClPq1YU0KSGL/4Qq+EaqpOOTJlxyBwKZc9TJaYl/
 7Dq23K6HKWUIl4rIBthyNZmRZcZUy/+CdeIzotDqxu7itqtMmzFQWnpml46An+ccJMT1
 W/+Q==
X-Gm-Message-State: AOJu0YzoEhTxijBu9VUV2IM0bkDJiFCj84OM5cyqCstiQiNJkNJD9HHp
 IC4jQArx9mnrFFC8WeL3utcpQ3s528vBR6bEjE6YNTsEdn0RFCFEbTDBDgafHlZuT8pDR278VqU
 UkfXBxk5w2EcenJP/8mKz8+y/p+vvxgI=
X-Google-Smtp-Source: AGHT+IGJcEx9NsHbSURWiEEtnXdYLLaG+Lwao5PQ4WvzerbGbpE1Zo1+e5uo7J0wqdq5tf2guNT4iAWOpkM0HELJCYM=
X-Received: by 2002:a25:a341:0:b0:e03:4ee5:8c0e with SMTP id
 3f1490d57ef6-e041b17827fmr4721136276.63.1720604221384; Wed, 10 Jul 2024
 02:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAFAK9+dyXdn6RBLLm=Dw2+7rxxoiAPx0_kBJGn1dR6+SweOCiQ@mail.gmail.com>
 <91d7aa43-3f8b-427d-995e-2fcce5824d74@gmx.de>
In-Reply-To: <91d7aa43-3f8b-427d-995e-2fcce5824d74@gmx.de>
From: =?UTF-8?B?Sm9zw6kgTWVuZGVz?= <jp.baltazar.mendes@gmail.com>
Date: Wed, 10 Jul 2024 11:36:25 +0200
Message-ID: <CAFAK9+dE4hJLy4hQGoML-CFtAud-Gb94E6w2-yNzx8NR+O7moA@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720604221; x=1721209021; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KN1xeT84NoYPmeAa6hTtTyih0YAO0GVwjdD/7d8cerQ=;
 b=kjNkiXXY0lNlSqStEIHO6BhPPaMpy9r1shH/qnp9pmu8NjmvJ1RQF9yXSFyawL0yWK
 vQfG1pqYPoiNDFgZ5mdHpfHtKFbyb+VkvA2JtM4gNVctJvt5A+xctRepOXw16f9cmwe7
 6cSGXMk1vVvsdqkjfCr1M9n0C2PG5CzfToAW9hNjrzAqqqU1oEah00qTOlsazYx0EFJ4
 HGoF9P1vHQXjp9indNIbLHHuVMUuyY6zA8LAUCQrBEyus7QEEM5h4zLXmi8WXYyNQfVF
 E8U8Ag5Gzl1+yzOUebEgbbJj5iD/1tp605rgnGK5CJPCh4GvmTXHMjxnNZqn+hKMCPq+
 MB9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kjNkiXXY
Subject: Re: [Buildroot] U-Boot for RaspberryPi CM4IO
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
Content-Type: multipart/mixed; boundary="===============4274439475127618753=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4274439475127618753==
Content-Type: multipart/alternative; boundary="0000000000006a2ff4061ce1636d"

--0000000000006a2ff4061ce1636d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fiona,

I've been absent for a bit but would like to ask you a few more questions.

I've tried some things and found out that I had to set the buildroot build
scheme to legacy to avoid the defconfigs and be able to use
the uboot configs.

I've looked around for solutions and they seem to be around changing the
environment for uboot. I'm not really sure how to get there and what I'm
supposed to do.

On Tue, 18 Jun 2024 at 21:12, Fiona Klute <fiona.klute@gmx.de> wrote:

> Hi Jos=C3=A9, all!
>
> Am 18.06.24 um 14:44 schrieb Jos=C3=A9 Mendes:
> > Hello all,
> >
> > I'm relatively new to Buildroot and very new to U-Boot.
> >
> > My goal is to make a system with redundant bootable partitions onto whi=
ch
> > OTA updates will be applied (swupdate). The redundant part I absolutely
> > need is the rootfs but if the bootloader could also be updatable that
> would
> > be great.
> >
> > I haven't had much progress with U-Boot as it seems to require a
> defconfig
> > and when I provide raspberrypicm4io_64_defconfig from the defaults, it
> > seems to complain that it either does not exist or several parameters a=
re
> > missing.
>
> The defconfig you need there isn't a Buildroot or Linux one, you need to
> pick a suitable one for U-Boot, see here:
>
> https://docs.u-boot.org/en/latest/board/broadcom/raspberrypi.html
>
> >   Any tips on how to proceed / what to do?
>
> I'm currently working with an RPi CM4 based system, there U-Boot built
> with rpi_arm64_defconfig worked out of the box (assuming a suitable DTB
> is installed). You'll need to adjust the config.txt that gets installed
> to actually run u-boot.bin instead of the Linux image that has been
> built, and provide whatever boot configuration you need for U-Boot.
>
> I actually have two related patches for board/raspberrypi/post-image.sh
> that I'd like to upstream eventually (to install a boot.scr if any has
> been built and U-Boot is used, and support for using the precompiled
> DTBs from the rpi-firmware package), I intend to send them to the list
> soon.
>
> Best regards,
> Fiona
>
> > Best regards,
> >
> > Jos=C3=A9 Mendes
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
>

--0000000000006a2ff4061ce1636d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Fiona,<br><br>I&#39;ve been absent for=
 a bit but would like to ask you a few more=C2=A0questions.<br><br>I&#39;ve=
 tried some things and found out that I had to set the buildroot build sche=
me to legacy to avoid the defconfigs and be able to use the=C2=A0uboot=C2=
=A0configs.<br><br>I&#39;ve looked around for solutions and they=C2=A0seem =
to be around changing the environment for uboot. I&#39;m not really=C2=A0su=
re how to get there and what I&#39;m supposed to do.<br></div><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"><br>On Tue, 18 Jun 2024=
 at 21:12, Fiona Klute &lt;<a href=3D"mailto:fiona.klute@gmx.de">fiona.klut=
e@gmx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Hi Jos=C3=A9, all!<br>
<br>
Am 18.06.24 um 14:44 schrieb Jos=C3=A9 Mendes:<br>
&gt; Hello all,<br>
&gt;<br>
&gt; I&#39;m relatively new to Buildroot and very new to U-Boot.<br>
&gt;<br>
&gt; My goal is to make a system with redundant bootable partitions onto wh=
ich<br>
&gt; OTA updates will be applied (swupdate). The redundant part I absolutel=
y<br>
&gt; need is the rootfs but if the bootloader could also be updatable that =
would<br>
&gt; be great.<br>
&gt;<br>
&gt; I haven&#39;t had much progress with U-Boot as it seems to require a d=
efconfig<br>
&gt; and when I provide raspberrypicm4io_64_defconfig from the defaults, it=
<br>
&gt; seems to complain that it either does not exist or several parameters =
are<br>
&gt; missing.<br>
<br>
The defconfig you need there isn&#39;t a Buildroot or Linux one, you need t=
o<br>
pick a suitable one for U-Boot, see here:<br>
<br>
<a href=3D"https://docs.u-boot.org/en/latest/board/broadcom/raspberrypi.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://docs.u-boot.org/en/latest/b=
oard/broadcom/raspberrypi.html</a><br>
<br>
&gt;=C2=A0 =C2=A0Any tips on how to proceed / what to do?<br>
<br>
I&#39;m currently working with an RPi CM4 based system, there U-Boot built<=
br>
with rpi_arm64_defconfig worked out of the box (assuming a suitable DTB<br>
is installed). You&#39;ll need to adjust the config.txt that gets installed=
<br>
to actually run u-boot.bin instead of the Linux image that has been<br>
built, and provide whatever boot configuration you need for U-Boot.<br>
<br>
I actually have two related patches for board/raspberrypi/post-image.sh<br>
that I&#39;d like to upstream eventually (to install a boot.scr if any has<=
br>
been built and U-Boot is used, and support for using the precompiled<br>
DTBs from the rpi-firmware package), I intend to send them to the list soon=
.<br>
<br>
Best regards,<br>
Fiona<br>
<br>
&gt; Best regards,<br>
&gt;<br>
&gt; Jos=C3=A9 Mendes<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
</blockquote></div></div>

--0000000000006a2ff4061ce1636d--

--===============4274439475127618753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4274439475127618753==--
