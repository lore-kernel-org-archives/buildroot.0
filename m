Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F9DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 12:10:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4141461074
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 12:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4141461074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E65660761;
	Wed, 20 Oct 2021 12:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oi_zgb3XXge7; Wed, 20 Oct 2021 12:10:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16EA660784;
	Wed, 20 Oct 2021 12:10:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4ACAD1BF951
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 12:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39E624055F
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 12:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RtRxr1FtsMsS for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 12:10:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 352BC4055E
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 12:10:22 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id r4so18366176edi.5
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 05:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bE2DGYBnjxGN7KFvSkO0tEYKMNW5APnFjAxzLG3aBB0=;
 b=EZ5izRFXvlmFnGn6Ypp4Xjuv57K7ixHDU6TG+kG7S8KwxEL1FxM085bh9J8GL4g1fl
 6EIdrRDJS/xKKfn5AJi9P4V6AOcgxNTj4KIl+iK5nHtflBUDgaUvuXqeymemeTDhGpPe
 gXhIYIv8YVwWqL/k7mqSEj/z42b77ozaqVSCDkLAlG6GxOostmu0NeiHvhau7m4G/l3j
 pt3q56CqbIKC2mOYjXU28Dp57QYhvVpRP5SJGkUEYiQ0YARadnLlrgNoj3FDUIC549Ix
 iIYuKZRuWPKs5b8t/wfuqyf3Ma8EFAY1JZOoDFqRYbRHYd3JjoowdAxzAxM8HJL1yL5F
 rWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bE2DGYBnjxGN7KFvSkO0tEYKMNW5APnFjAxzLG3aBB0=;
 b=JL/XQ1mZu5jT2Z9VBedAo2B4AcgqjzoyFavia0po6CroQ0DzcCknWWgndt2wMCb9H4
 r1XBcdMieIcCfbCpChXHeYIxqvkBqn4FIkOT/+snBA0deqDTf3Hy6zJvKN3GZtcvFnM5
 Ptk6XLs+yJwrywKRk050yDL2ELqMfdlU3ZV0G8o/tcHh/EbD+Eh2+sckPfD9vKR5gsrJ
 npva4YUBZ5zerznF5udvV0KdFoBY+TzOzob8+Kbk7ueyihJmo4Dp17uAqCnCv8XZBXVP
 Ngo/xeAoG0S50wLPz5xtaqINLA5wjtQAGI1oS8rOdpBPTfDnpI+VJA7TgGIMLYwnlZHq
 azTQ==
X-Gm-Message-State: AOAM533BlcKraFfwnPNt12tYh5p2ORQF0kHYcGoJPVXP4PC6VebUvQ/N
 cSuUT7yPjSJrARhxyeiU9G0WUqZMwVFMjgfc9bvsd8/bhKgY8hu+y3SbhA==
X-Google-Smtp-Source: ABdhPJxz3DWaW6PmQ4QGaBkXX9BKumSJMuzjqIAVrRQuPzHvAla2EoyY5RbY7IPKY2Gmwbvq5xNZ57AYUOtRqeGKQMQ=
X-Received: by 2002:a17:906:3784:: with SMTP id
 n4mr45826316ejc.129.1634731818211; 
 Wed, 20 Oct 2021 05:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211008110345.1901311-1-jose.pekkarinen@unikie.com>
 <dc50460f-e7cb-8863-9319-4904742ca2c8@mind.be>
In-Reply-To: <dc50460f-e7cb-8863-9319-4904742ca2c8@mind.be>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Wed, 20 Oct 2021 15:10:07 +0300
Message-ID: <CAJPV9MopDAbp6FiYLOXTsQVjdDdCzb5=O0GmYx7zBcMq0Sz40g@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH] package/opensc: add package
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
Content-Type: multipart/mixed; boundary="===============3874288715480995500=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3874288715480995500==
Content-Type: multipart/alternative; boundary="00000000000053f61b05cec7a9bd"

--00000000000053f61b05cec7a9bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 17, 2021 at 7:18 PM Arnout Vandecappelle <arnout@mind.be> wrote=
:

>   Hi Jose=CC=81,
>
>   Same comments on this patch as what Gilles gave on the softhsm2 one.
>
> On 08/10/2021 13:03, Jos=C3=A9 Pekkarinen wrote:
> > The following patch will add a recipe to
> > install opensc in final images.
> >
> > Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
> > ---
> >   package/opensc/Config.in |  7 +++++++
> >   package/opensc/opensc.mk | 15 +++++++++++++++
>
>   You need to add it to package/Config.in, you need to add a hash file,
> and
> preferably also add yourself to DEVELOPERS for this package.
>
>   It's also convenient if you put the two packages together in a series,
> because
> the DEVELOPERS and package/Config.in are likely to cause conflicts.
>
> >   2 files changed, 22 insertions(+)
> >   create mode 100644 package/opensc/Config.in
> >   create mode 100644 package/opensc/opensc.mk
> >
> > diff --git a/package/opensc/Config.in b/package/opensc/Config.in
> > new file mode 100644
> > index 0000000000..abd26a9b08
> > --- /dev/null
> > +++ b/package/opensc/Config.in
> > @@ -0,0 +1,7 @@
> > +config BR2_PACKAGE_OPENSC
> > +     bool "opensc"
> > +     depends on BR2_PACKAGE_LIBOPENSSL && BR2_PACKAGE_PCSC_LITE
> > +     help
> > +             OpenSC provides a set of libraries and utilities to work
> with smart cards.
>
>   Indentation + wrapping. Please use utils/check-package to verify.
>
> > +
> > +             https://github.com/OpenSC/OpenSC.git
>
>   The URL shouldn't have a .git part. That said, a better location is
> https://github.com/OpenSC/OpenSC/wiki
>
>
> > diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
> > new file mode 100644
> > index 0000000000..7741dac2a5
> > --- /dev/null
> > +++ b/package/opensc/opensc.mk
> > @@ -0,0 +1,15 @@
> >
> +########################################################################=
########
> > +#
> > +# opensc
> > +#
> >
> +########################################################################=
########
> > +
> > +OPENSC_VERSION =3D 0.22.0
> > +OPENSC_SITE =3D $(call github,OpenSC,OpenSC,$(OPENSC_VERSION))
>
>   There's an uploaded tarball at
>
> https://github.com/OpenSC/OpenSC/releases/download/0.22.0/opensc-0.22.0.t=
ar.gz
>
> > +OPENSC_LICENSE =3D GPL-2
>
>   I haven't checked in detail, but it seems to be LGPL-2.1+
>
> > +OPENSC_LICENSE_FILES =3D LICENSE
>
>   This file doesn't even exist.
>
> > +OPENSC_DEPENDENCIES =3D openssl pcsc-lite
> > +OPENSC_AUTORECONF =3D YES
>
>   You need to add a comment why this is needed. It probably isn't with th=
e
> uploaded tarball.
>
> > +OPENSC_INSTALL_TARGET =3D YES
>
>   This is unnecessary (default). _INSTALL_STAGING, on the other hand, *is=
*
> necessary.
>
> > +
> > +$(eval $(autotools-package))
> >
>

Hi,

Thanks for the help and guidance, while reading the

v2 of the patch I find the following warning I don't quite understand,
and I don't find any relevant docs over the net, would you mind to
elaborate what could it mean the following warning from check-package:

$ ./utils/check-package package/opensc/*
package/opensc/opensc.mk:8: remove default value of _SOURCE variable (
http://nightly.buildroot.org/#generic-package-reference)
25 lines processed
1 warnings generated

while the package looks like this:

$ cat package/opensc/opensc.mk
###########################################################################=
#####

#
# opensc
#
###########################################################################=
#####


OPENSC_VERSION =3D 0.22.0
OPENSC_SOURCE =3D opensc-$(OPENSC_VERSION).tar.gz
OPENSC_SITE =3D
https://github.com/OpenSC/OpenSC/releases/download/$(OPENSC_VERSION)/
OPENSC_LICENSE =3D LGPL-2.1+
OPENSC_LICENSE_FILES =3D COPYING
OPENSC_DEPENDENCIES =3D openssl pcsc-lite
OPENSC_INSTALL_STAGING =3D YES

$(eval $(autotools-package))

Thanks!

Jos=C3=A9.

--00000000000053f61b05cec7a9bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 17, 2021 at 7:18 PM Arnou=
t Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 =
Hi Jose=CC=81,<br>
<br>
=C2=A0 Same comments on this patch as what Gilles gave on the softhsm2 one.=
<br>
<br>
On 08/10/2021 13:03, Jos=C3=A9 Pekkarinen wrote:<br>
&gt; The following patch will add a recipe to<br>
&gt; install opensc in final images.<br>
&gt; <br>
&gt; Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkari=
nen@unikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/opensc/Config.in |=C2=A0 7 +++++++<br>
&gt;=C2=A0 =C2=A0package/opensc/<a href=3D"http://opensc.mk" rel=3D"norefer=
rer" target=3D"_blank">opensc.mk</a> | 15 +++++++++++++++<br>
<br>
=C2=A0 You need to add it to package/Config.in, you need to add a hash file=
, and <br>
preferably also add yourself to DEVELOPERS for this package.<br>
<br>
=C2=A0 It&#39;s also convenient if you put the two packages together in a s=
eries, because <br>
the DEVELOPERS and package/Config.in are likely to cause conflicts.<br>
<br>
&gt;=C2=A0 =C2=A02 files changed, 22 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/opensc/Config.in<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/opensc/<a href=3D"http://opensc=
.mk" rel=3D"noreferrer" target=3D"_blank">opensc.mk</a><br>
&gt; <br>
&gt; diff --git a/package/opensc/Config.in b/package/opensc/Config.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..abd26a9b08<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/opensc/Config.in<br>
&gt; @@ -0,0 +1,7 @@<br>
&gt; +config BR2_PACKAGE_OPENSC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;opensc&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_LIBOPENSSL &amp;&amp; BR2_=
PACKAGE_PCSC_LITE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OpenSC provides a set=
 of libraries and utilities to work with smart cards.<br>
<br>
=C2=A0 Indentation + wrapping. Please use utils/check-package to verify.<br=
>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://gi=
thub.com/OpenSC/OpenSC.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/OpenSC/OpenSC.git</a><br>
<br>
=C2=A0 The URL shouldn&#39;t have a .git part. That said, a better location=
 is <br>
<a href=3D"https://github.com/OpenSC/OpenSC/wiki" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/OpenSC/OpenSC/wiki</a><br>
<br>
<br>
&gt; diff --git a/package/opensc/<a href=3D"http://opensc.mk" rel=3D"norefe=
rrer" target=3D"_blank">opensc.mk</a> b/package/opensc/<a href=3D"http://op=
ensc.mk" rel=3D"noreferrer" target=3D"_blank">opensc.mk</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..7741dac2a5<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/opensc/<a href=3D"http://opensc.mk" rel=3D"noreferrer" t=
arget=3D"_blank">opensc.mk</a><br>
&gt; @@ -0,0 +1,15 @@<br>
&gt; +#####################################################################=
###########<br>
&gt; +#<br>
&gt; +# opensc<br>
&gt; +#<br>
&gt; +#####################################################################=
###########<br>
&gt; +<br>
&gt; +OPENSC_VERSION =3D 0.22.0<br>
&gt; +OPENSC_SITE =3D $(call github,OpenSC,OpenSC,$(OPENSC_VERSION))<br>
<br>
=C2=A0 There&#39;s an uploaded tarball at<br>
<a href=3D"https://github.com/OpenSC/OpenSC/releases/download/0.22.0/opensc=
-0.22.0.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://github.com/Ope=
nSC/OpenSC/releases/download/0.22.0/opensc-0.22.0.tar.gz</a><br>
<br>
&gt; +OPENSC_LICENSE =3D GPL-2<br>
<br>
=C2=A0 I haven&#39;t checked in detail, but it seems to be LGPL-2.1+<br>
<br>
&gt; +OPENSC_LICENSE_FILES =3D LICENSE<br>
<br>
=C2=A0 This file doesn&#39;t even exist.<br>
<br>
&gt; +OPENSC_DEPENDENCIES =3D openssl pcsc-lite<br>
&gt; +OPENSC_AUTORECONF =3D YES<br>
<br>
=C2=A0 You need to add a comment why this is needed. It probably isn&#39;t =
with the <br>
uploaded tarball.<br>
<br>
&gt; +OPENSC_INSTALL_TARGET =3D YES<br>
<br>
=C2=A0 This is unnecessary (default). _INSTALL_STAGING, on the other hand, =
*is* <br>
necessary.<br>
<br>
&gt; +<br>
&gt; +$(eval $(autotools-package))<br>
&gt; <br>
</blockquote></div><div><br></div><blockquote style=3D"margin:0 0 0 40px;bo=
rder:none;padding:0px">Hi,<br><br>Thanks for the help and guidance, while r=
eading the<br></blockquote>v2 of the patch I find the following warning I d=
on&#39;t quite understand,<div>and I don&#39;t find any relevant docs over =
the net, would you mind to</div><div>elaborate what could it mean the follo=
wing warning from check-package:</div><div><br></div>$ ./utils/check-packag=
e package/opensc/*<br>package/opensc/<a href=3D"http://opensc.mk:8">opensc.=
mk:8</a>: remove default value of _SOURCE variable (<a href=3D"http://night=
ly.buildroot.org/#generic-package-reference">http://nightly.buildroot.org/#=
generic-package-reference</a>)<br>25 lines processed<br>1 warnings generate=
d<div><br></div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:=
0px"><div>while the package looks like this:</div><div><br></div></blockquo=
te><div><div><span style=3D"font-family:monospace"><span style=3D"color:rgb=
(0,0,0)">$ cat package/opensc/<a href=3D"http://opensc.mk">opensc.mk</a> =
=C2=A0</span><br>##########################################################=
######################
<br>#
<br># opensc
<br>#
<br>#######################################################################=
#########
<br>
<br>OPENSC_VERSION =3D 0.22.0
<br>OPENSC_SOURCE =3D opensc-$(OPENSC_VERSION).tar.gz
<br>OPENSC_SITE =3D <a href=3D"https://github.com/OpenSC/OpenSC/releases/do=
wnload/$(OPENSC_VERSION)/">https://github.com/OpenSC/OpenSC/releases/downlo=
ad/$(OPENSC_VERSION)/</a>
<br>OPENSC_LICENSE =3D LGPL-2.1+
<br>OPENSC_LICENSE_FILES =3D COPYING
<br>OPENSC_DEPENDENCIES =3D openssl pcsc-lite
<br>OPENSC_INSTALL_STAGING =3D YES
<br>
<br>$(eval $(autotools-package))</span></div><div><span style=3D"font-famil=
y:monospace"><br></span></div></div><blockquote style=3D"margin:0 0 0 40px;=
border:none;padding:0px"><div><div><span style=3D"font-family:monospace">Th=
anks!</span></div></div><div><span style=3D"font-family:monospace"><br></sp=
an></div></blockquote><div><div><div dir=3D"ltr" class=3D"gmail_signature">=
<div dir=3D"ltr"><blockquote style=3D"margin:0px 0px 0px 40px;border:none;p=
adding:0px">Jos=C3=A9.</blockquote></div></div></div></div></div>

--00000000000053f61b05cec7a9bd--

--===============3874288715480995500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3874288715480995500==--
