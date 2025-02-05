Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64175C02196
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 20:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF8DD60F25;
	Wed,  5 Feb 2025 20:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8e-6rNQNehDA; Wed,  5 Feb 2025 20:30:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C58AA60F31
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C58AA60F31;
	Wed,  5 Feb 2025 20:30:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 65357CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 20:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2591760F31
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 20:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lxPtcdA6HtqK for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 20:30:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2c; helo=mail-oo1-xc2c.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F022060F25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F022060F25
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F022060F25
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 20:30:35 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-5f4cc48ab37so52761eaf.1
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 12:30:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738787435; x=1739392235;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/a7vbouWDaPJx0qXIEb0ZdoaeA2xgwK5RCznPwzOou4=;
 b=oCjT26KaZaofgmybICDug1tzps3JFDDqluihzy7OIwp0OSF1WuolKJa/m1KGJ2lBYl
 BbbPJgnyHY2mFM8UPjhz1Y1HDFC0WWOxxTqTE6uKD5TQqYYG8W1KU6PC6Vf+x9g6v80I
 +E0uP/52GKAx4dw04gdF9ohcDjXHHJkmMJPr/y3WlDp4Ron9D11m0FAWUAp9whgsCwqH
 GKSKK19FedYwbWHNZriW1BQYODZJ+CtNDSxdDsfH8CnFDZpsIWcoetaAArAL75rEpdyC
 yOyK/7y46ow7nt8YbXn6dbaM6ltuZXg09rDzckyeupa6EnIocISbaZc+tdzhX2/QnPky
 fLRg==
X-Gm-Message-State: AOJu0YynBLsG4ycyADQXSjfZajngmyzMty6JIz0ukDDg83zRf2ax5YX1
 M2zjb2VzIoXCm0D959tiuoyL4rL4pdI/aB3diyGwJDqBeFh06ergqe8z101E3b1C8J/PBO6htt/
 J
X-Gm-Gg: ASbGnctDN7BM1WH5ery7Zd9Qun1f+apGFqRw7qsRSLzswrTX/nvY64s6aNJJMB9u5CK
 S/JM4sNQuQrYbhEJwDZbaZFxEmsZ0eCHUQTNlzB3qghZv2bLRWs6KvJD9LekUjnIopl+pTjiy0J
 0GvSjGdZCGKHlaO0J5d/FpQlIvmezsajqccYpaV5yCfZSeITCmZPUWUJngR43dvIR4UaFg+bNkL
 Chx8y0NEzYALnngfZeQv9FHcY7TO4I7HLkJl7G2wpyPtGEey/Ke+kNdYoK2IkBw/ei8mqbvpYBr
 EWQxBDokJwN69P+EFUdPaMB7TNUoijGrK/JPn31B08w+40DxmwWt/PI=
X-Google-Smtp-Source: AGHT+IGk43ltPB/Goyn49iVuL+0d5hwhlSJNQT+3TW72VOw/icyUYbsIP5bJFy4TRSdpk31EfOmxLw==
X-Received: by 2002:a05:6870:9108:b0:29e:503a:7ea3 with SMTP id
 586e51a60fabf-2b80519d7bamr3085504fac.36.1738787434813; 
 Wed, 05 Feb 2025 12:30:34 -0800 (PST)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com.
 [209.85.160.41]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2b356196935sm4853005fac.17.2025.02.05.12.30.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 12:30:34 -0800 (PST)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-2b7f9158b97so46421fac.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 12:30:33 -0800 (PST)
X-Received: by 2002:a05:6870:d62a:b0:29f:97af:a1a0 with SMTP id
 586e51a60fabf-2b805136098mr2758653fac.24.1738787433687; Wed, 05 Feb 2025
 12:30:33 -0800 (PST)
MIME-Version: 1.0
References: <20250205135825.2310972-1-fiona.klute@gmx.de>
In-Reply-To: <20250205135825.2310972-1-fiona.klute@gmx.de>
Date: Wed, 5 Feb 2025 12:30:22 -0800
X-Gmail-Original-Message-ID: <CA+h8R2qBgCGkb18BLgbKY8g6V+VE6LfwJfKsy0t7Txk7HEK6RQ@mail.gmail.com>
X-Gm-Features: AWEUYZkJMkh4xbQ6my_N7BF5CZ9lPg1DsOhQ-vzm6HAxsaWlPtobFQqYTnDjhk0
Message-ID: <CA+h8R2qBgCGkb18BLgbKY8g6V+VE6LfwJfKsy0t7Txk7HEK6RQ@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738787435; x=1739392235; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/a7vbouWDaPJx0qXIEb0ZdoaeA2xgwK5RCznPwzOou4=;
 b=mhtTj4co+Wr7LUEAe6moL4kPCv5FJ7zQ5VIPliBeclwbSEX8B+Ygf63uImBd6+ayJE
 z3ussfSo4s3DcVacXmf6988ARh+H1JIAS14RpmfTaM/2KP5z9E9FAxlQ9+bjCGvak7Fb
 Cg6gfcxRGlEKx/onFXGxr1aB24b8unZGvozgQK0/BESp/1iXrH8ulFwyVWtkcU1fGwfi
 3E2ntyaEhPEsQlgWLQM1Z05e6G64UEtcztosXZZlQ9WC26LhwAxjcd7AxmIESGeQAV9S
 153+JZnRyLtbq664PwE3R1DAXdSG17PJJDQVibKJauMD8IM2nwLF2A4cFvcE8+3y+eMx
 fwZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=mhtTj4co
Subject: Re: [Buildroot] [PATCH v3 1/3] package/pkg-golang: allow packages
 to provide extldflags
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: yann.morin@orange.com, Thomas Perale <thomas.perale@mind.be>,
 Nathaniel Roach <nroach44@nroach44.id.au>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============3569369954971554767=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3569369954971554767==
Content-Type: multipart/alternative; boundary="000000000000533c34062d6aff0d"

--000000000000533c34062d6aff0d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fiona,

Looks great!

On Wed, Feb 5, 2025, 5:58=E2=80=AFAM Fiona Klute <fiona.klute@gmx.de> wrote=
:

> From: "Yann E. MORIN" <yann.morin@orange.com>
>
> Currently, only the -static extldflags may be set in the
> golang-package infra. However, in some cases, it might be necessary to
> pass other flags, either because they are needed on a specific
> architecture, or a specific C library; packages may also have a need
> to pass arbitrary linker flags when they use CGO linking.
>
> For example, on AArch64, go forcibly uses ld.gold, but it is not
> available in all toolchains, and ld.bfd works nowadays (following
> patch); another case is musl, where PIE is not supported with go.
>
> Introduce FOO_EXTLDFLAGS, which we use to set those flags, and that
> packages can set to pass such flags.
>
> Migrate the current setting of -static to use that new variable.
>
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Tested-by: Nathaniel Roach <nroach44@nroach44.id.au>
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
> Changes v2 -> v3 (Fiona):
> * Update commit message as provided by Yann via Buildroot ML
>
>  docs/manual/adding-packages-golang.adoc | 6 ++++--
>  package/pkg-golang.mk                   | 6 +++++-
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/docs/manual/adding-packages-golang.adoc
> b/docs/manual/adding-packages-golang.adoc
> index aa25426591..6de0916a83 100644
> --- a/docs/manual/adding-packages-golang.adoc
> +++ b/docs/manual/adding-packages-golang.adoc
> @@ -84,8 +84,10 @@ therefore only use a few of them, or none.
>    infrastructure will automatically generate a minimal +go.mod+ file
>    in the package source tree if it doesn't exist.
>
> -* +FOO_LDFLAGS+ and +FOO_TAGS+ can be used to pass respectively the
> -  +LDFLAGS+ or the +TAGS+ to the +go+ build command.
> +* +FOO_LDFLAGS+, +FOO_EXTLDFLAGS+, and +FOO_TAGS+ can be used to pass
> +  respectively the go +LDFLAGS+ (via the `-ldflags` command line flag),
> +  the external linker flags +EXTLDFLAGS+ (via the `-extldflags`
> +  command line flag), or the +TAGS+ to the +go+ build command.
>
>  * +FOO_BUILD_TARGETS+ can be used to pass the list of targets that
>    should be built. If +FOO_BUILD_TARGETS+ is not specified, it
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index 33cf9bfb1a..a3421af288 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -114,10 +114,14 @@ ifndef $(2)_BUILD_CMDS
>  ifeq ($(4),target)
>
>  ifeq ($(BR2_STATIC_LIBS),y)
> -$(2)_LDFLAGS +=3D -extldflags '-static'
> +$(2)_EXTLDFLAGS +=3D -static
>  $(2)_TAGS +=3D osusergo netgo
>  endif
>
> +ifneq ($$($(2)_EXTLDFLAGS),)
> +$(2)_LDFLAGS +=3D -extldflags '$$($(2)_EXTLDFLAGS)'
> +endif
> +
>  # Build package for target
>  define $(2)_BUILD_CMDS
>         $$(foreach d,$$($(2)_BUILD_TARGETS),\
> --
> 2.47.2
>

Thanks,

Reviewed-by: Christian Stewart <christian@aperture.us>

--000000000000533c34062d6aff0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Hi Fiona,</div><div dir=3D"auto"><br></=
div><div>Looks great!<br><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Wed, Feb 5, 2025, 5:58=E2=80=AFAM Fiona Klute &lt;<a =
href=3D"mailto:fiona.klute@gmx.de" target=3D"_blank" rel=3D"noreferrer">fio=
na.klute@gmx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From=
: &quot;Yann E. MORIN&quot; &lt;<a href=3D"mailto:yann.morin@orange.com" re=
l=3D"noreferrer noreferrer" target=3D"_blank">yann.morin@orange.com</a>&gt;=
<br>
<br>
Currently, only the -static extldflags may be set in the<br>
golang-package infra. However, in some cases, it might be necessary to<br>
pass other flags, either because they are needed on a specific<br>
architecture, or a specific C library; packages may also have a need<br>
to pass arbitrary linker flags when they use CGO linking.<br>
<br>
For example, on AArch64, go forcibly uses ld.gold, but it is not<br>
available in all toolchains, and ld.bfd works nowadays (following<br>
patch); another case is musl, where PIE is not supported with go.<br>
<br>
Introduce FOO_EXTLDFLAGS, which we use to set those flags, and that<br>
packages can set to pass such flags.<br>
<br>
Migrate the current setting of -static to use that new variable.<br>
<br>
Signed-off-by: Yann E. MORIN &lt;<a href=3D"mailto:yann.morin@orange.com" r=
el=3D"noreferrer noreferrer" target=3D"_blank">yann.morin@orange.com</a>&gt=
;<br>
Tested-by: Nathaniel Roach &lt;<a href=3D"mailto:nroach44@nroach44.id.au" r=
el=3D"noreferrer noreferrer" target=3D"_blank">nroach44@nroach44.id.au</a>&=
gt;<br>
Signed-off-by: Fiona Klute (WIWA) &lt;<a href=3D"mailto:fiona.klute@gmx.de"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">fiona.klute@gmx.de</a>&gt;=
<br>
---<br>
Changes v2 -&gt; v3 (Fiona):<br>
* Update commit message as provided by Yann via Buildroot ML<br>
<br>
=C2=A0docs/manual/adding-packages-golang.adoc | 6 ++++--<br>
=C2=A0package/<a href=3D"http://pkg-golang.mk" rel=3D"noreferrer noreferrer=
 noreferrer" target=3D"_blank">pkg-golang.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++++-<br>
=C2=A02 files changed, 9 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/docs/manual/adding-packages-golang.adoc b/docs/manual/adding-p=
ackages-golang.adoc<br>
index aa25426591..6de0916a83 100644<br>
--- a/docs/manual/adding-packages-golang.adoc<br>
+++ b/docs/manual/adding-packages-golang.adoc<br>
@@ -84,8 +84,10 @@ therefore only use a few of them, or none.<br>
=C2=A0 =C2=A0infrastructure will automatically generate a minimal +go.mod+ =
file<br>
=C2=A0 =C2=A0in the package source tree if it doesn&#39;t exist.<br>
<br>
-* +FOO_LDFLAGS+ and +FOO_TAGS+ can be used to pass respectively the<br>
-=C2=A0 +LDFLAGS+ or the +TAGS+ to the +go+ build command.<br>
+* +FOO_LDFLAGS+, +FOO_EXTLDFLAGS+, and +FOO_TAGS+ can be used to pass<br>
+=C2=A0 respectively the go +LDFLAGS+ (via the `-ldflags` command line flag=
),<br>
+=C2=A0 the external linker flags +EXTLDFLAGS+ (via the `-extldflags`<br>
+=C2=A0 command line flag), or the +TAGS+ to the +go+ build command.<br>
<br>
=C2=A0* +FOO_BUILD_TARGETS+ can be used to pass the list of targets that<br=
>
=C2=A0 =C2=A0should be built. If +FOO_BUILD_TARGETS+ is not specified, it<b=
r>
diff --git a/package/<a href=3D"http://pkg-golang.mk" rel=3D"noreferrer nor=
eferrer noreferrer" target=3D"_blank">pkg-golang.mk</a> b/package/<a href=
=3D"http://pkg-golang.mk" rel=3D"noreferrer noreferrer noreferrer" target=
=3D"_blank">pkg-golang.mk</a><br>
index 33cf9bfb1a..a3421af288 100644<br>
--- a/package/<a href=3D"http://pkg-golang.mk" rel=3D"noreferrer noreferrer=
 noreferrer" target=3D"_blank">pkg-golang.mk</a><br>
+++ b/package/<a href=3D"http://pkg-golang.mk" rel=3D"noreferrer noreferrer=
 noreferrer" target=3D"_blank">pkg-golang.mk</a><br>
@@ -114,10 +114,14 @@ ifndef $(2)_BUILD_CMDS<br>
=C2=A0ifeq ($(4),target)<br>
<br>
=C2=A0ifeq ($(BR2_STATIC_LIBS),y)<br>
-$(2)_LDFLAGS +=3D -extldflags &#39;-static&#39;<br>
+$(2)_EXTLDFLAGS +=3D -static<br>
=C2=A0$(2)_TAGS +=3D osusergo netgo<br>
=C2=A0endif<br>
<br>
+ifneq ($$($(2)_EXTLDFLAGS),)<br>
+$(2)_LDFLAGS +=3D -extldflags &#39;$$($(2)_EXTLDFLAGS)&#39;<br>
+endif<br>
+<br>
=C2=A0# Build package for target<br>
=C2=A0define $(2)_BUILD_CMDS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $$(foreach d,$$($(2)_BUILD_TARGETS),\<br>
-- <br>
2.47.2<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Thanks,</div><div dir=3D"auto"><br></div><div dir=3D"auto">Reviewed-b=
y: Christian Stewart &lt;<a href=3D"mailto:christian@aperture.us">christian=
@aperture.us</a>&gt;</div></div>

--000000000000533c34062d6aff0d--

--===============3569369954971554767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3569369954971554767==--
