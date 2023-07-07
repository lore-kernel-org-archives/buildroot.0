Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F524EB64D9
	for <buildroot@archiver.kernel.org>; Fri,  7 Jul 2023 20:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85FE782E4C;
	Fri,  7 Jul 2023 20:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85FE782E4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ew367eDY8huo; Fri,  7 Jul 2023 20:05:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A03C582E9D;
	Fri,  7 Jul 2023 20:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A03C582E9D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB2C01BF405
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 20:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2FB14019D
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 20:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2FB14019D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tWotFiaykToD for <buildroot@lists.busybox.net>;
 Fri,  7 Jul 2023 20:05:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C8B4400AB
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C8B4400AB
 for <buildroot@buildroot.org>; Fri,  7 Jul 2023 20:05:23 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3142ee41fd2so2380289f8f.3
 for <buildroot@buildroot.org>; Fri, 07 Jul 2023 13:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688760321; x=1691352321;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1QJo8zBqak/TFu40YctyZLN2bRS2YjZ8MkK3TRQuBDo=;
 b=ilj7wjz/cQOlRe70cORtphCYJ56w1vKj59LK8oCyMEjkzCPylqaVGuOnrSSJ7h222z
 opF1BsaVXWqcNhI2wKsH4oUY+uPb8RwdRox8xQOZ3X7ldygYHQiMpX5CRXKQckndFjKh
 EnYAYDXxJYumGmZ1p1Gsh0nOhuH6+Qm1XcNcpwWm+IhGNJeKh2EEoCNvAbzS3e4AdSz+
 NClbWKPU19XYhqi3oY8IosAjzPMp25C/N14qeH3lBH0J4k8d54XA8ZVbuQALupM4WS0g
 L1idoXoETDN36RBAG6ngWpda3mTizZb4kND30MdcKMtlbeI8bYpOQJ9dLm/KVmxO7Hd0
 AIuA==
X-Gm-Message-State: ABy/qLaUCJq7T9cBKQGqqfz0UhxJIpA2LJbhK+vKUYQqa5gts/7UvD3Y
 log8ssHGCT4W3ZyFOwlEY2HimSuXKlMa555j1wt4U4o+
X-Google-Smtp-Source: APBJJlGUvy2/Emtit6S/lN7O9X5pIb5bGfiyeurw8tMlF75cb9d97pamwG+PbZNrYCpu7wbgoTtJZkqhgn8NQgf97H4=
X-Received: by 2002:a05:6000:150:b0:306:46c4:d313 with SMTP id
 r16-20020a056000015000b0030646c4d313mr4764491wrx.28.1688760321027; Fri, 07
 Jul 2023 13:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230707185106.98208-1-ckhardin@gmail.com>
 <CA+h8R2ro85otAvxzWshcrrwPVyrAiZ0vEdtrMNKXLX8mvOBwdA@mail.gmail.com>
 <CA+h8R2qsM9OGKgvHz_oZBSD+t4-oMjK+TMu34AneoaJVnPsnDA@mail.gmail.com>
In-Reply-To: <CA+h8R2qsM9OGKgvHz_oZBSD+t4-oMjK+TMu34AneoaJVnPsnDA@mail.gmail.com>
From: Charles Hardin <ckhardin@gmail.com>
Date: Fri, 7 Jul 2023 13:05:09 -0700
Message-ID: <CAN=fXj0yUyOncAf40AUnjt6=23ZQhqdBU7aoihfW1wViYjqWTw@mail.gmail.com>
To: Christian Stewart <christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688760321; x=1691352321;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1QJo8zBqak/TFu40YctyZLN2bRS2YjZ8MkK3TRQuBDo=;
 b=pPJm6FyD1ZV1nypHutM6bdspkw8WxjGHTobrAeDnUoyUdIKNI8ICJMsQVrXJJarqXr
 Q2DwR6BL8H1TobdUZxaCU2Klo3gJi054NfYgnewFxSNvB7a8lILxIoCh2/Fm6CzQRgMG
 ZuRW4OMn/ujjErrDmWPHoCKGAYVNqiihBgCWhc/hMFWaYX+iogLmNY5z94QJEmG++YE4
 2DHry23GfZvFnIlFRpjhgynUTbzHhpfTWtlrpq+arOSPxG3A0fnUF6OU53cu3ws7JWGa
 oZ6gwMbibKiDX+L2rd4sa8TiMvaEdZj8hrv4r3N3Y+NttlWnCi3wo1zBz7wdXX0tCl2M
 x25A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=pPJm6FyD
Subject: Re: [Buildroot] [PATCH 1/1] package/go-native: add a new download
 only package for go compilers
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
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1483389492269236767=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1483389492269236767==
Content-Type: multipart/alternative; boundary="0000000000000bb0f005ffeb2727"

--0000000000000bb0f005ffeb2727
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Christian

On Fri, Jul 7, 2023 at 12:08=E2=80=AFPM Christian Stewart <christian@apertu=
re.us>
wrote:

> Hi Charles,
>
>
> On Fri, Jul 7, 2023 at 12:04=E2=80=AFPM Christian Stewart <christian@aper=
ture.us>
> wrote:
> > This is not necessary with this patch series:
> >
> > https://patchwork.ozlabs.org/project/buildroot/list/?series=3D358451
> >
> > We can correctly bootstrap on arm64.
>
> I should clarify: actually go bootstrap stage1 cannot work on arm64
> (you're correct on this).
>
> I had submitted this patch as well to use the host "go" in this case:
>
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20230215073256.18647=
6-3-christian@paral.in/
>
> Similar to how we use host gcc.
>
>
Weird - i was looking for a fix and never saw - perhaps i didn't have the
magic google search keywords. So, this was "our fix" to just get something
working specifically on a aarch64 builds. This is our annual timeline of
let's take our patches we have locally and send them upstream to see what
happens and see if we can drop our local patches in favor of upstream fixes=
.


> However, I understand that your series intends to add downloading the
> binaries for the Go compiler to Buildroot as well.
>
> This is potentially useful but I still submit that we need to merge
> the above series updating to Go 1.20 and splitting the bootstrap into
> two phases before merging the go-native series.
>
>
I just went for a quick and dirty to just use a native instead of doing the
bootstrap - we have a major issue in that we don't have many x86_64 build
systems anymore and we are having to move to aarch64 builds almost
exclusively. So, not having a way to get the compiler going was becoming a
headache.


> I'll start testing your patch as well.
>
>
This is not meant to replace - more of a - here is a way that worked for
us, if there is a better way that fits into buildroot then please just
merge that. Right now we don't have anything in the proper mainline so
everything is a deviation at this time.


> Thanks,
> Christian
>
> > On Fri, Jul 7, 2023 at 11:51=E2=80=AFAM Charles Hardin <ckhardin@gmail.=
com>
> wrote:
> > >
> > > The go-native is mainly for the aarch64 support since that was
> > > added after the go-bootstrap written in C was dropped. So, to
> > > get a cross compiler for go a host/native compiler needs to be
> > > available to generate the setup for the needed target. This is
> > > using the same go version as the expected cross-compiler to
> > > keep the packages in sync. A specific version could be used.
>

--0000000000000bb0f005ffeb2727
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Christian</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 7, 2023 at 12:08=E2=
=80=AFPM Christian Stewart &lt;<a href=3D"mailto:christian@aperture.us">chr=
istian@aperture.us</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Hi Charles,<br>
<br>
<br>
On Fri, Jul 7, 2023 at 12:04=E2=80=AFPM Christian Stewart &lt;<a href=3D"ma=
ilto:christian@aperture.us" target=3D"_blank">christian@aperture.us</a>&gt;=
 wrote:<br>
&gt; This is not necessary with this patch series:<br>
&gt;<br>
&gt; <a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/?series=
=3D358451" rel=3D"noreferrer" target=3D"_blank">https://patchwork.ozlabs.or=
g/project/buildroot/list/?series=3D358451</a><br>
&gt;<br>
&gt; We can correctly bootstrap on arm64.<br>
<br>
I should clarify: actually go bootstrap stage1 cannot work on arm64<br>
(you&#39;re correct on this).<br>
<br>
I had submitted this patch as well to use the host &quot;go&quot; in this c=
ase:<br>
<br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/20230215073=
256.186476-3-christian@paral.in/" rel=3D"noreferrer" target=3D"_blank">http=
s://patchwork.ozlabs.org/project/buildroot/patch/20230215073256.186476-3-ch=
ristian@paral.in/</a><br>
<br>
Similar to how we use host gcc.<br>
<br></blockquote><div><br></div><div>Weird=C2=A0- i was looking for a fix a=
nd never saw - perhaps i didn&#39;t have the magic google search keywords. =
So, this was &quot;our fix&quot; to just get something working specifically=
 on a aarch64 builds. This is our annual timeline of let&#39;s take our pat=
ches we have locally and send them upstream to see what happens and see if =
we can drop our local patches in favor of upstream fixes.</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
However, I understand that your series intends to add downloading the<br>
binaries for the Go compiler to Buildroot as well.<br>
<br>
This is potentially useful but I still submit that we need to merge<br>
the above series updating to Go 1.20 and splitting the bootstrap into<br>
two phases before merging the go-native series.<br>
<br></blockquote><div><br></div><div>I just went for a quick and dirty to j=
ust use a native instead of doing the bootstrap - we have a major issue in =
that we don&#39;t have many x86_64 build systems anymore and we are having =
to move to aarch64 builds almost exclusively. So, not having a way to get t=
he compiler going was becoming a headache.</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
I&#39;ll start testing your patch as well.<br>
<br></blockquote><div><br></div><div>This is not meant to replace - more of=
 a - here is a way that worked for us, if there is a better way that fits i=
nto buildroot then please just merge that. Right now we don&#39;t have anyt=
hing in the proper mainline so everything is a deviation at this time.</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks,<br>
Christian<br>
<br>
&gt; On Fri, Jul 7, 2023 at 11:51=E2=80=AFAM Charles Hardin &lt;<a href=3D"=
mailto:ckhardin@gmail.com" target=3D"_blank">ckhardin@gmail.com</a>&gt; wro=
te:<br>
&gt; &gt;<br>
&gt; &gt; The go-native is mainly for the aarch64 support since that was<br=
>
&gt; &gt; added after the go-bootstrap written in C was dropped. So, to<br>
&gt; &gt; get a cross compiler for go a host/native compiler needs to be<br=
>
&gt; &gt; available to generate the setup for the needed target. This is<br=
>
&gt; &gt; using the same go version as the expected cross-compiler to<br>
&gt; &gt; keep the packages in sync. A specific version could be used.<br>
</blockquote></div></div>

--0000000000000bb0f005ffeb2727--

--===============1483389492269236767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1483389492269236767==--
