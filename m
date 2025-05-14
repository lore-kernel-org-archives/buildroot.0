Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68E6C3ABD8
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 22:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 416D26085A;
	Wed, 14 May 2025 22:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCJDx-7fSyMu; Wed, 14 May 2025 22:20:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D05D608E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D05D608E9;
	Wed, 14 May 2025 22:20:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 431BF13D
 for <buildroot@buildroot.org>; Wed, 14 May 2025 22:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 346DB400E5
 for <buildroot@buildroot.org>; Wed, 14 May 2025 22:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HDDKmLCwI0Dh for <buildroot@buildroot.org>;
 Wed, 14 May 2025 22:20:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F0BAC400C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0BAC400C4
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0BAC400C4
 for <buildroot@buildroot.org>; Wed, 14 May 2025 22:20:34 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-70c7b8794faso3018257b3.1
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747261233; x=1747866033;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fELGA6rSv60itXVKC2Qmm2sk3w7z4oVC2XTaZWJIXns=;
 b=jf3qURIp91yxuOLbFNlpEVnapZptZJmLxc9XfHyWTX53PpsXxEdupDDva9TUUzq9Io
 NZ9qfwSJUU81luS4LF9AbshIdS+rVpW3u/hckDff4D23W7bIFc9v/ixX5C45WCYv1kIm
 X/keQl38Rh7KG6mK4z5BlUDNClCZfyCQf8mP+RSMMy6hn9UQcSF/0ub6yb0J8o+zD2dC
 pnH7USnxLanpHRR3+2dRTpFCbHoQaZEVXS84M5AbcdM5eGzRQFOBttL1v4QewhxQT6K3
 SH3VhZSFPl+ij737/ywF3RIfvm4IZoNRCP7xQymIPqiLn3lQ2AprrdFS7eFav9Jlfl8R
 8bfQ==
X-Gm-Message-State: AOJu0YwxmHXayAVAo0jgyXfXVAPv8UtASHLvJ8PAGwwYoAvwpAGv3v/h
 E57t+yMUQ6zY9OBN8XeLRkQdlxvmoQgMuiZbtzHy7ekPMwubBvfTt1gM3zNFD56wsNjnMtj2qMu
 +4sOMm5wYH9TRntJr9rH+PSlByoZbrg==
X-Gm-Gg: ASbGncsgNDP2F1kaLgbOx2OH9cedrGs4a8H99Ir0csxc6npaQEk0vsePrW+csjHZQLk
 zXRx/WVDSAWhpItyv534MRMhSG8XjuMtvoioVvh0RDmp6BpRY/OdUENnM9TzzO85qfLqUi34NR+
 oyIr/842wxaNf9das5VVbRBVD+fTfU5z5r7Q==
X-Google-Smtp-Source: AGHT+IEXC8z1SzeQzj5/JpldqaLiZza07tfep48g9pLFguOITmDVG9WnHHde9uUmDTyv7IzMpOehFUqcWm3vnJIlrXw=
X-Received: by 2002:a05:690c:7013:b0:6fb:a696:b23b with SMTP id
 00721157ae682-70c7f22c60fmr72962067b3.33.1747261233374; Wed, 14 May 2025
 15:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250514220736.1380151-1-roykollensvendsen@gmail.com>
In-Reply-To: <20250514220736.1380151-1-roykollensvendsen@gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Thu, 15 May 2025 00:20:21 +0200
X-Gm-Features: AX0GCFsHh5jKAiNV-rFQEVFzkxLb52qELQZ2mJFEC4_x1mQB9oWorZ5TtTXwoeI
Message-ID: <CA+R_depmhktQwtbf7f1i6Axk4H9-QyRqTpM_1yXtGiA-g3ZX-A@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747261233; x=1747866033; darn=buildroot.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fELGA6rSv60itXVKC2Qmm2sk3w7z4oVC2XTaZWJIXns=;
 b=KvSdHveNqiojp2nkv6M6ejjylKtB+d40O3FRppxU7QBPXVjoOo/n77LIockqj5IQ9h
 VSd1JjZr7BTs0G5JYZAx7yXmF/d/OezPocKd5LqzB0DcX4MlxRggl8iWdXqAGbb3Rs1c
 0n10PBxmLYAg4uNqLy/sSk1jKux7PuzXRI4XUlHudP3Ut8KPte+KkXDnk4bYxrgiD50b
 wukz3sJz05IkmBF+WvLzQJT2xCRNXle4gx2O7gFG37PPqJ08xVIBpsnYSwHhq9n11p4n
 FS9QLmRh42Cm02TNaNp9/7LcFOwPPRv+PYURrK0IaUEO50i1R4CgUX1xzvhowcIbJT/F
 YP6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KvSdHveN
Subject: Re: [Buildroot] [PATCH 1/1] package/mariadb: bump version to
 10.11.11
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
Content-Type: multipart/mixed; boundary="===============1906539266446558640=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1906539266446558640==
Content-Type: multipart/alternative; boundary="00000000000025307b06351ff5af"

--00000000000025307b06351ff5af
Content-Type: text/plain; charset="UTF-8"

I rejected this myself, since i discovered a build failure.

tor. 15. mai 2025 kl. 00:07 skrev Roy Kollen Svendsen <
roykollensvendsen@gmail.com>:

> Fixes:
> Bumping the version to 10.11.11 fixes builds with gcc-15:
> "MDEV-35607 Compile error with gcc-15 (signal returns)"
> (1d6f857534eeadd1b6aaa37d8e27c081421d2ffa)
>
> Remove "0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch",
> since the problem was fixed
> upstream in 4375245d5d9f01cabb6e3fd6c637535e724eae38.
>
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
>  ...le-failure-fmt-use-incompatible-with.patch | 35 -------------------
>  package/mariadb/mariadb.hash                  |  4 +--
>  package/mariadb/mariadb.mk                    |  2 +-
>  3 files changed, 3 insertions(+), 38 deletions(-)
>  delete mode 100644
> package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch
>
> diff --git
> a/package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch
> b/package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch
> deleted file mode 100644
> index b6c8807f44..0000000000
> ---
> a/package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 69935c10b95fc7f7a2e1c3ed02831958e1a9b6a4 Mon Sep 17 00:00:00 2001
> -From: Daniel Black <daniel@mariadb.org>
> -Date: Wed, 22 May 2024 17:43:17 +1000
> -Subject: [PATCH] MDEV-34206 compile failure: fmt use incompatible with
> - libfmt-10.2.[2]+
> -
> -Upstream libfmt commit
> https://github.com/fmtlib/fmt/commit/d70729215fba1d54862e407b626abf86ddf409bf
> -now
> <https://github.com/fmtlib/fmt/commit/d70729215fba1d54862e407b626abf86ddf409bf-now>
> requires the format function to be const.
> -
> -Adjust the function prototype so it is const and can compile.a
> -
> -Signed-off-by: Daniel Black <daniel@mariadb.org>
> -[Julien: add SoB line with the original patch author name]
> -Upstream:
> https://github.com/MariaDB/server/commit/4375245d5d9f01cabb6e3fd6c637535e724eae38
> -Signed-off-by
> <https://github.com/MariaDB/server/commit/4375245d5d9f01cabb6e3fd6c637535e724eae38-Signed-off-by>:
> Julien Olivain <ju.o@free.fr>
> ----
> - sql/item_strfunc.cc | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/sql/item_strfunc.cc b/sql/item_strfunc.cc
> -index 4bbf36ec1cf..2ad8a9b3ce5 100644
> ---- a/sql/item_strfunc.cc
> -+++ b/sql/item_strfunc.cc
> -@@ -1392,7 +1392,7 @@ bool Item_func_sformat::fix_length_and_dec(THD *thd)
> - namespace fmt {
> -   template <> struct formatter<String>: formatter<string_view> {
> -     template <typename FormatContext>
> --    auto format(String c, FormatContext& ctx) -> decltype(ctx.out()) {
> -+    auto format(String c, FormatContext& ctx) const ->
> decltype(ctx.out()) {
> -       string_view name = { c.ptr(), c.length() };
> -       return formatter<string_view>::format(name, ctx);
> -     };
> ---
> -2.46.0
> -
> diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
> index fd73cca4f3..4d0a793096 100644
> --- a/package/mariadb/mariadb.hash
> +++ b/package/mariadb/mariadb.hash
> @@ -1,5 +1,5 @@
> -# From https://downloads.mariadb.org/mariadb/10.11.6
> -sha512
> 3d77f7be4a26d5a36af56150a5f8ed5e21adeed9bc8ea1bd694e47a25a571bd73468eada7c96e0dfe5a6c81bef625abf71a56d228cf43a738e555e3c0d824a6a
> mariadb-10.11.6.tar.gz
> +# From https://downloads.mariadb.org/mariadb/10.11.11
> +sha512
> d9c154207a9f435ce08d5fbfe31814a739e577c656ef9996cf7e60c2cad8b4c07e2de8d94b6191fefa2b5cbde56437b586f85f144d3b4fcec8533449ed8411ac
> mariadb-10.11.11.tar.gz
>
>  # Hash for license files
>  sha256  2b278a3a2f20696113a7c57c4f3e6a5cdb9a25f2a827e72e0c089a2f805ff91a
> README.md
> diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
> index 1dcf6568da..8156af8ee6 100644
> --- a/package/mariadb/mariadb.mk
> +++ b/package/mariadb/mariadb.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ################################################################################
>
> -MARIADB_VERSION = 10.11.6
> +MARIADB_VERSION = 10.11.11
>  MARIADB_SITE =
> https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
>  MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL
> client library), LGPL-2.0 (LGPL client library)
>  # Tarball no longer contains LGPL license text
> --
> 2.49.0
>
>

--00000000000025307b06351ff5af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I rejected this myself, since i discovered a build failure=
.</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr=
" class=3D"gmail_attr">tor. 15. mai 2025 kl. 00:07 skrev Roy Kollen Svendse=
n &lt;<a href=3D"mailto:roykollensvendsen@gmail.com">roykollensvendsen@gmai=
l.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">F=
ixes:<br>
Bumping the version to 10.11.11 fixes builds with gcc-15:<br>
&quot;MDEV-35607 Compile error with gcc-15 (signal returns)&quot; (1d6f8575=
34eeadd1b6aaa37d8e27c081421d2ffa)<br>
<br>
Remove &quot;0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patc=
h&quot;, since the problem was fixed<br>
upstream in 4375245d5d9f01cabb6e3fd6c637535e724eae38.<br>
<br>
Signed-off-by: Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@=
gmail.com" target=3D"_blank">roykollensvendsen@gmail.com</a>&gt;<br>
---<br>
=C2=A0...le-failure-fmt-use-incompatible-with.patch | 35 ------------------=
-<br>
=C2=A0package/mariadb/mariadb.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +--<br>
=C2=A0package/mariadb/<a href=3D"http://mariadb.mk" rel=3D"noreferrer" targ=
et=3D"_blank">mariadb.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A03 files changed, 3 insertions(+), 38 deletions(-)<br>
=C2=A0delete mode 100644 package/mariadb/0002-MDEV-34206-compile-failure-fm=
t-use-incompatible-with.patch<br>
<br>
diff --git a/package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incomp=
atible-with.patch b/package/mariadb/0002-MDEV-34206-compile-failure-fmt-use=
-incompatible-with.patch<br>
deleted file mode 100644<br>
index b6c8807f44..0000000000<br>
--- a/package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incompatible-=
with.patch<br>
+++ /dev/null<br>
@@ -1,35 +0,0 @@<br>
-From 69935c10b95fc7f7a2e1c3ed02831958e1a9b6a4 Mon Sep 17 00:00:00 2001<br>
-From: Daniel Black &lt;<a href=3D"mailto:daniel@mariadb.org" target=3D"_bl=
ank">daniel@mariadb.org</a>&gt;<br>
-Date: Wed, 22 May 2024 17:43:17 +1000<br>
-Subject: [PATCH] MDEV-34206 compile failure: fmt use incompatible with<br>
- libfmt-10.2.[2]+<br>
-<br>
-Upstream libfmt commit <a href=3D"https://github.com/fmtlib/fmt/commit/d70=
729215fba1d54862e407b626abf86ddf409bf-now" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/fmtlib/fmt/commit/d70729215fba1d54862e407b626abf86d=
df409bf<br>
-now</a> requires the format function to be const.<br>
-<br>
-Adjust the function prototype so it is const and can compile.a<br>
-<br>
-Signed-off-by: Daniel Black &lt;<a href=3D"mailto:daniel@mariadb.org" targ=
et=3D"_blank">daniel@mariadb.org</a>&gt;<br>
-[Julien: add SoB line with the original patch author name]<br>
-Upstream: <a href=3D"https://github.com/MariaDB/server/commit/4375245d5d9f=
01cabb6e3fd6c637535e724eae38-Signed-off-by" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/MariaDB/server/commit/4375245d5d9f01cabb6e3fd6c637=
535e724eae38<br>
-Signed-off-by</a>: Julien Olivain &lt;<a href=3D"mailto:ju.o@free.fr" targ=
et=3D"_blank">ju.o@free.fr</a>&gt;<br>
----<br>
- sql/item_strfunc.cc | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/sql/item_strfunc.cc b/sql/item_strfunc.cc<br>
-index 4bbf36ec1cf..2ad8a9b3ce5 100644<br>
---- a/sql/item_strfunc.cc<br>
-+++ b/sql/item_strfunc.cc<br>
-@@ -1392,7 +1392,7 @@ bool Item_func_sformat::fix_length_and_dec(THD *thd)=
<br>
- namespace fmt {<br>
-=C2=A0 =C2=A0template &lt;&gt; struct formatter&lt;String&gt;: formatter&l=
t;string_view&gt; {<br>
-=C2=A0 =C2=A0 =C2=A0template &lt;typename FormatContext&gt;<br>
--=C2=A0 =C2=A0 auto format(String c, FormatContext&amp; ctx) -&gt; decltyp=
e(ctx.out()) {<br>
-+=C2=A0 =C2=A0 auto format(String c, FormatContext&amp; ctx) const -&gt; d=
ecltype(ctx.out()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0string_view name =3D { c.ptr(), c.length() };<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return formatter&lt;string_view&gt;::format(nam=
e, ctx);<br>
-=C2=A0 =C2=A0 =C2=A0};<br>
--- <br>
-2.46.0<br>
-<br>
diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash<br=
>
index fd73cca4f3..4d0a793096 100644<br>
--- a/package/mariadb/mariadb.hash<br>
+++ b/package/mariadb/mariadb.hash<br>
@@ -1,5 +1,5 @@<br>
-# From <a href=3D"https://downloads.mariadb.org/mariadb/10.11.6" rel=3D"no=
referrer" target=3D"_blank">https://downloads.mariadb.org/mariadb/10.11.6</=
a><br>
-sha512=C2=A0 3d77f7be4a26d5a36af56150a5f8ed5e21adeed9bc8ea1bd694e47a25a571=
bd73468eada7c96e0dfe5a6c81bef625abf71a56d228cf43a738e555e3c0d824a6a=C2=A0 m=
ariadb-10.11.6.tar.gz<br>
+# From <a href=3D"https://downloads.mariadb.org/mariadb/10.11.11" rel=3D"n=
oreferrer" target=3D"_blank">https://downloads.mariadb.org/mariadb/10.11.11=
</a><br>
+sha512=C2=A0 d9c154207a9f435ce08d5fbfe31814a739e577c656ef9996cf7e60c2cad8b=
4c07e2de8d94b6191fefa2b5cbde56437b586f85f144d3b4fcec8533449ed8411ac=C2=A0 m=
ariadb-10.11.11.tar.gz<br>
<br>
=C2=A0# Hash for license files<br>
=C2=A0sha256=C2=A0 2b278a3a2f20696113a7c57c4f3e6a5cdb9a25f2a827e72e0c089a2f=
805ff91a=C2=A0 README.md<br>
diff --git a/package/mariadb/<a href=3D"http://mariadb.mk" rel=3D"noreferre=
r" target=3D"_blank">mariadb.mk</a> b/package/mariadb/<a href=3D"http://mar=
iadb.mk" rel=3D"noreferrer" target=3D"_blank">mariadb.mk</a><br>
index 1dcf6568da..8156af8ee6 100644<br>
--- a/package/mariadb/<a href=3D"http://mariadb.mk" rel=3D"noreferrer" targ=
et=3D"_blank">mariadb.mk</a><br>
+++ b/package/mariadb/<a href=3D"http://mariadb.mk" rel=3D"noreferrer" targ=
et=3D"_blank">mariadb.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-MARIADB_VERSION =3D 10.11.6<br>
+MARIADB_VERSION =3D 10.11.11<br>
=C2=A0MARIADB_SITE =3D <a href=3D"https://downloads.mariadb.org/interstitia=
l/mariadb-$(MARIADB_VERSION)/source" rel=3D"noreferrer" target=3D"_blank">h=
ttps://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source=
</a><br>
=C2=A0MARIADB_LICENSE =3D GPL-2.0 (server), GPL-2.0 with FLOSS exception (G=
PL client library), LGPL-2.0 (LGPL client library)<br>
=C2=A0# Tarball no longer contains LGPL license text<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div>

--00000000000025307b06351ff5af--

--===============1906539266446558640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1906539266446558640==--
