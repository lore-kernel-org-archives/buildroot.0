Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8798ECD128A
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 21:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16C67817AC;
	Mon,  1 Apr 2024 21:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ly4UHqjovHHi; Mon,  1 Apr 2024 21:10:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF0E2817AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF0E2817AE;
	Mon,  1 Apr 2024 21:10:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4425E1BF338
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 21:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 309FE608B8
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 21:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OthyDyvMRLl1 for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 21:10:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com;
 envelope-from=pholden@nklabs.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A7C7C6077D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7C7C6077D
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7C7C6077D
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 21:10:05 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-5ce2aada130so2845581a12.1
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 14:10:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712005805; x=1712610605;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qHPzi4eHBQCQ8DI6qju/iaj0yHsRwAp+qwBIwJqO8ro=;
 b=u7RzKN4QQvvjf79Rt8IgRnGpy0bCbf3oGgkgnXnWtRtNRpjTSOwP3XTFzoDBOhwbwb
 83SpUT7T2B+zXP51/MPELmQoDPfQQ3SGcIXSc+TklYQzEoGd0ULl2yWm3RsM2DVWFsfa
 ou5aPlnEkCgTIJywL/5JBzWhCecm81rSuvBlPnCYHvG92ek1WKsXsse+/hnfI/oDruyT
 BFUFGgaGScyzNZTi2e/TMqqrZCIY+cney2FYVXTSOS+f+HTpps+LI3tc+8xLfFsr4cHl
 VvcTG6zHv2xbYIiLnBk2wIWMQix1oEjydv4bgxYHOuC3t0ASl+noG4yvQKNRd4pqdHPW
 lFdQ==
X-Gm-Message-State: AOJu0YxOL+MFqNYTDW0pHkvv0gsLESfQDTpZGgAtXTiaTjUGH+q9IC++
 yvZyjLv7rdwJxuQ3F7Zrs1ulfE3rF+EkxHKgvgSkuvLHd8K3Q43U18Tv0CCxUL26LuSTNcDGpHC
 IeFnciLwMLF3q7IuNn6+6QNXpFjdnDXEDh8jeVW08VSN358XAXffSvA==
X-Google-Smtp-Source: AGHT+IFvNt+WJl2UY+b6B03LwytQvVkazFryFGvbHOqLErL8xR247bk15qCVLOsYvQEH7zm8aZ3NuaQgfBNqDhXbHp4=
X-Received: by 2002:a17:903:258a:b0:1e0:a1c7:572c with SMTP id
 jb10-20020a170903258a00b001e0a1c7572cmr7834018plb.18.1712005804730; Mon, 01
 Apr 2024 14:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ6EmCfd_TZwz3=RKequ=1t1-2Q5FbHENkcrPTu0ebwMEWq_HA@mail.gmail.com>
 <03d6dfc8-3a39-45eb-bdca-7f1654fab9a3@mind.be>
 <CAJ6EmCcEAuv8i_RC5FbVLueXaCLYm1T-GsuEtmo1wNCPOsRmCw@mail.gmail.com>
 <b5434307-aaf8-4ee1-a41a-00d9730f332c@mind.be>
In-Reply-To: <b5434307-aaf8-4ee1-a41a-00d9730f332c@mind.be>
From: Patricia Holden <pholden@nklabs.com>
Date: Mon, 1 Apr 2024 17:09:53 -0400
Message-ID: <CAJ6EmCdiSJk0Mora4P401KPv3vhXOpSGEthujBh37Lg_kAc52w@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs.com; s=google; t=1712005805; x=1712610605; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qHPzi4eHBQCQ8DI6qju/iaj0yHsRwAp+qwBIwJqO8ro=;
 b=N+TmlN9pHEEtB0TDNtn+IOQgiFvMZAgUx0o4zfbinHq10Os170KPA/o6Sd85tMDauf
 Tw8jjc30N5I/yjtgny+E/Pb2r5aGQ/qI1kIzHnzCF9ctctm7lN/hkL044FPhcFXBn4BU
 lW5hG7gfU2pwqnfR5sLZn06MsmQUDPW67dO/PQDNb5AiHbQwyvrGYk05OJhnk31kXAtk
 LS7K4jQWqzFNvx9PcUIswAU0avvqsR7d37gbyE5Nnx3vUTHVIwbaXWYsTYUpEGl92ltI
 yybr++p4L2gUghLaTPLhS7IQYNY3RjRjTALOz8s427Q8ZaOcfLMz57xDrEgTxKD9cTk4
 Oj+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=nklabs.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=nklabs.com header.i=@nklabs.com header.a=rsa-sha256
 header.s=google header.b=N+TmlN9p
Subject: Re: [Buildroot] Is there an official browser patch for Buildroot?
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3944100682344790420=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3944100682344790420==
Content-Type: multipart/alternative; boundary="000000000000d84da406150f69c7"

--000000000000d84da406150f69c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Unfortunately I cannot use WPEWebKit with Beagleplay dev board I'm using.
It requires OpenGL which has no Beagleplay support at the moment.  What
about matchbox-window-manager?

On Mon, Apr 1, 2024 at 3:53=E2=80=AFPM Arnout Vandecappelle <arnout@mind.be=
> wrote:

>
>
> On 01/04/2024 20:56, Patricia Holden wrote:
> > I just need a simple web page I can run a react app on.  If you know of
> any
> > examples of this, please share!  I have tried using matchbox, but not
> sure I'm
> > configuring it correctly.
>
>   That's exactly what qt-webkit-kiosk is meant for. Oh, and I forgot cog
> earlier: that's the same kind of tool but without pulling in Qt. Note: yo=
u
> need
> to enable WPEWebKit to be able to enable cog in Buildroot.
>
>   cog is much better maintained - I added Adrian in Cc who works on
> WPEWebKit
> and cog in Buildroot.
>
>   Regards,
>   Arnout
>
> >
> > On Mon, Apr 1, 2024 at 2:38=E2=80=AFPM Arnout Vandecappelle <arnout@min=
d.be
> > <mailto:arnout@mind.be>> wrote:
> >
> >
> >
> >     On 01/04/2024 20:00, Patricia Holden wrote:
> >      > I found a few topics online about a patch for chromium, but they
> are
> >     dated 2018
> >      > or older.  Is there an official patch to add the chromium-browse=
r
> as a
> >     package
> >      > for Buildroot?  Or how about "minibrowser", which I have also
> seen topics
> >     in an
> >      > online search?
> >
> >        I don't think there has ever been an attempt to attempt chromium
> itself, but
> >     there was an attempt at patches for Chromium Embedded Framework
> (CEF). That's
> >     not a browser, however, just a browser engine. And anyway it turned
> out that
> >     Chromium (and firefox) are way too complicated with too many vendor=
ed
> >     dependencies and crazy buildsystems.
> >
> >        There are a bunch of alternative browser engines: qt5webengine,
> qt5webkit,
> >     webkitgtk, wpewebkit.
> >
> >        There are also a few simple "frontends" for these, that basicall=
y
> render a
> >     single webpage and then allow you to browse (so no things like
> history,
> >     bookmarks, plugins, etc.): qt-webkit-kiosk, qt5webview; and a more
> complete
> >     browser: midori.
> >
> >        Finally, there's also the text-mode browser links, but I don't
> suppose that
> >     that is what you're looking for.
> >
> >
> >        Regards,
> >        Arnout
> >
> >      >
> >      > Thanks!
> >      > Pat Holden, NK Labs
> >      >
> >      > _______________________________________________
> >      > buildroot mailing list
> >      > buildroot@buildroot.org <mailto:buildroot@buildroot.org>
> >      > https://lists.buildroot.org/mailman/listinfo/buildroot
> >     <https://lists.buildroot.org/mailman/listinfo/buildroot>
> >
>

--000000000000d84da406150f69c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Unfortunately I cannot use WPEWebKit with Beagleplay=C2=A0=
dev board I&#39;m using.=C2=A0 It requires OpenGL which has no Beagleplay s=
upport at the moment.=C2=A0 What about matchbox-window-manager?</div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr =
1, 2024 at 3:53=E2=80=AFPM Arnout Vandecappelle &lt;<a href=3D"mailto:arnou=
t@mind.be">arnout@mind.be</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><br>
<br>
On 01/04/2024 20:56, Patricia Holden wrote:<br>
&gt; I just need a simple web page I can run a react app on.=C2=A0 If you k=
now of any <br>
&gt; examples of this, please share!=C2=A0 I have tried using matchbox, but=
 not sure I&#39;m <br>
&gt; configuring it correctly.<br>
<br>
=C2=A0 That&#39;s exactly what qt-webkit-kiosk is meant for. Oh, and I forg=
ot cog <br>
earlier: that&#39;s the same kind of tool but without pulling in Qt. Note: =
you need <br>
to enable WPEWebKit to be able to enable cog in Buildroot.<br>
<br>
=C2=A0 cog is much better maintained - I added Adrian in Cc who works on WP=
EWebKit <br>
and cog in Buildroot.<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; <br>
&gt; On Mon, Apr 1, 2024 at 2:38=E2=80=AFPM Arnout Vandecappelle &lt;<a hre=
f=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@mind.be</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@=
mind.be</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 01/04/2024 20:00, Patricia Holden wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I found a few topics online about a patch for=
 chromium, but they are<br>
&gt;=C2=A0 =C2=A0 =C2=A0dated 2018<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; or older.=C2=A0 Is there an official patch to=
 add the chromium-browser as a<br>
&gt;=C2=A0 =C2=A0 =C2=A0package<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; for Buildroot?=C2=A0 Or how about &quot;minib=
rowser&quot;, which I have also seen topics<br>
&gt;=C2=A0 =C2=A0 =C2=A0in an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; online search?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 I don&#39;t think there has ever been an at=
tempt to attempt chromium itself, but<br>
&gt;=C2=A0 =C2=A0 =C2=A0there was an attempt at patches for Chromium Embedd=
ed Framework (CEF). That&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0not a browser, however, just a browser engine. And =
anyway it turned out that<br>
&gt;=C2=A0 =C2=A0 =C2=A0Chromium (and firefox) are way too complicated with=
 too many vendored<br>
&gt;=C2=A0 =C2=A0 =C2=A0dependencies and crazy buildsystems.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 There are a bunch of alternative browser en=
gines: qt5webengine, qt5webkit,<br>
&gt;=C2=A0 =C2=A0 =C2=A0webkitgtk, wpewebkit.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 There are also a few simple &quot;frontends=
&quot; for these, that basically render a<br>
&gt;=C2=A0 =C2=A0 =C2=A0single webpage and then allow you to browse (so no =
things like history,<br>
&gt;=C2=A0 =C2=A0 =C2=A0bookmarks, plugins, etc.): qt-webkit-kiosk, qt5webv=
iew; and a more complete<br>
&gt;=C2=A0 =C2=A0 =C2=A0browser: midori.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Finally, there&#39;s also the text-mode bro=
wser links, but I don&#39;t suppose that<br>
&gt;=C2=A0 =C2=A0 =C2=A0that is what you&#39;re looking for.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Arnout<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Thanks!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Pat Holden, NK Labs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; _____________________________________________=
__<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; buildroot mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; <a href=3D"mailto:buildroot@buildroot.org" ta=
rget=3D"_blank">buildroot@buildroot.org</a> &lt;mailto:<a href=3D"mailto:bu=
ildroot@buildroot.org" target=3D"_blank">buildroot@buildroot.org</a>&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; <a href=3D"https://lists.buildroot.org/mailma=
n/listinfo/buildroot" rel=3D"noreferrer" target=3D"_blank">https://lists.bu=
ildroot.org/mailman/listinfo/buildroot</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.buildroot.org/mailman/=
listinfo/buildroot" rel=3D"noreferrer" target=3D"_blank">https://lists.buil=
droot.org/mailman/listinfo/buildroot</a>&gt;<br>
&gt; <br>
</blockquote></div>

--000000000000d84da406150f69c7--

--===============3944100682344790420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3944100682344790420==--
