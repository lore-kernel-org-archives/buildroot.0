Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624F9C433FE
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 08:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8E7940492;
	Sun,  2 Oct 2022 08:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8E7940492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2P34C8mSgbeD; Sun,  2 Oct 2022 08:38:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83408400D8;
	Sun,  2 Oct 2022 08:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83408400D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D2411BF371
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 08:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 181A682A8F
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 08:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 181A682A8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qz9jz5qBg2lE for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 08:38:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EF7982A72
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EF7982A72
 for <buildroot@busybox.net>; Sun,  2 Oct 2022 08:38:24 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id m15so10925067edb.13
 for <buildroot@busybox.net>; Sun, 02 Oct 2022 01:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=TYvjy+6hdMBFtwxr3ZR8YSuJJ/aWdW3D24wU3miHmY4=;
 b=nwaWlUe2ZYg1kizfuL1xekNCsbubEU2//u02+U/zhFQaw1OZ+XxgCtcPCx7vW+oK6S
 HSuTfYb49JiZ/vselmVp5BlpTEt7YjkCYR5bhcN0C1h1h+xABU2up9SrO/dnqedXjSj6
 jlAxWkJ8FJ8khzypm62fxmuhH2BL+cSXakJxewrUDSEhQ6jblj/uXdSEmG2dQ2te+xh2
 BuNfojUezsyP4U764fQqj7aQuZtFpjgzOt8vglyKZiTNzw1WiJej59f4UT33w9Q0Qkzy
 k/YGTV0pHm3PdoE9h087JUFtfgG/OwbDyHw1iQisuV7HuEBVmR9SV+khFk5rb/i+Snk5
 KNWw==
X-Gm-Message-State: ACrzQf2uChgpTRAT+zpcuP09T7IWWa8Jv/wA9qpU8o7PlD+1gfTRiUpm
 HbnJFnVKRln49nWjItchaAxZC56qysep5W5fOLk=
X-Google-Smtp-Source: AMsMyM5zZsIrTfkzeFwwT1Nvk9TUL7u/vyT2KsVePJFxsKYxIUCZDBo82uKuTzCSijyGLd5xYgYaOFaYO7x3VuFK+Ns=
X-Received: by 2002:a05:6402:3550:b0:451:473a:5ca3 with SMTP id
 f16-20020a056402355000b00451473a5ca3mr14390950edd.48.1664699902537; Sun, 02
 Oct 2022 01:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220928193437.13407-1-guillaume.bressaix@gmail.com>
 <20221001181938.GO30794@scaer>
In-Reply-To: <20221001181938.GO30794@scaer>
From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Sun, 2 Oct 2022 10:37:55 +0200
Message-ID: <CAJe0E3dLMdNC_zoNQRnepG5Vcqe8ou=ivWLxopZaLGUN8-Ky7w@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=TYvjy+6hdMBFtwxr3ZR8YSuJJ/aWdW3D24wU3miHmY4=;
 b=jg7kiAYOlfMIQ77wJtCC9h6zKo2uwNSiRR9CDf1q0FE+PWv5GoOClY3km3cuyW/GVQ
 LeIij+n0BLQgML+zqTee2Loz7JrwyWm+WJnLlkyR2LWC3wPgS8hlYzQd7r09AlmrU95i
 C8+BDSfwqcxcNHSjKojAVELT5Fd//2/Je8WcGy5RuAGh2/FFNo7MLeJ+OHyBXa+cZ5st
 qrsPHyFXsQHL1sSwnsUUbhI3aB6+359OTyiKX/2V7g9x9DB5ByTqP0M/dSKVyhnbLZho
 Vnl3rAbqJBUOLapS4Rscewj6jAoe1nUsnzfCSitySmNIRW7dFWGhDK+ZHcCVNqPgz7Ni
 82ZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jg7kiAYO
Subject: Re: [Buildroot] [RESEND v1 1/1] package/python-scipy: bump version
 to 1.9.1
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
Cc: buildroot@busybox.net
Content-Type: multipart/mixed; boundary="===============8566767719558249126=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8566767719558249126==
Content-Type: multipart/alternative; boundary="0000000000005933cc05ea092623"

--0000000000005933cc05ea092623
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Yann for the needed feedback.
I see most of my submissions as drafts that need one.
For instance, I hesitate a lot about what should remain in the commit log
or not.

Same thing applies to the -latomic flag, which I knew solved my use case,
but I could not find a package to find similar requirements.
Your input is always valued, thank you

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le sam. 1 oct. 2022 =C3=A0 20:19, Yann E. MORIN <yann.morin.1998@free.fr> a
=C3=A9crit :

> Guillaume, All,
>
> On 2022-09-28 21:34 +0200, Guillaume W. Bres spake thusly:
> > Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> > ---
>
> All that is below the triple-dash line will be dropped by git when we
> apply the patch. However, you provided interesting information in that
> post-commit-log message...
>
> > Scipy is expected to move to a meson build infrastructure
> > by the next release
> >
> > scipy-.tar.xz is no longer released.
>
> This should be part of the commit log proper, to explain why you
> switched to the .tar.gz archive.
>
> > For some reason, a new "Python.h" missing header
> > build time failure arised. I solve it with a -Ipython include.
>
> This should also be part of the commit log
>
> > Then test script failed, with linker/runtime missing symbols error,
> > all related to the linear algebra portion (which we do test).
> > Errors like "undefined reference to __atomic_compare_exchange 8"
> > regarding
> > "site-/scipy/optimize/_highs/_
> highs_wrapper.cpython-310-arm-linux-gnueabi.so"
> > to be specific. I solved it with a -latomic flag.
>
> I see you pass it via CFLAGS; that's not correct, it should be passed
> via LDFLAGS. If that doesnt work, it should be explained why.
>
> Also, we can't arbitrary link agains -latomic, because not all
> toolchains have it. See cairo.mk for how it should be conditionally
> used.
>
> Regards,
> Yann E. MORIN.
>
> > Once 1.9.2 is out, we know we already have my V3-1.9.1 patch
> > serie that builds "fine" with meson, it involved a minor tweak
> > (hopefuly solved by this time). The test script no longer did pass
> though,
> > this serie is not 100% ready to go
> > ---
> >  package/python-scipy/python-scipy.hash | 2 +-
> >  package/python-scipy/python-scipy.mk   | 7 +++++--
> >  2 files changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/python-scipy/python-scipy.hash
> b/package/python-scipy/python-scipy.hash
> > index 0274679c43..1ba239aabf 100644
> > --- a/package/python-scipy/python-scipy.hash
> > +++ b/package/python-scipy/python-scipy.hash
> > @@ -1,5 +1,5 @@
> >  # Locally generated
> > -sha256
> 0140dd24d14ce194fdb3df496c2190f0896ca84ac98bf5d69c3b3fb7bde1a1e9
> scipy-1.8.1.tar.xz
> > +sha256
> 26d28c468900e6d5fdb37d2812ab46db0ccd22c63baa095057871faa3a498bc9
> scipy-1.9.1.tar.gz
> >  sha256
> 96599f8ec69a2cc609265eed13fc75090aacb28742260e55ce623788a33da19c
> LICENSE.txt
> >  sha256
> 37e64a498894ac7c3b070023e3689e954a8ecf8a23b90968d09a455f1b4f7b35
> scipy/linalg/src/lapack_deprecations/LICENSE
> >  sha256
> 606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609
> scipy/ndimage/LICENSE.txt
> > diff --git a/package/python-scipy/python-scipy.mk
> b/package/python-scipy/python-scipy.mk
> > index a8c23c6c88..1619b9f40a 100644
> > --- a/package/python-scipy/python-scipy.mk
> > +++ b/package/python-scipy/python-scipy.mk
> > @@ -4,8 +4,8 @@
> >  #
> >
> #########################################################################=
#######
> >
> > -PYTHON_SCIPY_VERSION =3D 1.8.1
> > -PYTHON_SCIPY_SOURCE =3D scipy-$(PYTHON_SCIPY_VERSION).tar.xz
> > +PYTHON_SCIPY_VERSION =3D 1.9.1
> > +PYTHON_SCIPY_SOURCE =3D scipy-$(PYTHON_SCIPY_VERSION).tar.gz
> >  PYTHON_SCIPY_SITE =3D
> https://github.com/scipy/scipy/releases/download/v$(PYTHON_SCIPY_VERSION)
> >  PYTHON_SCIPY_LICENSE =3D \
> >       BSD-3-Clause, \
> > @@ -36,6 +36,8 @@ PYTHON_SCIPY_INSTALL_STAGING =3D YES
> >  PYTHON_SCIPY_SETUP_TYPE =3D setuptools
> >  PYTHON_SCIPY_BUILD_OPTS =3D config_fc --fcompiler=3Dgnu95
> >
> > +PYTHON_SCIPY_CFLAGS =3D \
> > +     -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
> >  PYTHON_SCIPY_LDFLAGS =3D $(TARGET_LDFLAGS) -shared \
> >       -L$(PYTHON3_PATH)/site-packages/numpy/core/lib
> >  # -lnpyrandom localization
> > @@ -44,6 +46,7 @@ PYTHON_SCIPY_LDFLAGS +=3D \
> >
> >  PYTHON_SCIPY_ENV =3D \
> >       F90=3D$(TARGET_FC) \
> > +     CFLAGS=3D"$(PYTHON_SCIPY_CFLAGS) -latomic" \
> >       LDFLAGS=3D"$(PYTHON_SCIPY_LDFLAGS)"
> >
> >  # Provide system configuration options to numpy distutils extensions,
> telling
> > --
> > 2.20.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
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

--0000000000005933cc05ea092623
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you Yann for the needed=C2=A0feedback.<br>I see most=
 of my submissions as drafts that need=C2=A0one.<br>For instance, I hesitat=
e a lot about what should remain in the commit log or not.<br><br>Same thin=
g applies to the -latomic flag,=C2=A0which I knew solved my use case, but I=
 could not find a package to find similar requirements.<br>Your input is al=
ways valued, thank you<br><br clear=3D"all"><div><div dir=3D"ltr" data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr=
"><div dir=3D"ltr"><div><div><div><font face=3D"arial,helvetica,sans-serif"=
>Guillaume W. Bres<br></font></div><font face=3D"arial,helvetica,sans-serif=
">Software engineer</font><br></div><font face=3D"arial,helvetica,sans-seri=
f"></font></div><font face=3D"arial,helvetica,sans-serif">&lt;<a href=3D"ma=
ilto:guillaume.bressaix@gmail.com" target=3D"_blank">guillaume.bressaix@gma=
il.com</a>&gt;<br></font></div></div></div></div></div></div><br></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sa=
m. 1 oct. 2022 =C3=A0=C2=A020:19, Yann E. MORIN &lt;<a href=3D"mailto:yann.=
morin.1998@free.fr" target=3D"_blank">yann.morin.1998@free.fr</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">G=
uillaume, All,<br>
<br>
On 2022-09-28 21:34 +0200, Guillaume W. Bres spake thusly:<br>
&gt; Signed-off-by: Guillaume W. Bres &lt;<a href=3D"mailto:guillaume.bress=
aix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
All that is below the triple-dash line will be dropped by git when we<br>
apply the patch. However, you provided interesting information in that<br>
post-commit-log message...<br>
<br>
&gt; Scipy is expected to move to a meson build infrastructure<br>
&gt; by the next release<br>
&gt; <br>
&gt; scipy-.tar.xz is no longer released.<br>
<br>
This should be part of the commit log proper, to explain why you<br>
switched to the .tar.gz archive.<br>
<br>
&gt; For some reason, a new &quot;Python.h&quot; missing header<br>
&gt; build time failure arised. I solve it with a -Ipython include.<br>
<br>
This should also be part of the commit log <br>
<br>
&gt; Then test script failed, with linker/runtime missing symbols error,<br=
>
&gt; all related to the linear algebra portion (which we do test).<br>
&gt; Errors like &quot;undefined reference to __atomic_compare_exchange 8&q=
uot;<br>
&gt; regarding<br>
&gt; &quot;site-/scipy/optimize/_highs/_<a href=3D"http://highs_wrapper.cpy=
thon-310-arm-linux-gnueabi.so" rel=3D"noreferrer" target=3D"_blank">highs_w=
rapper.cpython-310-arm-linux-gnueabi.so</a>&quot;<br>
&gt; to be specific. I solved it with a -latomic flag.<br>
<br>
I see you pass it via CFLAGS; that&#39;s not correct, it should be passed<b=
r>
via LDFLAGS. If that doesnt work, it should be explained why.<br>
<br>
Also, we can&#39;t arbitrary link agains -latomic, because not all<br>
toolchains have it. See <a href=3D"http://cairo.mk" rel=3D"noreferrer" targ=
et=3D"_blank">cairo.mk</a> for how it should be conditionally<br>
used.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; Once 1.9.2 is out, we know we already have my V3-1.9.1 patch<br>
&gt; serie that builds &quot;fine&quot; with meson, it involved a minor twe=
ak<br>
&gt; (hopefuly solved by this time). The test script no longer did pass tho=
ugh,<br>
&gt; this serie is not 100% ready to go<br>
&gt; ---<br>
&gt;=C2=A0 package/python-scipy/python-scipy.hash | 2 +-<br>
&gt;=C2=A0 package/python-scipy/<a href=3D"http://python-scipy.mk" rel=3D"n=
oreferrer" target=3D"_blank">python-scipy.mk</a>=C2=A0 =C2=A0| 7 +++++--<br=
>
&gt;=C2=A0 2 files changed, 6 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/python-scipy/python-scipy.hash b/package/python-s=
cipy/python-scipy.hash<br>
&gt; index 0274679c43..1ba239aabf 100644<br>
&gt; --- a/package/python-scipy/python-scipy.hash<br>
&gt; +++ b/package/python-scipy/python-scipy.hash<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 # Locally generated<br>
&gt; -sha256=C2=A0 0140dd24d14ce194fdb3df496c2190f0896ca84ac98bf5d69c3b3fb7=
bde1a1e9=C2=A0 scipy-1.8.1.tar.xz<br>
&gt; +sha256=C2=A0 26d28c468900e6d5fdb37d2812ab46db0ccd22c63baa095057871faa=
3a498bc9=C2=A0 scipy-1.9.1.tar.gz<br>
&gt;=C2=A0 sha256=C2=A0 96599f8ec69a2cc609265eed13fc75090aacb28742260e55ce6=
23788a33da19c=C2=A0 LICENSE.txt<br>
&gt;=C2=A0 sha256=C2=A0 37e64a498894ac7c3b070023e3689e954a8ecf8a23b90968d09=
a455f1b4f7b35=C2=A0 scipy/linalg/src/lapack_deprecations/LICENSE<br>
&gt;=C2=A0 sha256=C2=A0 606209a000716c5f66e33e180ce08434b96ed17db4975ab9723=
c6b5fbcc89609=C2=A0 scipy/ndimage/LICENSE.txt<br>
&gt; diff --git a/package/python-scipy/<a href=3D"http://python-scipy.mk" r=
el=3D"noreferrer" target=3D"_blank">python-scipy.mk</a> b/package/python-sc=
ipy/<a href=3D"http://python-scipy.mk" rel=3D"noreferrer" target=3D"_blank"=
>python-scipy.mk</a><br>
&gt; index a8c23c6c88..1619b9f40a 100644<br>
&gt; --- a/package/python-scipy/<a href=3D"http://python-scipy.mk" rel=3D"n=
oreferrer" target=3D"_blank">python-scipy.mk</a><br>
&gt; +++ b/package/python-scipy/<a href=3D"http://python-scipy.mk" rel=3D"n=
oreferrer" target=3D"_blank">python-scipy.mk</a><br>
&gt; @@ -4,8 +4,8 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ################################################################=
################<br>
&gt;=C2=A0 <br>
&gt; -PYTHON_SCIPY_VERSION =3D 1.8.1<br>
&gt; -PYTHON_SCIPY_SOURCE =3D scipy-$(PYTHON_SCIPY_VERSION).tar.xz<br>
&gt; +PYTHON_SCIPY_VERSION =3D 1.9.1<br>
&gt; +PYTHON_SCIPY_SOURCE =3D scipy-$(PYTHON_SCIPY_VERSION).tar.gz<br>
&gt;=C2=A0 PYTHON_SCIPY_SITE =3D <a href=3D"https://github.com/scipy/scipy/=
releases/download/v$(PYTHON_SCIPY_VERSION)" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/scipy/scipy/releases/download/v$(PYTHON_SCIPY_VERS=
ION)</a><br>
&gt;=C2=A0 PYTHON_SCIPY_LICENSE =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0BSD-3-Clause, \<br>
&gt; @@ -36,6 +36,8 @@ PYTHON_SCIPY_INSTALL_STAGING =3D YES<br>
&gt;=C2=A0 PYTHON_SCIPY_SETUP_TYPE =3D setuptools<br>
&gt;=C2=A0 PYTHON_SCIPY_BUILD_OPTS =3D config_fc --fcompiler=3Dgnu95<br>
&gt;=C2=A0 <br>
&gt; +PYTHON_SCIPY_CFLAGS =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERS=
ION_MAJOR)<br>
&gt;=C2=A0 PYTHON_SCIPY_LDFLAGS =3D $(TARGET_LDFLAGS) -shared \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-L$(PYTHON3_PATH)/site-packages/numpy/core/l=
ib<br>
&gt;=C2=A0 # -lnpyrandom localization<br>
&gt; @@ -44,6 +46,7 @@ PYTHON_SCIPY_LDFLAGS +=3D \<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PYTHON_SCIPY_ENV =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0F90=3D$(TARGET_FC) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;$(PYTHON_SCIPY_CFLAGS) -latomic&qu=
ot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0LDFLAGS=3D&quot;$(PYTHON_SCIPY_LDFLAGS)&quot=
;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Provide system configuration options to numpy distutils extens=
ions, telling<br>
&gt; -- <br>
&gt; 2.20.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
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
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div>

--0000000000005933cc05ea092623--

--===============8566767719558249126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8566767719558249126==--
