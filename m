Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C44C77B7A
	for <buildroot@archiver.kernel.org>; Mon, 29 May 2023 20:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B9BD83668;
	Mon, 29 May 2023 20:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B9BD83668
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVVBXGdb2bQp; Mon, 29 May 2023 20:39:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 306E2836E1;
	Mon, 29 May 2023 20:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 306E2836E1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D03C31BF32C
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 20:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A95EA836E1
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 20:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A95EA836E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eX66BhjAxVjS for <buildroot@lists.busybox.net>;
 Mon, 29 May 2023 20:39:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89FE583668
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89FE583668
 for <buildroot@buildroot.org>; Mon, 29 May 2023 20:39:45 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-19f22575d89so1380442fac.0
 for <buildroot@buildroot.org>; Mon, 29 May 2023 13:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685392784; x=1687984784;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wp7MKNo3jg4xDa1EO3cxP1rVcfaacoCznWIkospxlIY=;
 b=dHcpk5Djvs0M2YTACY3olGZBhtEjFodj+7lV4n6uvVm8LW5WV/ZcsWqITFOLJ9IFQ4
 9yVgIWse1vvmT+roLQYsHU4noFItwr/DKJWdeyC60xCY9Y2+nuGR52Dz13avQ1jxPD7F
 Nzt4MCrJs8mE/Hq1rqhWZbOHKf53hcs+VMG0uDNYo0ce5X5chhnDnsc2CIWsI1kAa8zh
 VnNC+yI/04AYVTMWo2XEF5aHCNrKoyyoLnZS0Z73isuInj4I6Z+DJUYxHHkWbaGDOPac
 jNtoEygiRmXIaEjlnPeHGsb6YsdY5gi9/N0+4BysqP0/4PCdvH6Xf2uTDADyYoyOZjLF
 Y9Bg==
X-Gm-Message-State: AC+VfDyZvJasrA2bIFr+2ucLlSpUt4x0oEKMrq/b1LsRgQY1dH2bdy17
 cUhJmCLuLnxUoO1gCViKGvGaAWOercHG1shi6vM=
X-Google-Smtp-Source: ACHHUZ45OA5WxkgzBKaB7GWySh2CIb9B4UAl1QvyoBaBrYIW/eIEWjlI5BK8edH/5tU+RDeewCrg2vEiwApVawnTfJ8=
X-Received: by 2002:a05:6870:3653:b0:18e:e0bc:829 with SMTP id
 v19-20020a056870365300b0018ee0bc0829mr5138681oak.17.1685392783956; Mon, 29
 May 2023 13:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230109042648.2342444-1-james.hilliard1@gmail.com>
 <e7edff90-429c-06fb-8127-263f62e53ede@smile.fr>
In-Reply-To: <e7edff90-429c-06fb-8127-263f62e53ede@smile.fr>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 29 May 2023 14:39:32 -0600
Message-ID: <CADvTj4o-0p0GLyp_LK_zciQACB9L5ZuTZyQU4My0ZcgwR0ym6w@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685392784; x=1687984784;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wp7MKNo3jg4xDa1EO3cxP1rVcfaacoCznWIkospxlIY=;
 b=i2Mksah8HVZcgzoo2xkfd1KcH5VjRmKroq7TQKkFHrUqebKFq96uhplIXKb4r4KuVq
 o6eVPAooq1gN2s/YDK7pdkzW8xFo3BBXhdBjjDX8sJNcj7gJtqgH/nrQL1b+56rZNUso
 1DSbDAOYKYAe5Peyl5HbrW1kDFYe6AzdOWRZKupBQHGlBr5LQooRba0Wkk/FfPKhmS/1
 ljJKUs1kVqdQEqrokNcvlWI86B3afF0ETl91lB8Nzdj4HFZhDgfBqaEOP5jfifNfFzDa
 KH5mgoSX6WFf0ASD2dGSwVtp0lCqdvtRqQ6a5Uy/QBoFnAYKPzMaF23N4aK+dcmGS6fy
 DlpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=i2Mksah8
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ipython: bump to version
 8.8.0
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5168420747676465508=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5168420747676465508==
Content-Type: multipart/alternative; boundary="00000000000031e27b05fcdb1694"

--00000000000031e27b05fcdb1694
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 3:44=E2=80=AFPM Romain Naour <romain.naour@smile.fr=
> wrote:

> Hello James,
>
> Le 09/01/2023 =C3=A0 05:26, James Hilliard a =C3=A9crit :
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/python-ipython/python-ipython.hash | 4 ++--
> >  package/python-ipython/python-ipython.mk   | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/package/python-ipython/python-ipython.hash
> b/package/python-ipython/python-ipython.hash
> > index aae34f6f9b..f11ad1e18c 100644
> > --- a/package/python-ipython/python-ipython.hash
> > +++ b/package/python-ipython/python-ipython.hash
> > @@ -1,6 +1,6 @@
> >  # md5, sha256 from https://pypi.org/pypi/ipython/json
> > -md5  3adf9fca317512e5b3516a9ac25b3442  ipython-8.7.0.tar.gz
> > -sha256
> 882899fe78d5417a0aa07f995db298fa28b58faeba2112d2e3a4c95fe14bb738
> ipython-8.7.0.tar.gz
> > +md5  a1ea9b6e43c5568e5031974eb3a6acb0  ipython-8.8.0.tar.gz
> > +sha256
> f3bf2c08505ad2c3f4ed5c46ae0331a8547d36bf4b21a451e8ae80c0791db95b
> ipython-8.8.0.tar.gz
> >  # Locally computed sha256 checksums
> >  sha256
> 341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17
> COPYING.rst
> >  sha256
> e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
> > diff --git a/package/python-ipython/python-ipython.mk
> b/package/python-ipython/python-ipython.mk
> > index 1af1081741..f5a114c2f3 100644
> > --- a/package/python-ipython/python-ipython.mk
> > +++ b/package/python-ipython/python-ipython.mk
> > @@ -4,9 +4,9 @@
> >  #
> >
> #########################################################################=
#######
> >
> > -PYTHON_IPYTHON_VERSION =3D 8.7.0
> > +PYTHON_IPYTHON_VERSION =3D 8.8.0
>
> The test TestIPythonPy3 fail [1] since it was updated to 8.6.0 release ju=
st
> after 2022.11.
>
>   ModuleNotFoundError: No module named 'stack_data'
>
> Indeed there is no such python3-stack-data in Buildroot.
> For example, Fedora packaging added python3-stack-data while updating to
> ipython
> 8.0.1.
>
> Can you have a look please?
>

Oh, must have missed that when updating ipython I see you already sent a
series fixing this:
https://lore.kernel.org/buildroot/20230528190111.2430580-5-romain.naour@gma=
il.com/


>
> [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819089
> [2]
>
> https://src.fedoraproject.org/rpms/ipython/c/f7c85fbf241a9dfcf28682f8c1ff=
e11f2d26e01a
>
> Best regards,
> Romain
>
>
> >  PYTHON_IPYTHON_SOURCE =3D ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
> > -PYTHON_IPYTHON_SITE =3D
> https://files.pythonhosted.org/packages/82/2b/026af47da09998404f51064d328=
f5f1f68c78829082d2945be489343fde6
> > +PYTHON_IPYTHON_SITE =3D
> https://files.pythonhosted.org/packages/f5/39/89664d8c3e4dfb0a73862cbbff8=
eb4028a1e3d4305da80ab0a493848ed9b
> >  PYTHON_IPYTHON_LICENSE =3D BSD-3-Clause
> >  PYTHON_IPYTHON_LICENSE_FILES =3D COPYING.rst LICENSE
> >  PYTHON_IPYTHON_CPE_ID_VENDOR =3D ipython
>
>

--00000000000031e27b05fcdb1694
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 25, 2023 at 3:44=E2=80=AF=
PM Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr">romain.naour@s=
mile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Hello James,<br>
<br>
Le 09/01/2023 =C3=A0 05:26, James Hilliard a =C3=A9crit=C2=A0:<br>
&gt; Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gm=
ail.com" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/python-ipython/python-ipython.hash | 4 ++--<br>
&gt;=C2=A0 package/python-ipython/<a href=3D"http://python-ipython.mk" rel=
=3D"noreferrer" target=3D"_blank">python-ipython.mk</a>=C2=A0 =C2=A0| 4 ++-=
-<br>
&gt;=C2=A0 2 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/python-ipython/python-ipython.hash b/package/pyth=
on-ipython/python-ipython.hash<br>
&gt; index aae34f6f9b..f11ad1e18c 100644<br>
&gt; --- a/package/python-ipython/python-ipython.hash<br>
&gt; +++ b/package/python-ipython/python-ipython.hash<br>
&gt; @@ -1,6 +1,6 @@<br>
&gt;=C2=A0 # md5, sha256 from <a href=3D"https://pypi.org/pypi/ipython/json=
" rel=3D"noreferrer" target=3D"_blank">https://pypi.org/pypi/ipython/json</=
a><br>
&gt; -md5=C2=A0 3adf9fca317512e5b3516a9ac25b3442=C2=A0 ipython-8.7.0.tar.gz=
<br>
&gt; -sha256=C2=A0 882899fe78d5417a0aa07f995db298fa28b58faeba2112d2e3a4c95f=
e14bb738=C2=A0 ipython-8.7.0.tar.gz<br>
&gt; +md5=C2=A0 a1ea9b6e43c5568e5031974eb3a6acb0=C2=A0 ipython-8.8.0.tar.gz=
<br>
&gt; +sha256=C2=A0 f3bf2c08505ad2c3f4ed5c46ae0331a8547d36bf4b21a451e8ae80c0=
791db95b=C2=A0 ipython-8.8.0.tar.gz<br>
&gt;=C2=A0 # Locally computed sha256 checksums<br>
&gt;=C2=A0 sha256=C2=A0 341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b=
30670f043df17=C2=A0 COPYING.rst<br>
&gt;=C2=A0 sha256=C2=A0 e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427=
c75c5e51268fb=C2=A0 LICENSE<br>
&gt; diff --git a/package/python-ipython/<a href=3D"http://python-ipython.m=
k" rel=3D"noreferrer" target=3D"_blank">python-ipython.mk</a> b/package/pyt=
hon-ipython/<a href=3D"http://python-ipython.mk" rel=3D"noreferrer" target=
=3D"_blank">python-ipython.mk</a><br>
&gt; index 1af1081741..f5a114c2f3 100644<br>
&gt; --- a/package/python-ipython/<a href=3D"http://python-ipython.mk" rel=
=3D"noreferrer" target=3D"_blank">python-ipython.mk</a><br>
&gt; +++ b/package/python-ipython/<a href=3D"http://python-ipython.mk" rel=
=3D"noreferrer" target=3D"_blank">python-ipython.mk</a><br>
&gt; @@ -4,9 +4,9 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ################################################################=
################<br>
&gt;=C2=A0 <br>
&gt; -PYTHON_IPYTHON_VERSION =3D 8.7.0<br>
&gt; +PYTHON_IPYTHON_VERSION =3D 8.8.0<br>
<br>
The test TestIPythonPy3 fail [1] since it was updated to 8.6.0 release just=
<br>
after 2022.11.<br>
<br>
=C2=A0 ModuleNotFoundError: No module named &#39;stack_data&#39;<br>
<br>
Indeed there is no such python3-stack-data in Buildroot.<br>
For example, Fedora packaging added python3-stack-data while updating to ip=
ython<br>
8.0.1.<br>
<br>
Can you have a look please?<br></blockquote><div><br></div><div>Oh, must ha=
ve missed that when updating ipython I see you already sent a series fixing=
 this:</div><div><a href=3D"https://lore.kernel.org/buildroot/2023052819011=
1.2430580-5-romain.naour@gmail.com/">https://lore.kernel.org/buildroot/2023=
0528190111.2430580-5-romain.naour@gmail.com/</a></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
[1] <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819089=
" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/buildroot.org/bui=
ldroot/-/jobs/4322819089</a><br>
[2]<br>
<a href=3D"https://src.fedoraproject.org/rpms/ipython/c/f7c85fbf241a9dfcf28=
682f8c1ffe11f2d26e01a" rel=3D"noreferrer" target=3D"_blank">https://src.fed=
oraproject.org/rpms/ipython/c/f7c85fbf241a9dfcf28682f8c1ffe11f2d26e01a</a><=
br>
<br>
Best regards,<br>
Romain<br>
<br>
<br>
&gt;=C2=A0 PYTHON_IPYTHON_SOURCE =3D ipython-$(PYTHON_IPYTHON_VERSION).tar.=
gz<br>
&gt; -PYTHON_IPYTHON_SITE =3D <a href=3D"https://files.pythonhosted.org/pac=
kages/82/2b/026af47da09998404f51064d328f5f1f68c78829082d2945be489343fde6" r=
el=3D"noreferrer" target=3D"_blank">https://files.pythonhosted.org/packages=
/82/2b/026af47da09998404f51064d328f5f1f68c78829082d2945be489343fde6</a><br>
&gt; +PYTHON_IPYTHON_SITE =3D <a href=3D"https://files.pythonhosted.org/pac=
kages/f5/39/89664d8c3e4dfb0a73862cbbff8eb4028a1e3d4305da80ab0a493848ed9b" r=
el=3D"noreferrer" target=3D"_blank">https://files.pythonhosted.org/packages=
/f5/39/89664d8c3e4dfb0a73862cbbff8eb4028a1e3d4305da80ab0a493848ed9b</a><br>
&gt;=C2=A0 PYTHON_IPYTHON_LICENSE =3D BSD-3-Clause<br>
&gt;=C2=A0 PYTHON_IPYTHON_LICENSE_FILES =3D COPYING.rst LICENSE<br>
&gt;=C2=A0 PYTHON_IPYTHON_CPE_ID_VENDOR =3D ipython<br>
<br>
</blockquote></div></div>

--00000000000031e27b05fcdb1694--

--===============5168420747676465508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5168420747676465508==--
