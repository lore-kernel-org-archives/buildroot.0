Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D86E74919
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 20:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6EFA404C9;
	Mon,  2 Oct 2023 20:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6EFA404C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WTabhNVIEldV; Mon,  2 Oct 2023 20:26:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D687E40B56;
	Mon,  2 Oct 2023 20:26:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D687E40B56
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31AE01BF276
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 20:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0740B8204E
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 20:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0740B8204E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yo9A4K-6K1lH for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 20:26:55 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81A018201F
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 20:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81A018201F
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2c28e35752cso1937781fa.0
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 13:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696278413; x=1696883213;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rrKfoM1pxS53e/jH7ZTNBi0T09waiznmRk0TxcZUnIo=;
 b=oUKOFOSMmC6v6M8slCphYll6ywYimwuRginCCJnlCg9ITIYJcgeDXrmdrf05uQNIq9
 E83i6tvUJC0kk4O7IE6ns65slbUzlcJCBQIB2fwhz21awDB6lEY3OEOQ4BCMqEYDgAIB
 hpjBXjHbQ/CcHQ1/yyyJeXgqweNyKElUgxNX/LgRI8moSY7axv8JZywIFyQ7BMWd/Cjw
 oguhUlU0Ijpy/vVoVvCoEgJoOVcQMzE9v5e4CnRb1EQfn0WYu4cRVV4FDbQQKE69b/kr
 bwGV8HHSvItCB7r7jqXs80uaRzeFeGlviK8j3ae2QIuNabrhVLTninVOlEydMBsWSVEV
 cUSw==
X-Gm-Message-State: AOJu0Yzn3GYdvzwN3ilN8kes3sCfYt4juyQKQ+KhFcqihBu9DN4AZfel
 W9+fAV0075gm2ViBMml3nueLPNDNR9dheA==
X-Google-Smtp-Source: AGHT+IGbUpeNSHNnj2/H8FBenEUOUmYankfDAeQHsAslZX0Zgt5hc/Dyib32iKevgWEDwYPFhtBlwg==
X-Received: by 2002:a2e:9ec5:0:b0:2bb:b01a:9226 with SMTP id
 h5-20020a2e9ec5000000b002bbb01a9226mr9131462ljk.7.1696278412754; 
 Mon, 02 Oct 2023 13:26:52 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174]) by smtp.gmail.com with ESMTPSA id
 y2-20020a2e3202000000b002b736576a10sm5388438ljy.137.2023.10.02.13.26.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Oct 2023 13:26:52 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2b9d07a8d84so1673681fa.3
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 13:26:52 -0700 (PDT)
X-Received: by 2002:a05:6512:3e24:b0:504:7bd5:a269 with SMTP id
 i36-20020a0565123e2400b005047bd5a269mr11762798lfv.64.1696278411978; Mon, 02
 Oct 2023 13:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230802111447.41714-1-thomas@devoogdt.com>
 <20230806141506.GS421096@scaer> <20231002173310.GA2957@scaer>
In-Reply-To: <20231002173310.GA2957@scaer>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 2 Oct 2023 22:26:40 +0200
X-Gmail-Original-Message-ID: <CACXRmJgyWvL4jr7-mtWJgCCYGFE3ookcU3TwoNE5bHFLjXaM6Q@mail.gmail.com>
Message-ID: <CACXRmJgyWvL4jr7-mtWJgCCYGFE3ookcU3TwoNE5bHFLjXaM6Q@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH v6 1/4] pkg-cmake: add option to select the
 Ninja generator
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Devoogdt <thomas@devoogdt.com>, Samuel Martin <s.martin49@gmail.com>,
 John Keeping <john@metanate.com>, Thomas Devoogdt <thomas.devoogdt@barco.com>,
 buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>
Content-Type: multipart/mixed; boundary="===============4589095263527414729=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4589095263527414729==
Content-Type: multipart/alternative; boundary="0000000000002faf030606c1986f"

--0000000000002faf030606c1986f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yann, All,


I will check what I can do. A quick search gives me this flag:
https://cmake.org/cmake/help/latest/variable/CMAKE_SKIP_INSTALL_ALL_DEPENDE=
NCY.html
,
which is probably what we want. Otherwise I don't see much additional
install options. And calling the make install/fast target directly is not
very generator generic.


Kr,

Thomas

Op ma 2 okt. 2023 19:33 schreef Yann E. MORIN <yann.morin.1998@free.fr>:

> Thomas, All,
>
> On 2023-08-06 16:15 +0200, Yann E. MORIN spake thusly:
> > On 2023-08-02 13:14 +0200, Thomas Devoogdt spake thusly:
> > > From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> > > Cmake supports multiple generators. Ninja is a small build system wit=
h
> a
> > > focus on speed. It is mainly used with the meson build system, but al=
so
> > > cmake has very good support for it. This adds optional support for th=
e
> > > Ninja build system.
> [--SNIP--]
> > Please review the new code. If I broke something, please send followup
> > fixup patches with appropriate explanations (there's a kind of d=C3=A9j=
=C3=A0-vu
> > here...)
>
> While reviewing another patch, I now noticed that we did lose something
> with the introduction of this ninja backend. that I totally missed when
> I applied it.
>
> Indeed, previously, the install step was done with the install/fast
> rule:
>
>     $(2)_INSTALL_STAGING_OPTS      ?=3D DESTDIR=3D$$(STAGING_DIR) install=
/fast
>     $(2)_INSTALL_TARGET_OPTS       ?=3D DESTDIR=3D$$(TARGET_DIR) install/=
fast
>
> But this got removed with your patch, with nothing to replace it.
>
> See commit dfcc18f84b0d (pkg-cmake: Skip compilation in installation
> step) for the rationale of using install/fast.
>
> Could you look into restoring this, please?
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------=
------'
>
>

--0000000000002faf030606c1986f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Hi Yann, All,<div dir=3D"auto"><br></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">I will check what I can do.=
 A quick search gives me this flag:</div><div dir=3D"auto"><a href=3D"https=
://cmake.org/cmake/help/latest/variable/CMAKE_SKIP_INSTALL_ALL_DEPENDENCY.h=
tml" target=3D"_blank" rel=3D"noreferrer">https://cmake.org/cmake/help/late=
st/variable/CMAKE_SKIP_INSTALL_ALL_DEPENDENCY.html</a>,</div><div dir=3D"au=
to">which is probably what we want. Otherwise I don&#39;t see much addition=
al install options. And calling the make install/fast target directly is no=
t very generator generic.=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Kr,</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Thomas=C2=A0</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">Op ma 2 okt. 2023 19:33 schreef Yann E.=
 MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr" target=3D"_blank" rel=
=3D"noreferrer">yann.morin.1998@free.fr</a>&gt;:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Thomas, All,<br>
<br>
On 2023-08-06 16:15 +0200, Yann E. MORIN spake thusly:<br>
&gt; On 2023-08-02 13:14 +0200, Thomas Devoogdt spake thusly:<br>
&gt; &gt; From: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devoogdt@barco=
.com" rel=3D"noreferrer noreferrer" target=3D"_blank">thomas.devoogdt@barco=
.com</a>&gt;<br>
&gt; &gt; Cmake supports multiple generators. Ninja is a small build system=
 with a<br>
&gt; &gt; focus on speed. It is mainly used with the meson build system, bu=
t also<br>
&gt; &gt; cmake has very good support for it. This adds optional support fo=
r the<br>
&gt; &gt; Ninja build system.<br>
[--SNIP--]<br>
&gt; Please review the new code. If I broke something, please send followup=
<br>
&gt; fixup patches with appropriate explanations (there&#39;s a kind of d=
=C3=A9j=C3=A0-vu<br>
&gt; here...)<br>
<br>
While reviewing another patch, I now noticed that we did lose something<br>
with the introduction of this ninja backend. that I totally missed when<br>
I applied it.<br>
<br>
Indeed, previously, the install step was done with the install/fast<br>
rule:<br>
<br>
=C2=A0 =C2=A0 $(2)_INSTALL_STAGING_OPTS=C2=A0 =C2=A0 =C2=A0 ?=3D DESTDIR=3D=
$$(STAGING_DIR) install/fast<br>
=C2=A0 =C2=A0 $(2)_INSTALL_TARGET_OPTS=C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D DESTD=
IR=3D$$(TARGET_DIR) install/fast<br>
<br>
But this got removed with your patch, with nothing to replace it.<br>
<br>
See commit dfcc18f84b0d (pkg-cmake: Skip compilation in installation<br>
step) for the rationale of using install/fast.<br>
<br>
Could you look into restoring this, please?<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer noreferrer nor=
eferrer" target=3D"_blank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ H=
TML MAIL=C2=A0 =C2=A0 |=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
<br>
</blockquote></div></div>

--0000000000002faf030606c1986f--

--===============4589095263527414729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4589095263527414729==--
