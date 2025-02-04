Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86982C02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 21:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F6794095E;
	Tue,  4 Feb 2025 21:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvPNe2jwNGKC; Tue,  4 Feb 2025 21:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 846D6409F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 846D6409F2;
	Tue,  4 Feb 2025 21:23:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4426512F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 21:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23C2E4013B
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 21:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SAiXGMfvQIq4 for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 21:23:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A11240148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A11240148
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A11240148
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 21:23:35 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3ee29277d44so3849146b6e.1
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 13:23:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738704214; x=1739309014;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X52D5uz3JMGlu7WWuD/I2zSOu+6JnQr5tuM/HoRKXok=;
 b=cAEKMA1CfwstJ1tOQhoHnbdFVuj8PnZAzXRPCNv8Bir7SNwzYRSaHwQ+mt949k6Leu
 fE/Hf8curX7ntxeFzHa40vO4001+cDxWHsN07DRjNTHFHc2siz9J4KW3f8wUxrUcpy32
 potRDtrCnDQtPdKiENEkRdwVDvqyvI1v1HnJ/ydZWlJbmL4SzfeCDFDv4rx3ZTlJwguy
 LYuPaD62Nk6xoZkvcQhO7yTb6ZwY9x26ZPHUgcoW9XLjvLjdgNt15u2QQcjFYnAI0CHe
 dCBQX/0bn+z+shQVOK8fTSSCXJ0A2TFQbci8QCt0jEwGErQPrOYW3DDiH8mGtJDHOz5g
 8GJQ==
X-Gm-Message-State: AOJu0YyCCH63E+dTmkSPUGtjpbDCs9wl3EEJdlVDSmkISHBCnsLcVPRG
 zhjrpV39J+Dkklhy0VuYmh0xGQMxa5/IBgwUlMT39a3dIFn1sKfy2ecG3x2Sya23jMYmrZy44mP
 J
X-Gm-Gg: ASbGncuLTiUAetx58LSYPgOprEF2qnCiOi07TpLb8XpZ9iGGlsJeFiQijsnoe0O6xLs
 ZVHVBXcUZS2TnJwSIn5kcNvs8ZYhP8nBfSPiGY3oaRgomxtUYbvlV4XZwbhdTSxi+SsjaHJPXWP
 UA/Panu94nw5xTPCXmgBKP8/AqjjsvkRKnWMt+H5V/SVf5dg1ogrRVrM15S2OKMwh527OmEUn24
 Zybz7717id3bM50u3L7tTdSBxgICSJ0cJpOIRDAqo7uv2r6yxgXsrQAQfWWiaQuo+Tvc2J/2QQm
 j5v/rSynV27WqA+FU4ECSLNhOOgbRVU4wJTgiNQfGfzt7amhiTC7M/E=
X-Google-Smtp-Source: AGHT+IG7Eb0v/cjhb0koxc5cBQQ/8Qw6zdVeSEWryf0YPeBpKF9peQivm5V9NaK8TZxbXrmjMkLqwA==
X-Received: by 2002:a05:6808:3083:b0:3e6:5522:b333 with SMTP id
 5614622812f47-3f37c125b28mr182104b6e.22.1738704214058; 
 Tue, 04 Feb 2025 13:23:34 -0800 (PST)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com.
 [209.85.161.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f3335423f0sm3195564b6e.17.2025.02.04.13.23.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 13:23:33 -0800 (PST)
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-5f2e31139d9so2831622eaf.0
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 13:23:33 -0800 (PST)
X-Received: by 2002:a05:6870:5250:b0:29e:24c7:2861 with SMTP id
 586e51a60fabf-2b804f49fcdmr318973fac.13.1738704213144; Tue, 04 Feb 2025
 13:23:33 -0800 (PST)
MIME-Version: 1.0
References: <20250204143227.1233163-1-fiona.klute@gmx.de>
In-Reply-To: <20250204143227.1233163-1-fiona.klute@gmx.de>
Date: Tue, 4 Feb 2025 13:23:23 -0800
X-Gmail-Original-Message-ID: <CA+h8R2odWOyS=7=9LGGkBGHYENiLHtkj76_L2Zvq_PHOFYs9sA@mail.gmail.com>
X-Gm-Features: AWEUYZlPMkc4a0UpqaIdlh8bKHaji9mh1n4E1RJys_lvyeu-PIIW3N2O8am-rzg
Message-ID: <CA+h8R2odWOyS=7=9LGGkBGHYENiLHtkj76_L2Zvq_PHOFYs9sA@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738704214; x=1739309014; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X52D5uz3JMGlu7WWuD/I2zSOu+6JnQr5tuM/HoRKXok=;
 b=kTlI+teQXUCBYfEDzw1RgInvT3w/P2QRZRNN7UEVJj+enUhcgk5nSZOAa059XXE5ea
 FjzGShuZH+el912flcC3mtPM8f2Z7Go2RpFP+j7i3Lza/SYimqoSjHnaANRfHAfsKtz8
 ogvHQMSTBEPDNdN5yl6RvGaL9KRFs3ya8ADp7o8r/JHFBfnhMbA7SOBUXWBYXNuyPDd9
 aV3AmGbn0Xzt+McpdFDtIp7+McYnADANSCP7+C1bv2WCCP7SVACzv8H/FZV81s6BOVwk
 rle2oqsF3EltWpz6uaWRtu6jYpYiLaByDcYUOzlnR2iNMqsxqZZd6ecmItmu8EOcPZjK
 JFRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=kTlI+teQ
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: fix build with
 toolchain without Gold linker
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
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============4681540913701520649=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4681540913701520649==
Content-Type: multipart/alternative; boundary="000000000000fe8826062d579ecb"

--000000000000fe8826062d579ecb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fiona, Yann, all,



On Tue, Feb 4, 2025, 6:32=E2=80=AFAM Fiona Klute <fiona.klute@gmx.de> wrote=
:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>
> Go forces use of the Gold linker on aarch64 due to a bug in BFD (the
> default GNU linker) that is fixed in Binutils >=3D 2.41 [1]. All
> toolchains provided by Buildroot have the fix, and none of them
> provide Gold, so the forced setting breaks dynamic linking in
> Buildroot. Set EXTLDFLAGS to use BFD instead.
>
> Additionally disable PIE on musl to fix "read-only segment has dynamic
> relocations" errors during linking [2].
>
> [1] https://github.com/golang/go/issues/22040
> [2] https://github.com/golang/go/issues/17847
>
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
> This patch requires Yann E. Morin's patch that introduces
> PACKAGE_EXTLDFLAGS:
>
> https://patchwork.ozlabs.org/project/buildroot/patch/876f3a7bb6a2375193fc=
8f06ab856d2449f83727.1699547993.git.yann.morin@orange.com/
>
> Based on the linked issue the --no-pie linker flag should be needed
> only for musl, but I'd be grateful if anyone could test with glibc.
>
>  package/containerd/containerd.mk | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/package/containerd/containerd.mk b/package/containerd/
> containerd.mk
> index ee07c22495..cb648f87a9 100644
> --- a/package/containerd/containerd.mk
> +++ b/package/containerd/containerd.mk
> @@ -49,6 +49,20 @@ ifneq ($(BR2_PACKAGE_CONTAINERD_CRI),y)
>  CONTAINERD_TAGS +=3D no_cri
>  endif
>
> +ifeq ($(BR2_aarch64),y)
> +# Go forces use of the Gold linker on aarch64 due to a bug in BFD that
> +# is fixed in Binutils >=3D 2.41 (so all versions provided by
> +# Buildroot). Forcing Gold will break with toolchains that don't
> +# provide it, so override the flag and use BFD.
> +# See: https://github.com/golang/go/issues/22040
> +CONTAINERD_EXTLDFLAGS +=3D -fuse-ld=3Dbfd
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +# Go exe build with PIE doesn't work with musl.
> +# See: https://github.com/golang/go/issues/17847
> +CONTAINERD_EXTLDFLAGS +=3D -Wl,--no-pie
> +endif
> +endif
> +
>  define CONTAINERD_INSTALL_INIT_SYSTEMD
>         $(INSTALL) -D -m 0644 $(@D)/containerd.service \
>                 $(TARGET_DIR)/usr/lib/systemd/system/containerd.service
> --
> 2.47.2
>


This looks good to me. But shouldn't we apply this more generally to go-src
and go-bin? It's true for all Go packages that we should pass these flags
right? Why specifically containerd?

Thanks!
Christian Stewart

>
>

--000000000000fe8826062d579ecb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Fiona, Yann, all,<div dir=3D"auto"><br></div><div=
 dir=3D"auto"><br></div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 4, 2025, 6:32=E2=80=AFA=
M Fiona Klute &lt;<a href=3D"mailto:fiona.klute@gmx.de">fiona.klute@gmx.de<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: &quot;Fiona Kl=
ute (WIWA)&quot; &lt;<a href=3D"mailto:fiona.klute@gmx.de" target=3D"_blank=
" rel=3D"noreferrer">fiona.klute@gmx.de</a>&gt;<br>
<br>
Go forces use of the Gold linker on aarch64 due to a bug in BFD (the<br>
default GNU linker) that is fixed in Binutils &gt;=3D 2.41 [1]. All<br>
toolchains provided by Buildroot have the fix, and none of them<br>
provide Gold, so the forced setting breaks dynamic linking in<br>
Buildroot. Set EXTLDFLAGS to use BFD instead.<br>
<br>
Additionally disable PIE on musl to fix &quot;read-only segment has dynamic=
<br>
relocations&quot; errors during linking [2].<br>
<br>
[1] <a href=3D"https://github.com/golang/go/issues/22040" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">https://github.com/golang/go/issues/22040</a=
><br>
[2] <a href=3D"https://github.com/golang/go/issues/17847" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">https://github.com/golang/go/issues/17847</a=
><br>
<br>
Signed-off-by: Fiona Klute (WIWA) &lt;<a href=3D"mailto:fiona.klute@gmx.de"=
 target=3D"_blank" rel=3D"noreferrer">fiona.klute@gmx.de</a>&gt;<br>
---<br>
This patch requires Yann E. Morin&#39;s patch that introduces<br>
PACKAGE_EXTLDFLAGS:<br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/876f3a7bb6a=
2375193fc8f06ab856d2449f83727.1699547993.git.yann.morin@orange.com/" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://patchwork.ozlabs.org/proj=
ect/buildroot/patch/876f3a7bb6a2375193fc8f06ab856d2449f83727.1699547993.git=
.yann.morin@orange.com/</a><br>
<br>
Based on the linked issue the --no-pie linker flag should be needed<br>
only for musl, but I&#39;d be grateful if anyone could test with glibc.<br>
<br>
=C2=A0package/containerd/<a href=3D"http://containerd.mk" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">containerd.mk</a> | 14 ++++++++++++++<br>
=C2=A01 file changed, 14 insertions(+)<br>
<br>
diff --git a/package/containerd/<a href=3D"http://containerd.mk" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">containerd.mk</a> b/package/container=
d/<a href=3D"http://containerd.mk" rel=3D"noreferrer noreferrer" target=3D"=
_blank">containerd.mk</a><br>
index ee07c22495..cb648f87a9 100644<br>
--- a/package/containerd/<a href=3D"http://containerd.mk" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">containerd.mk</a><br>
+++ b/package/containerd/<a href=3D"http://containerd.mk" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">containerd.mk</a><br>
@@ -49,6 +49,20 @@ ifneq ($(BR2_PACKAGE_CONTAINERD_CRI),y)<br>
=C2=A0CONTAINERD_TAGS +=3D no_cri<br>
=C2=A0endif<br>
<br>
+ifeq ($(BR2_aarch64),y)<br>
+# Go forces use of the Gold linker on aarch64 due to a bug in BFD that<br>
+# is fixed in Binutils &gt;=3D 2.41 (so all versions provided by<br>
+# Buildroot). Forcing Gold will break with toolchains that don&#39;t<br>
+# provide it, so override the flag and use BFD.<br>
+# See: <a href=3D"https://github.com/golang/go/issues/22040" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">https://github.com/golang/go/issues/2204=
0</a><br>
+CONTAINERD_EXTLDFLAGS +=3D -fuse-ld=3Dbfd<br>
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)<br>
+# Go exe build with PIE doesn&#39;t work with musl.<br>
+# See: <a href=3D"https://github.com/golang/go/issues/17847" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">https://github.com/golang/go/issues/1784=
7</a><br>
+CONTAINERD_EXTLDFLAGS +=3D -Wl,--no-pie<br>
+endif<br>
+endif<br>
+<br>
=C2=A0define CONTAINERD_INSTALL_INIT_SYSTEMD<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL) -D -m 0644 $(@D)/containerd.service =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_DIR)/usr/l=
ib/systemd/system/containerd.service<br>
-- <br>
2.47.2<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">This looks good to me. But shouldn&#39;t =
we apply this more generally to go-src and go-bin? It&#39;s true for all Go=
 packages that we should pass these flags right? Why specifically container=
d?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks!</div><div dir=
=3D"auto">Christian Stewart</div><div dir=3D"auto"><div class=3D"gmail_quot=
e gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
</blockquote></div></div></div>

--000000000000fe8826062d579ecb--

--===============4681540913701520649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4681540913701520649==--
