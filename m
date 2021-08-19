Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AECC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 12:13:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12593610A7
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 12:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12593610A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEDCF60B91;
	Thu, 19 Aug 2021 12:13:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_glcYtzwkRD; Thu, 19 Aug 2021 12:13:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60988606EF;
	Thu, 19 Aug 2021 12:13:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A4A8B1BF280
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 12:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92A7A400FD
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 12:13:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X-UnDm0JJ0HA for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 12:12:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D77E400F2
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 12:12:55 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id z1so7374543ioh.7
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 05:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uEKDTRT5QJir60rkKc3LlwjMpNm3xptSnrdsjNohCJ4=;
 b=gwvc0Z8ESt/MSWNrQsBK9P+BdMkqkdiy0Cd0+82TDkFkr6V9oylRn1Fuc55e7tpTQa
 CYJtHAugBCXg/hEvMV7zmlsRd5AADt9D0y2gCzBuG+9DZ8V4dUP+aOsqAmHaJjxSD92T
 sMHJkBm3WauN4Nz86mfS3sXU2B1eo5g6tBLiYSBY++7BIcQ9lIExhJJOMkLW3W/Bbj0P
 pymjl2RAARf0CrE7NRgfBcD9jLjZe/U01ucjFBHEYvhC5rjAdxyW2syCXbzWRsTIwrpv
 ww41peGrjxm78ThVQs69HbbQT6ziHE4kQTyrNj9oA1dM2cANgcmMGBzAvUCaKcKSVFhj
 ibmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uEKDTRT5QJir60rkKc3LlwjMpNm3xptSnrdsjNohCJ4=;
 b=hvM4ovqC2AVVs/J1VAMfggPNOqvprAk3/3ivuW3eZbEGPHL9aQdXsYamxgDbaINHIW
 me8p5E77NRGob5vZja9DsX4BFdNETiq6eCxq6zSpduwNBL3cfHMUNbL7gYSjZMZeUdqi
 8IjHmd/gmRvqyVUNg4Uq7WBen+BZzYCu2aC9EvOEmYOLuM0B8E4DjXrDxj5W7+VDiN6i
 Hsxq2N0AWHYwfDDtlsgxa6qipr/v4Jqqwrd3j607pLFu5Yrh2fLQxG/I5WKemItIX3bg
 und5lYnvlXAgBbBdd//iBEAgYKu9hgaNRUER1ZqPwlK6Em2zO/ZKXJkwoPmqpx7H+dC3
 Ngag==
X-Gm-Message-State: AOAM533Ois4Tc1UHN213SeJACfuwPt66lHyBphRSlrMkDB2Q+ck7JU3d
 BM/gztbmZ0KU+w+1XkGDQM1ecdxBUTZJU5VRvhLXzg==
X-Google-Smtp-Source: ABdhPJwAdqN/qu6aoNeChW6owfWgddknbosMpCS8Uz3jx2kcUotWAuVIjUKSv5VXxSsEXqiU1XFj2gRkyTHPV34Kz7I=
X-Received: by 2002:a05:6638:349e:: with SMTP id
 t30mr8410137jal.142.1629375174685; 
 Thu, 19 Aug 2021 05:12:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210818190345.2081421-1-illia.bitkov@mind.be>
 <20210819000511.401a2bc1@windsurf>
 <CA+vtFZP41G3kTPaCoQbPvqAMsy3nKvev0E6C1PokyeWGE=0mvg@mail.gmail.com>
In-Reply-To: <CA+vtFZP41G3kTPaCoQbPvqAMsy3nKvev0E6C1PokyeWGE=0mvg@mail.gmail.com>
From: Illia Bitkov <illia.bitkov@mind.be>
Date: Thu, 19 Aug 2021 14:12:43 +0200
Message-ID: <CA+vtFZOujJoJpugJ0z0e-pwrXZmiPVi0MxGBvtLXteigF3maFw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mono: force internal
 libatomic-ops for some arm variants
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7050317353738797385=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============7050317353738797385==
Content-Type: multipart/alternative; boundary="0000000000007e4bc305c9e878d1"

--0000000000007e4bc305c9e878d1
Content-Type: text/plain; charset="UTF-8"

Hello Thomas, All

On Thu, Aug 19, 2021 at 12:05 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Illia,
>
> On Wed, 18 Aug 2021 21:03:45 +0200
> Illia Bitkov <illia.bitkov@mind.be> wrote:
>
> > Fixes:
> >
> http://autobuild.buildroot.net/results/18b017dd5b9c1d8d6c91303ea4f1fdd3e1b086e0/
> >
> http://autobuild.buildroot.net/results/1d262e9ad5bf8bf437bc3f2a709d84acf854d298/
> > Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>
>

Thanks a lot, but this needs more explanation. Why is libatomic_ops not
> working for those platforms ?
>
>
Currently I don't have a clear answer. I've tested building external
libatomic-ops with configuration keys I've taken from the build of internal
one. I'll look into them more.
Also I think I'll try to downgrade lib to version used in mono(7.6.10 ->
7.4.2)
I suspect it currently doesn't build mono on the whole ARMv5 but I've
failed to test it.


> > ---
> >  package/mono/Config.in |  2 +-
> >  package/mono/mono.mk   | 10 ++++++++--
> >  2 files changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/mono/Config.in b/package/mono/Config.in
> > index 44b8cf8581..3f26bd4092 100644
> > --- a/package/mono/Config.in
> > +++ b/package/mono/Config.in
> > @@ -16,7 +16,7 @@ config BR2_PACKAGE_MONO
> >       depends on BR2_INSTALL_LIBSTDCPP
> >       depends on BR2_TOOLCHAIN_HAS_THREADS
> >       depends on !BR2_STATIC_LIBS
> > -     select BR2_PACKAGE_LIBATOMIC_OPS
> > +     select BR2_PACKAGE_LIBATOMIC_OPS if !BR2_xscale && !BR2_arm926t
> >       help
> >         An open source, cross-platform, implementation of C#
> >         and the CLR that is binary compatible with Microsoft.NET.
> > diff --git a/package/mono/mono.mk b/package/mono/mono.mk
> > index 27f7886224..e697ed7ea2 100644
> > --- a/package/mono/mono.mk
> > +++ b/package/mono/mono.mk
> > @@ -43,8 +43,14 @@ endif
> >
> >  MONO_DEPENDENCIES += \
> >       host-mono \
> > -     $(if $(BR2_PACKAGE_LIBUNWIND),libunwind) \
> > -     libatomic_ops
> > +     $(if $(BR2_PACKAGE_LIBUNWIND),libunwind)
> > +
> > +ifeq ($(BR2_xscale)$(BR2_arm926t),nn)
>
> This is wrong, options never have the value "n"
>
> Thanks, I'll fix it



> > +MONO_DEPENDENCIES += libatomic_ops
> > +else
> > +#force use of internal libatomic-ops
> > +MONO_CONF_OPTS += --with-libatomic-ops=no
> > +endif
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--0000000000007e4bc305c9e878d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Thomas, All<br></div><div><br></div><div class=
=3D"gmail_quote"><span class=3D"gmail-im"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Thu, Aug 19, 2021 at 12:05 AM Thomas Petazzoni &lt;<a href=3D"mailt=
o:thomas.petazzoni@bootlin.com" target=3D"_blank">thomas.petazzoni@bootlin.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Hello Illia,<br>
<br>
On Wed, 18 Aug 2021 21:03:45 +0200<br>
Illia Bitkov &lt;<a href=3D"mailto:illia.bitkov@mind.be" target=3D"_blank">=
illia.bitkov@mind.be</a>&gt; wrote:<br>
<br>
&gt; Fixes:<br>
&gt; <a href=3D"http://autobuild.buildroot.net/results/18b017dd5b9c1d8d6c91=
303ea4f1fdd3e1b086e0/" rel=3D"noreferrer" target=3D"_blank">http://autobuil=
d.buildroot.net/results/18b017dd5b9c1d8d6c91303ea4f1fdd3e1b086e0/</a><br>
&gt; <a href=3D"http://autobuild.buildroot.net/results/1d262e9ad5bf8bf437bc=
3f2a709d84acf854d298/" rel=3D"noreferrer" target=3D"_blank">http://autobuil=
d.buildroot.net/results/1d262e9ad5bf8bf437bc3f2a709d84acf854d298/</a><br>
&gt; Signed-off-by: Illia Bitkov &lt;<a href=3D"mailto:illia.bitkov@mind.be=
" target=3D"_blank">illia.bitkov@mind.be</a>&gt;<br>
=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks a lot, but this needs more explanation. Why is libatomic_ops not<br>
working for those platforms ?<br>=C2=A0 <br></blockquote></span><div>Curren=
tly
 I don&#39;t have a clear answer. I&#39;ve tested building external=20
libatomic-ops with configuration keys I&#39;ve taken from the build of=20
internal one. I&#39;ll look into them more.</div><div>Also I think I&#39;ll=
 try to downgrade lib to version used in mono(7.6.10 -&gt; 7.4.2)</div><div=
>I suspect it currently doesn&#39;t build mono on the whole ARMv5 but I&#39=
;ve failed to test it.<br></div><div><div class=3D"gmail-im"><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; ---<br>
&gt;=C2=A0 package/mono/Config.in |=C2=A0 2 +-<br>
&gt;=C2=A0 package/mono/<a href=3D"http://mono.mk" rel=3D"noreferrer" targe=
t=3D"_blank">mono.mk</a>=C2=A0 =C2=A0| 10 ++++++++--<br>
&gt;=C2=A0 2 files changed, 9 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/mono/Config.in b/package/mono/Config.in<br>
&gt; index 44b8cf8581..3f26bd4092 100644<br>
&gt; --- a/package/mono/Config.in<br>
&gt; +++ b/package/mono/Config.in<br>
&gt; @@ -16,7 +16,7 @@ config BR2_PACKAGE_MONO<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_STATIC_LIBS<br>
&gt; -=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBATOMIC_OPS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBATOMIC_OPS if !BR2_xscale &=
amp;&amp; !BR2_arm926t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0An open source, cross-platform, imple=
mentation of C#<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and the CLR that is binary compatible=
 with Microsoft.NET.<br>
&gt; diff --git a/package/mono/<a href=3D"http://mono.mk" rel=3D"noreferrer=
" target=3D"_blank">mono.mk</a> b/package/mono/<a href=3D"http://mono.mk" r=
el=3D"noreferrer" target=3D"_blank">mono.mk</a><br>
&gt; index 27f7886224..e697ed7ea2 100644<br>
&gt; --- a/package/mono/<a href=3D"http://mono.mk" rel=3D"noreferrer" targe=
t=3D"_blank">mono.mk</a><br>
&gt; +++ b/package/mono/<a href=3D"http://mono.mk" rel=3D"noreferrer" targe=
t=3D"_blank">mono.mk</a><br>
&gt; @@ -43,8 +43,14 @@ endif<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 MONO_DEPENDENCIES +=3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0host-mono \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(if $(BR2_PACKAGE_LIBUNWIND),libunwind) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0libatomic_ops<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(if $(BR2_PACKAGE_LIBUNWIND),libunwind)<br>
&gt; +<br>
&gt; +ifeq ($(BR2_xscale)$(BR2_arm926t),nn)<br>
<br>
This is wrong, options never have the value &quot;n&quot;<br>
<br></blockquote></div></div><div>Thanks, I&#39;ll fix it<div class=3D"gmai=
l-yj6qo gmail-ajU"><div id=3D"gmail-:uw" class=3D"gmail-ajR" role=3D"button=
" tabindex=3D"0" aria-label=3D"Hide expanded content" aria-expanded=3D"true=
"><img class=3D"gmail-ajT" src=3D"https://ssl.gstatic.com/ui/v1/icons/mail/=
images/cleardot.gif"></div></div><div class=3D"gmail-adL"><br></div></div><=
div class=3D"gmail-adL"><div class=3D"gmail-im"><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
&gt; +MONO_DEPENDENCIES +=3D libatomic_ops<br>
&gt; +else<br>
&gt; +#force use of internal libatomic-ops<br>
&gt; +MONO_CONF_OPTS +=3D --with-libatomic-ops=3Dno<br>
&gt; +endif<br>
<br>
Thanks,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a></blockquote></div></div></div></div>

--0000000000007e4bc305c9e878d1--

--===============7050317353738797385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============7050317353738797385==--
