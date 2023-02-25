Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710BBC7EE2D
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 10:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE09D60BB1;
	Sat, 25 Feb 2023 10:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE09D60BB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ziZciY9U-gOM; Sat, 25 Feb 2023 10:35:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 298D260B3F;
	Sat, 25 Feb 2023 10:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 298D260B3F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A3F81BF82C
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 10:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 307AB60B3F
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 10:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 307AB60B3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dADJjETOnEDo for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 10:35:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA99960687
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA99960687
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 10:35:26 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id 16so960990pge.11
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 02:35:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=raNLqcm2jULwmJ4eNoRFaAfYp5JuoHyvfSHOWJnrr6c=;
 b=YMvUlv1a6WR8ssv8xuO/KVcTUnuLf3V3UYxXsx7BhE4JqyZ7tz5ZKg/JFyWny/yf4r
 qtxAujYGw6dyt50OkMwirx8VJmJnlU1rXNGiK4uW5KKP1QtOFbtCiEIu1WMRWG7tX+uN
 oQfcZEL7iRFUo5KJJSvUxYUhxVpb5JUUKn9Cm89RsGfMc8xIh+emmzDJrUVmnChha80c
 vtI1u2I4oILf3CfJ7mHeoqPM0to8rsvdO/XOyow3CickDC8cxM1JVc+47H0r3mU2XvFU
 0VAGhqIRK0GF+3CGt6UbWDu9Sv8cp8ubcgP9ujCR7AqjE6/wjN9Oke6OD7XFOfK2Gl8n
 CD6Q==
X-Gm-Message-State: AO0yUKXjf/hcLBragGF2Nj3cjMY7NQYrw7g4GZSOcoapNCKC1zHjovWu
 Cq+lzms/XHVmGJ5MAVVf5tz8bGB9UcVTqj2577MRJvhzfHs=
X-Google-Smtp-Source: AK7set925R0Ex0jnF/mCef4F2yks+TO+67s0KWD94uEEL5vaHLzZlq0lV32o1JBd2OrDzZMSAIHZsQWd2iB3qLM1vyI=
X-Received: by 2002:a63:7a54:0:b0:4fb:3896:a7d4 with SMTP id
 j20-20020a637a54000000b004fb3896a7d4mr3743270pgn.7.1677321325961; Sat, 25 Feb
 2023 02:35:25 -0800 (PST)
MIME-Version: 1.0
References: <20230224095045.782119-1-fontaine.fabrice@gmail.com>
 <20230225104216.6f9f39b6@windsurf>
In-Reply-To: <20230225104216.6f9f39b6@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 25 Feb 2023 11:35:14 +0100
Message-ID: <CAPi7W82vg=m_G_e6a0v3t3ikJtzApTQ_wmRQKnFvqj_LbZ1wGw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=raNLqcm2jULwmJ4eNoRFaAfYp5JuoHyvfSHOWJnrr6c=;
 b=lPJhq3gQ+KZbsNf5pFr7IZbmUEDPnXdinuXKwOMd71hcoVcCRKQD1X59QSU3CB5uGA
 xYjI3f+r5VNRgLO4X2tjn5NAg7w/NqFTibIxPIxbCW/05ScjOLhd7uCuEsR8jJixO53H
 53ao9xM+ZDnZJ6e6qvPcsaiC7Os2L9K/YsPkRHibfcqlFX7Av+7AIamGKMN852683FbW
 FNlJnyJVLe9wb4htrUM6o0tLEYstqVoOAfKxMwBgm+sA3j8U9ytllfwk37LEVgdLFLbq
 Dtf+sSIXuFiZ1haKJOEkvURDVUJZBJNj9Og6SbnZT0PRQM+qdkmsDejw61ujOQu/FjvL
 DUOQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lPJhq3gQ
Subject: Re: [Buildroot] [PATCH 1/1] package/asterisk: fix build with
 libressl
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7465705510625578327=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7465705510625578327==
Content-Type: multipart/alternative; boundary="000000000000ceee1e05f583cd80"

--000000000000ceee1e05f583cd80
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 25 f=C3=A9vr. 2023 =C3=A0 10:42, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a =C3=A9crit :

> On Fri, 24 Feb 2023 10:50:45 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fix the following build failure with libressl by using SSL_is_server
> > which is available since version 2.7.0 and
> >
> https://github.com/libressl-portable/openbsd/commit/d7ec516916c5eaac29b02=
d7a8ac6570f63b458f7
> :
> >
> > iostream.c: In function 'ast_iostream_close':
> > iostream.c:559:41: error: invalid use of incomplete typedef 'SSL' {aka
> 'struct ssl_st'}
> >   559 |                         if (!stream->ssl->server) {
> >       |                                         ^~
> >
> > Fixes:
> >  -
> http://autobuild.buildroot.org/results/ce4d62d00bb77ba5b303cacf6be7e35058=
1a62f9
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  ...n-iostream.c-fix-build-with-libressl.patch | 38 +++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >  create mode 100644
> package/asterisk/0006-main-iostream.c-fix-build-with-libressl.patch
>
> Applied to master, thanks. What is the upstream status of this patch?
>

I finally sent it today (
https://issues.asterisk.org/jira/browse/ASTERISK-30107), I really hate
gerrit ...


>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

Best Regards,

Fabrice

--000000000000ceee1e05f583cd80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 25 f=C3=A9vr. 2023 =C3=
=A0=C2=A010:42, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@boo=
tlin.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 24 Feb 2023 10:5=
0:45 +0100<br>
Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=
=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Fix the following build failure with libressl by using SSL_is_server<b=
r>
&gt; which is available since version 2.7.0 and<br>
&gt; <a href=3D"https://github.com/libressl-portable/openbsd/commit/d7ec516=
916c5eaac29b02d7a8ac6570f63b458f7" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/libressl-portable/openbsd/commit/d7ec516916c5eaac29b02d7a8a=
c6570f63b458f7</a>:<br>
&gt; <br>
&gt; iostream.c: In function &#39;ast_iostream_close&#39;:<br>
&gt; iostream.c:559:41: error: invalid use of incomplete typedef &#39;SSL&#=
39; {aka &#39;struct ssl_st&#39;}<br>
&gt;=C2=A0 =C2=A0559 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!stream-&gt;ssl-&gt;server) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~<br>
&gt; <br>
&gt; Fixes:<br>
&gt;=C2=A0 - <a href=3D"http://autobuild.buildroot.org/results/ce4d62d00bb7=
7ba5b303cacf6be7e350581a62f9" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.org/results/ce4d62d00bb77ba5b303cacf6be7e350581a62f9</a>=
<br>
&gt; <br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...n-iostream.c-fix-build-with-libressl.patch | 38 +++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 38 insertions(+)<br>
&gt;=C2=A0 create mode 100644 package/asterisk/0006-main-iostream.c-fix-bui=
ld-with-libressl.patch<br>
<br>
Applied to master, thanks. What is the upstream status of this patch?<br></=
blockquote><div><br></div><div>I finally sent it today (<a href=3D"https://=
issues.asterisk.org/jira/browse/ASTERISK-30107">https://issues.asterisk.org=
/jira/browse/ASTERISK-30107</a>), I really hate gerrit ...<br></div><div>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br></blockquote><div><br></div><div>Best Regards,</div><d=
iv><br></div><div>Fabrice <br></div></div></div>

--000000000000ceee1e05f583cd80--

--===============7465705510625578327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7465705510625578327==--
