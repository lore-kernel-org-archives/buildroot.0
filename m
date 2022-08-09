Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822C2C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 08:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FC7B4055D;
	Tue,  9 Aug 2022 08:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FC7B4055D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SyDUTjyKTb8D; Tue,  9 Aug 2022 08:38:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E9154055A;
	Tue,  9 Aug 2022 08:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E9154055A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B71C41BF5F5
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 08:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BF0681801
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 08:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BF0681801
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M9ACUJNB4Mg3 for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 08:38:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 749358176E
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 749358176E
 for <buildroot@busybox.net>; Tue,  9 Aug 2022 08:38:03 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id z2so14256761edc.1
 for <buildroot@busybox.net>; Tue, 09 Aug 2022 01:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CkRRHOZWIMSiD8YYsFXfDdD+O/fPmiyYlknWcl9xfCM=;
 b=HHGMMQOkDvT6XvawsVMIvgsTO1vr+qkNtIJMDi6WsTS64NHbS9bDJsktnOueVAMRGd
 7QaukE0KuPRAc2LA1kFwyF3vsjCkqX465b8FRkz3BusU2LDchVVTfzX411t+pN+5rF+R
 p0UajYdQY9qeZiP9zcQlaaO4V53fvUX4QqcDvpOwJl4B06CJL4bNXZ9T3JPBzRviJDUb
 8ceb1rNuUXJeI+ff1Y86gfztWMU4eHUr7iJLHl1cUM0p5wwFFe4cVooPdTTWKoey4gQJ
 N1Ntrz9pR5bXTr081zmuCeOJPj/XSaQ2U+HoLOvf4Qg3VCgtOCSzgSaRiatCJZ5nEO4J
 bLgQ==
X-Gm-Message-State: ACgBeo0aou52Mo5Ob/g1ts8K6wUVdMnzEChhviqDqkfxoPvCTdJEYGQM
 zpi6KIBAuUQKcRFfrtjo6cSe77QVGTMA+hknwPo=
X-Google-Smtp-Source: AA6agR6h2UOlhdnOeFzG1uW5mmvebP88xw5iJ37PkoI3o3o7ffsR4Cs4ZNjK/R6e52e0pIsuKtPJXvCaWj7s7GU0BMc=
X-Received: by 2002:aa7:c946:0:b0:43d:3038:1381 with SMTP id
 h6-20020aa7c946000000b0043d30381381mr21042310edt.354.1660034281487; Tue, 09
 Aug 2022 01:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220805143625.16542-1-guillaume.bressaix@gmail.com>
 <20220805143625.16542-2-guillaume.bressaix@gmail.com>
 <CAJe0E3cL8MK4ipwq3tLDy_D6dqrEJ2gfi20J1rXEewW4fUSkcw@mail.gmail.com>
 <28767d03-5c5f-d40e-12d1-ebdc6b3a5900@mind.be>
 <20220808231302.08adad89@windsurf>
In-Reply-To: <20220808231302.08adad89@windsurf>
From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Tue, 9 Aug 2022 10:37:34 +0200
Message-ID: <CAJe0E3fy_HBXg9nwBaWSOADuMLtPhJLr3weAx2n1R13h_+OMTQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=CkRRHOZWIMSiD8YYsFXfDdD+O/fPmiyYlknWcl9xfCM=;
 b=Q7DJRNrNQGSkv9a/rokOjzeHDZL42abtjoV61/Mib1DvOmfFR3mNhu9ekMtFCXxQUT
 Ssyg7xQbaHMHYNgNfdJfENd06NHj81vujuRDc/wdj7IwZbw1BkgA0zxJ7atBqFkjReEw
 W7t36WOCCJOTECRURyGXYyVSzUYUaDzc6Jh3R8EJmYYl3NKzivDjBomDMuzpThPPa+2Z
 2nHqVQt0RcxJ32F5yFdeagNdcibEPco5B1UPtZ8r3fJvkAdSH2UEecizG++4WasJBZOv
 vc20EKtfS3e2nirzN6MvLEs2hEeM4aRHGbd0gOO2s+qxUOEsUnm6NTNqySMO0qYGkFHB
 cWTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Q7DJRNrN
Subject: Re: [Buildroot] [RFC v3 2/2] package/python-scipy: bump version to
 1.9.0
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
Cc: buildroot@busybox.net, ralf.gommers@gmail.com
Content-Type: multipart/mixed; boundary="===============1524818890837565802=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1524818890837565802==
Content-Type: multipart/alternative; boundary="000000000000a9bfca05e5cad92b"

--000000000000a9bfca05e5cad92b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

for information,
pybind will soon become pkg-config knowledgeable, as this issue is about to
get merged https://github.com/pybind/pybind11/pull/4077

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le lun. 8 ao=C3=BBt 2022 =C3=A0 23:13, Thomas Petazzoni <thomas.petazzoni@b=
ootlin.com>
a =C3=A9crit :

> On Mon, 8 Aug 2022 22:58:46 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
>
> >   pybind is consistently annoying, it uses ldd and stuff to discover
> paths...
>
> Well, it's not just pybind. Python itself, in its ctype.find_library()
> function, uses ldconfig, tries to use gcc on the target, and more funky
> stuff that borks terribly in a Buildroot situation.
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000a9bfca05e5cad92b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">for information,<br>pybind will soon become pkg-config kno=
wledgeable, as this issue is about to get merged <a href=3D"https://github.=
com/pybind/pybind11/pull/4077">https://github.com/pybind/pybind11/pull/4077=
</a><br><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" d=
ata-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div><div><div><font face=3D"arial,helvetica,san=
s-serif">Guillaume W. Bres<br></font></div><font face=3D"arial,helvetica,sa=
ns-serif">Software engineer</font><br></div><font face=3D"arial,helvetica,s=
ans-serif"></font></div><font face=3D"arial,helvetica,sans-serif">&lt;<a hr=
ef=3D"mailto:guillaume.bressaix@gmail.com" target=3D"_blank">guillaume.bres=
saix@gmail.com</a>&gt;<br></font></div></div></div></div></div></div><br></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=
=C2=A0lun. 8 ao=C3=BBt 2022 =C3=A0=C2=A023:13, Thomas Petazzoni &lt;<a href=
=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&g=
t; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Mon, 8 Aug 2022 22:58:46 +0200<br>
Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be" target=3D"_blank=
">arnout@mind.be</a>&gt; wrote:<br>
<br>
&gt;=C2=A0 =C2=A0pybind is consistently annoying, it uses ldd and stuff to =
discover paths...<br>
<br>
Well, it&#39;s not just pybind. Python itself, in its ctype.find_library()<=
br>
function, uses ldconfig, tries to use gcc on the target, and more funky<br>
stuff that borks terribly in a Buildroot situation.<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000a9bfca05e5cad92b--

--===============1524818890837565802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1524818890837565802==--
