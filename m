Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA3EC4332F
	for <buildroot@archiver.kernel.org>; Thu, 22 Dec 2022 21:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 838D181842;
	Thu, 22 Dec 2022 21:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 838D181842
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cP13HsfEMgR4; Thu, 22 Dec 2022 21:25:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAB45817A4;
	Thu, 22 Dec 2022 21:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAB45817A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 624591BF2BE
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 21:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DCB360B49
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 21:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DCB360B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rOZFeRI8biCH for <buildroot@lists.busybox.net>;
 Thu, 22 Dec 2022 21:25:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40B0360797
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40B0360797
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 21:25:46 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 u15-20020a17090a3fcf00b002191825cf02so3152165pjm.2
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 13:25:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WCiVzEnSviYZjVNFpgkEAGMemLy49M1pT3xLCYMRdXw=;
 b=OQAg/lsXo5Y55xNgRjSzNTkZPhhH1MWgK3kqmxEbgKdt7chI5fBeCZwYGI9kr9VZVM
 w9LvuX+/07U5ofd9qOTr/wbJy7QMcdLiIfPZ0wKYaSXDLmRZfdRBJNlmYR+3LbwBM07p
 bPJEgYay67tQpZqoroGhTIsuwYu4KwstOkPicuJtCqeYdwKD+Xmz+VSNJYZvDMEYIgN1
 aT/mis/CGa5EbT+hDYTS9324kUQYmZ0QyGjA+BoTCNIXu/LjR5jQwTP+YSWERj13cJ/Q
 uUgWMSR1BX2WogFLojPdWcYBnXFMSz4B+jNqXLTKseCgzvKAfkog1PU5b5b0hr9zb/i+
 hzYQ==
X-Gm-Message-State: AFqh2kpQtN4sT3M7eDsUCc/CZeXcDkwYyMLECK3jtjeJ4KHa+yX1EGzD
 pIiIAmLiw8pIZXME/8YX1R6Ea4qHn3IGMMf2gAAPW0km
X-Google-Smtp-Source: AMrXdXthk3EncWFlgrW/vDLPI+LWabgUi1ADy0Avmsbw1IVticC+rtvYRFiAjanX12S7IFvuehF8lgkvCNvMK24QKI4=
X-Received: by 2002:a17:90a:5e02:b0:221:5f8e:7bec with SMTP id
 w2-20020a17090a5e0200b002215f8e7becmr714705pjf.140.1671744345497; Thu, 22 Dec
 2022 13:25:45 -0800 (PST)
MIME-Version: 1.0
References: <20221222152506.8310-1-fontaine.fabrice@gmail.com>
 <87lemzkua3.fsf@dell.be.48ers.dk>
In-Reply-To: <87lemzkua3.fsf@dell.be.48ers.dk>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 22 Dec 2022 22:25:34 +0100
Message-ID: <CAPi7W81sM1y-shpwp8Hwi5LyytEwtbx9e0WWwwCjV8GHPX1Rqg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WCiVzEnSviYZjVNFpgkEAGMemLy49M1pT3xLCYMRdXw=;
 b=QIkFQYm3Sx89WoFT3raCwIL/GthvTjghkFZMAn6zFw/TpDXcEhV8M/MDwIUoVI7z7U
 zr5VDCqfJX5WaGnER5Wp5kgOZDm0kmKNIqTQNEyfySMR9cHzlm8GrZSNTv4tiWC6aiei
 ulRsXe/w/01G04L6pJi2xfAWyHoPH+ItwDE52wMc26ecmO2gyXUuYgt1flb40UXpElLU
 Lu11fhD8ryQMEWbEIXkxIXNedpW/g3f3mZ89D1c/zhCsbUGJ6x9uVGfkYKVpAla6LWyb
 78LJ2KuEq/laSpyEsg0aLj5zqzYwMaWo/ExVEi2TBvK07mJGgBGX2zm0ufGLgybjPNSt
 LMGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QIkFQYm3
Subject: Re: [Buildroot] [PATCH 1/1] package/exfat-utils: add CPE variables
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
Content-Type: multipart/mixed; boundary="===============6692389211017064522=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6692389211017064522==
Content-Type: multipart/alternative; boundary="000000000000de671f05f0714f88"

--000000000000de671f05f0714f88
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 22 d=C3=A9c. 2022 =C3=A0 22:23, Peter Korsgaard <peter@korsgaard.co=
m> a
=C3=A9crit :

> >>>>> "Fabrice" =3D=3D Fabrice Fontaine <fontaine.fabrice@gmail.com> writ=
es:
>
>  > cpe:2.3:a:exfat_project:exfat is a valid CPE identifier for this
>  > package:
>
>  >
> https://nvd.nist.gov/products/cpe/search/results?namingFormat=3D2.3&keywo=
rd=3Dcpe%3A2.3%3Aa%3Aexfat_project%3Aexfat
>
>  > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  > ---
>  >  package/exfat-utils/exfat-utils.mk | 2 ++
>  >  1 file changed, 2 insertions(+)
>
>  > diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/
> exfat-utils.mk
>  > index d13ec6bab8..704641dd0a 100644
>  > --- a/package/exfat-utils/exfat-utils.mk
>  > +++ b/package/exfat-utils/exfat-utils.mk
>  > @@ -8,6 +8,8 @@ EXFAT_UTILS_VERSION =3D 1.3.0
>  >  EXFAT_UTILS_SITE =3D
> https://github.com/relan/exfat/releases/download/v$(EXFAT_UTILS_VERSION)
>  >  EXFAT_UTILS_LICENSE =3D GPL-2.0+
>  >  EXFAT_UTILS_LICENSE_FILES =3D COPYING
>  > +EXFAT_CPE_ID_VENDOR =3D exfat_project
>  > +EXFAT_CPE_ID_PRODUCT =3D exfat
>
> From check-package:
>
> package/exfat-utils/exfat-utils.mk:11: possible typo: EXFAT_CPE_ID_VENDOR
> -> *EXFAT_UTILS*
> package/exfat-utils/exfat-utils.mk:12: possible typo:
> EXFAT_CPE_ID_PRODUCT -> *EXFAT_UTILS*
>
> Was this supposed to be for package/exfat instead?
>

This is a copy/paste error, I'll send a v2.
Actually, exfat and exfat-utils are the same package on NVD side.


>
> --
> Bye, Peter Korsgaard
>

Best Regards,

Fabrice

--000000000000de671f05f0714f88
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 22 d=C3=A9c. 2022 =C3=A0=
=C2=A022:23, Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com">pet=
er@korsgaard.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;Fabrice&quot; =3D=
=3D Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" targ=
et=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; writes:<br>
<br>
=C2=A0&gt; cpe:2.3:a:exfat_project:exfat is a valid CPE identifier for this=
<br>
=C2=A0&gt; package:<br>
<br>
=C2=A0&gt;=C2=A0 =C2=A0<a href=3D"https://nvd.nist.gov/products/cpe/search/=
results?namingFormat=3D2.3&amp;keyword=3Dcpe%3A2.3%3Aa%3Aexfat_project%3Aex=
fat" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/products/cpe=
/search/results?namingFormat=3D2.3&amp;keyword=3Dcpe%3A2.3%3Aa%3Aexfat_proj=
ect%3Aexfat</a><br>
<br>
=C2=A0&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.f=
abrice@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
=C2=A0&gt; ---<br>
=C2=A0&gt;=C2=A0 package/exfat-utils/<a href=3D"http://exfat-utils.mk" rel=
=3D"noreferrer" target=3D"_blank">exfat-utils.mk</a> | 2 ++<br>
=C2=A0&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
<br>
=C2=A0&gt; diff --git a/package/exfat-utils/<a href=3D"http://exfat-utils.m=
k" rel=3D"noreferrer" target=3D"_blank">exfat-utils.mk</a> b/package/exfat-=
utils/<a href=3D"http://exfat-utils.mk" rel=3D"noreferrer" target=3D"_blank=
">exfat-utils.mk</a><br>
=C2=A0&gt; index d13ec6bab8..704641dd0a 100644<br>
=C2=A0&gt; --- a/package/exfat-utils/<a href=3D"http://exfat-utils.mk" rel=
=3D"noreferrer" target=3D"_blank">exfat-utils.mk</a><br>
=C2=A0&gt; +++ b/package/exfat-utils/<a href=3D"http://exfat-utils.mk" rel=
=3D"noreferrer" target=3D"_blank">exfat-utils.mk</a><br>
=C2=A0&gt; @@ -8,6 +8,8 @@ EXFAT_UTILS_VERSION =3D 1.3.0<br>
=C2=A0&gt;=C2=A0 EXFAT_UTILS_SITE =3D <a href=3D"https://github.com/relan/e=
xfat/releases/download/v$(EXFAT_UTILS_VERSION)" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/relan/exfat/releases/download/v$(EXFAT_UTILS=
_VERSION)</a><br>
=C2=A0&gt;=C2=A0 EXFAT_UTILS_LICENSE =3D GPL-2.0+<br>
=C2=A0&gt;=C2=A0 EXFAT_UTILS_LICENSE_FILES =3D COPYING<br>
=C2=A0&gt; +EXFAT_CPE_ID_VENDOR =3D exfat_project<br>
=C2=A0&gt; +EXFAT_CPE_ID_PRODUCT =3D exfat<br>
<br>
From check-package:<br>
<br>
package/exfat-utils/<a href=3D"http://exfat-utils.mk:11" rel=3D"noreferrer"=
 target=3D"_blank">exfat-utils.mk:11</a>: possible typo: EXFAT_CPE_ID_VENDO=
R -&gt; *EXFAT_UTILS*<br>
package/exfat-utils/<a href=3D"http://exfat-utils.mk:12" rel=3D"noreferrer"=
 target=3D"_blank">exfat-utils.mk:12</a>: possible typo: EXFAT_CPE_ID_PRODU=
CT -&gt; *EXFAT_UTILS*<br>
<br>
Was this supposed to be for package/exfat instead?<br></blockquote><div><br=
></div><div>This is a copy/paste error, I&#39;ll send a v2.</div><div>Actua=
lly, exfat and exfat-utils are the same package on NVD side.<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Bye, Peter Korsgaard<br></blockquote><div><br></div><div>Best Regards,</div=
><div><br></div><div>Fabrice <br></div></div></div>

--000000000000de671f05f0714f88--

--===============6692389211017064522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6692389211017064522==--
