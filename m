Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D01C05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 16:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6140740AFF;
	Sun, 19 Feb 2023 16:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6140740AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ThgVL13nW1co; Sun, 19 Feb 2023 16:37:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DBD540439;
	Sun, 19 Feb 2023 16:37:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DBD540439
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 054731BF287
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 16:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBB88416C3
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 16:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBB88416C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FzTIaSxQVXBn for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 16:37:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A1FD416BF
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A1FD416BF
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 16:37:22 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 l4-20020a17090a49c400b002341fadc370so831032pjm.1
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 08:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ONd3ve4tx4tT7dDQ52hXi75yBG6ikZzNdicaG8+KHd4=;
 b=KqbILtNxxiGANlV/o4FVLrs3jBa3wvdtH4wfv/ePuOU7heoA+V9v15v4czcwkNS+O2
 WPYgJMZIzrYawf4f4ZpMpdymp8OJbtZKp+UpIZlofYOQcm4b4IABRUTDuGdiNJFtk6IX
 F7CIwTVrz8Itdk0ugFoghqAzR4lrM9ZG1h1kAMqihVyB3PAa4zEVa+QVAftiadfAZI46
 Zap9MHY4MSVdo4C/0+t5JB2rBt1EgIm1ZWcCFUqpZHFvly3iVjBYAvVr4It3iApv+dpy
 n+ahPRW4laI4veyLf2v1OvUbnhNJ7/d/dtFOIGKbmhU2jTOsL24IjXSVqYdMOxGyfsfi
 Hn3A==
X-Gm-Message-State: AO0yUKUkhiR74I86QWR0BJcjjkmyCN6jXnFhpCVZMThA7LLRtIdPo5xt
 mnq9UJ+u+bqSwToblSCRkm/wj+2E1sUHV2Uy9h0CG6Rgh3s=
X-Google-Smtp-Source: AK7set9/RtI+mZKnb4Px89DxeJRU52jkXwhNfq+xvtfbsWXm1guE0Bal/gI2inyECSBUFDZDaQ5P/5dhBrkp4lr0Vrw=
X-Received: by 2002:a17:90b:3882:b0:234:f45:c117 with SMTP id
 mu2-20020a17090b388200b002340f45c117mr806473pjb.76.1676824641495; Sun, 19 Feb
 2023 08:37:21 -0800 (PST)
MIME-Version: 1.0
References: <20230219140051.80647-1-fontaine.fabrice@gmail.com>
 <334eac4665b498754a5615cdec982341@free.fr>
In-Reply-To: <334eac4665b498754a5615cdec982341@free.fr>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 19 Feb 2023 17:37:10 +0100
Message-ID: <CAPi7W83LfMLzNbDcnerJxM2nuZW5BfTPH+2=82R5rhAtz2pVEg@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ONd3ve4tx4tT7dDQ52hXi75yBG6ikZzNdicaG8+KHd4=;
 b=Vd6ErM7VoAz40Iw+HN90JK5cWex9LA7GW1PD1hyVrLpu+dG1ZPDbbQ0T6z61fVDDzw
 +mv42YNINuU2UYu3hbqWPstJfN6pZ1nR9Wqwu/bRHHiY8Rtje56sljdG6/aUH/LsnTPG
 4Yz9cz86/i5itUFQeNXZf5Dzk5U4w3dW0oDVh5cBmzKxuFzhlNiHJqJpMb1QbHoOEutL
 QrB+2VvmU8nR27SnJbwsZc0mkm03C9uyd/B/qxsvCg3bxJX/k73dLW0YSRJ8vh6LdQPy
 TXsTEksjZFpFrBS9ICeX+38VxNm8p6f3zStEvJGN1K+ZGI0k5tGosxmxP3ffG4w4yK1v
 yXow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Vd6ErM7V
Subject: Re: [Buildroot] [PATCH 1/3] package/libjxl: fix build with libjpeg
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2684781062788970746=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2684781062788970746==
Content-Type: multipart/alternative; boundary="0000000000001b66f305f510298e"

--0000000000001b66f305f510298e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Le dim. 19 f=C3=A9vr. 2023 =C3=A0 16:31, Julien Olivain <ju.o@free.fr> a =
=C3=A9crit :

> Hi Fabrice,
>
> On 19/02/2023 15:00, Fabrice Fontaine wrote:
> > Building with libjpeg will raise the following build failure on some
> > architectures since the addition of the package in commit
> > e648d399d8bd609697e78f13f7fa76be06d91a57:
> >
> > /tmp/instance-14/output-1/build/libjxl-0.7.0/lib/extras/enc/jpg.cc: In
> > function 'jxl::Status
> > jxl::extras::{anonymous}::EncodeWithLibJpeg(const
> > jxl::extras::PackedImage&, const JxlBasicInfo&, const
> > std::vector<unsigned char>&, std::vector<unsigned char>, size_t, const
> > string&, std::vector<unsigned char>*)':
> >
> /tmp/instance-14/output-1/build/libjxl-0.7.0/lib/extras/enc/jpg.cc:126:34=
:
> > error: invalid conversion from 'long unsigned int*' to 'size_t*' {aka
> > 'unsigned int*'} [-fpermissive]
> >   126 |   jpeg_mem_dest(&cinfo, &buffer, &size);
> >       |                                  ^~~~~
> >       |                                  |
> >       |                                  long unsigned int*
> >
> > Upstream advocates to use jpeg-turbo:
> > https://github.com/libjxl/libjxl/issues/1802
> >
> > Fixes:
> >  -
> >
> http://autobuild.buildroot.org/results/9a2a7c6072876f2562609bf98f32a1ce93=
631a75
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/libjxl/libjxl.mk | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
> > index cc24ba258c..02a93ac5d9 100644
> > --- a/package/libjxl/libjxl.mk
> > +++ b/package/libjxl/libjxl.mk
> > @@ -30,4 +30,11 @@ LIBJXL_CONF_OPTS =3D \
> >       -DJPEGXL_ENABLE_SJPEG=3DOFF \
> >       -DJPEGXL_ENABLE_SKCMS=3DOFF
> >
> > +ifeq ($(BR2_PACKAGE_JPEG_TURBO),y)
> > +LIBJXL_DEPENDENCIES +=3D jpeg-turbo
> > +LIBJXL_CONF_OPTS +=3D -DJPEGXL_ENABLE_TOOLS=3DON
> > +else
> > +LIBJXL_CONF_OPTS +=3D -DJPEGXL_ENABLE_TOOLS=3DOFF
>
> Having JPEGXL_ENABLE_TOOLS=3DON without any libjpeg is a valid
> configuration for libjxl.
>
> Is it possible to disable the tools only if BR2_PACKAGE_LIBJPEG=3Dy?
>

Thanks for your review, I'll send a v2 which will set
CMAKE_DISABLE_FIND_PACKAGE_JPEG.


> The configuration with tools and without any libjpeg is the one
> used by the package runtime test.
>
> Running the test with command:
>
>      support/testing/run-tests \
>          -d dl -o output_folder \
>          tests.package.test_libjxl
>
> now fails with output:
>
>      AssertionError: 127 !=3D 0 :
>      Failed to run: cjxl /var/tmp/reference.ppm /var/tmp/encoded.jxl
>      output was:
>        -sh: cjxl: not found
>
> > +endif
> > +
> >  $(eval $(cmake-package))
>
> Best regards,
>
> Julien.
>

Best Regards,

Fabrice

--0000000000001b66f305f510298e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Julien,<br></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 19 f=C3=A9vr. =
2023 =C3=A0=C2=A016:31, Julien Olivain &lt;<a href=3D"mailto:ju.o@free.fr" =
target=3D"_blank">ju.o@free.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hi Fabrice,<br>
<br>
On 19/02/2023 15:00, Fabrice Fontaine wrote:<br>
&gt; Building with libjpeg will raise the following build failure on some<b=
r>
&gt; architectures since the addition of the package in commit<br>
&gt; e648d399d8bd609697e78f13f7fa76be06d91a57:<br>
&gt; <br>
&gt; /tmp/instance-14/output-1/build/libjxl-0.7.0/lib/extras/enc/jpg.cc: In=
<br>
&gt; function &#39;jxl::Status<br>
&gt; jxl::extras::{anonymous}::EncodeWithLibJpeg(const<br>
&gt; jxl::extras::PackedImage&amp;, const JxlBasicInfo&amp;, const<br>
&gt; std::vector&lt;unsigned char&gt;&amp;, std::vector&lt;unsigned char&gt=
;, size_t, const<br>
&gt; string&amp;, std::vector&lt;unsigned char&gt;*)&#39;:<br>
&gt; /tmp/instance-14/output-1/build/libjxl-0.7.0/lib/extras/enc/jpg.cc:126=
:34:<br>
&gt; error: invalid conversion from &#39;long unsigned int*&#39; to &#39;si=
ze_t*&#39; {aka<br>
&gt; &#39;unsigned int*&#39;} [-fpermissive]<br>
&gt;=C2=A0 =C2=A0126 |=C2=A0 =C2=A0jpeg_mem_dest(&amp;cinfo, &amp;buffer, &=
amp;size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 long unsigned int*<br>
&gt; <br>
&gt; Upstream advocates to use jpeg-turbo:<br>
&gt; <a href=3D"https://github.com/libjxl/libjxl/issues/1802" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/libjxl/libjxl/issues/1802</a><br=
>
&gt; <br>
&gt; Fixes:<br>
&gt;=C2=A0 -<br>
&gt; <a href=3D"http://autobuild.buildroot.org/results/9a2a7c6072876f256260=
9bf98f32a1ce93631a75" rel=3D"noreferrer" target=3D"_blank">http://autobuild=
.buildroot.org/results/9a2a7c6072876f2562609bf98f32a1ce93631a75</a><br>
&gt; <br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/libjxl/<a href=3D"http://libjxl.mk" rel=3D"noreferrer" t=
arget=3D"_blank">libjxl.mk</a> | 7 +++++++<br>
&gt;=C2=A0 1 file changed, 7 insertions(+)<br>
&gt; <br>
&gt; diff --git a/package/libjxl/<a href=3D"http://libjxl.mk" rel=3D"norefe=
rrer" target=3D"_blank">libjxl.mk</a> b/package/libjxl/<a href=3D"http://li=
bjxl.mk" rel=3D"noreferrer" target=3D"_blank">libjxl.mk</a><br>
&gt; index cc24ba258c..02a93ac5d9 100644<br>
&gt; --- a/package/libjxl/<a href=3D"http://libjxl.mk" rel=3D"noreferrer" t=
arget=3D"_blank">libjxl.mk</a><br>
&gt; +++ b/package/libjxl/<a href=3D"http://libjxl.mk" rel=3D"noreferrer" t=
arget=3D"_blank">libjxl.mk</a><br>
&gt; @@ -30,4 +30,11 @@ LIBJXL_CONF_OPTS =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-DJPEGXL_ENABLE_SJPEG=3DOFF \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-DJPEGXL_ENABLE_SKCMS=3DOFF<br>
&gt; <br>
&gt; +ifeq ($(BR2_PACKAGE_JPEG_TURBO),y)<br>
&gt; +LIBJXL_DEPENDENCIES +=3D jpeg-turbo<br>
&gt; +LIBJXL_CONF_OPTS +=3D -DJPEGXL_ENABLE_TOOLS=3DON<br>
&gt; +else<br>
&gt; +LIBJXL_CONF_OPTS +=3D -DJPEGXL_ENABLE_TOOLS=3DOFF<br>
<br>
Having JPEGXL_ENABLE_TOOLS=3DON without any libjpeg is a valid<br>
configuration for libjxl.<br>
<br>
Is it possible to disable the tools only if BR2_PACKAGE_LIBJPEG=3Dy?<br></b=
lockquote><div><br></div><div>Thanks for your review, I&#39;ll send a v2 wh=
ich will set CMAKE_DISABLE_FIND_PACKAGE_JPEG.</div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
The configuration with tools and without any libjpeg is the one<br>
used by the package runtime test.<br>
<br>
Running the test with command:<br>
<br>
=C2=A0 =C2=A0 =C2=A0support/testing/run-tests \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-d dl -o output_folder \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests.package.test_libjxl<br>
<br>
now fails with output:<br>
<br>
=C2=A0 =C2=A0 =C2=A0AssertionError: 127 !=3D 0 :<br>
=C2=A0 =C2=A0 =C2=A0Failed to run: cjxl /var/tmp/reference.ppm /var/tmp/enc=
oded.jxl<br>
=C2=A0 =C2=A0 =C2=A0output was:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0-sh: cjxl: not found<br>
<br>
&gt; +endif<br>
&gt; +<br>
&gt;=C2=A0 $(eval $(cmake-package))<br>
<br>
Best regards,<br>
<br>
Julien.<br></blockquote><div><br></div><div>Best Regards,</div><div><br></d=
iv><div>Fabrice <br></div></div></div>

--0000000000001b66f305f510298e--

--===============2684781062788970746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2684781062788970746==--
