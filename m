Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032EBC3DA7A
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 11:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DF8D8140D;
	Sat, 31 Dec 2022 11:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DF8D8140D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yuZh4oSkD1TF; Sat, 31 Dec 2022 11:04:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 815E68143A;
	Sat, 31 Dec 2022 11:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 815E68143A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 339201BF280
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 11:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C4308143A
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 11:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C4308143A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qu9SuNb1xvux for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 11:04:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AB828140D
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9AB828140D
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 11:04:24 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id i188so23504275vsi.8
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 03:04:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jo9J7M4qREZyNhKPopG3KJRM3345QxjgI3KRloLxJeM=;
 b=mR0RlroXxKMVZcLEr6XdupX9Y63pHMdYjDFHENUWl9LHf891uFDC7/4uKe6JsN5s4J
 sz/2PnIneL84QewSNxvogTADz9mCOopcuK8T6kP/oOY//vQXVFqOWBGlPFnHPAXbdxwF
 +O5KMDHVh7QOmTvyB/V09VUZ6lxNLKLFYCX94UYv+5IG21x8WMlUCjMziiDp2E9dUh51
 3fNp+134O6FUeLUeNtKQGrVJ2yQfNWEU9hkdbXu+yNiBMdtTa8Aj5ySfQJe5ZU5DttHC
 eZvkjAG+LY7ynP01SbV5gDQpn/fp2V2R9uYD6S60ihByyA3uMqXo1FaTbsUa433DuVme
 p1sQ==
X-Gm-Message-State: AFqh2kpaS/Q6JGlSM0c6NfXcg0fqfJic1MYUzJfQzdfBF/2mEYrWJuMZ
 8nfnS+5HyPUZ61NRGQzG4LqJja9rRc215cHyiXLnwQ==
X-Google-Smtp-Source: AMrXdXvVgu7n7cngNoZ7KeILbVhLcyNGXBtA2nGF8tEcrvy++fFKpq0+nzvajgxO2eBmDLNDQLyYLkQRI6WD0c3t9as=
X-Received: by 2002:a05:6102:a34:b0:3b1:4888:8599 with SMTP id
 20-20020a0561020a3400b003b148888599mr3620282vsb.42.1672484663174; Sat, 31 Dec
 2022 03:04:23 -0800 (PST)
MIME-Version: 1.0
References: <20221229194729.8085-1-ju.o@free.fr>
 <20221229194729.8085-9-ju.o@free.fr>
In-Reply-To: <20221229194729.8085-9-ju.o@free.fr>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 31 Dec 2022 12:04:11 +0100
Message-ID: <CAB0FRsudJ2F+rXSk-ROVf0JXT=SGXLG5gvvLAm-muDHy+VBdDw@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Subject: Re: [Buildroot] [PATCH 09/27] package/qoriq-rcw: update codeaurora
 URLs to github
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Gary Bisson <bisson.gary@gmail.com>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>,
 Gilles Talis <gilles.talis@gmail.com>, Refik Tuzakli <tuzakli.refik@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>, buildroot@buildroot.org,
 Fabio Estevam <festevam@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Type: multipart/mixed; boundary="===============6975131394682698743=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6975131394682698743==
Content-Type: multipart/alternative; boundary="0000000000003dc36205f11dae13"

--0000000000003dc36205f11dae13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 29 d=C3=A9c. 2022 =C3=A0 20:50, Julien Olivain <ju.o@free.fr> a =C3=
=A9crit :

> NXP moved all its open source code repositories from Code Aurora Forum
> to github. See for example:
>
> https://github.com/nxp-imx/meta-imx/commit/39bc4d81969a40e0da660519cf4ed0=
83b9c53097
>
> Software packages are now grouped in several NXP github
> projects/organizations (nxp-imx, nxp-qoriq, ...). See:
> https://www.nxp.com/design/software/embedded-software/nxp-github:NXP-GITH=
UB
>
> The NXP code published on Code Aurora is still present (at the time of
> this commit) but is no longer receiving updates. It is also expected
> to be shut down on 2023-03-31. The Code Aurora website
> https://source.codeaurora.org/ currently show the following message:
> """
> Note: Qualcomm Innovation Center Inc. maintained repositories have
> migrated to git.codelinaro.org. QUIC repositories on this site will
> not receive any updates after March 31, 2022, and will be deleted on
> March 31, 2023. If your project depends on these repositories, please
> adjust your tooling configuration to use the new, up-to-date project
> location.
> """
>
> For this reason, the NXP recipes using codeaurora.org urls need to be
> updated to the correct github.com replacement.
>
> Note: this commit does not change the component version. Only the
> download URL is updated. The archive content is expected to be the
> same.
>
> Note 2: the _SITE_METHOD is also changed from "git" to the default
> "wget", for faster downloads. This is why the package hash has
> changed.
>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
>

Reviewed-by: Francois Perrad <francois.perrad@gadz.org>



> ---
>  package/qoriq-rcw/Config.in.host | 2 +-
>  package/qoriq-rcw/qoriq-rcw.hash | 2 +-
>  package/qoriq-rcw/qoriq-rcw.mk   | 3 +--
>  3 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/package/qoriq-rcw/Config.in.host
> b/package/qoriq-rcw/Config.in.host
> index 08fc83acd0..58c16d495b 100644
> --- a/package/qoriq-rcw/Config.in.host
> +++ b/package/qoriq-rcw/Config.in.host
> @@ -9,7 +9,7 @@ config BR2_PACKAGE_HOST_QORIQ_RCW
>           $(HOST_DIR)/share/rcw. Either a SDK or post scripts can
>           then use this toolset and examples.
>
> -
> https://source.codeaurora.org/external/qoriq/qoriq-components/rcw/
> +         https://github.com/nxp-qoriq/rcw
>
>  if BR2_PACKAGE_HOST_QORIQ_RCW
>
> diff --git a/package/qoriq-rcw/qoriq-rcw.hash
> b/package/qoriq-rcw/qoriq-rcw.hash
> index f34c771d11..2a887d57d4 100644
> --- a/package/qoriq-rcw/qoriq-rcw.hash
> +++ b/package/qoriq-rcw/qoriq-rcw.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  caa6802f2ba5ea92fd27e7c977749010a91c9091fcc3fe626f96d9cacfba1f0a
> qoriq-rcw-LSDK-21.08-br1.tar.gz
> +sha256  f199c10e50bd18d7bed0d60f5b68194240dea4f1aa164cec98332723727a4796
> qoriq-rcw-LSDK-21.08.tar.gz
>  sha256  68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9
> LICENSE
> diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/
> qoriq-rcw.mk
> index 0501c36f46..8b1ceacfce 100644
> --- a/package/qoriq-rcw/qoriq-rcw.mk
> +++ b/package/qoriq-rcw/qoriq-rcw.mk
> @@ -5,8 +5,7 @@
>
>  ########################################################################=
########
>
>  QORIQ_RCW_VERSION =3D LSDK-21.08
> -QORIQ_RCW_SITE =3D
> https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
> -QORIQ_RCW_SITE_METHOD
> <https://source.codeaurora.org/external/qoriq/qoriq-components/rcw-QORIQ_=
RCW_SITE_METHOD>
> =3D git
> +QORIQ_RCW_SITE =3D $(call github,nxp-qoriq,rcw,$(QORIQ_RCW_VERSION))
>  QORIQ_RCW_LICENSE =3D BSD-3-Clause
>  QORIQ_RCW_LICENSE_FILES =3D LICENSE
>
> --
> 2.39.0
>
>

--0000000000003dc36205f11dae13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 29 d=C3=A9c. 2022 =C3=A0=
=C2=A020:50, Julien Olivain &lt;<a href=3D"mailto:ju.o@free.fr">ju.o@free.f=
r</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">NXP moved all its open source code repositories from Code Aur=
ora Forum<br>
to github. See for example:<br>
<a href=3D"https://github.com/nxp-imx/meta-imx/commit/39bc4d81969a40e0da660=
519cf4ed083b9c53097" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/nxp-imx/meta-imx/commit/39bc4d81969a40e0da660519cf4ed083b9c53097</a><br>
<br>
Software packages are now grouped in several NXP github<br>
projects/organizations (nxp-imx, nxp-qoriq, ...). See:<br>
<a href=3D"https://www.nxp.com/design/software/embedded-software/nxp-github=
:NXP-GITHUB" rel=3D"noreferrer" target=3D"_blank">https://www.nxp.com/desig=
n/software/embedded-software/nxp-github:NXP-GITHUB</a><br>
<br>
The NXP code published on Code Aurora is still present (at the time of<br>
this commit) but is no longer receiving updates. It is also expected<br>
to be shut down on 2023-03-31. The Code Aurora website<br>
<a href=3D"https://source.codeaurora.org/" rel=3D"noreferrer" target=3D"_bl=
ank">https://source.codeaurora.org/</a> currently show the following messag=
e:<br>
&quot;&quot;&quot;<br>
Note: Qualcomm Innovation Center Inc. maintained repositories have<br>
migrated to <a href=3D"http://git.codelinaro.org" rel=3D"noreferrer" target=
=3D"_blank">git.codelinaro.org</a>. QUIC repositories on this site will<br>
not receive any updates after March 31, 2022, and will be deleted on<br>
March 31, 2023. If your project depends on these repositories, please<br>
adjust your tooling configuration to use the new, up-to-date project<br>
location.<br>
&quot;&quot;&quot;<br>
<br>
For this reason, the NXP recipes using <a href=3D"http://codeaurora.org" re=
l=3D"noreferrer" target=3D"_blank">codeaurora.org</a> urls need to be<br>
updated to the correct <a href=3D"http://github.com" rel=3D"noreferrer" tar=
get=3D"_blank">github.com</a> replacement.<br>
<br>
Note: this commit does not change the component version. Only the<br>
download URL is updated. The archive content is expected to be the<br>
same.<br>
<br>
Note 2: the _SITE_METHOD is also changed from &quot;git&quot; to the defaul=
t<br>
&quot;wget&quot;, for faster downloads. This is why the package hash has<br=
>
changed.<br>
<br>
Signed-off-by: Julien Olivain &lt;<a href=3D"mailto:ju.o@free.fr" target=3D=
"_blank">ju.o@free.fr</a>&gt;<br></blockquote><div><br></div><div><pre clas=
s=3D"gmail-content"><span class=3D"gmail-reviewed-by">Reviewed-by: Francois=
 Perrad &lt;<a href=3D"mailto:francois.perrad@gadz.org">francois.perrad@gad=
z.org</a>&gt;</span></pre>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
---<br>
=C2=A0package/qoriq-rcw/Config.in.host | 2 +-<br>
=C2=A0package/qoriq-rcw/qoriq-rcw.hash | 2 +-<br>
=C2=A0package/qoriq-rcw/<a href=3D"http://qoriq-rcw.mk" rel=3D"noreferrer" =
target=3D"_blank">qoriq-rcw.mk</a>=C2=A0 =C2=A0| 3 +--<br>
=C2=A03 files changed, 3 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/package/qoriq-rcw/Config.in.host b/package/qoriq-rcw/Config.in=
.host<br>
index 08fc83acd0..58c16d495b 100644<br>
--- a/package/qoriq-rcw/Config.in.host<br>
+++ b/package/qoriq-rcw/Config.in.host<br>
@@ -9,7 +9,7 @@ config BR2_PACKAGE_HOST_QORIQ_RCW<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(HOST_DIR)/share/rcw. Either a SDK or p=
ost scripts can<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 then use this toolset and examples.<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://source.codeaurora.org=
/external/qoriq/qoriq-components/rcw/" rel=3D"noreferrer" target=3D"_blank"=
>https://source.codeaurora.org/external/qoriq/qoriq-components/rcw/</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/nxp-qoriq/=
rcw" rel=3D"noreferrer" target=3D"_blank">https://github.com/nxp-qoriq/rcw<=
/a><br>
<br>
=C2=A0if BR2_PACKAGE_HOST_QORIQ_RCW<br>
<br>
diff --git a/package/qoriq-rcw/qoriq-rcw.hash b/package/qoriq-rcw/qoriq-rcw=
.hash<br>
index f34c771d11..2a887d57d4 100644<br>
--- a/package/qoriq-rcw/qoriq-rcw.hash<br>
+++ b/package/qoriq-rcw/qoriq-rcw.hash<br>
@@ -1,3 +1,3 @@<br>
=C2=A0# Locally calculated<br>
-sha256=C2=A0 caa6802f2ba5ea92fd27e7c977749010a91c9091fcc3fe626f96d9cacfba1=
f0a=C2=A0 qoriq-rcw-LSDK-21.08-br1.tar.gz<br>
+sha256=C2=A0 f199c10e50bd18d7bed0d60f5b68194240dea4f1aa164cec98332723727a4=
796=C2=A0 qoriq-rcw-LSDK-21.08.tar.gz<br>
=C2=A0sha256=C2=A0 68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c=
943d42e9=C2=A0 LICENSE<br>
diff --git a/package/qoriq-rcw/<a href=3D"http://qoriq-rcw.mk" rel=3D"noref=
errer" target=3D"_blank">qoriq-rcw.mk</a> b/package/qoriq-rcw/<a href=3D"ht=
tp://qoriq-rcw.mk" rel=3D"noreferrer" target=3D"_blank">qoriq-rcw.mk</a><br=
>
index 0501c36f46..8b1ceacfce 100644<br>
--- a/package/qoriq-rcw/<a href=3D"http://qoriq-rcw.mk" rel=3D"noreferrer" =
target=3D"_blank">qoriq-rcw.mk</a><br>
+++ b/package/qoriq-rcw/<a href=3D"http://qoriq-rcw.mk" rel=3D"noreferrer" =
target=3D"_blank">qoriq-rcw.mk</a><br>
@@ -5,8 +5,7 @@<br>
=C2=A0#####################################################################=
###########<br>
<br>
=C2=A0QORIQ_RCW_VERSION =3D LSDK-21.08<br>
-QORIQ_RCW_SITE =3D <a href=3D"https://source.codeaurora.org/external/qoriq=
/qoriq-components/rcw-QORIQ_RCW_SITE_METHOD" rel=3D"noreferrer" target=3D"_=
blank">https://source.codeaurora.org/external/qoriq/qoriq-components/rcw<br=
>
-QORIQ_RCW_SITE_METHOD</a> =3D git<br>
+QORIQ_RCW_SITE =3D $(call github,nxp-qoriq,rcw,$(QORIQ_RCW_VERSION))<br>
=C2=A0QORIQ_RCW_LICENSE =3D BSD-3-Clause<br>
=C2=A0QORIQ_RCW_LICENSE_FILES =3D LICENSE<br>
<br>
-- <br>
2.39.0<br>
<br>
</blockquote></div></div>

--0000000000003dc36205f11dae13--

--===============6975131394682698743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6975131394682698743==--
