Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28BEC27C4F
	for <buildroot@archiver.kernel.org>; Wed, 26 Jun 2024 15:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47CE360C10;
	Wed, 26 Jun 2024 15:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GPmdoF1TlZza; Wed, 26 Jun 2024 15:29:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE482607B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE482607B3;
	Wed, 26 Jun 2024 15:29:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B5DF1BF3F2
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 15:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52D3580DDC
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 15:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUbVnBJYGgb4 for <buildroot@lists.busybox.net>;
 Wed, 26 Jun 2024 15:29:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA8F580DDA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA8F580DDA
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA8F580DDA
 for <buildroot@buildroot.org>; Wed, 26 Jun 2024 15:29:32 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-dff1ccdc17bso7240845276.0
 for <buildroot@buildroot.org>; Wed, 26 Jun 2024 08:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719415771; x=1720020571;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HTgtQ52lMZv22mHRMXAxBP8bxqobHLZ2QvMj4ca4Shc=;
 b=Ter9IBRWb4G8wmEMnUSpyWi8ZMNn+0ZEjapXI1wwbeukzFUqERNcbEsbPfB8hSNlVb
 +I8pqu93QreIk77hKxI9hC37sJ5SV6e3FJyABjGL0JSKWu6QdCboQkHl+zmoQmhjNX2K
 HxpkRsqZP7yqoyTkBSmDkNCZNrproDEiomoaW59w3n4sxQK5VvFiYp1ai/MaIpEZYBMx
 DT8l7Z5LJwnnyMflwaHFPQdb0UE7fQrQmdMvdEkodwm0KnBSonlNo8dX6FfPEEWUncWx
 cQvNA+MLE63Uk9RPBdpO9oxi2YB+ZmvUJDFTNEcGugPjZdHWS/YqYnSuAkFP/FF/RVnF
 nJHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkRRFWU2dTa5sVtpB5MotTbViJs4NTjxRcmWafA7ql7zLfj+Q0fsmXk+LeN96KFwdfYobo/hFXu7TsLf7dG8+0SxUzE0xj+Q==
X-Gm-Message-State: AOJu0YzIMCYchgN0SGCxaeTlobcOFYfOiDTd1GAYrq3jb6YAcnoFuGiP
 aRXJvPb8MCYsDOZCjOqrjHp+dyIlvEEmAHXU2UwFgtRM4Wfw+GVX4wSGMpzSazeK04ZVLxlyU0J
 OEtuuk1oKYFKjnutDT6lWWdqNk970ik0MkxhGmw==
X-Google-Smtp-Source: AGHT+IHuTP7kr6v3+6d5+fbOBgRTN2EfBM/5wQLEBxckOpMBi80gGX5Ptq42aKMd+sgqA2cMPjd3TBxKfxT6zWl0BAc=
X-Received: by 2002:a25:21c5:0:b0:e02:b415:fb14 with SMTP id
 3f1490d57ef6-e02fc2cfcd3mr11548380276.38.1719415770633; Wed, 26 Jun 2024
 08:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240626145942.3154406-1-fiona.klute@gmx.de>
In-Reply-To: <20240626145942.3154406-1-fiona.klute@gmx.de>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 26 Jun 2024 17:29:19 +0200
Message-ID: <CABGWkvoOTM9g3AYsGOAJB_yfQ_xY=XFBZopP9cJcWJz-DNUQuw@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1719415771; x=1720020571;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HTgtQ52lMZv22mHRMXAxBP8bxqobHLZ2QvMj4ca4Shc=;
 b=ahxDYuIFc23HpJxW6Cinvfd1nk7lFqonVUJG0r0IFQKttZ1tNxigT1N0z15OGVsIV1
 MrFImYrO4hZlSXxTB1JC9MyIZRJ1r16Do4DENJpZh61ZMS6l7YCOi9YsUHODhda1nngA
 M+Y05cGz73dcLziRgcE56qhn7tt0GHP6NAJnk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ahxDYuIF
Subject: Re: [Buildroot] [PATCH 1/1] package/rauc: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org,
 Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: multipart/mixed; boundary="===============1073523898072693970=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1073523898072693970==
Content-Type: multipart/alternative; boundary="0000000000003af0c8061bccae81"

--0000000000003af0c8061bccae81
Content-Type: text/plain; charset="UTF-8"

*Dario Binacchi*

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


*Amarula Solutions SRL*

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

Hi Fiona,

Il giorno mer 26 giu 2024 alle 16:59 Fiona Klute <fiona.klute@gmx.de> ha
scritto:

> This fixes link time errors, undefined references to various ENGINE_*
> functions (paths shortened to the output directory):
>
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld:
> librauc.a.p/src_signature.c.o: in function `get_pkcs11_engine.constprop.0':
> signature.c:(.text.get_pkcs11_engine.constprop.0+0x14): undefined
> reference to `ENGINE_load_builtin_engines'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld:
> signature.c:(.text.get_pkcs11_engine.constprop.0+0x20): undefined reference
> to `ENGINE_by_id'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld:
> signature.c:(.text.get_pkcs11_engine.constprop.0+0x54): undefined reference
> to `ENGINE_ctrl_cmd_string'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld:
> signature.c:(.text.get_pkcs11_engine.constprop.0+0x60): undefined reference
> to `ENGINE_init'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld:
> signature.c:(.text.get_pkcs11_engine.constprop.0+0xe0): undefined reference
> to `ENGINE_ctrl_cmd_string'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld:
> signature.c:(.text.get_pkcs11_engine.constprop.0+0x128): undefined
> reference to `ENGINE_free'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld:
> signature.c:(.text.get_pkcs11_engine.constprop.0+0x1a4): undefined
> reference to `ENGINE_finish'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld:
> librauc.a.p/src_signature.c.o: in function `load_cert':
> signature.c:(.text.load_cert+0x114): undefined reference to
> `ENGINE_ctrl_cmd'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld:
> librauc.a.p/src_signature.c.o: in function `load_key':
> signature.c:(.text.load_key+0x124): undefined reference to
> `ENGINE_load_private_key'


>
> Before linking there were matching implicit declaration warnings
> during compile.
>
> Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
> ---
> I assume this is a consequence of
> 623d3bbe43e9193aa8e3395367d01af59071b859, previously RAUC built fine
> without the option enabled.
>

I think you are right. This patch raised the error because it was not
backward compatible. So my suggestion is to fix the problem patching
package/libopensslConfig.in to enable by default the _ENGINES option.

Thanks and regards,
Dario


>  package/rauc/Config.in | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/rauc/Config.in b/package/rauc/Config.in
> index 7451b29a55..69a65d165b 100644
> --- a/package/rauc/Config.in
> +++ b/package/rauc/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_RAUC
>         depends on BR2_USE_WCHAR # glib2
>         select BR2_PACKAGE_LIBGLIB2
>         select BR2_PACKAGE_OPENSSL
> +       select BR2_PACKAGE_LIBOPENSSL_ENGINES
>         select BR2_PACKAGE_SQUASHFS # run-time dependency
>         select BR2_PACKAGE_UBOOT_TOOLS if BR2_TARGET_UBOOT # run-time
> dependency
>         select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV if BR2_TARGET_UBOOT
> --
> 2.45.2
>
>

--0000000000003af0c8061bccae81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br clear=3D"all"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gma=
il_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><span><p =
dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;vertical-align:baseline;white-spa=
ce:pre-wrap"><b>Dario Binacchi</b></span></p><p dir=3D"ltr" style=3D"line-h=
eight:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0=
);background-color:transparent;vertical-align:baseline;white-space:pre-wrap=
">Senior Embedded Linux Developer</span></p><p dir=3D"ltr" style=3D"line-he=
ight:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"fo=
nt-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0)=
;background-color:transparent;vertical-align:baseline;white-space:pre-wrap"=
><a href=3D"mailto:dario.binacchi@amarulasolutions.com" target=3D"_blank">d=
ario.binacchi@amarulasolutions.com</a></span></p><p dir=3D"ltr" style=3D"li=
ne-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;vertical-align:baseline;white-space:pre=
-wrap">__________________________________</span></p><p dir=3D"ltr" style=3D=
"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span sty=
le=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rg=
b(0,0,0);background-color:transparent;vertical-align:baseline;white-space:p=
re-wrap"><br></span><span style=3D"font-size:10pt;font-family:Ubuntu,sans-s=
erif;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;=
white-space:pre-wrap"><b>Amarula Solutions SRL</b></span></p><p dir=3D"ltr"=
 style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt">=
<span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace=
;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;whit=
e-space:pre-wrap">Via Le Canevare 30, 31100 Treviso, Veneto, IT</span></p><=
p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin=
-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&qu=
ot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-align:=
baseline;white-space:pre-wrap">T. +39 042 243 5310</span><span style=3D"fon=
t-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);=
background-color:transparent;vertical-align:baseline;white-space:pre-wrap">=
<br></span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot=
;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-align:ba=
seline;white-space:pre-wrap"><a href=3D"mailto:info@amarulasolutions.com" t=
arget=3D"_blank">info@amarulasolutions.com</a></span></p><p dir=3D"ltr" sty=
le=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><a h=
ref=3D"http://www.amarulasolutions.com/" target=3D"_blank"><span style=3D"f=
ont-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0=
);background-color:transparent;vertical-align:baseline;white-space:pre-wrap=
">www.amarulasolutions.com</span></a></p></span></div></div></div></div><di=
v><br></div><div dir=3D"auto">Hi Fiona,</div><div dir=3D"auto"><br><div cla=
ss=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">Il gi=
orno mer 26 giu 2024 alle 16:59 Fiona Klute &lt;<a href=3D"mailto:fiona.klu=
te@gmx.de">fiona.klute@gmx.de</a>&gt; ha scritto:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">This fixes link time errors, undefined references to various=
 ENGINE_*<br>
functions (paths shortened to the output directory):<br>
<br>
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildr=
oot-linux-musl/bin/ld: librauc.a.p/src_signature.c.o: in function `get_pkcs=
11_engine.constprop.0&#39;:<br>
signature.c:(.text.get_pkcs11_engine.constprop.0+0x14): undefined reference=
 to `ENGINE_load_builtin_engines&#39;<br>
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildr=
oot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x2=
0): undefined reference to `ENGINE_by_id&#39;<br>
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildr=
oot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x5=
4): undefined reference to `ENGINE_ctrl_cmd_string&#39;<br>
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildr=
oot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x6=
0): undefined reference to `ENGINE_init&#39;<br>
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildr=
oot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0xe=
0): undefined reference to `ENGINE_ctrl_cmd_string&#39;<br>
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildr=
oot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x1=
28): undefined reference to `ENGINE_free&#39;<br>
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildr=
oot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x1=
a4): undefined reference to `ENGINE_finish&#39;<br>
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildr=
oot-linux-musl/bin/ld: librauc.a.p/src_signature.c.o: in function `load_cer=
t&#39;:<br>
signature.c:(.text.load_cert+0x114): undefined reference to `ENGINE_ctrl_cm=
d&#39;<br>
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildr=
oot-linux-musl/bin/ld: librauc.a.p/src_signature.c.o: in function `load_key=
&#39;:<br>
signature.c:(.text.load_key+0x124): undefined reference to `ENGINE_load_pri=
vate_key&#39;</blockquote><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br><=
/blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><br>
Before linking there were matching implicit declaration warnings<br>
during compile.<br>
<br>
Signed-off-by: Fiona Klute &lt;<a href=3D"mailto:fiona.klute%2Bwiwa@gmx.de"=
 target=3D"_blank">fiona.klute+wiwa@gmx.de</a>&gt;<br>
---<br>
I assume this is a consequence of<br>
623d3bbe43e9193aa8e3395367d01af59071b859, previously RAUC built fine<br>
without the option enabled.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I think you are =
right. This patch raised the error because it was not backward compatible. =
So my suggestion is to fix the problem patching package/libopensslConfig.in=
 to enable by default the _ENGINES option.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Thanks and regards,</div><div dir=3D"auto">Dario</div><d=
iv dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0package/rauc/Config.in | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/package/rauc/Config.in b/package/rauc/Config.in<br>
index 7451b29a55..69a65d165b 100644<br>
--- a/package/rauc/Config.in<br>
+++ b/package/rauc/Config.in<br>
@@ -5,6 +5,7 @@ config BR2_PACKAGE_RAUC<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_USE_WCHAR # glib2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_LIBGLIB2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_OPENSSL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBOPENSSL_ENGINES<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_SQUASHFS # run-time dependen=
cy<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_UBOOT_TOOLS if BR2_TARGET_UB=
OOT # run-time dependency<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV if BR=
2_TARGET_UBOOT<br>
--<br>
2.45.2<br>
<br>
</blockquote></div></div>

--0000000000003af0c8061bccae81--

--===============1073523898072693970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1073523898072693970==--
