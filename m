Return-Path: <SRS0=a43l=QF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51987C433EF
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 10:18:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84D5B61246
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 10:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84D5B61246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2486B40375;
	Thu, 18 Nov 2021 10:18:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id biBmiQ8yycY3; Thu, 18 Nov 2021 10:18:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 507464037F;
	Thu, 18 Nov 2021 10:18:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11AF81BF5A1
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 10:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CC194025E
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 10:18:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id edaW1OLCYMFL for <buildroot@lists.busybox.net>;
 Thu, 18 Nov 2021 10:18:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A2C94025C
 for <buildroot@buildroot.org>; Thu, 18 Nov 2021 10:18:48 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id g14so24737444edz.2
 for <buildroot@buildroot.org>; Thu, 18 Nov 2021 02:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OrSpbaY4054DF8M5QCrzmwM6AcakGLG/NDE7RVURV30=;
 b=JQ79i0eQnNxcivmpHCeQz5LuTobdLQfE0GdqnDVFdrARj3dxSZJizVXBc6hUAfxqk9
 MnOla7v134npB9faDjP54XEIpxflsDxJEZJ+/Ko8np+RQBtD7vcL0cf9G2ZQT4keOh91
 0XcLDueXIRLlDXhjsqVP6oBLUXa++uYcnmvsMS1qSAcEhKrXyNVYdt0ktgr59xSzg8Gf
 Jzo0uy+7/6sbIX7XZLUaP8jX4uwEWXeulVAdHSt2d+H+Z7I3r1SAMbbD1c7O9qHNbOBi
 0eBjELb35vzCt2Ah+Aby2UzbuFo4ZqwRNxI8x0AVQjY3mbG/g0JnFDw30PqlyKoPiN8p
 ZEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OrSpbaY4054DF8M5QCrzmwM6AcakGLG/NDE7RVURV30=;
 b=HWDsssuF658GKWxcxY/xFw7mIADDhvKfiMvJwdgoGThuS9KZBqqMgv5uY+IMRMhmfw
 q/sXGQVpq2C/9/0mqj7UTbroGNBK2PS0zFEWFx1Jjy4TZEqN/UsmqU1pRY+Hdu/7+E0z
 rL0CngaiYcxecSfiJ4QC1UJudUusQmUNR+ilwlUBfleyWVbBMoA7TclI6aaEVnNuRxNH
 TDEZ4p9fHhhO75DHDsJgKmaPvtkqT2fNs7UO7lzX5ajc8hVaNJGeDXj0cni7HQMX7Fnj
 Z8x34elQGd0tO8n382Yqz3JHVakTjnuP4EMEswTThCtTnWKidgHQ9hbj6YcYLFZiPGLI
 E3yA==
X-Gm-Message-State: AOAM530GNSpJ0X+We2bbfNXShYppAYb6QK3VKkAD1sOc3sdhbi10fvi/
 B5ayOYpM97LJwidEZKGcDW+4d4siYq+w1vO05unvFQ==
X-Google-Smtp-Source: ABdhPJzqkplO3AixVmr9gmnzRUs25dGF/J/xiFvWRHryv3chAX6zNIubBJoA+fiHaogBXbATYGgDS/TavC7StCj5f1k=
X-Received: by 2002:a17:907:d0b:: with SMTP id
 gn11mr32025914ejc.355.1637230726477; 
 Thu, 18 Nov 2021 02:18:46 -0800 (PST)
MIME-Version: 1.0
References: <CAJPV9MpFEQJk5otMfJkC0D2YNjLnanijNhHWSYT3ymtLYd2yeg@mail.gmail.com>
 <20211116152552.0a9e32da@windsurf>
 <CAJPV9MpMc6t5uty1VGHQm7KsABg7yKqRaXDQqGxyuFiG91DfLw@mail.gmail.com>
 <e058dfd3-ead4-d375-c088-90c891cecf24@mind.be>
In-Reply-To: <e058dfd3-ead4-d375-c088-90c891cecf24@mind.be>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Thu, 18 Nov 2021 12:18:35 +0200
Message-ID: <CAJPV9Mo+Knr+pW31zw9dG1t6xtaGwrJJKuJhtTNR+kdNCf4c0Q@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] Running script after init
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============9102788189436215893=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9102788189436215893==
Content-Type: multipart/alternative; boundary="000000000000de129705d10d7b0d"

--000000000000de129705d10d7b0d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 17, 2021 at 10:29 PM Arnout Vandecappelle <arnout@mind.be>
wrote:

>
>
> On 17/11/2021 13:48, Jos=C3=A9 Pekkarinen wrote:
> >
> >
> > On Tue, Nov 16, 2021 at 4:25 PM Thomas Petazzoni <
> thomas.petazzoni@bootlin.com
> > <mailto:thomas.petazzoni@bootlin.com>> wrote:
> >
> >     Hello Jos=C3=A9,
> >
> >     On Tue, 16 Nov 2021 14:08:02 +0200
> >     Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com
> >     <mailto:jose.pekkarinen@unikie.com>> wrote:
> >
> >      > Any hint what would be the right place in buildroot
> >      >
> >      > userspace to put an script after the init process is over?
> >
> >     The init process by itself is never over, it continues to run until
> you
> >     reboot your system.
> >
> >     Could you clarify your question? You want a service to be started
> after
> >     all other services?
> >
> >
> >     Hi,
> >
> >     I want to run a script after the TTYs are up and running.
> >
> > Currently I run the script as S99myscript, and put a call in the
> > start, and it fails. If I later logging as root and manually run the
> > S99myscript start, it runs well.
>
>   The ttys are started immediately after the last script in /etc/init.d
> has
> finished, so it's unlikely a problem due to sequencing. More likely, the
> difference you observe is due to the difference in environment between an
> interactive login and when the init script is executed directly by init.
>
>   To debug your init script, you can start it with
>
> #! /bin/sh -x
>
> This will echo each command before it is executed, which will help to
> determine
> where it fails.
>

Thanks for the hints, the problem was actually in the script

since it referenced some files relatively, and for the init script it
requires
absolute path. Now it works.

Best regards.

Jos=C3=A9.

--000000000000de129705d10d7b0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 10:29 PM Arno=
ut Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 17/11/2021 13:48, Jos=C3=A9 Pekkarinen wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Tue, Nov 16, 2021 at 4:25 PM Thomas Petazzoni &lt;<a href=3D"mailto=
:thomas.petazzoni@bootlin.com" target=3D"_blank">thomas.petazzoni@bootlin.c=
om</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:thomas.petazzoni@bootlin.com" target=3D"_=
blank">thomas.petazzoni@bootlin.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hello Jos=C3=A9,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Tue, 16 Nov 2021 14:08:02 +0200<br>
&gt;=C2=A0 =C2=A0 =C2=A0Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pek=
karinen@unikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jose.pekkarinen@unikie=
.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Any hint what would be the right place in bui=
ldroot<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; userspace to put an script after the init pro=
cess is over?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The init process by itself is never over, it contin=
ues to run until you<br>
&gt;=C2=A0 =C2=A0 =C2=A0reboot your system.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Could you clarify your question? You want a service=
 to be started after<br>
&gt;=C2=A0 =C2=A0 =C2=A0all other services?<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I want to run a script after the TTYs are up and ru=
nning.<br>
&gt; <br>
&gt; Currently I run the script as S99myscript, and put a call in the<br>
&gt; start, and it fails. If I later logging as root and manually run the<b=
r>
&gt; S99myscript start, it runs well.<br>
<br>
=C2=A0 The ttys are started immediately after the last script in /etc/init.=
d has <br>
finished, so it&#39;s unlikely a problem due to sequencing. More likely, th=
e <br>
difference you observe is due to the difference in environment between an <=
br>
interactive login and when the init script is executed directly by init.<br=
>
<br>
=C2=A0 To debug your init script, you can start it with<br>
<br>
#! /bin/sh -x<br>
<br>
This will echo each command before it is executed, which will help to deter=
mine <br>
where it fails.<br></blockquote><div><br></div></div><blockquote style=3D"m=
argin:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><div>T=
hanks for the hints, the problem was actually in the script</div></div></bl=
ockquote>since it referenced some files relatively, and for the init script=
 it requires<div>absolute path. Now it works.</div><div><br><blockquote sty=
le=3D"margin:0 0 0 40px;border:none;padding:0px"><div>Best regards.</div><d=
iv><br></div></blockquote><div dir=3D"ltr" class=3D"gmail_signature"><div d=
ir=3D"ltr"><blockquote style=3D"margin:0px 0px 0px 40px;border:none;padding=
:0px">Jos=C3=A9.</blockquote></div></div></div></div>

--000000000000de129705d10d7b0d--

--===============9102788189436215893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9102788189436215893==--
