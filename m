Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067CBC433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 07:22:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A79C604E9
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 07:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A79C604E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D41E40535;
	Fri, 15 Oct 2021 07:22:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FRqfJrirKjsf; Fri, 15 Oct 2021 07:22:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 924CC4052F;
	Fri, 15 Oct 2021 07:22:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E463E1BF381
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 07:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC938401AF
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 07:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6WRmrWnh8vwf for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 07:22:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8368440012
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 07:22:22 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id s3so6261821ild.0
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 00:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DFuZ2SCbiWIc5CxOYysVFB++Ht7Ad7NrROz8un2zEPU=;
 b=N9kxkir+23h7EWm9Wuav7eMYtXQclPuN6Zy631BvSg2EZQexkOe3O/P4KgXd53HtbW
 cnUeEIbDWJWy+6jPqg8HlryG8lsp0A5jDlIAOwTKTH9CkSRqFnjJLBvStSYUnna/JRM9
 J8Wj5eQZNLY8nJPWt+PtEuJhoxONWvnwBVnPBLicmFHbl+iVISd9mBkX0XPA7al5Bwq7
 Bfg383dKknDYcATzTKMffrd6rU9nU46RFOzuXNHGOQNJ5RBiYv7XsGK4h0LUMrpZA7Dl
 B3Dvi9S+aM9ldMWX7haYg/ONsIJqW+f3UgMuF34XQAa+L9v1jYIGx0JAQCRWGGZXOF5d
 Doaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DFuZ2SCbiWIc5CxOYysVFB++Ht7Ad7NrROz8un2zEPU=;
 b=vXTaEO+BP0bcxzP4c4zdQqpZTBbUfOqo+KF3Gc8eQiYH43y2OUeaBOJ5MZdSVz6G8o
 TndZwMAqtdS/XvK0FOpui9jbLtVxV+93Qk0/Q1Wil5s2HXy8E/a4WZi8eeBLquVg2UZ+
 i1idaVfQwE0NqIkDUEcV/M3ELnuM6Td+Kpuy5BW41umgtP7NEjd4YoIGfIgL9182g6hd
 UP9NvRtA9myhaa/moOOhgQRI0VQOMu8NxMCaOjTJVTy7YggxwJSkLJF8LCp71+Lq08e5
 K6qZsRIucg73AGqJvIZ82FsalmqjCV5YLT1OSzx4XOqplT3glImT6ilHKXwKFhCw1qII
 YnLg==
X-Gm-Message-State: AOAM531Plnt3/iHb+m94bIZbyC+657C8fYwWWO7sEOPdUSCLzE5pf2Q9
 hiqwr7v2JJQGDrJlIlpMsm5tDHZVgadaOPQ7908=
X-Google-Smtp-Source: ABdhPJxpTI+18V1PlYVcpYeKSfCkMDsvHKmmYwWpYyP/PHZaSwR1bvfGcS+4BWpQfJVprCyAx3DDaiVDyEM2jg9vye0=
X-Received: by 2002:a92:6c0c:: with SMTP id h12mr2720315ilc.32.1634282541540; 
 Fri, 15 Oct 2021 00:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211014213025.66942-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20211014213025.66942-1-fontaine.fabrice@gmail.com>
From: Chris Packham <judge.packham@gmail.com>
Date: Fri, 15 Oct 2021 20:22:13 +1300
Message-ID: <CAFOYHZBqBW_zGnUkpYyS+WzvZrFSvN=DfFwEhN6PhadS2oqSQA@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/micropython: depends on
 host-python3
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============2720240110064739868=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2720240110064739868==
Content-Type: multipart/alternative; boundary="00000000000059e87505ce5f0ed3"

--00000000000059e87505ce5f0ed3
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Oct 2021, 10:32 AM Fabrice Fontaine, <fontaine.fabrice@gmail.com>
wrote:

> Replace BR2_PYTHON3_HOST_DEPENDENCY by host-python3 to avoid the
> following build failure raised since bump to version 1.17 in commit
> 32b2a03745785afeb496979aa3c0f654bc6063ce:
>
> Traceback (most recent call last):
>   File "../py/makeversionhdr.py", line 117, in <module>
>     make_version_header(sys.argv[1])
>   File "../py/makeversionhdr.py", line 79, in make_version_header
>     info = get_version_info_from_docs_conf()
>   File "../py/makeversionhdr.py", line 67, in
> get_version_info_from_docs_conf
>     for line in f:
>   File "/usr/lib/python3.5/encodings/ascii.py", line 26, in decode
>     return codecs.ascii_decode(input, self.errors)[0]
> UnicodeDecodeError: 'ascii' codec can't decode byte 0xc2 in position 2154:
> ordinal not in range(128)
>
> Indeed, this build failure is not reproduced by host-python3 (in version
> 3.9.7) so it is probably an issue with python 3.5 (which is 6-years old).
>
> Fixes:
>  -
> http://autobuild.buildroot.org/results/96f7b81f5d14715b0b6673a8016a31e9e1552d0b
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>

Thanks, I'd seen the failures but been unable to reproduce them. I figured
it was something to do with the python installation on the builders but
hadn't been able to dig into it.

It's a pity we're now forcing the building of python but I can't think of a
better alternative.

Reviewed-by: Chris Packham <judge.packham@gmail.com>

---
>  package/micropython/micropython.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/micropython/micropython.mk b/package/micropython/
> micropython.mk
> index 3d69e152e5..c49ca23449 100644
> --- a/package/micropython/micropython.mk
> +++ b/package/micropython/micropython.mk
> @@ -11,7 +11,7 @@ MICROPYTHON_SITE = $(call
> github,micropython,micropython,v$(MICROPYTHON_VERSION)
>  # and most of the copied code is not used in the unix build.
>  MICROPYTHON_LICENSE = MIT, BSD-1-clause, BSD-3-clause, Zlib
>  MICROPYTHON_LICENSE_FILES = LICENSE
> -MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
> $(BR2_PYTHON3_HOST_DEPENDENCY)
> +MICROPYTHON_DEPENDENCIES = host-pkgconf libffi host-python3
>
>  # Set GIT_DIR so package won't use buildroot's version number
>  MICROPYTHON_MAKE_ENV = \
> --
> 2.33.0
>
>

--00000000000059e87505ce5f0ed3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 15 Oct 2021, 10:32 AM Fabrice Fontaine, &lt;<a=
 href=3D"mailto:fontaine.fabrice@gmail.com">fontaine.fabrice@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">Replace BR2_PYTHON3_HOST=
_DEPENDENCY by host-python3 to avoid the<br>
following build failure raised since bump to version 1.17 in commit<br>
32b2a03745785afeb496979aa3c0f654bc6063ce:<br>
<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;../py/makeversionhdr.py&quot;, line 117, in &lt;module&gt=
;<br>
=C2=A0 =C2=A0 make_version_header(sys.argv[1])<br>
=C2=A0 File &quot;../py/makeversionhdr.py&quot;, line 79, in make_version_h=
eader<br>
=C2=A0 =C2=A0 info =3D get_version_info_from_docs_conf()<br>
=C2=A0 File &quot;../py/makeversionhdr.py&quot;, line 67, in get_version_in=
fo_from_docs_conf<br>
=C2=A0 =C2=A0 for line in f:<br>
=C2=A0 File &quot;/usr/lib/python3.5/encodings/ascii.py&quot;, line 26, in =
decode<br>
=C2=A0 =C2=A0 return codecs.ascii_decode(input, self.errors)[0]<br>
UnicodeDecodeError: &#39;ascii&#39; codec can&#39;t decode byte 0xc2 in pos=
ition 2154: ordinal not in range(128)<br>
<br>
Indeed, this build failure is not reproduced by host-python3 (in version<br=
>
3.9.7) so it is probably an issue with python 3.5 (which is 6-years old).<b=
r>
<br>
Fixes:<br>
=C2=A0- <a href=3D"http://autobuild.buildroot.org/results/96f7b81f5d14715b0=
b6673a8016a31e9e1552d0b" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tp://autobuild.buildroot.org/results/96f7b81f5d14715b0b6673a8016a31e9e1552d=
0b</a><br>
<br>
Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">fontaine.fabrice@gmail.com</a>&=
gt;<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Thanks, I&#39;d seen the failures but been unable to reproduce them. I f=
igured it was something to do with the python installation on the builders =
but hadn&#39;t been able to dig into it.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">It&#39;s a pity we&#39;re now forcing the building of pyth=
on but I can&#39;t think of a better alternative.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Reviewed-by: Chris Packham &lt;<a href=3D"mailto:=
judge.packham@gmail.com">judge.packham@gmail.com</a>&gt;</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
---<br>
=C2=A0package/micropython/<a href=3D"http://micropython.mk" rel=3D"noreferr=
er noreferrer" target=3D"_blank">micropython.mk</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/package/micropython/<a href=3D"http://micropython.mk" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">micropython.mk</a> b/package/microp=
ython/<a href=3D"http://micropython.mk" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">micropython.mk</a><br>
index 3d69e152e5..c49ca23449 100644<br>
--- a/package/micropython/<a href=3D"http://micropython.mk" rel=3D"noreferr=
er noreferrer" target=3D"_blank">micropython.mk</a><br>
+++ b/package/micropython/<a href=3D"http://micropython.mk" rel=3D"noreferr=
er noreferrer" target=3D"_blank">micropython.mk</a><br>
@@ -11,7 +11,7 @@ MICROPYTHON_SITE =3D $(call github,micropython,micropytho=
n,v$(MICROPYTHON_VERSION)<br>
=C2=A0# and most of the copied code is not used in the unix build.<br>
=C2=A0MICROPYTHON_LICENSE =3D MIT, BSD-1-clause, BSD-3-clause, Zlib<br>
=C2=A0MICROPYTHON_LICENSE_FILES =3D LICENSE<br>
-MICROPYTHON_DEPENDENCIES =3D host-pkgconf libffi $(BR2_PYTHON3_HOST_DEPEND=
ENCY)<br>
+MICROPYTHON_DEPENDENCIES =3D host-pkgconf libffi host-python3<br>
<br>
=C2=A0# Set GIT_DIR so package won&#39;t use buildroot&#39;s version number=
<br>
=C2=A0MICROPYTHON_MAKE_ENV =3D \<br>
-- <br>
2.33.0<br>
<br>
</blockquote></div></div></div>

--00000000000059e87505ce5f0ed3--

--===============2720240110064739868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2720240110064739868==--
