Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D80C433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 20:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A6EB408DB;
	Sun, 29 May 2022 20:18:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y-i1CiYCyQiR; Sun, 29 May 2022 20:18:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC14C40B08;
	Sun, 29 May 2022 20:18:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C1FB1BF3D7
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 20:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 079C841A0D
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 20:18:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VPUS7fOc6UCI for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 20:18:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54E3241A0B
 for <buildroot@buildroot.org>; Sun, 29 May 2022 20:18:06 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so11987186fac.9
 for <buildroot@buildroot.org>; Sun, 29 May 2022 13:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GOcQGseiAWWWjyKgJMuU8kpEQvbEUFr6bcyzJsgqyCg=;
 b=inZ0QzcDEtO5w65uAUp0vgaU8OYkJXrDEuY2tAahDc+plGYJ93anY07QBO/hX0jJeu
 9SkFq7EHZQ3ddzgQAKFmhCvVjOaZN22PORsio2oo95LvbfdhnWP2TEf5SxAB9QrJNvAj
 1RVJ2sB/zIjv2y18YLi1Qxtd48ty6sAoAl9eTSYa/AT4uLslfZ2eehIS+K2oAxJP553C
 vOzngUrrhJHiAh3B21ZY63S9tthx5UTML9oC8uwn0H54tEbMiMWKXEp7IlCA7KLU7+33
 TUhZO3iv1j9zJinhi4yzqdExsn/TdyCbvK3rKEaSfNRG8ScBY4BiH/uwiUEYizu1jmxO
 dimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GOcQGseiAWWWjyKgJMuU8kpEQvbEUFr6bcyzJsgqyCg=;
 b=AaT/kwg7YjvL8UcYSiDNeTT8BDDMqPBMgEYmw2lYoG7yRsryLFX/SRDBYPT6NF6+Kr
 NwRoRvv4N+l/421Cny4BflpTc15lKgcOv7wiAtRVFxkjWo/ebSLWFHtCMGygJ7PwRL2G
 kYtXjBbYujKf2YE733AaYOTRqOuVf79iUP1/JUuvJVYptOJFscUn+noK5FSn628UPnUG
 dlvaRcmcHM7PSV8cM2WCF9oumXNPVTkxFzNCsNaCAAAZnwmhizXAok5xlJ4rDryj4b4Y
 wzbifeI2ZdwvBkXUlARFR7HgAwEvyjC2Gt9qN8bCCCI+Qf4oLsmGMh3vnhPijsoRXojA
 LvIQ==
X-Gm-Message-State: AOAM530ib4NvyWMaDAsBAf/BEe8NmuTsjh8APUe1GR+ZC7XXXjcD5r4l
 BnYLBOtKkvcHt9OnwpkSpG1U+XwXLrJAePx9wMw=
X-Google-Smtp-Source: ABdhPJyojtwSRocL/hdmS4n/C0WjyBMsHOZQO70g5i3sAyp9+H05XCEBQAZVYYxyMgEYcj1GU0KVDbkEBnJ9STBEAQs=
X-Received: by 2002:a05:6870:3105:b0:f2:9615:ff8e with SMTP id
 v5-20020a056870310500b000f29615ff8emr8334158oaa.200.1653855485075; Sun, 29
 May 2022 13:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220517200923.1516695-1-james.hilliard1@gmail.com>
 <7585dcea-4e32-a582-e138-e7e225609398@gmail.com>
 <CADvTj4re+hCC9n=HRMsLQ+SaEPPH=XBkCG83mTp_U79rr9Nvyg@mail.gmail.com>
 <e3350a95-d9ca-8d7d-0f48-22c86289a3db@gmail.com>
In-Reply-To: <e3350a95-d9ca-8d7d-0f48-22c86289a3db@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 29 May 2022 14:17:52 -0600
Message-ID: <CADvTj4rWQx=g3MK6AoV7bbRS7ZOA4K7SMR2Qb+OhaOdX4y8odg@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask: bump to version
 2.1.2
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
Cc: Lionel Flandrin <lionel@svkt.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============0850491136460105848=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0850491136460105848==
Content-Type: multipart/alternative; boundary="000000000000b2a91305e02c3c63"

--000000000000b2a91305e02c3c63
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 29, 2022, 1:53 PM Romain Naour <romain.naour@gmail.com> wrote:

> Le 29/05/2022 =C3=A0 21:41, James Hilliard a =C3=A9crit :
> >
> >
> > On Sun, May 29, 2022, 1:29 PM Romain Naour <romain.naour@gmail.com
> > <mailto:romain.naour@gmail.com>> wrote:
> >
> >     Hello James,
> >
> >     Le 17/05/2022 =C3=A0 22:09, James Hilliard a =C3=A9crit :
> >     > License hash change due to license title syntax change:
> >     >
> >
> https://github.com/pallets/flask/commit/9e7d3a6b694b27f997266889ae463e06d=
d83a189
> >     <
> https://github.com/pallets/flask/commit/9e7d3a6b694b27f997266889ae463e06d=
d83a189
> >
> >
> >     This patch along with python-werkzeug version bump [1] fixes the
> >     tests.package.test_python_flask.TestPythonPy3Flask build issue in
> gitlab-ci [2].
> >
> >     This test fail since the python-jinja2 version bump 3.1.2 [3].
> >
> >     Do you know if bumping python-flash and python-werkzeug may
> introduce other
> >     runtime issue? Is any followup version bump required?
> >
> > I sent a few python package bumps that should fix it.
>
> Ok, but it's not explicitly stated if it's intended for master (upcoming
> 2022.05) or next branch.
> Can you list which patch must be merged in master?
>
I think all my python patches that were sent in the 17th:
https://patchwork.ozlabs.org/project/buildroot/list/?submitter=3D66301

>
> >
> >     Is reverting python-jinja2 safe?
> >
> > It's used by stuff other than flask so best to apply my patches bumping
> the
> > flask deps think.
>
> ok, I'm agree on the principle but as you noticed, any python package
> version
> bump may trigger a runtime issue in another python package.
>
> This should fixes two remaining gitlab-ci issues:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2491321292
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2491321291
>
> Best regards,
> Romain
>
>
> >
> >
> >     Tested-by: Romain Naour <romain.naour@gmail.com <mailto:
> romain.naour@gmail.com>>
> >
> >     [1]
> >
> http://patchwork.ozlabs.org/project/buildroot/patch/20220517201249.151835=
8-1-james.hilliard1@gmail.com/
> >     <
> http://patchwork.ozlabs.org/project/buildroot/patch/20220517201249.151835=
8-1-james.hilliard1@gmail.com/
> >
> >     [2] https://gitlab.com/buildroot.org/buildroot/-/jobs/2491321291
> >     <https://gitlab.com/buildroot.org/buildroot/-/jobs/2491321291>
> >     [3]
> http://lists.busybox.net/pipermail/buildroot/2022-May/642942.html
> >     <http://lists.busybox.net/pipermail/buildroot/2022-May/642942.html>
> >
> >     Best regards,
> >     Romain
> >
> >     >
> >     > Signed-off-by: James Hilliard <james.hilliard1@gmail.com
> >     <mailto:james.hilliard1@gmail.com>>
> >     > ---
> >     >  package/python-flask/python-flask.hash | 13 ++++++-------
> >     >  package/python-flask/python-flask.mk <http://python-flask.mk>
>  |  4 ++--
> >     >  2 files changed, 8 insertions(+), 9 deletions(-)
> >     >
> >     > diff --git a/package/python-flask/python-flask.hash
> >     b/package/python-flask/python-flask.hash
> >     > index c6ccd633f8..5f19a450a1 100644
> >     > --- a/package/python-flask/python-flask.hash
> >     > +++ b/package/python-flask/python-flask.hash
> >     > @@ -1,7 +1,6 @@
> >     > -# From
> >
> https://pypi.org/project/Flask/#copy-hash-modal-911ffb67-fe84-4e25-a1a9-f=
4c745a0a980
> >     <
> https://pypi.org/project/Flask/#copy-hash-modal-911ffb67-fe84-4e25-a1a9-f=
4c745a0a980
> >
> >     > -md5  0da4145d172993cd28a6c619630cc19c  Flask-1.1.2.tar.gz
> >     > -sha256
> >      4efa1ae2d7c9865af48986de8aeb8504bf32c7f3d6fdc9353d34b21f4b127060
> >     Flask-1.1.2.tar.gz
> >     > -
> >     > -# License files
> >     > -sha256
> >      489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea
> LICENSE.rst
> >     > -sha256
> >      0ef3ae025f4a398761079f0d687ff3d66f4fef3a32ac2607318e909c0cba9150
> >     docs/license.rst
> >     > +# md5, sha256 from https://pypi.org/pypi/flask/json
> >     <https://pypi.org/pypi/flask/json>
> >     > +md5  93f1832e5be704ef6ff2a4124579cd85  Flask-2.1.2.tar.gz
> >     > +sha256
> 315ded2ddf8a6281567edb27393010fe3406188bafbfe65a3339d5787d89e477
> >     Flask-2.1.2.tar.gz
> >     > +# Locally computed sha256 checksums
> >     > +sha256
> 489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea
> >     LICENSE.rst
> >     > +sha256
> 7535eac513edd12fb8e33f203c6a403549629e34b363418cdbd6c6ea5464515d
> >     docs/license.rst
> >     > diff --git a/package/python-flask/python-flask.mk <
> http://python-flask.mk>
> >     b/package/python-flask/python-flask.mk <http://python-flask.mk>
> >     > index 077aa600b8..b684aff480 100644
> >     > --- a/package/python-flask/python-flask.mk <http://python-flask.m=
k
> >
> >     > +++ b/package/python-flask/python-flask.mk <http://python-flask.m=
k
> >
> >     > @@ -4,9 +4,9 @@
> >     >  #
> >     >
> >
>  ########################################################################=
########
> >     >
> >     > -PYTHON_FLASK_VERSION =3D 1.1.2
> >     > +PYTHON_FLASK_VERSION =3D 2.1.2
> >     >  PYTHON_FLASK_SOURCE =3D Flask-$(PYTHON_FLASK_VERSION).tar.gz
> >     > -PYTHON_FLASK_SITE =3D
> >
> https://files.pythonhosted.org/packages/4e/0b/cb02268c90e67545a0e3a37ea1c=
a3d45de3aca43ceb7dbf1712fb5127d5d
> >     <
> https://files.pythonhosted.org/packages/4e/0b/cb02268c90e67545a0e3a37ea1c=
a3d45de3aca43ceb7dbf1712fb5127d5d
> >
> >     > +PYTHON_FLASK_SITE =3D
> >
> https://files.pythonhosted.org/packages/d3/3c/94f38d4db919a9326a706ad56f0=
5a7e6f0c8f7b7d93e2997cca54d3bc14b
> >     <
> https://files.pythonhosted.org/packages/d3/3c/94f38d4db919a9326a706ad56f0=
5a7e6f0c8f7b7d93e2997cca54d3bc14b
> >
> >     >  PYTHON_FLASK_SETUP_TYPE =3D setuptools
> >     >  PYTHON_FLASK_LICENSE =3D BSD-3-Clause
> >     >  PYTHON_FLASK_LICENSE_FILES =3D LICENSE.rst docs/license.rst
> >
>
>

--000000000000b2a91305e02c3c63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, May 29, 2022, 1:53 PM Romain Naour &lt;<a href=
=3D"mailto:romain.naour@gmail.com">romain.naour@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">Le 29/05/2022 =C3=A0 21:41, James Hil=
liard a =C3=A9crit=C2=A0:<br>
&gt; <br>
&gt; <br>
&gt; On Sun, May 29, 2022, 1:29 PM Romain Naour &lt;<a href=3D"mailto:romai=
n.naour@gmail.com" target=3D"_blank" rel=3D"noreferrer">romain.naour@gmail.=
com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:romain.naour@gmail.com" target=3D"_blank"=
 rel=3D"noreferrer">romain.naour@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hello James,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Le 17/05/2022 =C3=A0 22:09, James Hilliard a =C3=A9=
crit=C2=A0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; License hash change due to license title synta=
x change:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/pallets/flask/commit/=
9e7d3a6b694b27f997266889ae463e06dd83a189" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://github.com/pallets/flask/commit/9e7d3a6b694b27f99726=
6889ae463e06dd83a189</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/pallets/flask/com=
mit/9e7d3a6b694b27f997266889ae463e06dd83a189" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">https://github.com/pallets/flask/commit/9e7d3a6b694b27f9=
97266889ae463e06dd83a189</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This patch along with python-werkzeug version bump =
[1] fixes the<br>
&gt;=C2=A0 =C2=A0 =C2=A0tests.package.test_python_flask.TestPythonPy3Flask =
build issue in gitlab-ci [2].<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This test fail since the python-jinja2 version bump=
 3.1.2 [3].<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Do you know if bumping python-flash and python-werk=
zeug may introduce other<br>
&gt;=C2=A0 =C2=A0 =C2=A0runtime issue? Is any followup version bump require=
d?<br>
&gt; <br>
&gt; I sent a few python package bumps that should fix it.<br>
<br>
Ok, but it&#39;s not explicitly stated if it&#39;s intended for master (upc=
oming<br>
2022.05) or next branch.<br>
Can you list which patch must be merged in master?<br></blockquote></div></=
div><div dir=3D"auto">I think all my python patches that were sent in the 1=
7th:</div><div dir=3D"auto"><a href=3D"https://patchwork.ozlabs.org/project=
/buildroot/list/?submitter=3D66301">https://patchwork.ozlabs.org/project/bu=
ildroot/list/?submitter=3D66301</a><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Is reverting python-jinja2 safe?<br>
&gt; <br>
&gt; It&#39;s used by stuff other than flask so best to apply my patches bu=
mping the<br>
&gt; flask deps think.<br>
<br>
ok, I&#39;m agree on the principle but as you noticed, any python package v=
ersion<br>
bump may trigger a runtime issue in another python package.<br>
<br>
This should fixes two remaining gitlab-ci issues:<br>
<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/2491321292" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/buildroot.=
org/buildroot/-/jobs/2491321292</a><br>
<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/2491321291" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/buildroot.=
org/buildroot/-/jobs/2491321291</a><br>
<br>
Best regards,<br>
Romain<br>
<br>
<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Tested-by: Romain Naour &lt;<a href=3D"mailto:romai=
n.naour@gmail.com" target=3D"_blank" rel=3D"noreferrer">romain.naour@gmail.=
com</a> &lt;mailto:<a href=3D"mailto:romain.naour@gmail.com" target=3D"_bla=
nk" rel=3D"noreferrer">romain.naour@gmail.com</a>&gt;&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0[1]<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://patchwork.ozlabs.org/project/buil=
droot/patch/20220517201249.1518358-1-james.hilliard1@gmail.com/" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">http://patchwork.ozlabs.org/project/b=
uildroot/patch/20220517201249.1518358-1-james.hilliard1@gmail.com/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://patchwork.ozlabs.org/project/=
buildroot/patch/20220517201249.1518358-1-james.hilliard1@gmail.com/" rel=3D=
"noreferrer noreferrer" target=3D"_blank">http://patchwork.ozlabs.org/proje=
ct/buildroot/patch/20220517201249.1518358-1-james.hilliard1@gmail.com/</a>&=
gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0[2] <a href=3D"https://gitlab.com/buildroot.org/bui=
ldroot/-/jobs/2491321291" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://gitlab.com/buildroot.org/buildroot/-/jobs/2491321291</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.com/buildroot.org/bui=
ldroot/-/jobs/2491321291" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://gitlab.com/buildroot.org/buildroot/-/jobs/2491321291</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0[3] <a href=3D"http://lists.busybox.net/pipermail/b=
uildroot/2022-May/642942.html" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">http://lists.busybox.net/pipermail/buildroot/2022-May/642942.html</a><b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://lists.busybox.net/pipermail/b=
uildroot/2022-May/642942.html" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">http://lists.busybox.net/pipermail/buildroot/2022-May/642942.html</a>&g=
t;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Best regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Romain<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: James Hilliard &lt;<a href=3D"m=
ailto:james.hilliard1@gmail.com" target=3D"_blank" rel=3D"noreferrer">james=
.hilliard1@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:james.hilliard1@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">james.hilliard1@gmail.com</a>&gt;=
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 package/python-flask/python-flask.hash |=
 13 ++++++-------<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 package/python-flask/<a href=3D"http://p=
ython-flask.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">python-flas=
k.mk</a> &lt;<a href=3D"http://python-flask.mk" rel=3D"noreferrer noreferre=
r" target=3D"_blank">http://python-flask.mk</a>&gt;=C2=A0 =C2=A0|=C2=A0 4 +=
+--<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 2 files changed, 8 insertions(+), 9 dele=
tions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/package/python-flask/python-flask=
.hash<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/package/python-flask/python-flask.hash<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index c6ccd633f8..5f19a450a1 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/package/python-flask/python-flask.hash<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/package/python-flask/python-flask.hash<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -1,7 +1,6 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -# From<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://pypi.org/project/Flask/#copy-has=
h-modal-911ffb67-fe84-4e25-a1a9-f4c745a0a980" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">https://pypi.org/project/Flask/#copy-hash-modal-911ffb67=
-fe84-4e25-a1a9-f4c745a0a980</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://pypi.org/project/Flask/#copy=
-hash-modal-911ffb67-fe84-4e25-a1a9-f4c745a0a980" rel=3D"noreferrer norefer=
rer" target=3D"_blank">https://pypi.org/project/Flask/#copy-hash-modal-911f=
fb67-fe84-4e25-a1a9-f4c745a0a980</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -md5=C2=A0 0da4145d172993cd28a6c619630cc19c=C2=
=A0 Flask-1.1.2.tar.gz<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -sha256=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A04efa1ae2d7c9865af48986de8aeb8504bf32c7f3d6fdc=
9353d34b21f4b127060=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0Flask-1.1.2.tar.gz<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -# License files<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -sha256=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99=
a79c8448e7ff37d07ea=C2=A0 LICENSE.rst<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -sha256=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A00ef3ae025f4a398761079f0d687ff3d66f4fef3a32ac2=
607318e909c0cba9150=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0docs/license.rst<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# md5, sha256 from <a href=3D"https://pypi.or=
g/pypi/flask/json" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
pypi.org/pypi/flask/json</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://pypi.org/pypi/flask/json" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://pypi.org/pypi/flask/j=
son</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +md5=C2=A0 93f1832e5be704ef6ff2a4124579cd85=C2=
=A0 Flask-2.1.2.tar.gz<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +sha256=C2=A0 315ded2ddf8a6281567edb27393010fe=
3406188bafbfe65a3339d5787d89e477=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0Flask-2.1.2.tar.gz<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# Locally computed sha256 checksums<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +sha256=C2=A0 489a8e1108509ed98a37bb983e11e0f7=
e1d31f0bd8f99a79c8448e7ff37d07ea=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0LICENSE.rst<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +sha256=C2=A0 7535eac513edd12fb8e33f203c6a4035=
49629e34b363418cdbd6c6ea5464515d=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0docs/license.rst<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/package/python-flask/<a href=3D"h=
ttp://python-flask.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">pyth=
on-flask.mk</a> &lt;<a href=3D"http://python-flask.mk" rel=3D"noreferrer no=
referrer" target=3D"_blank">http://python-flask.mk</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/package/python-flask/<a href=3D"http://python-fla=
sk.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">python-flask.mk</a> =
&lt;<a href=3D"http://python-flask.mk" rel=3D"noreferrer noreferrer" target=
=3D"_blank">http://python-flask.mk</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 077aa600b8..b684aff480 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/package/python-flask/<a href=3D"http://p=
ython-flask.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">python-flas=
k.mk</a> &lt;<a href=3D"http://python-flask.mk" rel=3D"noreferrer noreferre=
r" target=3D"_blank">http://python-flask.mk</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/package/python-flask/<a href=3D"http://p=
ython-flask.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">python-flas=
k.mk</a> &lt;<a href=3D"http://python-flask.mk" rel=3D"noreferrer noreferre=
r" target=3D"_blank">http://python-flask.mk</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -4,9 +4,9 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 #<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0###################################################=
#############################<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -PYTHON_FLASK_VERSION =3D 1.1.2<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +PYTHON_FLASK_VERSION =3D 2.1.2<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 PYTHON_FLASK_SOURCE =3D Flask-$(PYTHON_F=
LASK_VERSION).tar.gz<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -PYTHON_FLASK_SITE =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://files.pythonhosted.org/packages/=
4e/0b/cb02268c90e67545a0e3a37ea1ca3d45de3aca43ceb7dbf1712fb5127d5d" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://files.pythonhosted.org/pac=
kages/4e/0b/cb02268c90e67545a0e3a37ea1ca3d45de3aca43ceb7dbf1712fb5127d5d</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://files.pythonhosted.org/packa=
ges/4e/0b/cb02268c90e67545a0e3a37ea1ca3d45de3aca43ceb7dbf1712fb5127d5d" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://files.pythonhosted.org=
/packages/4e/0b/cb02268c90e67545a0e3a37ea1ca3d45de3aca43ceb7dbf1712fb5127d5=
d</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +PYTHON_FLASK_SITE =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://files.pythonhosted.org/packages/=
d3/3c/94f38d4db919a9326a706ad56f05a7e6f0c8f7b7d93e2997cca54d3bc14b" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://files.pythonhosted.org/pac=
kages/d3/3c/94f38d4db919a9326a706ad56f05a7e6f0c8f7b7d93e2997cca54d3bc14b</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://files.pythonhosted.org/packa=
ges/d3/3c/94f38d4db919a9326a706ad56f05a7e6f0c8f7b7d93e2997cca54d3bc14b" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://files.pythonhosted.org=
/packages/d3/3c/94f38d4db919a9326a706ad56f05a7e6f0c8f7b7d93e2997cca54d3bc14=
b</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 PYTHON_FLASK_SETUP_TYPE =3D setuptools<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 PYTHON_FLASK_LICENSE =3D BSD-3-Clause<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 PYTHON_FLASK_LICENSE_FILES =3D LICENSE.r=
st docs/license.rst<br>
&gt; <br>
<br>
</blockquote></div></div></div>

--000000000000b2a91305e02c3c63--

--===============0850491136460105848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0850491136460105848==--
