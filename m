Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A82C3ABC6
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 21:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B5F761008;
	Thu,  8 May 2025 21:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wI58wWnJ4Jaq; Thu,  8 May 2025 21:01:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E42FA61005
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E42FA61005;
	Thu,  8 May 2025 21:01:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B7AD15A
 for <buildroot@buildroot.org>; Thu,  8 May 2025 21:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67B8040547
 for <buildroot@buildroot.org>; Thu,  8 May 2025 21:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xXjoW8sa00IT for <buildroot@buildroot.org>;
 Thu,  8 May 2025 21:01:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2A5CD403D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A5CD403D5
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A5CD403D5
 for <buildroot@buildroot.org>; Thu,  8 May 2025 21:01:52 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-70907505121so15002717b3.0
 for <buildroot@buildroot.org>; Thu, 08 May 2025 14:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746738111; x=1747342911;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/tw89DrSfOW7f07dLW4PVwU95JCclSbOPuVdk9A2XT8=;
 b=F+Ui5g0zUD9xxVP/2E7mGeOqBXeSl0vTKfoq7eJV9SmbZZz0rI2M0Fo4CukQqBU2Gm
 MOlL8PcdklNVV8BkPn4nI1vMwFighN7QuW7AgCjTtR+n8Piva4pOoZq0JRAorcuPokYT
 8ZFhGZxeLphRgqb0+emgtk7fy6Pmr+gbfGJADNRsEVkoXeh9mFIrfDapnWNWFioPv+El
 FQZuvJtmkRk9ORVLWZwE2rxUlgdzAVfuVjNH+kJ2URtm3whqqjvR5zy1JKZ6vJTdc7Kd
 9t0LZxUeIgIxgWIivgsSvu3WZvUCXZUwnQWG8VySO4N165dHNFUJAb1L7bFJng0seleh
 zlbw==
X-Gm-Message-State: AOJu0YxAehs+iWzKiz5Kx7hSrcM8k3YtnlJc0X5VuCXT59f6kLw2CL3i
 Uzxw6reOHi+RaJ/lbk2rMoIepAVsnEJ200KfJu4+Kw2b6vlBo9mbvs+h+rK0CkOV026WHgYrgqD
 ILpevUoHkueAg2aa3oUmpUyrgmOD60yK8
X-Gm-Gg: ASbGncu7yxueAckW/ZBHUwaqdDWwK8OBc52iJ4B3CpeJJR7Jehdhwjyo/amaPb2+uY1
 p9qcqd+aaeit4HUzEhyIL1q5ZLxsCx2oSVtXCUAB2Q3WSfFYMp9EEOTtYvRHuG/5Pw+3r3qMLNK
 fkCiU+qPXqLBixsFHCkWAPWrY=
X-Google-Smtp-Source: AGHT+IFVNgXeVJ4Cu0oaLRw7swlIWFuqqclN+LlO/ABu35K6d7ffCWkftKCuwzccaS45xX38wotn2+o1nM2Lt32v9VI=
X-Received: by 2002:a05:690c:4982:b0:6f9:97f7:a5c3 with SMTP id
 00721157ae682-70a3fa42c32mr14148067b3.18.1746738110722; Thu, 08 May 2025
 14:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250506040556.1023507-1-rubacha.jack03@gmail.com>
In-Reply-To: <20250506040556.1023507-1-rubacha.jack03@gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Thu, 8 May 2025 23:01:38 +0200
X-Gm-Features: AX0GCFs0dr_6xYkLQ72aglAxHGLcDdgbBPyKBaPws2kryqh1F3BuCPo7_mo3iAQ
Message-ID: <CA+R_deqyLH=xthFGGbyq7qeTBNKG4FC0QYCpSt7XryrppOLPkQ@mail.gmail.com>
To: Jack Rubacha <rubacha.jack03@gmail.com>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746738111; x=1747342911; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/tw89DrSfOW7f07dLW4PVwU95JCclSbOPuVdk9A2XT8=;
 b=UzS/dLrzN2gu5CICVJLbR4amWpBrse/gtEIQoPguKP3vVSC1UDmxDWqjamLGN6H+mP
 0+DobXZH3S6/FGzgf1y+0rcJTvbKZqI+R/cftg3WwTOAd82rLqrksJFGBhcdoBqF62pW
 GzwPxLZgpSpQX3iDPi0H3ngCI7t+ExRAkN3Oo3tlkue9W/kYAhGK/uLN/1dCwskBfEes
 mcolw6g9JKULGOJJARF7l1VX2VsyZA7FBsj+n6cjpLyK3bJi7hWL0d5GSAsD5nwUxb/S
 kR5iBQhip1kG2qBrCW7Nc4igXBZf8VoUhwOF/6LUWJoC/+fgVNj9FklZHB5nOyiQI+RB
 396g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UzS/dLrz
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6grpc: new package
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
Content-Type: multipart/mixed; boundary="===============8111835587879647298=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8111835587879647298==
Content-Type: multipart/alternative; boundary="0000000000009afe080634a62817"

--0000000000009afe080634a62817
Content-Type: text/plain; charset="UTF-8"

Hi Jack,

Thanks for contributing this patch.

By the way, the commit message should be: "package/qt6/qt6grpc: new
package" (not 'package/qt6grpc:...')

I have rebased and tested your package on top of qt 6.9.0.

Looks good so far.

tir. 6. mai 2025 kl. 06:06 skrev Jack Rubacha <rubacha.jack03@gmail.com>:

> Signed-off-by: Jack Rubacha <rubacha.jack03@gmail.com>
> ---
>  package/qt6/Config.in            |  1 +
>  package/qt6/qt6grpc/Config.in    |  7 +++++++
>  package/qt6/qt6grpc/qt6grpc.hash | 10 ++++++++++
>  package/qt6/qt6grpc/qt6grpc.mk   | 34 ++++++++++++++++++++++++++++++++
>  4 files changed, 52 insertions(+)
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
> index 0000000000..66adc85cfa
> --- /dev/null
> +++ b/package/qt6/qt6grpc/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_QT6GRPC
> +       bool "qt6grpc"
> +       select BR2_PACKAGE_HOST_QT6BASE
>

What is your intention when selecting this option?


> +       help
> +         This package corresponds the Qt GRPC module:
>

I think it is more correct to use the word 'provides' than 'corresponds'
here, since the package provides atleast one more module.


> +
> +         https://doc.qt.io/qt-6/qtgrpc-index.html


I like to have a link to the official git repo here too.

>
> diff --git a/package/qt6/qt6grpc/qt6grpc.hash
> b/package/qt6/qt6grpc/qt6grpc.hash
> new file mode 100644
> index 0000000000..0ebcaaf2a0
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
> +sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce
> LICENSES/BSD-3-Clause.txt
> +sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4
> LICENSES/GFDL-1.3-no-invariants-only.txt
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> LICENSES/GPL-2.0-only.txt
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
> LICENSES/GPL-3.0-only.txt
> +sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768
> LICENSES/LGPL-3.0-only.txt
> +sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2
> LICENSES/Qt-GPL-exception-1.0.txt
>

You hashes for more filen than in _LICENSE_FILES.


> diff --git a/package/qt6/qt6grpc/qt6grpc.mk b/package/qt6/qt6grpc/
> qt6grpc.mk
> new file mode 100644
> index 0000000000..f443116ae0
> --- /dev/null
> +++ b/package/qt6/qt6grpc/qt6grpc.mk
> @@ -0,0 +1,34 @@
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
> +QT6GRPC_LICENSE = GPL-3.0
> +QT6GRPC_LICENSE_FILES = LICENSES/GPL-3.0-only.txt
>

You only list the toplevel target license file here, but you list hashes
for most of the license files.


> +
> +QT6GRPC_CONF_OPTS = \
> +       -DQT_HOST_PATH=$(HOST_DIR) \
> +       -DBUILD_WITH_PCH=OFF \
> +       -DQT_BUILD_EXAMPLES=OFF \
> +       -DQT_BUILD_TESTS=OFF
>

I think you follow the same pattern as in the other qt6 pacakges, but I
think it is better to order the optons alpabetically:
QT6GRPC_CONF_OPTS = \
       -DBUILD_WITH_PCH=OFF \
       -DQT_BUILD_EXAMPLES=OFF \
       -DQT_BUILD_TESTS=OFF \
       -DQT_HOST_PATH=$(HOST_DIR)


> +
> +QT6GRPC_DEPENDENCIES = \
> +       host-pkgconf \
> +       qt6base \
> +       host-qt6grpc
>

The same applies here:
QT6GRPC_DEPENDENCIES = \
       host-pkgconf \
       host-qt6grpc \
       qt6base


> +
> +ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
> +QT6GRPC_DEPENDENCIES += qt6declarative
> +endif
> +
> +HOST_QT6GRPC_DEPENDENCIES = host-qt6base host-protobuf
>

For me this is more readable:
HOST_QT6GRPC_DEPENDENCIES = \
       host-qt6base \
       host-protobuf

> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))
> --
> 2.49.0
>

Best Regards,
Roy

--0000000000009afe080634a62817
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Jack,</div><div><br></div><div>Th=
anks for contributing this patch.</div><div>=C2=A0<br></div><div>By the way=
, the commit message should be: &quot;package/qt6/qt6grpc: new package&quot=
; (not &#39;package/qt6grpc:...&#39;)</div></div><div><br></div><div>I have=
 rebased and tested your package on top of qt 6.9.0.</div><div><br></div><d=
iv>Looks good so far.</div><div><br></div><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">tir. 6. mai 2025 kl. =
06:06 skrev Jack Rubacha &lt;<a href=3D"mailto:rubacha.jack03@gmail.com">ru=
bacha.jack03@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Signed-off-by: Jack Rubacha &lt;<a href=3D"mailto:rubacha.j=
ack03@gmail.com" target=3D"_blank">rubacha.jack03@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/qt6/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 1 +<br>
=C2=A0package/qt6/qt6grpc/Config.in=C2=A0 =C2=A0 |=C2=A0 7 +++++++<br>
=C2=A0package/qt6/qt6grpc/qt6grpc.hash | 10 ++++++++++<br>
=C2=A0package/qt6/qt6grpc/<a href=3D"http://qt6grpc.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6grpc.mk</a>=C2=A0 =C2=A0| 34 +++++++++++++++++++++++++=
+++++++<br>
=C2=A04 files changed, 52 insertions(+)<br>
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
index 0000000000..66adc85cfa<br>
--- /dev/null<br>
+++ b/package/qt6/qt6grpc/Config.in<br>
@@ -0,0 +1,7 @@<br>
+config BR2_PACKAGE_QT6GRPC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;qt6grpc&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_QT6BASE<br>
</blockquote><div><br></div><div>What is your intention when selecting this=
 option?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This package corresponds the Qt GRPC mod=
ule:<br></blockquote><div><br></div><div>I think it is more correct to use =
the word &#39;provides&#39; than &#39;corresponds&#39; here, since the pack=
age provides atleast one more module. <br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://doc.qt.io/qt-6/qtgrpc=
-index.html" rel=3D"noreferrer" target=3D"_blank">https://doc.qt.io/qt-6/qt=
grpc-index.html</a></blockquote><div><br></div><div>I like to have a link t=
o the official git repo here too. <br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><br>
diff --git a/package/qt6/qt6grpc/qt6grpc.hash b/package/qt6/qt6grpc/qt6grpc=
.hash<br>
new file mode 100644<br>
index 0000000000..0ebcaaf2a0<br>
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
+sha256=C2=A0 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1d=
cce=C2=A0 LICENSES/BSD-3-Clause.txt<br>
+sha256=C2=A0 110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b20=
6a4=C2=A0 LICENSES/GFDL-1.3-no-invariants-only.txt<br>
+sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880=
643=C2=A0 LICENSES/GPL-2.0-only.txt<br>
+sha256=C2=A0 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b=
903=C2=A0 LICENSES/GPL-3.0-only.txt<br>
+sha256=C2=A0 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464=
768=C2=A0 LICENSES/LGPL-3.0-only.txt<br>
+sha256=C2=A0 40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b053084=
6b2=C2=A0 LICENSES/Qt-GPL-exception-1.0.txt<br>
</blockquote><div><br></div><div>You hashes for more filen than in _LICENSE=
_FILES.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">diff --git a/package/qt6/qt6grpc/<a href=3D"http://qt6grpc.mk" rel=3D"=
noreferrer" target=3D"_blank">qt6grpc.mk</a> b/package/qt6/qt6grpc/<a href=
=3D"http://qt6grpc.mk" rel=3D"noreferrer" target=3D"_blank">qt6grpc.mk</a><=
br>
new file mode 100644<br>
index 0000000000..f443116ae0<br>
--- /dev/null<br>
+++ b/package/qt6/qt6grpc/<a href=3D"http://qt6grpc.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6grpc.mk</a><br>
@@ -0,0 +1,34 @@<br>
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
+QT6GRPC_LICENSE =3D GPL-3.0<br>
+QT6GRPC_LICENSE_FILES =3D LICENSES/GPL-3.0-only.txt<br></blockquote><div><=
br></div><div>You only list the toplevel target license file here, but you =
list hashes for most of the license files. <br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+QT6GRPC_CONF_OPTS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_HOST_PATH=3D$(HOST_DIR) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DBUILD_WITH_PCH=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_BUILD_EXAMPLES=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_BUILD_TESTS=3DOFF<br>
</blockquote><div><br></div><div>I think you follow the same pattern as in =
the other qt6 pacakges, but I think it is better to order the optons alpabe=
tically: <br></div><div>QT6GRPC_CONF_OPTS =3D \<br>

=C2=A0 =C2=A0 =C2=A0=C2=A0 -DBUILD_WITH_PCH=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 -DQT_BUILD_EXAMPLES=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 -DQT_BUILD_TESTS=3DOFF \<br>=C2=A0 =C2=A0 =C2=A0=
=C2=A0 -DQT_HOST_PATH=3D$(HOST_DIR)<br>=C2=A0 <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">+<br>
+QT6GRPC_DEPENDENCIES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host-pkgconf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0qt6base \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host-qt6grpc<br>
</blockquote><div><br></div><div>The same applies here:</div><div>QT6GRPC_D=
EPENDENCIES =3D \<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 host-pkgconf \<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 host-qt6grpc \<br>=C2=A0 =C2=A0 =C2=A0=C2=A0 qt6=
base<br>=C2=A0 <br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
+<br>
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)<br>
+QT6GRPC_DEPENDENCIES +=3D qt6declarative<br>
+endif<br>
+<br>
+HOST_QT6GRPC_DEPENDENCIES =3D host-qt6base host-protobuf<br></blockquote><=
div><br></div><div>For me this is more readable:</div><div>HOST_QT6GRPC_DEP=
ENDENCIES =3D \</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 host-qt6base=
 \</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 host-protobuf</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
+<br>
+$(eval $(cmake-package))<br>
+$(eval $(host-cmake-package))<br>
-- <br>
2.49.0<br></blockquote><div><br></div><div>Best Regards,</div><div>Roy <br>=
</div></div></div>

--0000000000009afe080634a62817--

--===============8111835587879647298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8111835587879647298==--
