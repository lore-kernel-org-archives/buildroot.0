Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43666CD343F
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 06:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87A3661223;
	Tue, 19 Sep 2023 06:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87A3661223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9mIx9dk5ZZnI; Tue, 19 Sep 2023 06:23:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72CCD61215;
	Tue, 19 Sep 2023 06:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72CCD61215
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61FDA1BF3D8
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 06:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3689841B61
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 06:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3689841B61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Km4AMYRnUZQo for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 06:22:59 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AB7941B60
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 06:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AB7941B60
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-502e7d66c1eso8319750e87.1
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 23:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695104577; x=1695709377;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=egHhz6VLMmEU4eKd4h8YSbGMqc3EuG4FejRAkdWUmk0=;
 b=Tp8CreRDg+k3uVpsN5K36ViRQXZUObgavy47nBszoIRbLQeLm48enLrfpNC2yieCft
 cSsalvT28IuBAmQJwEp37zWGxjDd+rb/0ztvV9z25FkEzhmcTcjYzLXD6xaaQL0TCeMH
 PeLh9b/s0WlRkMakHd2asU9jjqkON2qN11B6iWtjfcVnGNFAajy+Xfu7GTA3AnTv5qJE
 2YPFIwySxVsJ5Xhypk6PgaiAcfWd1+z27gW9TYBllI0dpOZ8bN/fe8w/iZPHQnytYo5m
 f4NbY1vAV3ySGLVOgEU0kH//2hjN8ufwpsbzbboeZxfB5HDWjU4n264VFBWttJmqz+Cd
 RB3g==
X-Gm-Message-State: AOJu0Yy3uhcqkg/o+leXL0Bqs6Ag5l/wFraC4hofK6BBGDS5qJKDCXQ+
 uAJkyNUWrSzMiu/wzFj9wc0ghwMST11St7eAZSU=
X-Google-Smtp-Source: AGHT+IF93Pf6RL1cAwQWFrprcEH70nTclfRE0UATvRVyLsLPcqzbh4CDAwpdZz2Wy/RZ9Yg9LGXBDVqfxSG6W/QpS3U=
X-Received: by 2002:a05:6512:2015:b0:4fb:744e:17db with SMTP id
 a21-20020a056512201500b004fb744e17dbmr8149295lfb.1.1695104576698; Mon, 18 Sep
 2023 23:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230916154940.746749-1-fontaine.fabrice@gmail.com>
 <37f6d34b-589e-4570-88d7-28aa967d45b5@gmx.at>
In-Reply-To: <37f6d34b-589e-4570-88d7-28aa967d45b5@gmx.at>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Sep 2023 08:22:45 +0200
Message-ID: <CAPi7W83Uf-Cjr7EWJEmN_E90FkqBq50jv2vJtK5yk+DJ2CLMTw@mail.gmail.com>
To: Daniel Lang <dalang@gmx.at>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695104577; x=1695709377; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=egHhz6VLMmEU4eKd4h8YSbGMqc3EuG4FejRAkdWUmk0=;
 b=Og8n+uMcE08iPUq536uphLramXIpeyJAefwmqm76/KwbuvdTw7+fcjx0fEcJkCGW4w
 Yylx6aD3b/pXcbknJl2R+HW4RowUBTEETeDypgUypBVX90Ky2/sXm5hpBkTPhVS+3mfd
 Fx9Wys/f27qGSX+pLzc+BPm+xCelir+/cnaioRAjz8/HopStEZp2N5gKrhbWtE5mbHLb
 HdhOk9gEgCcYzn+dOiEWExmLa24dpyQ6XiYzOU3K4O+aGwsFg7aUVXRxSPG5xxFZ5haR
 K+rM2imw9em8iB0+YhyXSSaVicfyck//XFzVGHLO9AFWyb0erzut1pYwAWElNR12Pvcj
 inyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Og8n+uMc
Subject: Re: [Buildroot] [PATCH 1/1] package/at-spi2-core: propagate dynamic
 library dependency
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Simon Dawson <spdawson@gmail.com>,
 James Knight <james.knight@collins.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2179314294215022938=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2179314294215022938==
Content-Type: multipart/alternative; boundary="00000000000026c10a0605b04a0c"

--00000000000026c10a0605b04a0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Le mar. 19 sept. 2023 =C3=A0 06:42, Daniel Lang <dalang@gmx.at> a =C3=A9cri=
t :

> Hi Fabrice,
>
> On 16.09.23 17:49, Fabrice Fontaine wrote:
> > Fix the following build failure raised since bump of at-spi2-core to
> > version 2.48.0 in commit d1757fdfb0010d29f20cd68cb6e16f019e236424:
> >
> > Makefile:576: *** dbus is in the dependency chain of at-spi2-core that
> has added it to its _DEPENDENCIES variable without selecting it or
> depending on it from Config.in.  Stop.
>
> Thanks for looking into this.
> I'm not sure adding this dependency is the best approach,
> as it would require propagating it to everything that uses libgtk3,
> which you didn't do, if I understand this patch correctly.
>

If I didn't miss something, the only package that has a mandatory
dependency to libgtk3 is vte which is updated by this patch.
Packages depending on libgtk2 have also been updated (e.g. gkrellm,
pcmanfm).


>
> I would like to propose another solution, that would fix the problem:
> Some weeks ago I send in a patch [0] to at-spi2-core that makes it possib=
le
> to deselect the runtime module needed by GTK2. This module is always
> compiled
> as library and seems to be the only thing that would force "depends on
> !BR2_STATIC_LIBS".
>
> So my proposal would be to only add the "depends..." if LIBGTK2 is
> selected and
> use the patch to exclude the runtime module. With this we only need to
> propagate
> it to LIBGTK2.
>
> Version 2.50 was released in the mean time, which contains the mentioned
> patch.
> For stable branches the patch is needed.
>

If you can drop the dynamic library dependency from at-spi2-core, feel free
to send another patch.


>
> >
> > Fixes:
> >  -
> http://autobuild.buildroot.org/results/511a682abd233ba90543044fd9102dc08c=
762f78
> >
>
> Please add, if okay with Bernd, see [1]:
>
> Reported-by: Bernd Kuhls <bernd@kuhls.net>
>
> Regards
> Daniel
>
> [0]:
> https://gitlab.gnome.org/GNOME/at-spi2-core/-/commit/520a7b16b0093a965542=
a3880b2e3b276fbe06d8
> [1]: http://lists.busybox.net/pipermail/buildroot/2023-June/669401.html


Best Regards,

Fabrice

--00000000000026c10a0605b04a0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Daniel,<br></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 19 sept. 2023 =
=C3=A0=C2=A006:42, Daniel Lang &lt;<a href=3D"mailto:dalang@gmx.at">dalang@=
gmx.at</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Hi Fabrice,<br>
<br>
On 16.09.23 17:49, Fabrice Fontaine wrote:<br>
&gt; Fix the following build failure raised since bump of at-spi2-core to<b=
r>
&gt; version 2.48.0 in commit d1757fdfb0010d29f20cd68cb6e16f019e236424:<br>
&gt;<br>
&gt; Makefile:576: *** dbus is in the dependency chain of at-spi2-core that=
 has added it to its _DEPENDENCIES variable without selecting it or dependi=
ng on it from Config.in.=C2=A0 Stop.<br>
<br>
Thanks for looking into this.<br>
I&#39;m not sure adding this dependency is the best approach,<br>
as it would require propagating it to everything that uses libgtk3,<br>
which you didn&#39;t do, if I understand this patch correctly.<br></blockqu=
ote><div><br></div><div>If I didn&#39;t miss something, the only package th=
at has a mandatory dependency to libgtk3 is vte which is updated by this pa=
tch.</div><div>Packages depending on libgtk2 have also been updated (e.g. g=
krellm, pcmanfm).<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
I would like to propose another solution, that would fix the problem:<br>
Some weeks ago I send in a patch [0] to at-spi2-core that makes it possible=
<br>
to deselect the runtime module needed by GTK2. This module is always compil=
ed<br>
as library and seems to be the only thing that would force &quot;depends on=
 !BR2_STATIC_LIBS&quot;.<br>
<br>
So my proposal would be to only add the &quot;depends...&quot; if LIBGTK2 i=
s selected and<br>
use the patch to exclude the runtime module. With this we only need to prop=
agate<br>
it to LIBGTK2.<br>
<br>
Version 2.50 was released in the mean time, which contains the mentioned pa=
tch.<br>
For stable branches the patch is needed.<br></blockquote><div><br></div><di=
v>If you can drop the dynamic library dependency from at-spi2-core, feel fr=
ee to send another patch.<br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Fixes:<br>
&gt;=C2=A0 - <a href=3D"http://autobuild.buildroot.org/results/511a682abd23=
3ba90543044fd9102dc08c762f78" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.org/results/511a682abd233ba90543044fd9102dc08c762f78</a>=
<br>
&gt;<br>
<br>
Please add, if okay with Bernd, see [1]:<br>
<br>
Reported-by: Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net" target=3D"_=
blank">bernd@kuhls.net</a>&gt;<br>
<br>
Regards<br>
Daniel<br>
<br>
[0]: <a href=3D"https://gitlab.gnome.org/GNOME/at-spi2-core/-/commit/520a7b=
16b0093a965542a3880b2e3b276fbe06d8" rel=3D"noreferrer" target=3D"_blank">ht=
tps://gitlab.gnome.org/GNOME/at-spi2-core/-/commit/520a7b16b0093a965542a388=
0b2e3b276fbe06d8</a><br>
[1]: <a href=3D"http://lists.busybox.net/pipermail/buildroot/2023-June/6694=
01.html" rel=3D"noreferrer" target=3D"_blank">http://lists.busybox.net/pipe=
rmail/buildroot/2023-June/669401.html</a></blockquote><div><br></div><div>B=
est Regards,</div><div><br></div><div>Fabrice <br></div></div></div>

--00000000000026c10a0605b04a0c--

--===============2179314294215022938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2179314294215022938==--
