Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5704C3ABBC
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 05:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1702D80D59;
	Fri,  9 May 2025 05:56:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T4vMF294RKiD; Fri,  9 May 2025 05:56:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E136180D6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E136180D6B;
	Fri,  9 May 2025 05:56:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B2591A9
 for <buildroot@buildroot.org>; Fri,  9 May 2025 05:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F0C4801CF
 for <buildroot@buildroot.org>; Fri,  9 May 2025 05:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3szDafzGdEu for <buildroot@buildroot.org>;
 Fri,  9 May 2025 05:56:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E06F83AF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E06F83AF4
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E06F83AF4
 for <buildroot@buildroot.org>; Fri,  9 May 2025 05:56:38 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-708d90aa8f9so16859577b3.3
 for <buildroot@buildroot.org>; Thu, 08 May 2025 22:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746770197; x=1747374997;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ohEpPQEBo/J2FMjHmGYeVKTqGOiOzvd5S/jEk49EhWI=;
 b=sfI/OOWydK/OTeUJPGZpyx9lnkOBBKX7MFqxmcrchaX1joCscwOaFRTERTtHo38gB2
 eJDXobfaMZxQDWQoyMqUK5nLX7N7G7kkrmZ0FzJ8mLmxQH5KjEJHJg6GS1LdNQE2Qj+u
 vBI5ehw5bN8/b+rLWxrTUkI6ihSRIqscugPAVioIaFapOlZo1S9MFFhuYhGRcM2gAjqt
 mj/PeukJZNLNsa1AKZycPdZTZkm6kESyoK3axyRzbBnxMqnkfkjm7tdEPeaZ/hM2Ca0I
 fQT8zhpBDr6VPpxbXRfs0D6Fc6aV98FuUfbCL65I93Rb7AJrF4hE84A/sxTOZbGfRRuW
 ZnXw==
X-Gm-Message-State: AOJu0YyJjjQ7caovzSFtEZX/51QioYgD3pI1auj6dOHvrY6TpY1kQUIB
 ptGciVayNfrhI37VaXc+4PVGs9S+1WlPSPmHVOJhZBOc7oHUe6/QH6zJhX9V0Kz0Tw/b5OLOSFw
 D98wXB3vEJSneuBiKSEdDqGybrAw=
X-Gm-Gg: ASbGncszAbjuyc3uKcdJBUouC1r+VlD6db3ayEYu5f4K5hpivR8tvx/tnqTv1BKr7IQ
 w0yPQlLn4lUSE8UYYsFg1+Ah8r/y/hmQ3C8PanjM9oge7GxuEqe3sW6338/HoIlf59iltNYK9yP
 aXe2oOtYpRLRvhi9FuJYVexSQ=
X-Google-Smtp-Source: AGHT+IGniCVFGs+8PtXctKgfgS59MfKF9+shnsSKDfDDAd/04XN9Wo2m99TJhB4ABeB1rkitt9vMRltGqOP8ZqBHO0g=
X-Received: by 2002:a05:690c:6ac6:b0:6f9:56d1:a8bd with SMTP id
 00721157ae682-70a3fb5425fmr25925067b3.33.1746770196932; Thu, 08 May 2025
 22:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250509014212.88296-1-rubacha.jack03@gmail.com>
In-Reply-To: <20250509014212.88296-1-rubacha.jack03@gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Fri, 9 May 2025 07:56:25 +0200
X-Gm-Features: AX0GCFtLJDdiK4C0DUy1RTlQOYMtdIEZJOKdwmiP70Z7Mj9_HuQiX_B1Q3FuC7g
Message-ID: <CA+R_deogDLOYSLAi08-3DHo=eL9zvwwPcq-ddsM3U3r2GFvZ3w@mail.gmail.com>
To: Jack Rubacha <rubacha.jack03@gmail.com>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746770197; x=1747374997; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ohEpPQEBo/J2FMjHmGYeVKTqGOiOzvd5S/jEk49EhWI=;
 b=YBU3EKjNkr5WdFoq86R9A1q0p8U+iHB2Frbdi9vZGKQiGvO8uG5CiA3gb2h/zqM5az
 hg86khfUK+IHm6nZ99jrGbO4h+Kubffgsrmkz1w4CHL8hRcduYGVB6IgQMe56VOr+rqv
 Zkf+MG452c/lt7oRl5J1wd9fDgatYUT/IsH5EAMeLGFIM1iwr6AJQGx+by2GFE3si1Ee
 kP263xXiQKrIjIHIuO77y4PVwSMharST7cdw2vIiU5mZPAeMtE9ID8Ddnoe14WTAxBc6
 ZKR9HreCv8jTaloBq7gSmdz0rLwdid3oAYZ47S3Dv+LKKc3RtEyINx+Uc6o7785xzJ/o
 KmgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YBU3EKjN
Subject: Re: [Buildroot] [PATCH v2] package/qt6/qt6grpc: new package
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
Content-Type: multipart/mixed; boundary="===============7734120844257469549=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7734120844257469549==
Content-Type: multipart/alternative; boundary="00000000000017b2b40634ada1b2"

--00000000000017b2b40634ada1b2
Content-Type: text/plain; charset="UTF-8"

Hi Jack,

Nice clean up.

fre. 9. mai 2025 kl. 03:45 skrev Jack Rubacha <rubacha.jack03@gmail.com>:

> Adds the QT GRPC module (containing Qt Protobuf as well).
>
> Signed-off-by: Jack Rubacha <rubacha.jack03@gmail.com>
>
> ---
> Changes v1 -> v2:
>  - Remove 'selects BR2_PACKAGE_HOST_QT6BASE' as it is a make dependency
>  - Changes help text to clearly state both modules
>  - Adds a git repository link to the help text
>  - Cleans up license files to show all necessary files, matches hashfile
>  - Make multiline clauses alphabetically ordered
>
> ---
>  package/qt6/Config.in            |  1 +
>  package/qt6/qt6grpc/Config.in    |  7 +++++
>  package/qt6/qt6grpc/qt6grpc.hash | 10 +++++++
>  package/qt6/qt6grpc/qt6grpc.mk   | 46 ++++++++++++++++++++++++++++++++
>  4 files changed, 64 insertions(+)
>  create mode 100644 package/qt6/qt6grpc/Config.in
>  create mode 100644 package/qt6/qt6grpc/qt6grpc.hash
>  create mode 100644 package/qt6/qt6grpc/qt6grpc.mk
>
> diff --git a/package/qt6/Config.in b/package/qt6/Config.in
> index 10594691cf..9c297b321e 100644
> --- a/package/qt6/Config.in
> +++ b/package/qt6/Config.in
> @@ -48,6 +48,7 @@ source "package/qt6/qt6charts/Config.in"
>  source "package/qt6/qt6core5compat/Config.in"
>  source "package/qt6/qt6declarative/Config.in"
>  source "package/qt6/qt6graphs/Config.in"
> +source "package/qt6/qt6grpc/Config.in"
>  source "package/qt6/qt6languageserver/Config.in"
>  source "package/qt6/qt6mqtt/Config.in"
>  source "package/qt6/qt6multimedia/Config.in"
> diff --git a/package/qt6/qt6grpc/Config.in b/package/qt6/qt6grpc/Config.in
> new file mode 100644
> index 0000000000..3d82cfcb0c
> --- /dev/null
> +++ b/package/qt6/qt6grpc/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_QT6GRPC
> +       bool "qt6grpc"
> +       help
> +         This package provides the Qt GRPC and Protobuf modules:
> +
> +         https://doc.qt.io/qt-6/qtgrpc-index.html
> +         https://code.qt.io/cgit/qt/qtgrpc.git/
> diff --git a/package/qt6/qt6grpc/qt6grpc.hash
> b/package/qt6/qt6grpc/qt6grpc.hash
> new file mode 100644
> index 0000000000..06da9f0700
> --- /dev/null
> +++ b/package/qt6/qt6grpc/qt6grpc.hash
> @@ -0,0 +1,10 @@
> +# Hash from:
> https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtgrpc-everywhere-src-6.8.1.tar.xz.sha256
> +sha256
> <https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtgrpc-everywhere-src-6.8.1.tar.xz.sha256+sha256>
> b1615c7096b012e5f42aea57c420d2ce21c906d0eda3ea373b09a47cf40b5e80
> qtgrpc-everywhere-src-6.8.1.tar.xz
> +
> +# Hashes for license files:
> +sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb
> LICENSE.Apache-2.0.txt
> +sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce
> LICENSES/BSD-3-Clause.txt
> +sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4
> LICENSES/GFDL-1.3-no-invariants-only.txt
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
> LICENSES/GPL-3.0-only.txt
> +sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d
> LICENSES/LicenseRef-protobuf.txt
> +sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2
> LICENSES/Qt-GPL-exception-1.0.txt
> diff --git a/package/qt6/qt6grpc/qt6grpc.mk b/package/qt6/qt6grpc/
> qt6grpc.mk
> new file mode 100644
> index 0000000000..b8bc2e4651
> --- /dev/null
> +++ b/package/qt6/qt6grpc/qt6grpc.mk
> @@ -0,0 +1,46 @@
>
> +################################################################################
> +#
> +# qt6grpc
> +#
>
> +################################################################################
> +
> +QT6GRPC_VERSION = $(QT6_VERSION)
> +QT6GRPC_SITE = $(QT6_SITE)
> +QT6GRPC_SOURCE =
> qtgrpc-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6GRPC_VERSION).tar.xz
> +QT6GRPC_INSTALL_STAGING = YES
> +QT6GRPC_SUPPORTS_IN_SOURCE_BUILD = NO
> +QT6GRPC_CMAKE_BACKEND = ninja
>

When you break your Makefile variable definition over multiple lines you
should add a single newline before and after.


> +QT6GRPC_LICENSE = \
> +       GPL-3.0-only, \
> +       Apache-2.0 (tests), \
> +       BSD-3-Clause (infrastructure), \
> +       GFDL-1.3-no-invariants-only (documentation)
>

But i think only this one line is preferred:

QT6GRPC_LICENSE = GPL-3.0-only

Only the toplevel license and for the stuff that ends up on target, I
believe the maintainers arrived at this conclusion in a prior discussion.

For consistency and improved readability you should also add a newline here:

+QT6GRPC_LICENSE_FILES = \
> +       LICENSE.Apache-2.0.txt \
> +       LICENSES/BSD-3-Clause.txt \
> +       LICENSES/GFDL-1.3-no-invariants-only.txt \
> +       LICENSES/GPL-3.0-only.txt \
> +       LICENSES/LicenseRef-protobuf.txt \
> +       LICENSES/Qt-GPL-exception-1.0.txt
> +
>

In my opinion it is good to add all the license files here, as you have
done. Its probably better to ship too much than too little legal-info.


> +QT6GRPC_CONF_OPTS = \
> +       -DBUILD_WITH_PCH=OFF \
> +       -DQT_BUILD_EXAMPLES=OFF \
> +       -DQT_BUILD_TESTS=OFF \
> +       -DQT_HOST_PATH=$(HOST_DIR)
> +
> +QT6GRPC_DEPENDENCIES = \
> +       host-pkgconf \
> +       host-qt6grpc \
> +       qt6base
> +
> +ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
> +QT6GRPC_DEPENDENCIES += qt6declarative
> +endif
> +
> +HOST_QT6GRPC_DEPENDENCIES = \
> +       host-qt6base \
> +       host-protobuf
>

You could also order the above dependencies alphabetically


> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))
> --
> 2.49.0
>

Regards,
Roy

--00000000000017b2b40634ada1b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Jack,</div><div><br></div><div>Ni=
ce clean up. <br></div></div><br><div class=3D"gmail_quote gmail_quote_cont=
ainer"><div dir=3D"ltr" class=3D"gmail_attr">fre. 9. mai 2025 kl. 03:45 skr=
ev Jack Rubacha &lt;<a href=3D"mailto:rubacha.jack03@gmail.com">rubacha.jac=
k03@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Adds the QT GRPC module (containing Qt Protobuf as well).<br>
<br>
Signed-off-by: Jack Rubacha &lt;<a href=3D"mailto:rubacha.jack03@gmail.com"=
 target=3D"_blank">rubacha.jack03@gmail.com</a>&gt;<br>
<br>
---<br>
Changes v1 -&gt; v2:<br>
=C2=A0- Remove &#39;selects BR2_PACKAGE_HOST_QT6BASE&#39; as it is a make d=
ependency<br>
=C2=A0- Changes help text to clearly state both modules<br>
=C2=A0- Adds a git repository link to the help text<br>
=C2=A0- Cleans up license files to show all necessary files, matches hashfi=
le<br>
=C2=A0- Make multiline clauses alphabetically ordered<br>
<br>
---<br>
=C2=A0package/qt6/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 1 +<br>
=C2=A0package/qt6/qt6grpc/Config.in=C2=A0 =C2=A0 |=C2=A0 7 +++++<br>
=C2=A0package/qt6/qt6grpc/qt6grpc.hash | 10 +++++++<br>
=C2=A0package/qt6/qt6grpc/<a href=3D"http://qt6grpc.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6grpc.mk</a>=C2=A0 =C2=A0| 46 +++++++++++++++++++++++++=
+++++++<br>
=C2=A04 files changed, 64 insertions(+)<br>
=C2=A0create mode 100644 package/qt6/qt6grpc/Config.in<br>
=C2=A0create mode 100644 package/qt6/qt6grpc/qt6grpc.hash<br>
=C2=A0create mode 100644 package/qt6/qt6grpc/<a href=3D"http://qt6grpc.mk" =
rel=3D"noreferrer" target=3D"_blank">qt6grpc.mk</a><br>
<br>
diff --git a/package/qt6/Config.in b/package/qt6/Config.in<br>
index 10594691cf..9c297b321e 100644<br>
--- a/package/qt6/Config.in<br>
+++ b/package/qt6/Config.in<br>
@@ -48,6 +48,7 @@ source &quot;package/qt6/qt6charts/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6core5compat/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6declarative/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6graphs/Config.in&quot;<br>
+source &quot;package/qt6/qt6grpc/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6languageserver/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6mqtt/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6multimedia/Config.in&quot;<br>
diff --git a/package/qt6/qt6grpc/Config.in b/package/qt6/qt6grpc/Config.in<=
br>
new file mode 100644<br>
index 0000000000..3d82cfcb0c<br>
--- /dev/null<br>
+++ b/package/qt6/qt6grpc/Config.in<br>
@@ -0,0 +1,7 @@<br>
+config BR2_PACKAGE_QT6GRPC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;qt6grpc&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This package provides the Qt GRPC and Pr=
otobuf modules:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://doc.qt.io/qt-6/qtgrpc=
-index.html" rel=3D"noreferrer" target=3D"_blank">https://doc.qt.io/qt-6/qt=
grpc-index.html</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://code.qt.io/cgit/qt/qt=
grpc.git/" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/cgit/qt/=
qtgrpc.git/</a><br>
diff --git a/package/qt6/qt6grpc/qt6grpc.hash b/package/qt6/qt6grpc/qt6grpc=
.hash<br>
new file mode 100644<br>
index 0000000000..06da9f0700<br>
--- /dev/null<br>
+++ b/package/qt6/qt6grpc/qt6grpc.hash<br>
@@ -0,0 +1,10 @@<br>
+# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.8/6.=
8.1/submodules/qtgrpc-everywhere-src-6.8.1.tar.xz.sha256+sha256" rel=3D"nor=
eferrer" target=3D"_blank">https://download.qt.io/official_releases/qt/6.8/=
6.8.1/submodules/qtgrpc-everywhere-src-6.8.1.tar.xz.sha256<br>
+sha256</a>=C2=A0 b1615c7096b012e5f42aea57c420d2ce21c906d0eda3ea373b09a47cf=
40b5e80=C2=A0 qtgrpc-everywhere-src-6.8.1.tar.xz<br>
+<br>
+# Hashes for license files:<br>
+sha256=C2=A0 e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c8=
9cb=C2=A0 LICENSE.Apache-2.0.txt<br>
+sha256=C2=A0 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1d=
cce=C2=A0 LICENSES/BSD-3-Clause.txt<br>
+sha256=C2=A0 110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b20=
6a4=C2=A0 LICENSES/GFDL-1.3-no-invariants-only.txt<br>
+sha256=C2=A0 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b=
903=C2=A0 LICENSES/GPL-3.0-only.txt<br>
+sha256=C2=A0 6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fe=
a7d=C2=A0 LICENSES/LicenseRef-protobuf.txt<br>
+sha256=C2=A0 40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b053084=
6b2=C2=A0 LICENSES/Qt-GPL-exception-1.0.txt<br>
diff --git a/package/qt6/qt6grpc/<a href=3D"http://qt6grpc.mk" rel=3D"noref=
errer" target=3D"_blank">qt6grpc.mk</a> b/package/qt6/qt6grpc/<a href=3D"ht=
tp://qt6grpc.mk" rel=3D"noreferrer" target=3D"_blank">qt6grpc.mk</a><br>
new file mode 100644<br>
index 0000000000..b8bc2e4651<br>
--- /dev/null<br>
+++ b/package/qt6/qt6grpc/<a href=3D"http://qt6grpc.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6grpc.mk</a><br>
@@ -0,0 +1,46 @@<br>
+##########################################################################=
######<br>
+#<br>
+# qt6grpc<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+QT6GRPC_VERSION =3D $(QT6_VERSION)<br>
+QT6GRPC_SITE =3D $(QT6_SITE)<br>
+QT6GRPC_SOURCE =3D qtgrpc-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6GRPC_VERSION).=
tar.xz<br>
+QT6GRPC_INSTALL_STAGING =3D YES<br>
+QT6GRPC_SUPPORTS_IN_SOURCE_BUILD =3D NO<br>
+QT6GRPC_CMAKE_BACKEND =3D ninja<br>
</blockquote><div><br></div><div>When you break your Makefile variable defi=
nition over multiple lines you should add a single newline before and after=
.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+=
QT6GRPC_LICENSE =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GPL-3.0-only, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Apache-2.0 (tests), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0BSD-3-Clause (infrastructure), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GFDL-1.3-no-invariants-only (documentation)<br>
</blockquote><div><br></div><div>But i think only this one line is preferre=
d:</div><div><br></div><div>QT6GRPC_LICENSE =3D GPL-3.0-only</div><div><br>=
</div><div>Only the toplevel license and for the stuff that ends up on targ=
et, I believe the maintainers arrived at this conclusion in a prior discuss=
ion.</div><div><br></div><div><div>For consistency and improved readability=
 you should also add a newline here:</div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">+QT6GRPC_LICENSE_FILES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSE.Apache-2.0.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/BSD-3-Clause.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/GFDL-1.3-no-invariants-only.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/GPL-3.0-only.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/LicenseRef-protobuf.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/Qt-GPL-exception-1.0.txt<br>
+<br>
</blockquote><div><br></div><div><div>In my opinion it is good to add all t=
he license files here, as you have done. Its probably better to ship too mu=
ch than too little legal-info.</div><div>=C2=A0</div></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">+QT6GRPC_CONF_OPTS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DBUILD_WITH_PCH=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_BUILD_EXAMPLES=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_BUILD_TESTS=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_HOST_PATH=3D$(HOST_DIR)<br>
+<br>
+QT6GRPC_DEPENDENCIES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host-pkgconf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host-qt6grpc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0qt6base<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)<br>
+QT6GRPC_DEPENDENCIES +=3D qt6declarative<br>
+endif<br>
+<br>
+HOST_QT6GRPC_DEPENDENCIES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host-qt6base \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host-protobuf<br>
</blockquote><div><br></div><div>You could also order the above dependencie=
s alphabetically</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">+<br>
+$(eval $(cmake-package))<br>
+$(eval $(host-cmake-package))<br>
-- <br>
2.49.0<br></blockquote><div><br></div><div>Regards,</div><div>Roy <br></div=
></div></div>

--00000000000017b2b40634ada1b2--

--===============7734120844257469549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7734120844257469549==--
