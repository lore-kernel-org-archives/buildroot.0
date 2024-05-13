Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921D5C25B75
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 10:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2CD982315;
	Mon, 13 May 2024 10:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjdZ8moSJvf4; Mon, 13 May 2024 10:29:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE05D8232C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE05D8232C;
	Mon, 13 May 2024 10:29:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E5C51BF3B0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 10:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6734B406D2
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 10:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GB_PoywlvQS2 for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 10:29:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EF5274068E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF5274068E
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF5274068E
 for <buildroot@buildroot.org>; Mon, 13 May 2024 10:29:46 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-de59daab3f3so3966040276.3
 for <buildroot@buildroot.org>; Mon, 13 May 2024 03:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715596186; x=1716200986;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MSZAGAZkqIuiYUQ4EQ9I+ag2BJ4q7yaZ1F6PrfJElic=;
 b=Ar1XHXYUkPZ51oROLkjvvvaxI0JjTNEaRWTpD6b3ej4rpr70sVogg2iWTPLEKNt3U5
 Iu7sSNC7J28g27u/iYquQI1q+BJOhzEO6+06iwU/xZbYPKOCkx3Z+FyASMKsg/xNHetJ
 nb3AtqAa5mBpIkNqsx1zGGBqvG2eQLKAJf0YqpL028wnsWuwQTE5H0polu2PAnMG0EXx
 uDE4x1MAVmUHmJ6ye3mOvvh+YSnQw+xn9XfE92/BizC/Vzr0uittIWOB+9v0rk7n8EEv
 w40iMw/zIuxXPA87zU+cmPjRYYWXJFbMOeFUbfaLxQOic7AJA5g4kfIbw5x/BxhYSvuT
 BNSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkzp3h+n6OREfhkqi1CMMrhvmALF6b/vWsW9yFq9gjHIGW0zL6i1sIytHHJ+0CsaGC1hMfHObAtvPhNHfomkl6axKZwVy7Tg==
X-Gm-Message-State: AOJu0YzsvWdhe/ExBhBH6r3a1wKHUksrypU+v58f/jF6gA9THDbO59JC
 nOCAJ62gb42nNhSp3m47Fl8tvzk9JozZkLTb7QIUMKOfaZl5LJDBRiJZGWmxpWoOv5ZD1c6Ebkj
 lu7ASjCnoJ0tXhUzgV9+agVgI5Vw=
X-Google-Smtp-Source: AGHT+IEyPzso5JiZpiMbUjPyGTOL7X3TZVgLN8CSHcqO4pwhTPUraEqU3eZWnKSX0RxR52mkkTQY0uRnZ0uWFXGsy6M=
X-Received: by 2002:a25:7482:0:b0:de5:6abe:9ab4 with SMTP id
 3f1490d57ef6-dee4f4da5afmr8235394276.50.1715596185618; Mon, 13 May 2024
 03:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240512114617.2564569-1-roykollensvendsen@gmail.com>
 <20240512114617.2564569-2-roykollensvendsen@gmail.com>
 <20240513084026.4513d1f6@windsurf>
 <CAMdwsN8eL5Urj5AyWn0RStgBmeZ0_afz7aRAgr5iwfxjhV_Vgg@mail.gmail.com>
In-Reply-To: <CAMdwsN8eL5Urj5AyWn0RStgBmeZ0_afz7aRAgr5iwfxjhV_Vgg@mail.gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Mon, 13 May 2024 12:29:33 +0200
Message-ID: <CA+R_deoKLT7TYE5kKjD9pOUsVcNA-iJOfmekfBOTA=gN3z=YoQ@mail.gmail.com>
To: Jesse Van Gavere <jesseevg@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715596186; x=1716200986; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MSZAGAZkqIuiYUQ4EQ9I+ag2BJ4q7yaZ1F6PrfJElic=;
 b=AkyP6Z/nPPsyOrSTWXDkH7VLzQSnk94FNshT1VtuALIC7eBsXS2eSsHOmxspxw9ZPc
 ZOciGnw2SCs+wapL9T9/fewECpFCukZODF8xDMga89iiOutuhTBKvfTuETAXBPNFcz66
 rOmHQX9klBqE6u2D+vuh7VE/n9tNHGUytn3+7f21hvnesPHGGM7vWFZy1cTrCd49KXsi
 wYbtJ2arbltmE/ZrTuzUkKT2P0IFUEVNI+Wke1r7yX0WGeF4FpGXbkRJoygzi19UIHyo
 FOHhX/TZU71Jx5x5DpJ1V7kKeQn6XanOEKec2bjuCh4+RmvyO7aKprcTcu/8B2dKx4fU
 BvZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AkyP6Z/n
Subject: Re: [Buildroot] [PATCH v3 02/14] package/qt6/qt6base: patch
 CVE-2024-33861
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2116682586231000447=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2116682586231000447==
Content-Type: multipart/alternative; boundary="00000000000038d3ce0618535d35"

--00000000000038d3ce0618535d35
Content-Type: text/plain; charset="UTF-8"

Hi Thomas and Jesse,

I assume I should add this information to the commit message and make a v4
patch-set?

Best regards,
Roy

man. 13. mai 2024 kl. 09:57 skrev Jesse Van Gavere <jesseevg@gmail.com>:

> Hello Thomas,
>
> Op ma 13 mei 2024 om 08:40 schreef Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>:
>
> >
> > Hello Roy,
> >
> > On Sun, 12 May 2024 13:45:49 +0200
> > Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
> >
> > > From: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
> > >
> > > Got patch from:
> > >
> > > https://download.qt.io/archive/qt/6.7/
> > > Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> >
> > Thanks for this v3. However, you're again putting a fix as PATCH 02/14
> > of the series, after a bump. Is it because this CVE is only applicable
> > to Qt 6.7 (and not the 6.4.3 we already have in Buildroot) ? Could you
> > clarify this point, which is very important?
>
> This is not applicable to 6.4.3, the affected versions are detailed in
> the bugzilla report below and it's only 6.5.0+
> So this seems perfectly valid to go along with the version bump.
>
> OpenSUSE report:
> https://www.suse.com/security/cve/CVE-2024-33861.html
> Bugzilla report clarifying affected versions
> https://bugzilla.suse.com/show_bug.cgi?id=1223917
>
> > Thanks!
> >
> > Thomas
> > --
> > Thomas Petazzoni, co-owner and CEO, Bootlin
> > Embedded Linux and Kernel engineering and training
> > https://bootlin.com
>
> Best regards,
> Jesse
>

--00000000000038d3ce0618535d35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Thomas and Jesse,<br></div><div><br></div><div>I a=
ssume I should add this information to the commit message and make a v4 pat=
ch-set?<br></div><div><br></div><div>Best regards,<br></div><div>Roy<br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">man. 13. mai 2024 kl. 09:57 skrev Jesse Van Gavere &lt;<a href=3D"mailto=
:jesseevg@gmail.com">jesseevg@gmail.com</a>&gt;:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hello Thomas,<br>
<br>
Op ma 13 mei 2024 om 08:40 schreef Thomas Petazzoni<br>
&lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" target=3D"_blank">thoma=
s.petazzoni@bootlin.com</a>&gt;:<br>
<br>
&gt;<br>
&gt; Hello Roy,<br>
&gt;<br>
&gt; On Sun, 12 May 2024 13:45:49 +0200<br>
&gt; Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com"=
 target=3D"_blank">roykollensvendsen@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; From: Roy Kollen Svendsen &lt;<a href=3D"mailto:roy.kollen.svends=
en@akersolutions.com" target=3D"_blank">roy.kollen.svendsen@akersolutions.c=
om</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Got patch from:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://download.qt.io/archive/qt/6.7/" rel=3D"norefer=
rer" target=3D"_blank">https://download.qt.io/archive/qt/6.7/</a><br>
&gt; &gt; Signed-off-by: Roy Kollen Svendsen &lt;<a href=3D"mailto:roykolle=
nsvendsen@gmail.com" target=3D"_blank">roykollensvendsen@gmail.com</a>&gt;<=
br>
&gt;<br>
&gt; Thanks for this v3. However, you&#39;re again putting a fix as PATCH 0=
2/14<br>
&gt; of the series, after a bump. Is it because this CVE is only applicable=
<br>
&gt; to Qt 6.7 (and not the 6.4.3 we already have in Buildroot) ? Could you=
<br>
&gt; clarify this point, which is very important?<br>
<br>
This is not applicable to 6.4.3, the affected versions are detailed in<br>
the bugzilla report below and it&#39;s only 6.5.0+<br>
So this seems perfectly valid to go along with the version bump.<br>
<br>
OpenSUSE report:<br>
<a href=3D"https://www.suse.com/security/cve/CVE-2024-33861.html" rel=3D"no=
referrer" target=3D"_blank">https://www.suse.com/security/cve/CVE-2024-3386=
1.html</a><br>
Bugzilla report clarifying affected versions<br>
<a href=3D"https://bugzilla.suse.com/show_bug.cgi?id=3D1223917" rel=3D"nore=
ferrer" target=3D"_blank">https://bugzilla.suse.com/show_bug.cgi?id=3D12239=
17</a><br>
<br>
&gt; Thanks!<br>
&gt;<br>
&gt; Thomas<br>
&gt; --<br>
&gt; Thomas Petazzoni, co-owner and CEO, Bootlin<br>
&gt; Embedded Linux and Kernel engineering and training<br>
&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">h=
ttps://bootlin.com</a><br>
<br>
Best regards,<br>
Jesse<br>
</blockquote></div>

--00000000000038d3ce0618535d35--

--===============2116682586231000447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2116682586231000447==--
