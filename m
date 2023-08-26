Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1C3C83F11
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 20:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39B4981EEA;
	Sat, 26 Aug 2023 20:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39B4981EEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S9OghRG44AAS; Sat, 26 Aug 2023 20:04:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5549881EE5;
	Sat, 26 Aug 2023 20:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5549881EE5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 65E021BF471
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 20:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CE854151C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 20:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CE854151C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rPNU7Qrvf8rG for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 20:04:32 +0000 (UTC)
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E22C54151A
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 20:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E22C54151A
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-58dfe2d5b9aso28173797b3.1
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 13:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693080271; x=1693685071;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ffqbMb/aXfjC5zCEds9GaxVqk8JaFuO/3DUFGd3u+0s=;
 b=WxufFQ85oYJXWS5ezM98K9RlQMG1NVg+T6fnyV6crgjT47x7Mqa7MvV8swcVWI1G70
 odmezPVVJ5G0B9ozGYpL6dkH/TYCcEt54pH+ygXlQD4PRXpO4eIoF4/i1SM6HAe6qGNJ
 BVlTUDMvrjsHvimRMxi/VpuIR+zlBNcFpKzwYJ5y9hmjRhjbzbP6tkSNaopNoMOm+8LJ
 hPfaGaxL8ydIexNexcznGUvWPmOwo+Pj0eQ0h8/6qCi1ONzJe1RTsZ/78D9J7+rLKua6
 jralHFAKDqoTgJ25/HiNUU1rpEvE2O0/m24fRf9gkOhJEPsoErbsqZe1BMS4c6JWP0Kw
 pIGg==
X-Gm-Message-State: AOJu0YzY4ymXjC7qciaZkFTIB0eS2RH3uRyAPf2puCE3tHcZHmfITfli
 tVWtFCBWbWCiwdYs8J4GmAp7260YWDZI9f1ZQ2E=
X-Google-Smtp-Source: AGHT+IF3PuvAxUvwLmoAMfm7+/RCQt+LKe39EvLN84sRtrZkzqNGvctyWOTx5HlrA6VWIR71C2XCHeQfNwvxUr1+2sI=
X-Received: by 2002:a81:9b04:0:b0:56f:f0db:759a with SMTP id
 s4-20020a819b04000000b0056ff0db759amr1789354ywg.13.1693080270626; Sat, 26 Aug
 2023 13:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230808172231.1114696-1-jesse.vangavere@scioteq.com>
 <20230826214912.7821c07c@windsurf>
In-Reply-To: <20230826214912.7821c07c@windsurf>
From: Jesse Van Gavere <jesseevg@gmail.com>
Date: Sat, 26 Aug 2023 22:04:19 +0200
Message-ID: <CAMdwsN_TugJKe9iAYaQRsE77RWTkdRATNWPHLY1=5DN4j0AFgA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693080271; x=1693685071;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ffqbMb/aXfjC5zCEds9GaxVqk8JaFuO/3DUFGd3u+0s=;
 b=pUfhq+SlthDtwsx8P79IJP9LXecX1NH3J3icB2TvAM+oNhBByRoP+AcCt23Tdp12Gj
 RtSir99LYHipZZIS1dRrbejlTq8ku9Lzctc+WKi4CfAHsmgKZUBjP5UWEpLKU7bnc+/8
 d59En+c13piuiOGc7raEf6rc+bnF4Y2WdhLJ7zcJIrEreAm7g/il2fBFDeT1D/colSWw
 WJqtkxtFBgN2YxodVfPC4HzAzYqUVMp5gXYr2d12Bn3F/FCwK4a1IUY3eqa7cgUUA2CT
 NcmGi7FzKsrXxJ0/tTReCPsWUUl+sqklz6emv1KRwAMzBxIdMPYcOsuZB7QFe2XR4ALl
 nhbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=pUfhq+Sl
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6shadertools: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Jesse Van Gavere <jesse.vangavere@scioteq.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6036492271469399484=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6036492271469399484==
Content-Type: multipart/alternative; boundary="0000000000001b65c40603d8f85a"

--0000000000001b65c40603d8f85a
Content-Type: text/plain; charset="UTF-8"

Hello Thomas,

Op za 26 aug. 2023 21:49 schreef Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> Hello Jesse,
>
> On Tue,  8 Aug 2023 19:22:31 +0200
> Jesse Van Gavere <jesseevg@gmail.com> wrote:
>
> > Signed-off-by: Jesse Van Gavere <jesse.vangavere@scioteq.com>
> > ---
> >  package/qt6/Config.in                         |  1 +
> >  package/qt6/qt6shadertools/Config.in          | 11 +++++
> >  .../qt6/qt6shadertools/qt6shadertools.hash    | 13 +++++
> >  package/qt6/qt6shadertools/qt6shadertools.mk  | 47 +++++++++++++++++++
> >  4 files changed, 72 insertions(+)
> >  create mode 100644 package/qt6/qt6shadertools/Config.in
> >  create mode 100644 package/qt6/qt6shadertools/qt6shadertools.hash
> >  create mode 100644 package/qt6/qt6shadertools/qt6shadertools.mk
>
> Thanks Jesse for your patch. It builds fine... but it doesn't install
> anything. Indeed, it looks like qt6shadertools doesn't not
> build/install anything when qt6base is not built with GUI support:
>
> Skipping the build as the condition "TARGET Qt::Gui" is not met.
>
You're right, forgot that dependency, I'll add it

>
> For the target package, it would be easy to fix. But for the host
> qt6base package, the story is a bit different. Does qt6shadertools
> really need GUI support in host-qt6base? If so, how did you test that
> as nothing in Buildroot right now allows to enable GUI support in
> host-qt6base?
>
Yeah another oversight, I probably built it with GUI temporarily in and
forgot about it, the host package is necessary though as this will install
qsb which is a requirement for the follow-up qt declarative package I want
to add (at least for QtQuick support) and I'm not aware of a mechanism that
allows for conditional host package builds, if it's available though I'll
take a look, otherwise I'll always do the host build jit for that case, but
I'll at least check for adding the host GUI support, a slight casualty of
Qt their new host/target split

>
> Could you have a look into this, and send a v2?
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--0000000000001b65c40603d8f85a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello Thomas,<br><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">Op za 26 aug. 2023 21:49 schreef Thomas P=
etazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzo=
ni@bootlin.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello Jesse=
,<br>
<br>
On Tue,=C2=A0 8 Aug 2023 19:22:31 +0200<br>
Jesse Van Gavere &lt;<a href=3D"mailto:jesseevg@gmail.com" target=3D"_blank=
" rel=3D"noreferrer">jesseevg@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Signed-off-by: Jesse Van Gavere &lt;<a href=3D"mailto:jesse.vangavere@=
scioteq.com" target=3D"_blank" rel=3D"noreferrer">jesse.vangavere@scioteq.c=
om</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/qt6/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 package/qt6/qt6shadertools/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 11 +++++<br>
&gt;=C2=A0 .../qt6/qt6shadertools/qt6shadertools.hash=C2=A0 =C2=A0 | 13 +++=
++<br>
&gt;=C2=A0 package/qt6/qt6shadertools/<a href=3D"http://qt6shadertools.mk" =
rel=3D"noreferrer noreferrer" target=3D"_blank">qt6shadertools.mk</a>=C2=A0=
 | 47 +++++++++++++++++++<br>
&gt;=C2=A0 4 files changed, 72 insertions(+)<br>
&gt;=C2=A0 create mode 100644 package/qt6/qt6shadertools/Config.in<br>
&gt;=C2=A0 create mode 100644 package/qt6/qt6shadertools/qt6shadertools.has=
h<br>
&gt;=C2=A0 create mode 100644 package/qt6/qt6shadertools/<a href=3D"http://=
qt6shadertools.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">qt6shade=
rtools.mk</a><br>
<br>
Thanks Jesse for your patch. It builds fine... but it doesn&#39;t install<b=
r>
anything. Indeed, it looks like qt6shadertools doesn&#39;t not<br>
build/install anything when qt6base is not built with GUI support:<br>
<br>
Skipping the build as the condition &quot;TARGET Qt::Gui&quot; is not met.<=
br></blockquote></div></div><div dir=3D"auto">You&#39;re right, forgot that=
 dependency, I&#39;ll add it</div><div dir=3D"auto"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><br>
For the target package, it would be easy to fix. But for the host<br>
qt6base package, the story is a bit different. Does qt6shadertools<br>
really need GUI support in host-qt6base? If so, how did you test that<br>
as nothing in Buildroot right now allows to enable GUI support in<br>
host-qt6base?<br></blockquote></div></div><div dir=3D"auto">Yeah another ov=
ersight, I probably built it with GUI temporarily in and forgot about it, t=
he host package is necessary though as this will install qsb which is a req=
uirement for the follow-up qt declarative package I want to add (at least f=
or QtQuick support) and I&#39;m not aware of a mechanism that allows for co=
nditional host package builds, if it&#39;s available though I&#39;ll take a=
 look, otherwise I&#39;ll always do the host build jit for that case, but I=
&#39;ll at least check for adding the host GUI support, a slight casualty o=
f Qt their new host/target split</div><div dir=3D"auto"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
<br>
Could you have a look into this, and send a v2?<br>
<br>
Thanks a lot!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div></div></div>

--0000000000001b65c40603d8f85a--

--===============6036492271469399484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6036492271469399484==--
