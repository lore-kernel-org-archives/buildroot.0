Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9239EC433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Apr 2022 23:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 174FD41A6B;
	Fri, 15 Apr 2022 23:37:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YH41Ta_291Sd; Fri, 15 Apr 2022 23:37:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AEB241A69;
	Fri, 15 Apr 2022 23:37:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A72F31BF5F8
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 23:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3AC08403B
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 23:37:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zt0_2GnMR2Np for <buildroot@lists.busybox.net>;
 Fri, 15 Apr 2022 23:37:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F1AC8403A
 for <buildroot@buildroot.org>; Fri, 15 Apr 2022 23:37:21 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2ef4a241cc5so88541787b3.2
 for <buildroot@buildroot.org>; Fri, 15 Apr 2022 16:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SbCVQ3WBtcEZaLzJkr/NGLupbCSMDdkszr4ct+X99b0=;
 b=i2j8CW4W7afejIOTtXvcqU+/PQiQfuY6woc/Fx/16pl+ozZtXUQ5b4nZBheUba8RTK
 oR/6IoN7F6ZRTcDb0Wv68y/rsFdilGH27FF89ZkDP+oWpDxuOCEqJF+sZ+cJO/we0abu
 FsKLzUxF+I5STia7CXbB2b7w1zvEU4mibx43QDQE0OFhu0coGWH42n4Rt4+oSkDQRGY1
 rQZYnQWLI0gtNAdcECzgUaNonhWP+FJwFC70+hNvFLUXl3BB7dN6b4TgPLlLtaZju91R
 vIDx2pDcbkwNx0zOYKryBKzqknT3eKSPxRIloHDCxck8el3RR/+7O6Y/um8PLRXuricD
 liEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SbCVQ3WBtcEZaLzJkr/NGLupbCSMDdkszr4ct+X99b0=;
 b=3NCIMsec4R4LyfqPxb/5FTnK/u3D9ivqF7fUZZVsXNdbOlGGzbsKrdWFQLnbhxXoNr
 +ZI9KxLG2UMaUjR6B1jCjXRMgP6vSeYx7XCScIyx/XlWejN+c6kRdUZf4OX02kLF2Y8o
 ES+yxC4z02naKYBE8NgQiB76NA30XF9rbDZh/7r+DHN9V1Uy1TTnR3g+uIrentcDASP8
 RUlMjnyc8YGo/FpGOFJc5RNlA2mwr+NmNE8c/snM8lIfd74A5YaFK05H+6FQiHoGwAx9
 Fhe5OUPpREgJpcW5KHALUUJarT+g/8QiHPN+jT/+t2TFc6FLtQIleAD8csnaKMMu+Yye
 PHPg==
X-Gm-Message-State: AOAM532czzoP5m3TyKkQnutC8ZmSb/Uy9gMbWNdyUzrmPJuc7pJo/714
 7UMBr7eYz4f28yLxsBuMuerAT9G64ZPVcnS41XpIZPfR
X-Google-Smtp-Source: ABdhPJxtT0mU/GgZchHUGOYnfn3vd0eMKD+vwy1qQKl/1TpW4HumATllce1WyaivXRwE3eK0NUhq2WEMrtLR0W7ILSg=
X-Received: by 2002:a81:7d43:0:b0:2ec:82a:a747 with SMTP id
 y64-20020a817d43000000b002ec082aa747mr1146842ywc.357.1650065840638; Fri, 15
 Apr 2022 16:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220404193733.0096182980@busybox.osuosl.org>
In-Reply-To: <20220404193733.0096182980@busybox.osuosl.org>
From: Emile Cormier <emile.cormier.jr@gmail.com>
Date: Fri, 15 Apr 2022 20:37:09 -0300
Message-ID: <CAM70yxC66V8wbjeXsz07pbV8DiB4xhN+vgQaAf_R-Dfvpe735Q@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [git commit] package/python-snappy: bump version to
 0.6.1
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
Content-Type: multipart/mixed; boundary="===============6128466002918468034=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6128466002918468034==
Content-Type: multipart/alternative; boundary="000000000000498dd705dcb9e4f4"

--000000000000498dd705dcb9e4f4
Content-Type: text/plain; charset="UTF-8"

Just a heads-up that I'm dropping Crossbar in our project in favor of a C++
based solution that doesn't require the heavyweight Python dependency.

I'm going to unsubscribe from the buildroot mailing list due to the high
traffic volume. Please remember to CC me directly if you decide to proceed
with the remaining patches in this set.

On Mon, Apr 4, 2022 at 4:48 PM Arnout Vandecappelle <arnout@mind.be> wrote:

> commit:
> https://git.buildroot.net/buildroot/commit/?id=968450adfdf1042ddcd8a0ab157dd9747ec6ee8b
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Required by python-crossbar and python-autobahn[compress].
>
> Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/python-snappy/python-snappy.hash | 6 +++---
>  package/python-snappy/python-snappy.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/package/python-snappy/python-snappy.hash
> b/package/python-snappy/python-snappy.hash
> index 1e0f96054f..c4dbc72077 100644
> --- a/package/python-snappy/python-snappy.hash
> +++ b/package/python-snappy/python-snappy.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/python-snappy/json
> -md5    82e09ffd44204096fc70d6de14d0ea2f  python-snappy-0.5.4.tar.gz
> -sha256 d9c26532cfa510f45e8d135cde140e8a5603d3fb254cfec273ebc0ecf9f668e2
> python-snappy-0.5.4.tar.gz
> +md5  fc84cfa3526fba06d66f0d0b2e764300  python-snappy-0.6.1.tar.gz
> +sha256  b6a107ab06206acc5359d4c5632bd9b22d448702a79b3169b0c62e0fb808bb2a
> python-snappy-0.6.1.tar.gz
>  # Locally computed sha256 checksums
> -sha256 d007cb05f143d99d16d5cd0d1bf291daf037adb36800344e440ec26edb938f9a
> LICENSE
> +sha256  d007cb05f143d99d16d5cd0d1bf291daf037adb36800344e440ec26edb938f9a
> LICENSE
> diff --git a/package/python-snappy/python-snappy.mk
> b/package/python-snappy/python-snappy.mk
> index d087c83b10..e80aa861df 100644
> --- a/package/python-snappy/python-snappy.mk
> +++ b/package/python-snappy/python-snappy.mk
> @@ -4,8 +4,8 @@
>  #
>
>  ################################################################################
>
> -PYTHON_SNAPPY_VERSION = 0.5.4
> -PYTHON_SNAPPY_SITE =
> https://files.pythonhosted.org/packages/45/35/65d9f8cc537129894b4b32647d80212d1fa342877581c5b8a69872cea8be
> +PYTHON_SNAPPY_VERSION = 0.6.1
> +PYTHON_SNAPPY_SITE =
> https://files.pythonhosted.org/packages/98/7a/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96
>  PYTHON_SNAPPY_SETUP_TYPE = setuptools
>  PYTHON_SNAPPY_LICENSE = BSD-3-Clause
>  PYTHON_SNAPPY_LICENSE_FILES = LICENSE
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000498dd705dcb9e4f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Just a heads-up that I&#39;m dropping Crossbar in our=
 project in favor of a C++ based solution that doesn&#39;t require the heav=
yweight Python dependency.</div><div><br></div><div>I&#39;m going to unsubs=
cribe from the buildroot mailing list due to the high traffic volume. Pleas=
e remember to CC me directly if you decide to proceed with the remaining pa=
tches in this set.<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Apr 4, 2022 at 4:48 PM Arnout Vandeca=
ppelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">commit: <a href=
=3D"https://git.buildroot.net/buildroot/commit/?id=3D968450adfdf1042ddcd8a0=
ab157dd9747ec6ee8b" rel=3D"noreferrer" target=3D"_blank">https://git.buildr=
oot.net/buildroot/commit/?id=3D968450adfdf1042ddcd8a0ab157dd9747ec6ee8b</a>=
<br>
branch: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Drefs/he=
ads/master" rel=3D"noreferrer" target=3D"_blank">https://git.buildroot.net/=
buildroot/commit/?id=3Drefs/heads/master</a><br>
<br>
Required by python-crossbar and python-autobahn[compress].<br>
<br>
Signed-off-by: Emile Cormier &lt;<a href=3D"mailto:emile.cormier.jr@gmail.c=
om" target=3D"_blank">emile.cormier.jr@gmail.com</a>&gt;<br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) &lt;<a href=3D"mailto:=
arnout@mind.be" target=3D"_blank">arnout@mind.be</a>&gt;<br>
---<br>
=C2=A0package/python-snappy/python-snappy.hash | 6 +++---<br>
=C2=A0package/python-snappy/<a href=3D"http://python-snappy.mk" rel=3D"nore=
ferrer" target=3D"_blank">python-snappy.mk</a>=C2=A0 =C2=A0| 4 ++--<br>
=C2=A02 files changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/package/python-snappy/python-snappy.hash b/package/python-snap=
py/python-snappy.hash<br>
index 1e0f96054f..c4dbc72077 100644<br>
--- a/package/python-snappy/python-snappy.hash<br>
+++ b/package/python-snappy/python-snappy.hash<br>
@@ -1,5 +1,5 @@<br>
=C2=A0# md5, sha256 from <a href=3D"https://pypi.org/pypi/python-snappy/jso=
n" rel=3D"noreferrer" target=3D"_blank">https://pypi.org/pypi/python-snappy=
/json</a><br>
-md5=C2=A0 =C2=A0 82e09ffd44204096fc70d6de14d0ea2f=C2=A0 python-snappy-0.5.=
4.tar.gz<br>
-sha256 d9c26532cfa510f45e8d135cde140e8a5603d3fb254cfec273ebc0ecf9f668e2=C2=
=A0 python-snappy-0.5.4.tar.gz<br>
+md5=C2=A0 fc84cfa3526fba06d66f0d0b2e764300=C2=A0 python-snappy-0.6.1.tar.g=
z<br>
+sha256=C2=A0 b6a107ab06206acc5359d4c5632bd9b22d448702a79b3169b0c62e0fb808b=
b2a=C2=A0 python-snappy-0.6.1.tar.gz<br>
=C2=A0# Locally computed sha256 checksums<br>
-sha256 d007cb05f143d99d16d5cd0d1bf291daf037adb36800344e440ec26edb938f9a=C2=
=A0 LICENSE<br>
+sha256=C2=A0 d007cb05f143d99d16d5cd0d1bf291daf037adb36800344e440ec26edb938=
f9a=C2=A0 LICENSE<br>
diff --git a/package/python-snappy/<a href=3D"http://python-snappy.mk" rel=
=3D"noreferrer" target=3D"_blank">python-snappy.mk</a> b/package/python-sna=
ppy/<a href=3D"http://python-snappy.mk" rel=3D"noreferrer" target=3D"_blank=
">python-snappy.mk</a><br>
index d087c83b10..e80aa861df 100644<br>
--- a/package/python-snappy/<a href=3D"http://python-snappy.mk" rel=3D"nore=
ferrer" target=3D"_blank">python-snappy.mk</a><br>
+++ b/package/python-snappy/<a href=3D"http://python-snappy.mk" rel=3D"nore=
ferrer" target=3D"_blank">python-snappy.mk</a><br>
@@ -4,8 +4,8 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-PYTHON_SNAPPY_VERSION =3D 0.5.4<br>
-PYTHON_SNAPPY_SITE =3D <a href=3D"https://files.pythonhosted.org/packages/=
45/35/65d9f8cc537129894b4b32647d80212d1fa342877581c5b8a69872cea8be" rel=3D"=
noreferrer" target=3D"_blank">https://files.pythonhosted.org/packages/45/35=
/65d9f8cc537129894b4b32647d80212d1fa342877581c5b8a69872cea8be</a><br>
+PYTHON_SNAPPY_VERSION =3D 0.6.1<br>
+PYTHON_SNAPPY_SITE =3D <a href=3D"https://files.pythonhosted.org/packages/=
98/7a/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96" rel=3D"=
noreferrer" target=3D"_blank">https://files.pythonhosted.org/packages/98/7a=
/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96</a><br>
=C2=A0PYTHON_SNAPPY_SETUP_TYPE =3D setuptools<br>
=C2=A0PYTHON_SNAPPY_LICENSE =3D BSD-3-Clause<br>
=C2=A0PYTHON_SNAPPY_LICENSE_FILES =3D LICENSE<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--000000000000498dd705dcb9e4f4--

--===============6128466002918468034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6128466002918468034==--
