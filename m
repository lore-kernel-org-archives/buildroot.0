Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4762C28B24
	for <buildroot@archiver.kernel.org>; Thu,  6 Mar 2025 19:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3592F412F9;
	Thu,  6 Mar 2025 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FyFN1M1ErNFa; Thu,  6 Mar 2025 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C46141291
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C46141291;
	Thu,  6 Mar 2025 19:35:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00F66F21
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 19:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4C0740979
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 19:35:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8SfC0AkAx4JU for <buildroot@buildroot.org>;
 Thu,  6 Mar 2025 19:35:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DF2DB40BF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF2DB40BF2
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF2DB40BF2
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 19:35:24 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e4419a47887so852520276.0
 for <buildroot@buildroot.org>; Thu, 06 Mar 2025 11:35:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741289724; x=1741894524;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jr18/HKJKB/SCvaAUzAkSkgW7BNPGv/PIlXAFnEVy1I=;
 b=KKKwrOMRIxMsY4Q7nz2PNAU35xcTofHYy+OaQjKFTEs3ceT7YjcoDnxGWnqGQ3Wzud
 cQA4KG8K5u1dWKxkbOnk4hzrITrKrzZMx7YxATfmAiPzcVuPD2EnTqJzYZLwrJU+a9Zt
 zucwxRK0IJqeQZ7/S0KxpzpZbbAG3Sw03V/0bX2xF+dbhXzCdpelEqsVWBpgZGXWr5Tj
 xK3hsMJIrIMowtca6DJCPKKkopCn3BUPtsnUlHxQlEbbEgk7hUQKENoIzkTWfQAjMMBW
 SZWUlFlA/ecK9eFXy6l/41vZJg8sib/MXTfYhSBhlkPmd7yEQU/V9jUZd/myeov3TeUm
 W02Q==
X-Gm-Message-State: AOJu0Yw2ClM9diUfDGJ4l0dFG29c+AeSEsu0jMRFplSwRda99OBSpJDo
 sUwnTGwNlyyGWiIIfF/uiiHKxnuaoYxNj57LIUky67Wf9azJsB/UrhaFMj9uOvpY2kYnwgW5dgn
 TQj3dtAuT1ooiB1Ty7/zVZGihcq0=
X-Gm-Gg: ASbGncvD+S8mwdIOLpF+3H0Yxvmzh/hmi98naxDtFXVIeqT4p1/uuk8K9unNGl9eyO4
 z+hIjqsW+YoBHgng0Vz7H+zwp/Qe0A7KvbRt1K/Cw9bK1dxnrj3d4JhWEMur9/SI3v4uhbeRL1C
 uSCkfBE6Rew5wT9Bejz3OzHKHwrUU=
X-Google-Smtp-Source: AGHT+IEUaMAf6GysfWNGT7D0aCU1WnzK3BvKHoQra4mPTOZOMptLMPbSZa2wQVKBIQrQ9meMEOXqZ3bdEnCqjtJsqsM=
X-Received: by 2002:a05:6902:1701:b0:e58:33aa:3ac7 with SMTP id
 3f1490d57ef6-e635c1ed2eemr798499276.44.1741289723164; Thu, 06 Mar 2025
 11:35:23 -0800 (PST)
MIME-Version: 1.0
References: <20240911131230.2299474-1-christian@klarinett.li>
 <20250306115443.2453044-1-christian@klarinett.li>
In-Reply-To: <20250306115443.2453044-1-christian@klarinett.li>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Thu, 6 Mar 2025 20:35:11 +0100
X-Gm-Features: AQ5f1JpY5WS4YIY4_ghOu8MJQfep9kWsrskC0yvnRq9TkuGIp7xQt8ENQmZpCII
Message-ID: <CA+R_deqUK7Wab4SGz8wFB38b7a3-wF7Rs_9EwSOBvAkcSNJ4+w@mail.gmail.com>
To: Christian Hitz <christian@klarinett.li>
Cc: buildroot@buildroot.org, Christian Hitz <christian.hitz@bbv.ch>, 
 Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741289724; x=1741894524; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Jr18/HKJKB/SCvaAUzAkSkgW7BNPGv/PIlXAFnEVy1I=;
 b=jDCUcmGpT69oLONMHMPSDl86v0hloWOwKYRNJV9pYWMZvb5vhG6m8xCiQTikFaQ9kN
 1PfmUz3BKZMVhfgEqMowE2mksBkWRWuYvfwJLdrpfqfLenZencaNsZzo0LR5ragmD8v/
 3Ce22tcGtmTuA+JRQ8PLnr5dnY+GpPpres+TkqpZTbWEa7ai3QCdvpUIWa44GE1LzZZa
 iGvzKywP10Jf55sH7jUrQSckAXE1K1F5wzeD3LR1wCjc9M7kyZWt9Xr2ItsCDYmsyZIM
 QlKDmVPteMsgON7qtJnl2Xdo5Jg9KjDcL2oBS0/NzQ+jS5o3BDgkMX5hVaNaUmgcOT9t
 +q+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jDCUcmGp
Subject: Re: [Buildroot] [PATCH v2] package/qt6/qt6connectivity: new package
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
Content-Type: multipart/mixed; boundary="===============9148814450491734341=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9148814450491734341==
Content-Type: multipart/alternative; boundary="0000000000006682fc062fb19b4c"

--0000000000006682fc062fb19b4c
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

Here are some superficial comments. I'll dig deeper when I have some spare
time.

Please also make a patch based on the series that bumps Qt to v6.8.2.

Regards,
Roy

tor. 6. mars 2025 kl. 12:54 skrev Christian Hitz <christian@klarinett.li>:

> From: Christian Hitz <christian.hitz@bbv.ch>
>
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> ---
> Changes v1 -> v2:
>   - remove concurrent dependency
>   - make dependency to neard runtime-only
>   - fix licenses and their hashes
> ---
>  package/qt6/Config.in                         |  1 +
>  package/qt6/qt6connectivity/Config.in         | 17 ++++++++
>  .../qt6/qt6connectivity/qt6connectivity.hash  | 11 +++++
>  .../qt6/qt6connectivity/qt6connectivity.mk    | 42 +++++++++++++++++++
>  4 files changed, 71 insertions(+)
>  create mode 100644 package/qt6/qt6connectivity/Config.in
>  create mode 100644 package/qt6/qt6connectivity/qt6connectivity.hash
>  create mode 100644 package/qt6/qt6connectivity/qt6connectivity.mk
>
> diff --git a/package/qt6/Config.in b/package/qt6/Config.in
> index 10594691cf..3597417ef7 100644
> --- a/package/qt6/Config.in
> +++ b/package/qt6/Config.in
> @@ -45,6 +45,7 @@ if BR2_PACKAGE_QT6
>
>  source "package/qt6/qt6base/Config.in"
>  source "package/qt6/qt6charts/Config.in"
> +source "package/qt6/qt6connectivity/Config.in"
>  source "package/qt6/qt6core5compat/Config.in"
>  source "package/qt6/qt6declarative/Config.in"
>  source "package/qt6/qt6graphs/Config.in"
> diff --git a/package/qt6/qt6connectivity/Config.in
> b/package/qt6/qt6connectivity/Config.in
> new file mode 100644
> index 0000000000..ba329d732e
> --- /dev/null
> +++ b/package/qt6/qt6connectivity/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_QT6CONNECTIVITY
> +       bool "qt6connectivity"
> +       depends on BR2_PACKAGE_NEARD || BR2_PACKAGE_BLUEZ5_UTILS
> +       select BR2_PACKAGE_QT6BASE_NETWORK
> +       select BR2_PACKAGE_QT6BASE_DBUS
> +       help
> +         Qt is a cross-platform application and UI framework for
> +         developers using C++.
> +
> +         Qt Connectivity module provides support for Bluetooth/NFC
> +         peripherials.
> +
> +         https://doc.qt.io/qt-6/qtbluetooth-index.html
> +         https://doc.qt.io/qt-6/qtnfc-index.html
> +
> +comment "qt6connectivity needs neard and/or bluez5_utils"
> +       depends on !BR2_PACKAGE_NEARD && !BR2_PACKAGE_BLUEZ5_UTILS
> diff --git a/package/qt6/qt6connectivity/qt6connectivity.hash
> b/package/qt6/qt6connectivity/qt6connectivity.hash
> new file mode 100644
> index 0000000000..f2c10a0adb
> --- /dev/null
> +++ b/package/qt6/qt6connectivity/qt6connectivity.hash
> @@ -0,0 +1,11 @@
> +# Hash from:
> https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtconnectivity-everywhere-src-6.8.1.tar.xz.sha256
> +sha256
> <https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtconnectivity-everywhere-src-6.8.1.tar.xz.sha256+sha256>
> ccfd46e7ad2290710788274e145fb1f224d8a5ce360764ec10824b5908a6441c
> qtconnectivity-everywhere-src-6.8.1.tar.xz
> +
> +# Hashes for license files:
> +sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb
> LICENSES/Apache-2.0.txt
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
> diff --git a/package/qt6/qt6connectivity/qt6connectivity.mk
> b/package/qt6/qt6connectivity/qt6connectivity.mk
> new file mode 100644
> index 0000000000..4d77b2328b
> --- /dev/null
> +++ b/package/qt6/qt6connectivity/qt6connectivity.mk
> @@ -0,0 +1,42 @@
>
> +################################################################################
> +#
> +# qt6connectivity
> +#
>
> +################################################################################
> +
> +QT6CONNECTIVITY_VERSION = $(QT6_VERSION)
> +QT6CONNECTIVITY_SITE = $(QT6_SITE)
> +QT6CONNECTIVITY_SOURCE =
> qtconnectivity-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6CONNECTIVITY_VERSION).tar.xz
> +QT6CONNECTIVITY_INSTALL_STAGING = YES
> +QT6CONNECTIVITY_SUPPORTS_IN_SOURCE_BUILD = NO
> +
>

Remove this empty line when the next variable definition is only one line.
No reason to emphasize this line.


> +QT6CONNECTIVITY_CMAKE_BACKEND = ninja
> +
> +QT6CONNECTIVITY_LICENSE = \
> +       GPL-2.0 or GPL-3.0 or LGPL-3.0, \
> +       GPL-3.0 with Qt GPL exception 1.0 (sdpscanner), \
> +       BSD-3-Clause (build system, examples), \
> +       Apache-2.0 (examples), \
> +       GPL-3.0, GFDL-1.3 no invariants (docs)
>

Only keep licenses for what ends up on target, and only the top level
license is necessary. (I think)


> +
> +QT6CONNECTIVITY_LICENSE_FILES = \
> +       LICENSES/Apache-2.0.txt \
> +       LICENSES/BSD-3-Clause.txt \
> +       LICENSES/GFDL-1.3-no-invariants-only.txt \
> +       LICENSES/GPL-2.0-only.txt \
> +       LICENSES/GPL-3.0-only.txt \
> +       LICENSES/LGPL-3.0-only.txt \
> +       LICENSES/Qt-GPL-exception-1.0.txt
> +
> +QT6CONNECTIVITY_CONF_OPTS = \
> +       -DQT_HOST_PATH=$(HOST_DIR) \
> +       -DBUILD_WITH_PCH=OFF \
> +       -DQT_BUILD_EXAMPLES=OFF \
>
+       -DQT_BUILD_TESTS=OFF
>
+
> +QT6CONNECTIVITY_DEPENDENCIES = \
>
+       qt6base
>

No reason to break this line since it only contains one element

+
> +QT6CONNECTIVITY_DEPENDENCIES += $(if
> $(BR2_PACKAGE_BLUEZ5_UTILS),bluez5_utils)
>

Check the documentation for how to do optional dependencies:

https://buildroot.org/downloads/manual/manual.html (16.2)




> +
> +$(eval $(cmake-package))
> --
> 2.48.1
>
>

--0000000000006682fc062fb19b4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Christian,</div><div><br></div><d=
iv><span class=3D"gmail-HwtZe" lang=3D"en"><span class=3D"gmail-jCAhz gmail=
-ChMk0b"><span class=3D"gmail-ryNqvb">Here are some superficial comments. I=
&#39;ll dig deeper when I have some spare time.</span></span></span></div><=
div><span class=3D"gmail-HwtZe" lang=3D"en"><span class=3D"gmail-jCAhz gmai=
l-ChMk0b"><span class=3D"gmail-ryNqvb"><br></span></span></span></div><div>=
<span class=3D"gmail-HwtZe" lang=3D"en"><span class=3D"gmail-jCAhz gmail-Ch=
Mk0b"><span class=3D"gmail-ryNqvb">Please also make a patch based on the se=
ries that bumps Qt to v6.8.2.</span></span></span></div><div><span class=3D=
"gmail-HwtZe" lang=3D"en"><span class=3D"gmail-jCAhz gmail-ChMk0b"><span cl=
ass=3D"gmail-ryNqvb"><br></span></span></span></div><div><span class=3D"gma=
il-HwtZe" lang=3D"en"><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=
=3D"gmail-ryNqvb">Regards,</span></span></span></div><div><span class=3D"gm=
ail-HwtZe" lang=3D"en"><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=
=3D"gmail-ryNqvb">Roy</span></span></span></div><div><br></div><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">tor. 6. mars 2025 kl=
. 12:54 skrev Christian Hitz &lt;<a href=3D"mailto:christian@klarinett.li" =
target=3D"_blank">christian@klarinett.li</a>&gt;:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">From: Christian Hitz &lt;<a href=3D"mailt=
o:christian.hitz@bbv.ch" target=3D"_blank">christian.hitz@bbv.ch</a>&gt;<br=
>
<br>
Signed-off-by: Christian Hitz &lt;<a href=3D"mailto:christian.hitz@bbv.ch" =
target=3D"_blank">christian.hitz@bbv.ch</a>&gt;<br>
---<br>
Changes v1 -&gt; v2:<br>
=C2=A0 - remove concurrent dependency<br>
=C2=A0 - make dependency to neard runtime-only<br>
=C2=A0 - fix licenses and their hashes<br>
---<br>
=C2=A0package/qt6/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0package/qt6/qt6connectivity/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 17 ++++++++<br>
=C2=A0.../qt6/qt6connectivity/qt6connectivity.hash=C2=A0 | 11 +++++<br>
=C2=A0.../qt6/qt6connectivity/<a href=3D"http://qt6connectivity.mk" rel=3D"=
noreferrer" target=3D"_blank">qt6connectivity.mk</a>=C2=A0 =C2=A0 | 42 ++++=
+++++++++++++++<br>
=C2=A04 files changed, 71 insertions(+)<br>
=C2=A0create mode 100644 package/qt6/qt6connectivity/Config.in<br>
=C2=A0create mode 100644 package/qt6/qt6connectivity/qt6connectivity.hash<b=
r>
=C2=A0create mode 100644 package/qt6/qt6connectivity/<a href=3D"http://qt6c=
onnectivity.mk" rel=3D"noreferrer" target=3D"_blank">qt6connectivity.mk</a>=
<br>
<br>
diff --git a/package/qt6/Config.in b/package/qt6/Config.in<br>
index 10594691cf..3597417ef7 100644<br>
--- a/package/qt6/Config.in<br>
+++ b/package/qt6/Config.in<br>
@@ -45,6 +45,7 @@ if BR2_PACKAGE_QT6<br>
<br>
=C2=A0source &quot;package/qt6/qt6base/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6charts/Config.in&quot;<br>
+source &quot;package/qt6/qt6connectivity/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6core5compat/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6declarative/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6graphs/Config.in&quot;<br>
diff --git a/package/qt6/qt6connectivity/Config.in b/package/qt6/qt6connect=
ivity/Config.in<br>
new file mode 100644<br>
index 0000000000..ba329d732e<br>
--- /dev/null<br>
+++ b/package/qt6/qt6connectivity/Config.in<br>
@@ -0,0 +1,17 @@<br>
+config BR2_PACKAGE_QT6CONNECTIVITY<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;qt6connectivity&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_NEARD || BR2_PACKAGE_BLU=
EZ5_UTILS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6BASE_NETWORK<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6BASE_DBUS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Qt is a cross-platform application and U=
I framework for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0developers using C++.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Qt Connectivity module provides support =
for Bluetooth/NFC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0peripherials.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://doc.qt.io/qt-6/qtblue=
tooth-index.html" rel=3D"noreferrer" target=3D"_blank">https://doc.qt.io/qt=
-6/qtbluetooth-index.html</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://doc.qt.io/qt-6/qtnfc-=
index.html" rel=3D"noreferrer" target=3D"_blank">https://doc.qt.io/qt-6/qtn=
fc-index.html</a><br>
+<br>
+comment &quot;qt6connectivity needs neard and/or bluez5_utils&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_NEARD &amp;&amp; !BR2_P=
ACKAGE_BLUEZ5_UTILS<br>
diff --git a/package/qt6/qt6connectivity/qt6connectivity.hash b/package/qt6=
/qt6connectivity/qt6connectivity.hash<br>
new file mode 100644<br>
index 0000000000..f2c10a0adb<br>
--- /dev/null<br>
+++ b/package/qt6/qt6connectivity/qt6connectivity.hash<br>
@@ -0,0 +1,11 @@<br>
+# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.8/6.=
8.1/submodules/qtconnectivity-everywhere-src-6.8.1.tar.xz.sha256+sha256" re=
l=3D"noreferrer" target=3D"_blank">https://download.qt.io/official_releases=
/qt/6.8/6.8.1/submodules/qtconnectivity-everywhere-src-6.8.1.tar.xz.sha256<=
br>
+sha256</a>=C2=A0 ccfd46e7ad2290710788274e145fb1f224d8a5ce360764ec10824b590=
8a6441c=C2=A0 qtconnectivity-everywhere-src-6.8.1.tar.xz<br>
+<br>
+# Hashes for license files:<br>
+sha256=C2=A0 e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c8=
9cb=C2=A0 LICENSES/Apache-2.0.txt<br>
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
diff --git a/package/qt6/qt6connectivity/<a href=3D"http://qt6connectivity.=
mk" rel=3D"noreferrer" target=3D"_blank">qt6connectivity.mk</a> b/package/q=
t6/qt6connectivity/<a href=3D"http://qt6connectivity.mk" rel=3D"noreferrer"=
 target=3D"_blank">qt6connectivity.mk</a><br>
new file mode 100644<br>
index 0000000000..4d77b2328b<br>
--- /dev/null<br>
+++ b/package/qt6/qt6connectivity/<a href=3D"http://qt6connectivity.mk" rel=
=3D"noreferrer" target=3D"_blank">qt6connectivity.mk</a><br>
@@ -0,0 +1,42 @@<br>
+##########################################################################=
######<br>
+#<br>
+# qt6connectivity<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+QT6CONNECTIVITY_VERSION =3D $(QT6_VERSION)<br>
+QT6CONNECTIVITY_SITE =3D $(QT6_SITE)<br>
+QT6CONNECTIVITY_SOURCE =3D qtconnectivity-$(QT6_SOURCE_TARBALL_PREFIX)-$(Q=
T6CONNECTIVITY_VERSION).tar.xz<br>
+QT6CONNECTIVITY_INSTALL_STAGING =3D YES<br>
+QT6CONNECTIVITY_SUPPORTS_IN_SOURCE_BUILD =3D NO<br>
+<br></blockquote><div><br></div><div>Remove this empty line when the next =
variable definition is only one line. No reason to <span class=3D"gmail-Hwt=
Ze" lang=3D"en"><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gma=
il-ryNqvb">emphasize this line.</span></span></span></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+QT6CONNECTIVITY_CMAKE_BACKEND =3D ninja<br>
+<br>
+QT6CONNECTIVITY_LICENSE =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GPL-2.0 or GPL-3.0 or LGPL-3.0, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GPL-3.0 with Qt GPL exception 1.0 (sdpscanner),=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0BSD-3-Clause (build system, examples), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Apache-2.0 (examples), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GPL-3.0, GFDL-1.3 no invariants (docs)<br></blo=
ckquote><div><br></div><div>Only keep licenses for what ends up on target, =
and only the top level license is necessary. (I think)</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+QT6CONNECTIVITY_LICENSE_FILES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/Apache-2.0.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/BSD-3-Clause.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/GFDL-1.3-no-invariants-only.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/GPL-2.0-only.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/GPL-3.0-only.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/LGPL-3.0-only.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/Qt-GPL-exception-1.0.txt<br>
+<br>
+QT6CONNECTIVITY_CONF_OPTS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_HOST_PATH=3D$(HOST_DIR) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DBUILD_WITH_PCH=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_BUILD_EXAMPLES=3DOFF \ <br></blockquote><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0-DQT_BUILD_TESTS=3DOFF<br>
</blockquote><div></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+=
<br>
+QT6CONNECTIVITY_DEPENDENCIES =3D \ <br></blockquote><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0qt6base<br>
</blockquote><div><br></div><div>No reason to break this line since it only=
 contains one element <br></div><div><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">+<br>
+QT6CONNECTIVITY_DEPENDENCIES +=3D $(if $(BR2_PACKAGE_BLUEZ5_UTILS),bluez5_=
utils)<br></blockquote><div><br></div><div>Check the documentation for how =
to do optional dependencies:</div><div><br></div><div><a href=3D"https://bu=
ildroot.org/downloads/manual/manual.html">https://buildroot.org/downloads/m=
anual/manual.html</a> (16.2)</div><div><br></div><div><br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+$(eval $(cmake-package))<br>
-- <br>
2.48.1<br>
<br>
</blockquote></div></div>
</div>

--0000000000006682fc062fb19b4c--

--===============9148814450491734341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9148814450491734341==--
