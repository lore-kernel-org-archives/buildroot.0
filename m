Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BFCC3DA7F
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 13:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0D7C403B7;
	Sun,  4 Aug 2024 13:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NmdkM0Z0sFZQ; Sun,  4 Aug 2024 13:31:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CC7840148
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CC7840148;
	Sun,  4 Aug 2024 13:31:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 71BB21BF379
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 13:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FFC3810E9
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 13:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OsPbPYB8C6T0 for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 13:31:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=softwarej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A175810DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A175810DF
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A175810DF
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 13:31:13 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e0b7efa1c1bso6927779276.3
 for <buildroot@buildroot.org>; Sun, 04 Aug 2024 06:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722778272; x=1723383072;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LmPohwmcsSE+VT86jIhunshPk6mdXXEFi3UDNJDOpTk=;
 b=hzrZTpMPP8FkYpiEERUDRq1NUPRpOqKZhpdqp0sNeMbKOEloQcd7CzczAkkjNwuGuk
 jRgwmJykCtjQv3ViXi7SrR2imzPzvfB28xuFULQkJrM+lKnX7RtydCrmhBKQx5kYNCaU
 kZqqBsS/w/ERUKJTwCBxaeQd+Z6CTPUccDI3fWwxi0BWLPS/BAHn41hgcoxYt7nCFcp7
 1WDhnbZkGcZq4FpoEJKvGZKlcTeTgt3r3qolUAglF4kt8N/eIequi4mmdvNBvlUK2rum
 TE4IOH3ldkfQ92XXb9WINqutDd8+ukqjRKGoIC5KqvllAWvCOzK5uDkx6MlYIIQNDisT
 cH5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRlLtXSd+A7Fz1g/tall2vVz628e7t3ab9NVLWpYUL3j5NsDr+SDnQGK0VUADccnfEOfEkVtLDRgGfQoEEz6tAE3+xQDQ3+Q==
X-Gm-Message-State: AOJu0YzQwHabHvVjWDsv75tKJryplPj6Th2RB99KoCRjfykQusWqvDIY
 I3kYe8UDwY+864es8dIzQTY1jjqGuONkW4ZW9wyGwgcvZtksj2EfGMezU45s4ZHKLrsg0M/UT9Z
 sgelcLYkvCzjvyND6d2DCMsgWtrQ=
X-Google-Smtp-Source: AGHT+IFHy6t2KbQqgNg51wG3BvTcXvGoq9QTP7AD7KSl3UzSaOaReJGAGjzIR7WhP5IzDYGtFuQle6V2VoBPNV/7Rgk=
X-Received: by 2002:a05:6902:2403:b0:e0e:3f14:c280 with SMTP id
 3f1490d57ef6-e0e3f14cbd3mr3278234276.3.1722778272452; Sun, 04 Aug 2024
 06:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240524181856.2712581-1-alexander.i.mukhin@gmail.com>
 <20240722144716.092e357b@windsurf>
 <CAH+XeQZrmvt7Ui7D6M2515=+W_3wTsPGVVWLcRALx+4X93Chzg@mail.gmail.com>
 <20240722151834.53981478@windsurf>
In-Reply-To: <20240722151834.53981478@windsurf>
From: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Date: Sun, 4 Aug 2024 15:31:01 +0200
Message-ID: <CAH+XeQZSokTTrUJWL02YkD75Z=Baxpwk28nMRBFjMSqcgBTG1g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722778272; x=1723383072; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LmPohwmcsSE+VT86jIhunshPk6mdXXEFi3UDNJDOpTk=;
 b=YB/I5szgItRB79SOoKP57Wu4KTJl329YoohPwQUMn+33f2Dky62pn+9UMzwGop5yex
 vBZdiFP4dmEtMLx04NrP+gyPxYM0wARqIXco4JvLo7oKUysK6DVjnfVdkVs8KuVs88zL
 wuB2ZH/M+0NZMaS7AnG4bR/8B5GGQh7UwQJqSeV53v22Wf7zbmjOoo5MX+E5zVKXhbi5
 EIm6wbpRWXop5F9Wag5YorogxFWNg64Xz+MUF6I9EDKG73l4Mr0NM09tvcjYeOL8Bk32
 WO2rHF4XUbown0qD55oWMElX/7jvdoWDjffeNsPskx1d08KNc9CvpJqCG4Dhg0lVBOpS
 X/AA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YB/I5szg
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.2.4
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
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5812996358181323696=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5812996358181323696==
Content-Type: multipart/alternative; boundary="000000000000f4d91c061edb925b"

--000000000000f4d91c061edb925b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Waldemar Brodkorb,

I saw the commit
https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=3D05b11809bd11=
450aff3d20e43f18415ce58601e7
that defines SEEK_DATA and SEEK_HOLE. However, I noticed that the following
code could fail at runtime:
https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/libc/sysdeps/linux/c=
ommon/lseek.c?id=3D05b11809bd11450aff3d20e43f18415ce58601e7#n44

Should SEEK_DATA and SEEK_HOLE be included here as well?

Regards.

El lun, 22 jul 2024 a las 15:18, Thomas Petazzoni (<
thomas.petazzoni@bootlin.com>) escribi=C3=B3:

> Hello Jos=C3=A9,
>
> Thanks for your super quick feedback!
>
> On Mon, 22 Jul 2024 15:01:45 +0200
> Jos=C3=A9 Luis Salvador Rufo <salvador.joseluis@gmail.com> wrote:
>
> > In the meantime, I recommend the following options:
> >
> > A) Revert to the previous version (OpenZFS v2.2.3). This is not ideal f=
or
> > people who have already upgraded.
> >
> > B) Include a work-in-progress (it works for buildroot, I tested it)
> patch:
> > https://github.com/openzfs/zfs/pull/16169.patch.
>
> Please do this option (B), and also contribute SEEK_DATA support to
> uClibc. I've added Waldemar, the uClibc-ng maintainer, in Cc.
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000f4d91c061edb925b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Waldemar Brodkorb,<br><br>I saw the commit <a href=
=3D"https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=3D05b11809=
bd11450aff3d20e43f18415ce58601e7">https://cgit.uclibc-ng.org/cgi/cgit/uclib=
c-ng.git/commit/?id=3D05b11809bd11450aff3d20e43f18415ce58601e7</a> that def=
ines SEEK_DATA and SEEK_HOLE. However, I noticed that the following code co=
uld fail at runtime: <a href=3D"https://cgit.uclibc-ng.org/cgi/cgit/uclibc-=
ng.git/tree/libc/sysdeps/linux/common/lseek.c?id=3D05b11809bd11450aff3d20e4=
3f18415ce58601e7#n44">https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tre=
e/libc/sysdeps/linux/common/lseek.c?id=3D05b11809bd11450aff3d20e43f18415ce5=
8601e7#n44</a><br><br><div>Should SEEK_DATA and SEEK_HOLE be included here =
as well?</div><div><br></div><div>Regards.<br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">El lun, 22 jul 2024 a l=
as 15:18, Thomas Petazzoni (&lt;<a href=3D"mailto:thomas.petazzoni@bootlin.=
com">thomas.petazzoni@bootlin.com</a>&gt;) escribi=C3=B3:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Hello Jos=C3=A9,<br>
<br>
Thanks for your super quick feedback!<br>
<br>
On Mon, 22 Jul 2024 15:01:45 +0200<br>
Jos=C3=A9 Luis Salvador Rufo &lt;<a href=3D"mailto:salvador.joseluis@gmail.=
com" target=3D"_blank">salvador.joseluis@gmail.com</a>&gt; wrote:<br>
<br>
&gt; In the meantime, I recommend the following options:<br>
&gt; <br>
&gt; A) Revert to the previous version (OpenZFS v2.2.3). This is not ideal =
for<br>
&gt; people who have already upgraded.<br>
&gt; <br>
&gt; B) Include a work-in-progress (it works for buildroot, I tested it) pa=
tch:<br>
&gt; <a href=3D"https://github.com/openzfs/zfs/pull/16169.patch" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/openzfs/zfs/pull/16169.patch<=
/a>.<br>
<br>
Please do this option (B), and also contribute SEEK_DATA support to<br>
uClibc. I&#39;ve added Waldemar, the uClibc-ng maintainer, in Cc.<br>
<br>
Thanks a lot!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000f4d91c061edb925b--

--===============5812996358181323696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5812996358181323696==--
