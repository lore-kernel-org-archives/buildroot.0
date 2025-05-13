Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BD3C3ABC9
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 09:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80CB2407FF;
	Tue, 13 May 2025 09:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMa4hrLS0_g5; Tue, 13 May 2025 09:07:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73DE740C91
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73DE740C91;
	Tue, 13 May 2025 09:07:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5EA1153
 for <buildroot@buildroot.org>; Tue, 13 May 2025 09:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6DB360AE4
 for <buildroot@buildroot.org>; Tue, 13 May 2025 09:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFJuXYI5R2yS for <buildroot@buildroot.org>;
 Tue, 13 May 2025 09:07:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a36; helo=mail-vk1-xa36.google.com;
 envelope-from=johanderycke@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A412560ECE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A412560ECE
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A412560ECE
 for <buildroot@buildroot.org>; Tue, 13 May 2025 09:07:14 +0000 (UTC)
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-52c65c00a02so1015651e0c.1
 for <buildroot@buildroot.org>; Tue, 13 May 2025 02:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747127233; x=1747732033;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1NJtUMHOtSbrenmW9w4Wxy4FWnL9ZefgHkYUI2SQYt8=;
 b=d9Il1Sb9A1/uCrBMz6s9sFql7ML1JRCS5PjHotYFBH4K08zCvmJVIWZ3EgNBE50pVP
 7btPkK/+vxlbdMBtACqL+CH+kVPHwEeDXDRhrGE6DA7GPYI7vRPmcg7Fu3NYxYVPnkO2
 kGV52kkmoD0ayri56zzj0Hoky+9mJ4m5em5PXEINuGRi3M5WYFnbtzTXGKgOJRiaEoO8
 xUEignYet/Hrgm0po/u47f0nzXOrnvJ1Esqm1vr2fHg7qGdwU85NykzZxuAVvkBTENi5
 SyeO16hWEa3qdyOlbDjB9PnJZ0VgeUkcJP2Q4lhWnV3rE2C75R33M+Z9ZKtaw/SahP0k
 0q9g==
X-Gm-Message-State: AOJu0YzoKIbGNvXzCJwCLQZz9O3ITBm2GcMpqUAi7y14Om04Kpm3Cti1
 x/RUILVEDXWdaxzw36Bn/rmbT5odn5HThndCvcvZvxrdieQQ93xFbLFEELebXEfI+QTbj7bKQ62
 qik7b3RrAWjnmgV+3PLbJcR8iaRQ=
X-Gm-Gg: ASbGncsfhe6XPMuAUOVzIcoiJyLv2xNHoVK4FB859HgcBNR3icyi7irbMut3wNa/KrG
 PRKNA7EgQk3GcL609xSX2wII0OTvkryo1boOw1NVnLkys+/LNQdmSH6AQitSO3yjJlbhr1C3BmI
 7BAaDKJVS1UsM2cbL7B4i34ElVnkk9penJ
X-Google-Smtp-Source: AGHT+IE/YmRqeQD2Bdfkn6h+VXpeBH/XJaluNeP0YVxirSrTne5KwoYXGIjNfWJHaD42izR6sW+N4weVu8nVVIUkCoM=
X-Received: by 2002:a05:6122:17aa:b0:526:2210:5b64 with SMTP id
 71dfb90a1353d-52c53ca24afmr10937798e0c.9.1747127233259; Tue, 13 May 2025
 02:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250426073305.1189443-1-thomas.perale@mind.be>
In-Reply-To: <20250426073305.1189443-1-thomas.perale@mind.be>
From: Johan Derycke <johanderycke@gmail.com>
Date: Tue, 13 May 2025 11:07:02 +0200
X-Gm-Features: AX0GCFtzJVYSOrkEu3K4MR18oroR1RmNeph7AL0z-lrD4LYqGusvG0NLOy-isSU
Message-ID: <CAKHhJn0aapXTg++0J1wriFHcoq6khZQvN93+pzZ5OXk=OS=ceA@mail.gmail.com>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Daniel Price <daniel.price@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747127233; x=1747732033; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1NJtUMHOtSbrenmW9w4Wxy4FWnL9ZefgHkYUI2SQYt8=;
 b=XHaCZ2tJ1pDEXLNVLa42uMxnTadFc+ZYL5DifklC4OZh7b1VcMjjNTayU5DbfvUwY4
 3qP/zQ9h8Z+TthjuqWUBcDn8a+/WAXA+7QqaVOd/v1HJXA4V2SVH0VcTMY4yxTFXoY1F
 Ow6KdqomTwpFagxfpie/sVmcwOF2sqzkJ46Pog9uGgmV3FPQCiSzByKQdMJdADrcfgOk
 v3aVaqYJc8AtxTo+G30h7AqOpSpKU4O3399HsnQG/rz5Dm45DgAea3DapA2NdG4l4UI0
 m3GKmHCpxQ24f7qiff1vlGrn0AUY59aV+SStDgHOSt3qs2wH2sdCdWxiPq31zAj3jaQz
 0fmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XHaCZ2tJ
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: make target nodejs
 package virtual
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7207209510042109155=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7207209510042109155==
Content-Type: multipart/alternative; boundary="0000000000001daeb2063500c231"

--0000000000001daeb2063500c231
Content-Type: text/plain; charset="UTF-8"

Hi,

Tested on 2024.02 branch. Makes "Dependency-Track" happy :-)

Tested-by: johan.derycke@barco.com


Op za 26 apr 2025 om 09:34 schreef Thomas Perale via buildroot <
buildroot@buildroot.org>:

> Since commit [1], the host-nodejs package was turned into a virtual
> package. However, the target nodejs package was intentionally not
> turned into a virtual package and became an empty package.
> The reason for this is:
>
>   - No alternatives providers were introduced for the target nodejs
>     package.
>   - The Config.in remained unchaged for the target package.
>
> As a result, running `make show-info` with a config that includes the
> target nodejs package, outputs an entry for the empty package:
>
> ```
> "nodejs": {
>     "type": "target",
>     "name": "nodejs",
>     "virtual": false,
>     "version": "",
>     ...
>     "cpe-id": "cpe:2.3:a:nodejs:node.js::*:*:*:*:*:*:*"
> },
> ```
>
> This can be an issue because the CPE ID of the empty nodejs package
> is the following `cpe:2.3:a:nodejs:node.js::*:*:*:*:*:*:*`.
> Reporting such a CPE ID can be an issue for certain software that consume
> the SBOM and could be interpreted as CPE that matches with every versions
> of the package.
>
> This patch converts the target nodejs package into a virtual package to
> prevents the empty package from being included in the SBOM.
>
> [1] 4cbc2af604 package/nodejs: rename to nodejs-src and convert to virtual
> package
>
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>  package/nodejs/Config.in                | 4 ++++
>  package/nodejs/nodejs-src/nodejs-src.mk | 1 +
>  package/nodejs/nodejs.mk                | 3 +--
>  3 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> index 50d1360715..2a0074b5a4 100644
> --- a/package/nodejs/Config.in
> +++ b/package/nodejs/Config.in
> @@ -87,4 +87,8 @@ config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS
>
>  endif
>
> +config BR2_PACKAGE_PROVIDES_NODEJS
> +       string
> +       default "nodejs-src"
> +
>  source "package/nodejs/nodejs-src/Config.in"
> diff --git a/package/nodejs/nodejs-src/nodejs-src.mk
> b/package/nodejs/nodejs-src/nodejs-src.mk
> index 8f934202b0..30e72743a1 100644
> --- a/package/nodejs/nodejs-src/nodejs-src.mk
> +++ b/package/nodejs/nodejs-src/nodejs-src.mk
> @@ -14,6 +14,7 @@ NODEJS_SRC_LICENSE_FILES = $(NODEJS_LICENSE_FILES)
>  NODEJS_SRC_CPE_ID_VENDOR = $(NODEJS_CPE_ID_VENDOR)
>  NODEJS_SRC_CPE_ID_PRODUCT = $(NODEJS_CPE_ID_PRODUCT)
>
> +NODEJS_SRC_PROVIDES = nodejs
>  HOST_NODEJS_SRC_PROVIDES = host-nodejs
>
>  NODEJS_SRC_DEPENDENCIES = \
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 6dc0e501b4..752971c4a6 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -32,8 +32,7 @@ PNPM = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/pnpm
>  YARN = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/yarn
>  endif
>
> -NODEJS_DEPENDENCIES = nodejs-src
> -$(eval $(generic-package))
> +$(eval $(virtual-package))
>  $(eval $(host-virtual-package))
>
>  include $(sort $(wildcard package/nodejs/*/*.mk))
> --
> 2.49.0
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000001daeb2063500c231
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>Tested on 2024.02 branch. Makes &quot;Dependenc=
y-Track&quot; happy :-)<div><br></div><div>Tested-by: <a href=3D"mailto:joh=
an.derycke@barco.com">johan.derycke@barco.com</a></div><div><br></div></div=
><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" clas=
s=3D"gmail_attr">Op za 26 apr 2025 om 09:34 schreef Thomas Perale via build=
root &lt;<a href=3D"mailto:buildroot@buildroot.org">buildroot@buildroot.org=
</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Since =
commit [1], the host-nodejs package was turned into a virtual<br>
package. However, the target nodejs package was intentionally not<br>
turned into a virtual package and became an empty package.<br>
The reason for this is:<br>
<br>
=C2=A0 - No alternatives providers were introduced for the target nodejs<br=
>
=C2=A0 =C2=A0 package.<br>
=C2=A0 - The Config.in remained unchaged for the target package.<br>
<br>
As a result, running `make show-info` with a config that includes the<br>
target nodejs package, outputs an entry for the empty package:<br>
<br>
```<br>
&quot;nodejs&quot;: {<br>
=C2=A0 =C2=A0 &quot;type&quot;: &quot;target&quot;,<br>
=C2=A0 =C2=A0 &quot;name&quot;: &quot;nodejs&quot;,<br>
=C2=A0 =C2=A0 &quot;virtual&quot;: false,<br>
=C2=A0 =C2=A0 &quot;version&quot;: &quot;&quot;,<br>
=C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 &quot;cpe-id&quot;: &quot;cpe:2.3:a:nodejs:node.js::*:*:*:*:*=
:*:*&quot;<br>
},<br>
```<br>
<br>
This can be an issue because the CPE ID of the empty nodejs package<br>
is the following `cpe:2.3:a:nodejs:node.js::*:*:*:*:*:*:*`.<br>
Reporting such a CPE ID can be an issue for certain software that consume<b=
r>
the SBOM and could be interpreted as CPE that matches with every versions<b=
r>
of the package.<br>
<br>
This patch converts the target nodejs package into a virtual package to<br>
prevents the empty package from being included in the SBOM.<br>
<br>
[1] 4cbc2af604 package/nodejs: rename to nodejs-src and convert to virtual =
package<br>
<br>
Signed-off-by: Thomas Perale &lt;<a href=3D"mailto:thomas.perale@mind.be" t=
arget=3D"_blank">thomas.perale@mind.be</a>&gt;<br>
---<br>
=C2=A0package/nodejs/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 4 ++++<br>
=C2=A0package/nodejs/nodejs-src/<a href=3D"http://nodejs-src.mk" rel=3D"nor=
eferrer" target=3D"_blank">nodejs-src.mk</a> | 1 +<br>
=C2=A0package/nodejs/<a href=3D"http://nodejs.mk" rel=3D"noreferrer" target=
=3D"_blank">nodejs.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 3 +--<br>
=C2=A03 files changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in<br>
index 50d1360715..2a0074b5a4 100644<br>
--- a/package/nodejs/Config.in<br>
+++ b/package/nodejs/Config.in<br>
@@ -87,4 +87,8 @@ config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS<br>
<br>
=C2=A0endif<br>
<br>
+config BR2_PACKAGE_PROVIDES_NODEJS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0string<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;nodejs-src&quot;<br>
+<br>
=C2=A0source &quot;package/nodejs/nodejs-src/Config.in&quot;<br>
diff --git a/package/nodejs/nodejs-src/<a href=3D"http://nodejs-src.mk" rel=
=3D"noreferrer" target=3D"_blank">nodejs-src.mk</a> b/package/nodejs/nodejs=
-src/<a href=3D"http://nodejs-src.mk" rel=3D"noreferrer" target=3D"_blank">=
nodejs-src.mk</a><br>
index 8f934202b0..30e72743a1 100644<br>
--- a/package/nodejs/nodejs-src/<a href=3D"http://nodejs-src.mk" rel=3D"nor=
eferrer" target=3D"_blank">nodejs-src.mk</a><br>
+++ b/package/nodejs/nodejs-src/<a href=3D"http://nodejs-src.mk" rel=3D"nor=
eferrer" target=3D"_blank">nodejs-src.mk</a><br>
@@ -14,6 +14,7 @@ NODEJS_SRC_LICENSE_FILES =3D $(NODEJS_LICENSE_FILES)<br>
=C2=A0NODEJS_SRC_CPE_ID_VENDOR =3D $(NODEJS_CPE_ID_VENDOR)<br>
=C2=A0NODEJS_SRC_CPE_ID_PRODUCT =3D $(NODEJS_CPE_ID_PRODUCT)<br>
<br>
+NODEJS_SRC_PROVIDES =3D nodejs<br>
=C2=A0HOST_NODEJS_SRC_PROVIDES =3D host-nodejs<br>
<br>
=C2=A0NODEJS_SRC_DEPENDENCIES =3D \<br>
diff --git a/package/nodejs/<a href=3D"http://nodejs.mk" rel=3D"noreferrer"=
 target=3D"_blank">nodejs.mk</a> b/package/nodejs/<a href=3D"http://nodejs.=
mk" rel=3D"noreferrer" target=3D"_blank">nodejs.mk</a><br>
index 6dc0e501b4..752971c4a6 100644<br>
--- a/package/nodejs/<a href=3D"http://nodejs.mk" rel=3D"noreferrer" target=
=3D"_blank">nodejs.mk</a><br>
+++ b/package/nodejs/<a href=3D"http://nodejs.mk" rel=3D"noreferrer" target=
=3D"_blank">nodejs.mk</a><br>
@@ -32,8 +32,7 @@ PNPM =3D $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/pnpm<br>
=C2=A0YARN =3D $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/yarn<br>
=C2=A0endif<br>
<br>
-NODEJS_DEPENDENCIES =3D nodejs-src<br>
-$(eval $(generic-package))<br>
+$(eval $(virtual-package))<br>
=C2=A0$(eval $(host-virtual-package))<br>
<br>
=C2=A0include $(sort $(wildcard package/nodejs/*/*.mk))<br>
-- <br>
2.49.0<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--0000000000001daeb2063500c231--

--===============7207209510042109155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7207209510042109155==--
