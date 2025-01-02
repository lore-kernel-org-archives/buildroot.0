Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDB2E77194
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 09:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF3AD403E7;
	Thu,  2 Jan 2025 09:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cunwq0D5z0gc; Thu,  2 Jan 2025 09:45:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5618C403D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5618C403D5;
	Thu,  2 Jan 2025 09:45:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0026F27
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 09:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1AB3403CE
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 09:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rk0tJsNb_NRW for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 09:45:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5F992403D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F992403D5
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F992403D5
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 09:45:48 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2ee8e8e29f6so12476312a91.0
 for <buildroot@buildroot.org>; Thu, 02 Jan 2025 01:45:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735811147; x=1736415947;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qR1N6+cbtTyHz/TljNyh1Q514uJ/JXG/Rp4ebRDAnLY=;
 b=VH74ORld2TK6izJC/QFrsu2lMjxSqhgIfcr/hP9P2UCoYE2vRUT2Mu6novt2nAhXYc
 cBHYiKsziSILrZsY0H4XM5CpANdVMCOfe+egApEUAh1u21WYLL7MPu+/NXOvEWAo+GPh
 wF12sBmjOdWpo9BtcOo/t2WC7pCXjoUZRTCVooZ4caCNgrDTEO7EM7FMKNVrokp3am9p
 MpLZrPl/6WzUbtyJcnXhKyBz+z2vBPzv2S2/cB/WtW+B2YrpdCZ9QzQtv59KM0RVgDnv
 Yj2l/uOxBw6k9UE7zBMkHhqZH3LSTZCNIG36gyJxKaKSluTY7Pn1vjkDwiOHs3vlXsMX
 tTkQ==
X-Gm-Message-State: AOJu0YyLcHs0HSXrST0NU2BV2JtkHXJzIXBrHOHjndRtWBxv1tU+slhT
 TCcdD0AAJeo9m6bpfMCuomXjvLiFoTracRyvK2SMuWBD5Vm9pO/RPpee8AZ92U/8L3CPKEQpz6+
 goKugjTbDT6umqvGnrCQN+5kA5nZZ82FEpY4KKgscBIA6jY3xMrQg
X-Gm-Gg: ASbGnctsLIf3qNgx+7XkHa0lqLUyON6iV/FaZJ56wnxB3Ndx/FCDbgTfuP/GhHtk9M8
 4xy2Yxq9cGm/d/sZjEpdyQPbJGns7M/lwOQJOtqu40ZcujdjIXGRnUy4/lXzl+Re/tMOEtfs=
X-Google-Smtp-Source: AGHT+IHPVwklMjIs3vHAena60g1kej+7VyDctZLaWZeeo9SHPW0b3aSeNBuRxadhBRaXToXBQ4eOF0A5rEw6D0BMEXc=
X-Received: by 2002:a17:90b:3d50:b0:2ee:b4bf:2d06 with SMTP id
 98e67ed59e1d1-2f452e458ccmr66631438a91.19.1735811147463; Thu, 02 Jan 2025
 01:45:47 -0800 (PST)
MIME-Version: 1.0
References: <20250101202112.1845113-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20250101202112.1845113-1-thomas.petazzoni@bootlin.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 2 Jan 2025 10:45:36 +0100
Message-ID: <CAAE6iEVZyYzizNbqd1koGCvna9EmTzkX7PpBKm6=07pdWVkV3Q@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1735811147; x=1736415947; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qR1N6+cbtTyHz/TljNyh1Q514uJ/JXG/Rp4ebRDAnLY=;
 b=TadV/73gCYe8Ht9WIlq506c2I1IUz3LyQzqQcPm18r+Re1Co+6yAHNO5SgKserBlDJ
 qITrJg8EPmN9wsTCrWfdFcD+sGEOLuAxYjK3ZOGujWdDNarchbsZCbfx4JO+VaqzrJuy
 pLscYPIuxkU/JtQxK1T09E3tWON+/UQUP6OLG87YExUj15IZw7h7xSFEmqNG8tPIF8HJ
 5FyEtCYPCzjn5Xc92SNQy813w2JljaUhvbIUWR1GVDseOHEmb0fK5+uxXCM/KuFXi7BH
 bv15/bqSzlQcZbFpZ+T/c/gx7XT0zEM8wgWeW4SN4UKMWoLUqM+OY4KZjtAfYG7P5vzR
 962A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=TadV/73g
Subject: Re: [Buildroot] [PATCH] package/perl: properly pass CFLAGS/LDFLAGS
 when building host-perl
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
Content-Type: multipart/mixed; boundary="===============6132553214457820381=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6132553214457820381==
Content-Type: multipart/alternative; boundary="000000000000d8165d062ab606f1"

--000000000000d8165d062ab606f1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 1 janv. 2025 =C3=A0 21:21, Thomas Petazzoni <thomas.petazzoni@bootl=
in.com>
a =C3=A9crit :

> HOST_CFLAGS and HOST_LDFLAGS are currently not accounted for when
> building host-perl. In particular, it means that executables
> built/installed by host-perl do not have a RPATH pointing to
> HOST_DIR/lib, which can cause issues as libcrypt.so can now be
> provided by host-libxcrypt.
>
> This was causing check-host-rpath to complain in the situation where:
>
> 1. host-perl was built, with no RPATH, linked against the system
>    libcrypt.so
>
> 2. host-libxcrypt was built afterwards, installed as
>    HOST_DIR/lib/libcrypt.so, which made check-host-rpath complain as
>    HOST_DIR/bin/perl is linked against a library present in
>    HOST_DIR/lib but doesn't have a RPATH to HOST_DIR/lib
>
> Fixes:
>
>
> http://autobuild.buildroot.net/results/d4348d7f872ccd734795a1d071960a6961=
48ed6a/
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>

Acked-by: Francois Perrad <francois.perrad@gadz.org>


> ---
>  package/perl/perl.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index 0f7038a048..dc7c0b8d42 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -98,7 +98,9 @@ endef
>  HOST_PERL_CONF_OPTS =3D \
>         -des \
>         -Dprefix=3D"$(HOST_DIR)" \
> -       -Dcc=3D"$(HOSTCC)"
> +       -Dcc=3D"$(HOSTCC)" \
> +       -Dccflags=3D"$(HOST_CFLAGS)" \
> +       -Dldflags=3D"$(HOST_LDFLAGS)"
>
>  define HOST_PERL_CONFIGURE_CMDS
>         (cd $(@D); $(HOST_MAKE_ENV) HOSTCC=3D'$(HOSTCC_NOCCACHE)' \
> --
> 2.47.1
>
>

--000000000000d8165d062ab606f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 1 =
janv. 2025 =C3=A0=C2=A021:21, Thomas Petazzoni &lt;<a href=3D"mailto:thomas=
.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">HOST_CFL=
AGS and HOST_LDFLAGS are currently not accounted for when<br>
building host-perl. In particular, it means that executables<br>
built/installed by host-perl do not have a RPATH pointing to<br>
HOST_DIR/lib, which can cause issues as libcrypt.so can now be<br>
provided by host-libxcrypt.<br>
<br>
This was causing check-host-rpath to complain in the situation where:<br>
<br>
1. host-perl was built, with no RPATH, linked against the system<br>
=C2=A0 =C2=A0libcrypt.so<br>
<br>
2. host-libxcrypt was built afterwards, installed as<br>
=C2=A0 =C2=A0HOST_DIR/lib/libcrypt.so, which made check-host-rpath complain=
 as<br>
=C2=A0 =C2=A0HOST_DIR/bin/perl is linked against a library present in<br>
=C2=A0 =C2=A0HOST_DIR/lib but doesn&#39;t have a RPATH to HOST_DIR/lib<br>
<br>
Fixes:<br>
<br>
=C2=A0 <a href=3D"http://autobuild.buildroot.net/results/d4348d7f872ccd7347=
95a1d071960a696148ed6a/" rel=3D"noreferrer" target=3D"_blank">http://autobu=
ild.buildroot.net/results/d4348d7f872ccd734795a1d071960a696148ed6a/</a><br>
<br>
Signed-off-by: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@boot=
lin.com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br></blockq=
uote><div><br></div><div>Acked-by: Francois Perrad &lt;<a href=3D"mailto:fr=
ancois.perrad@gadz.org">francois.perrad@gadz.org</a>&gt;</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0package/perl/<a href=3D"http://perl.mk" rel=3D"noreferrer" target=3D"=
_blank">perl.mk</a> | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/package/perl/<a href=3D"http://perl.mk" rel=3D"noreferrer" tar=
get=3D"_blank">perl.mk</a> b/package/perl/<a href=3D"http://perl.mk" rel=3D=
"noreferrer" target=3D"_blank">perl.mk</a><br>
index 0f7038a048..dc7c0b8d42 100644<br>
--- a/package/perl/<a href=3D"http://perl.mk" rel=3D"noreferrer" target=3D"=
_blank">perl.mk</a><br>
+++ b/package/perl/<a href=3D"http://perl.mk" rel=3D"noreferrer" target=3D"=
_blank">perl.mk</a><br>
@@ -98,7 +98,9 @@ endef<br>
=C2=A0HOST_PERL_CONF_OPTS =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -des \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dprefix=3D&quot;$(HOST_DIR)&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcc=3D&quot;$(HOSTCC)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcc=3D&quot;$(HOSTCC)&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dccflags=3D&quot;$(HOST_CFLAGS)&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dldflags=3D&quot;$(HOST_LDFLAGS)&quot;<br>
<br>
=C2=A0define HOST_PERL_CONFIGURE_CMDS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (cd $(@D); $(HOST_MAKE_ENV) HOSTCC=3D&#39;$(HOS=
TCC_NOCCACHE)&#39; \<br>
-- <br>
2.47.1<br>
<br>
</blockquote></div></div>

--000000000000d8165d062ab606f1--

--===============6132553214457820381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6132553214457820381==--
