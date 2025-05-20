Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9A6C3DA6D
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 12:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB1746103B;
	Tue, 20 May 2025 12:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IY65AlJcL8td; Tue, 20 May 2025 12:10:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD0CB61046
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD0CB61046;
	Tue, 20 May 2025 12:10:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB6F51BF
 for <buildroot@buildroot.org>; Tue, 20 May 2025 12:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD61040AD2
 for <buildroot@buildroot.org>; Tue, 20 May 2025 12:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QbR4i0cd0aUU for <buildroot@buildroot.org>;
 Tue, 20 May 2025 12:09:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6C36E40ACB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C36E40ACB
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C36E40ACB
 for <buildroot@buildroot.org>; Tue, 20 May 2025 12:09:59 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-3105ef2a071so63578111fa.1
 for <buildroot@buildroot.org>; Tue, 20 May 2025 05:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747742997; x=1748347797;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p4fO/LWIZtDmVv4qJneMwlQ71altjuy9k0OiR4ItPIQ=;
 b=MQsIjmbdf11ev4D6G+KxqWeSaSOC2MB9bFYZcrUHArwe5J7LUtMcsvfv9+W+hx1myT
 DYcarZ9WP0kFlKI+8iRnLjxiWpryEc05rrt+S/YyC3fxLZk4u3VyQCEKV340yqWaUIGb
 QVT9y1Q/OBUydIqGLOoWRjlqDqC/Xo312ti+BbPGk8D48IaPx+kQCA50POfe3M3Z9hFY
 csJw3BT8I70c/g+erzkXY/0yErvuD821585xzxSPrIFczx1/igIFeGbwt6Xv2OzP5WJT
 Kw0aqdZvKMX2tLWJmoltApGsyW/75RJrDBG/fRvEZofFQZUY+JbCetNxzWgs5Rg0VAwk
 s97A==
X-Gm-Message-State: AOJu0Yx0vfWizk1gw+oNc/xNi/GR0OkDUlKr130FDwl6fnfDrPuIPbqZ
 8cs85XfBmL6F1BB560+BDGzWVpeag/6Bchd4W26+urFE80N4ZQx9F+tjT+3shPNVriZsG0V+BZU
 LOEGHIGdIfcTOEDUL7QdryB+byznMMwE8+qkI/MCZVBY0bgfFFeeyVg==
X-Gm-Gg: ASbGncsMzp+EawitGXNcDdwrfsOIBaNf5Y3X63K3pthDnrezMHF/1GxsTGaKwif5xPW
 0K0zW//PlBhisTaBUFEaGg6BnHALj6I43Pt/Jf2VNljQ7/cvayT3W6FtoYM2wIh0AbHZtlPR2KR
 GiURi33PnjH+5pO5HsvgVX/wQYvQi7Xl+har56CEqYeEd5njTqlC2wPBtSCNDrFSi+OQ==
X-Google-Smtp-Source: AGHT+IE2w9CHGbpq+LeNy0kdEpV/YWiBXcdw3WQkx90pO0ZjH7hAgYPS0fPDDB4xQIq5a+0Wsr32wIzB00yDtzie80s=
X-Received: by 2002:a05:651c:31cf:b0:30b:f2d6:8aab with SMTP id
 38308e7fff4ca-328097806dbmr53261101fa.32.1747742997071; Tue, 20 May 2025
 05:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250519104010.C2AF383BC0@busybox.osuosl.org>
In-Reply-To: <20250519104010.C2AF383BC0@busybox.osuosl.org>
Date: Tue, 20 May 2025 14:09:45 +0200
X-Gm-Features: AX0GCFtCzpefjwjHQcjjY_9H4TpovNp8tuf6gVnzBkZVgsDNpvadHcG6u5h4GsM
Message-ID: <CAAE6iEWEdBZ4=_=4hbBROBdRcGPNh8NVMqz=jNdj99cmA4hXzA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1747742997; x=1748347797; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p4fO/LWIZtDmVv4qJneMwlQ71altjuy9k0OiR4ItPIQ=;
 b=Ex2xZ2gjD6drnDEhATemaQ1DZ1CF0TvskBY58Xxf926U7OGnwMA0DNRp5dRegSbVkQ
 JrNstPBHvUSqcb05l5VBJzmNTDiSw5seCbPtPAvE2kbdaC7toatINgETQPp3MXnGZYvb
 uf1WCWE3BCIzk4D4nZA4k/14/2nHMm8QQQAmnkigssoUOQ/89qRy0PiOg33SCzVgMPBB
 Y8klI8mdAkbtolT7ZZ2/O2vqtG6mypgxTGAMDIQiTgaQnaNCr4T6BOby4qVyhsCnyrfy
 fsaQiiNZY4U4kCKJ5owXMPyuWkoCX2Ba1KD7YvjFIZdZx2TBjAaDZO0zvB6RW6NtRR9b
 fzXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=Ex2xZ2gj
Subject: Re: [Buildroot] [git commit branch/next]
 docs/manual/customize-directory-structure.adoc: suggest a custom top
 Makefile
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
From: =?utf-8?q?Fran=C3=A7ois_Perrad_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Content-Type: multipart/mixed; boundary="===============3988846870720391700=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3988846870720391700==
Content-Type: multipart/alternative; boundary="0000000000008022bb0635902052"

--0000000000008022bb0635902052
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 19 mai 2025 =C3=A0 13:06, Arnout Vandecappelle via buildroot <
buildroot@buildroot.org> a =C3=A9crit :

> commit:
> https://git.buildroot.net/buildroot/commit/?id=3D36f9436488c5fc640836eda9=
6799305e114c6e9d
> branch: https://git.buildroot.net/buildroot/commit/?id=3Drefs/heads/next
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> [Arnout: give a bit more explanation, simplify the example]
> Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
> ---
>  docs/manual/customize-directory-structure.adoc | 42
> ++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/docs/manual/customize-directory-structure.adoc
> b/docs/manual/customize-directory-structure.adoc
> index e0eecb5641..b4b5d50e1a 100644
> --- a/docs/manual/customize-directory-structure.adoc
> +++ b/docs/manual/customize-directory-structure.adoc
> @@ -49,6 +49,7 @@ to you.
>  |           +-- package2.mk
>  |
>  +-- Config.in (if using a br2-external tree)
> ++-- Makefile (if using a custom top makefile)
>  +-- external.mk (if using a br2-external tree)
>  +-- external.desc (if using a br2-external tree)
>  ----
> @@ -109,3 +110,44 @@ BR2_GLOBAL_PATCH_DIR=3D"board/<company>/common/patch=
es
> board/<company>/fooboard/pa
>
>  then first the patches from the 'common' layer would be applied,
>  followed by the patches from the 'fooboard' layer.
> +
> +=3D=3D=3D=3D Custom top Makefile
> +
> +You normally launch Buildroot from the buildroot source directory,
> pointing
> ++BR2_EXTERNAL+ and +O+ to the right places for the build you want to mak=
e.
> +You can simplify this by adding a Makefile to your br2-external that set=
s
> +these variables and calls into buildroot.
> +
> +You can add additional, custom rules to this Makefile for various tasks
> you
> +need to perform, e.g. integrate multiple configurations into a single
> image,
> +upload to a release server or to a test device, include multiple
> +br2-external configurations, etc.
> +
> +A basic Makefile looks like this. It assumes the buildroot source is
> available
> +(e.g. as a git submodule) in the +buildroot+ subdirectory. It makes sure
> that
> +the download directory is shared between different builds, and it
> organizes
> +the output directories in a structure under +outputs/+.
>

typo, s/outputs/output/;


> +
> +----
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# Avoid surprises by disabling default rules
> +MAKEFLAGS +=3D --no-builtin-rules
> +.SUFFIXES:
> +
> +THIS_EXTERNAL_PATH :=3D $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
>

why creating this variable THIS_EXTERNAL_PATH instead of using the builtin
one CURDIR ?

Fran=C3=A7ois


> +
> +# Put downloads in this directory instead of in the Buildroot directory
> +ifeq ($(BR2_DL_DIR),)
> +BR2_DL_DIR =3D $(THIS_EXTERNAL_PATH)/dl
> +endif
> +
> +OUTPUT_BASEDIR =3D $(THIS_EXTERNAL_PATH)/output
> +OUTPUT_DIR =3D $(OUTPUT_BASEDIR)/$(patsubst %_defconfig,%,$@)
> +
> +MAKE_BUILDROOT =3D $(MAKE) -C $(THIS_EXTERNAL_PATH)/buildroot
> BR2_EXTERNAL=3D$(THIS_EXTERNAL_PATH)
> +
> +%: $(THIS_EXTERNAL_PATH)/configs/%
> +       $(MAKE_BUILDROOT) O=3D$(OUTPUT_DIR) $@
> +       sed -i /^BR2_DL_DIR=3D.*/s%%BR2_DL_DIR=3D$(BR2_DL_DIR)%
> $(OUTPUT_DIR)/.config
> +----
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000008022bb0635902052
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=
=C2=A0lun. 19 mai 2025 =C3=A0=C2=A013:06, Arnout Vandecappelle via buildroo=
t &lt;<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroo=
t@buildroot.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">commit: <a href=3D"https://git.buildroot.net/bu=
ildroot/commit/?id=3D36f9436488c5fc640836eda96799305e114c6e9d" rel=3D"noref=
errer" target=3D"_blank">https://git.buildroot.net/buildroot/commit/?id=3D3=
6f9436488c5fc640836eda96799305e114c6e9d</a><br>
branch: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Drefs/he=
ads/next" rel=3D"noreferrer" target=3D"_blank">https://git.buildroot.net/bu=
ildroot/commit/?id=3Drefs/heads/next</a><br>
<br>
Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@gadz.o=
rg" target=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
[Arnout: give a bit more explanation, simplify the example]<br>
Signed-off-by: Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@rnout.be" =
target=3D"_blank">arnout@rnout.be</a>&gt;<br>
---<br>
=C2=A0docs/manual/customize-directory-structure.adoc | 42 +++++++++++++++++=
+++++++++<br>
=C2=A01 file changed, 42 insertions(+)<br>
<br>
diff --git a/docs/manual/customize-directory-structure.adoc b/docs/manual/c=
ustomize-directory-structure.adoc<br>
index e0eecb5641..b4b5d50e1a 100644<br>
--- a/docs/manual/customize-directory-structure.adoc<br>
+++ b/docs/manual/customize-directory-structure.adoc<br>
@@ -49,6 +49,7 @@ to you.<br>
=C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+-- <a href=3D"http://packa=
ge2.mk" rel=3D"noreferrer" target=3D"_blank">package2.mk</a><br>
=C2=A0|<br>
=C2=A0+-- Config.in (if using a br2-external tree)<br>
++-- Makefile (if using a custom top makefile)<br>
=C2=A0+-- <a href=3D"http://external.mk" rel=3D"noreferrer" target=3D"_blan=
k">external.mk</a> (if using a br2-external tree)<br>
=C2=A0+-- external.desc (if using a br2-external tree)<br>
=C2=A0----<br>
@@ -109,3 +110,44 @@ BR2_GLOBAL_PATCH_DIR=3D&quot;board/&lt;company&gt;/com=
mon/patches board/&lt;company&gt;/fooboard/pa<br>
<br>
=C2=A0then first the patches from the &#39;common&#39; layer would be appli=
ed,<br>
=C2=A0followed by the patches from the &#39;fooboard&#39; layer.<br>
+<br>
+=3D=3D=3D=3D Custom top Makefile<br>
+<br>
+You normally launch Buildroot from the buildroot source directory, pointin=
g<br>
++BR2_EXTERNAL+ and +O+ to the right places for the build you want to make.=
<br>
+You can simplify this by adding a Makefile to your br2-external that sets<=
br>
+these variables and calls into buildroot.<br>
+<br>
+You can add additional, custom rules to this Makefile for various tasks yo=
u<br>
+need to perform, e.g. integrate multiple configurations into a single imag=
e,<br>
+upload to a release server or to a test device, include multiple<br>
+br2-external configurations, etc.<br>
+<br>
+A basic Makefile looks like this. It assumes the buildroot source is avail=
able<br>
+(e.g. as a git submodule) in the +buildroot+ subdirectory. It makes sure t=
hat<br>
+the download directory is shared between different builds, and it organize=
s<br>
+the output directories in a structure under +outputs/+.<br></blockquote><d=
iv><br></div><div>typo, s/outputs/output/;</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
+<br>
+----<br>
+# SPDX-License-Identifier: GPL-2.0<br>
+<br>
+# Avoid surprises by disabling default rules<br>
+MAKEFLAGS +=3D --no-builtin-rules<br>
+.SUFFIXES:<br>
+<br>
+THIS_EXTERNAL_PATH :=3D $(abspath $(dir $(lastword $(MAKEFILE_LIST))))<br>=
</blockquote><div><br></div><div>why creating this variable THIS_EXTERNAL_P=
ATH instead of using the builtin one CURDIR ?</div><div><br></div><div>Fran=
=C3=A7ois</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
+<br>
+# Put downloads in this directory instead of in the Buildroot directory<br=
>
+ifeq ($(BR2_DL_DIR),)<br>
+BR2_DL_DIR =3D $(THIS_EXTERNAL_PATH)/dl<br>
+endif<br>
+<br>
+OUTPUT_BASEDIR =3D $(THIS_EXTERNAL_PATH)/output<br>
+OUTPUT_DIR =3D $(OUTPUT_BASEDIR)/$(patsubst %_defconfig,%,$@)<br>
+<br>
+MAKE_BUILDROOT =3D $(MAKE) -C $(THIS_EXTERNAL_PATH)/buildroot BR2_EXTERNAL=
=3D$(THIS_EXTERNAL_PATH)<br>
+<br>
+%: $(THIS_EXTERNAL_PATH)/configs/%<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE_BUILDROOT) O=3D$(OUTPUT_DIR) $@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i /^BR2_DL_DIR=3D.*/s%%BR2_DL_DIR=3D$(BR2_=
DL_DIR)% $(OUTPUT_DIR)/.config<br>
+----<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>
</div>
</div>

--0000000000008022bb0635902052--

--===============3988846870720391700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3988846870720391700==--
