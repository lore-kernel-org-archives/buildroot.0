Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D910C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 08:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3FB240352;
	Sun, 14 Jul 2024 08:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRimpDonsF3N; Sun, 14 Jul 2024 08:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FFC740372
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FFC740372;
	Sun, 14 Jul 2024 08:33:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 097661BF576
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 08:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9C3840372
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 08:33:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RKjKWJE7oGue for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 08:33:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D86040352
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D86040352
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D86040352
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 08:33:42 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-654cf0a069eso28578437b3.1
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 01:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720946021; x=1721550821;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yZ7LVVsG/WR2qlwOlbjS5v94+mozGKeu9JSTOqN0wpA=;
 b=asIJ//I4y1rNLfVYlOQHleMowjhuSWvmksNWYogRtDDUElu9KF00MqCBPjM7xGqKWU
 pE7EfMvbeDZ+qVWw1vckmmdK1Vx+0DSF79QEDjDnCsym15BR82Mnlsd2E8sJrQrB6bsL
 zbgETn9zcadyHz1rfbJUP/Q3sU4a66u8wHC+cOdNhy1uGqahb+1L8RjlZ4gyL+PMDwQ9
 l1kaOOVkr84wYJxiBYTLKsNVVwcXXsjZtjCTHY/zHdVVods4qWiFY7fRlof/KAD8JZAV
 A+7h34cr/JmZlvz61o5t6nXiUNdo95UNGQHBbko1JBkItSr0ZwmLmX+W6Qg3l7Ohd510
 jvsQ==
X-Gm-Message-State: AOJu0YziDwkciIkp0DeQkrIechQKwhN6GcNj950tMpzej0Law5s9Iko0
 OvQgeIKIcZKCJ1B21UsKvMACHwJlWA6wkUI0UmWbZktEFomHiV3nUPA2acVhoEVf2YAOss1d04s
 VTpanpRAMRXdnPoo1fiVS7AK2ZIs=
X-Google-Smtp-Source: AGHT+IGh02PIwqFLWcB9FKq6y4cKazq6ezxevjCcXhvogzjHICRXW+W/7XezwDIPMySdJcst2/XKvKe+JdjA4gl2VZ4=
X-Received: by 2002:a05:690c:3512:b0:62a:530:472f with SMTP id
 00721157ae682-658f02f4a66mr212387067b3.32.1720946021241; Sun, 14 Jul 2024
 01:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-6-roykollensvendsen@gmail.com>
 <20240712105138.4e28f65d@windsurf>
In-Reply-To: <20240712105138.4e28f65d@windsurf>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Sun, 14 Jul 2024 10:33:29 +0200
Message-ID: <CA+R_deo1bTkEVThZfubHt6nNrL9XfmOJ-a43xuiEAfiPpe-WDA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720946021; x=1721550821; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yZ7LVVsG/WR2qlwOlbjS5v94+mozGKeu9JSTOqN0wpA=;
 b=moEW0xEV3xG8+5vntSNdsJOlbUO/tR1/ATrIQWw34n99TMPifBh5e35jnWLzgYJkbz
 3Pv6eogWz9r8mxuLhPd5V/y6yKEoYxMMS9QL2XFArtdibGHAsZWkaGEqt8heGMBLQro8
 5bPzJOkLzSFLxoQrLalBNQ3AsE4oMQqyOtzC2CL6nTIbQYuEBcDJIDgAAwcClrz/V7mJ
 gBPDZvC9RLCO42CgoKFtWEfms2dQ6wcce/xcS7LlPXu2Y1Y59eALv1ANhYuzTeNyjxcv
 bSSm1lO9tzg2jFZ7JZJ2Y3HULDhLS+XC9nztV/CZuqWFlzDjESaEFGrf3bUYRyClIgYb
 u/cQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=moEW0xEV
Subject: Re: [Buildroot] [PATCH v9 06/14] package/qt6/qt6shadertools: new
 package
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0539200605172139145=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0539200605172139145==
Content-Type: multipart/alternative; boundary="000000000000461c2f061d30f8d0"

--000000000000461c2f061d30f8d0
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

Thanks for the example, I'll do a review as soon as possible.

Best Regards,
Roy

fre. 12. juli 2024 kl. 10:51 skrev Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> Hello Roy,
>
> On Tue, 25 Jun 2024 23:18:30 +0200
> Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
>
> > diff --git a/package/qt6/qt6shadertools/Config.in
> b/package/qt6/qt6shadertools/Config.in
> > new file mode 100644
> > index 0000000000..1b47dc6132
> > --- /dev/null
> > +++ b/package/qt6/qt6shadertools/Config.in
> > @@ -0,0 +1,13 @@
> > +config BR2_PACKAGE_QT6SHADERTOOLS
> > +     bool "qt6shadertools"
> > +     select BR2_PACKAGE_HOST_QT6BASE_GUI
>
> I've added a comment above this line (taken from your commit log) to
> explain why we are selecting this, as it's not obvious.
>
>
> > +QT6SHADERTOOLS_LICENSE = \
> > +     GPL-2.0+ or LGPL-3.0, \
> > +     GPL-3.0, GFDL-1.3 no invariants (docs)
>
> This licensing information looked not correct, and actually the
> licensing info was also not correct for qt6languageserver, it seems to
> just be copy/pasted. So I'm wondering if the licensing information for
> qt6 packages we already have in the tree is correct. Could you do a
> review?
>
> To do this review, just do:
>
> grep -r SPDX *
>
> in the source tree.
>
> For shadertools, this gives us:
>
> buildroot-build/include/QtShaderTools/qtshadertoolsexports.h://
> SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR
> GPL-2.0-only OR GPL-3.0-only
> buildroot-build/include/QtShaderTools/6.7.2/QtShaderTools/private/qtshadertoolsexports_p.h://
> SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR
> GPL-2.0-only OR GPL-3.0-only
> buildroot-build/lib/cmake/Qt6BuildInternals/StandaloneTests/QtShaderToolsTestsConfig.cmake:#
> SPDX-License-Identifier: BSD-3-Clause
> buildroot-build/lib/cmake/Qt6ShaderTools/Qt6ShaderToolsConfig.cmake:#
> SPDX-License-Identifier: BSD-3-Clause
> buildroot-build/lib/cmake/Qt6ShaderTools/Qt6ShaderToolsDependencies.cmake:#
> SPDX-License-Identifier: BSD-3-Clause
> buildroot-build/lib/cmake/Qt6ShaderTools/Qt6ShaderToolsConfigVersion.cmake:#
> SPDX-License-Identifier: BSD-3-Clause
> CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause
> licenseRule.json:                     "spdx: list of
> SPDX-License-Expression's allowed in the matching files.",
> src/SPIRV-Cross/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause
> src/3rdparty/SPIRV-Cross/spirv_hlsl.cpp: * SPDX-License-Identifier:
> Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_hlsl.hpp: * SPDX-License-Identifier:
> Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/GLSL.std.450.h: * SPDX-License-Identifier: MIT
> src/3rdparty/SPIRV-Cross/spirv_glsl.hpp: * SPDX-License-Identifier:
> Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_cross_parsed_ir.hpp: *
> SPDX-License-Identifier: Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_cross_containers.hpp: *
> SPDX-License-Identifier: Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_cpp.cpp: * SPDX-License-Identifier:
> Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_cross_c.h: * SPDX-License-Identifier:
> Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_cfg.hpp: * SPDX-License-Identifier:
> Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_cross_util.hpp: * SPDX-License-Identifier:
> Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_msl.hpp: * SPDX-License-Identifier:
> Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_parser.hpp: * SPDX-License-Identifier:
> Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_cross_util.cpp: * SPDX-License-Identifier:
> Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_cfg.cpp: * SPDX-License-Identifier:
> Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_cross_c.cpp: * SPDX-License-Identifier:
> Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_cross_error_handling.hpp: *
> SPDX-License-Identifier: Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_parser.cpp: * SPDX-License-Identifier:
> Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_cross.cpp: * SPDX-License-Identifier:
> Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_reflect.cpp: * SPDX-License-Identifier:
> Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_cpp.hpp: * SPDX-License-Identifier:
> Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_common.hpp: * SPDX-License-Identifier:
> Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_glsl.cpp: * SPDX-License-Identifier:
> Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_cross_parsed_ir.cpp: *
> SPDX-License-Identifier: Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_cross.hpp: * SPDX-License-Identifier:
> Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_reflect.hpp: * SPDX-License-Identifier:
> Apache-2.0 OR MIT
> src/3rdparty/SPIRV-Cross/spirv_msl.cpp: * SPDX-License-Identifier:
> Apache-2.0 OR MIT
> src/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause
> src/shadertools/qshaderrewriter_p.h:// SPDX-License-Identifier:
> LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
> src/shadertools/qspirvshader_p.h:// SPDX-License-Identifier:
> LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
> src/shadertools/qspirvcompiler.cpp:// SPDX-License-Identifier:
> LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
> src/shadertools/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause
> src/shadertools/qspirvcompiler_p.h:// SPDX-License-Identifier:
> LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
> src/shadertools/qspirvshaderremap.cpp:// SPDX-License-Identifier:
> LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
> src/shadertools/qtshadertoolsglobal.h:// SPDX-License-Identifier:
> LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
> src/shadertools/qshaderrewriter.cpp:// SPDX-License-Identifier:
> LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
> src/shadertools/qshaderbaker.cpp:// SPDX-License-Identifier:
> LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
> src/shadertools/doc/src/qtshadertools-index.qdoc://
> SPDX-License-Identifier: LicenseRef-Qt-Commercial OR
> GFDL-1.3-no-invariants-only
> src/shadertools/doc/src/qtshadertools-qsb.qdoc:// SPDX-License-Identifier:
> LicenseRef-Qt-Commercial OR GFDL-1.3-no-invariants-only
> src/shadertools/doc/src/qtshadertools-overview.qdoc://
> SPDX-License-Identifier: LicenseRef-Qt-Commercial OR
> GFDL-1.3-no-invariants-only
> src/shadertools/doc/src/qtshadertools-build.qdoc://
> SPDX-License-Identifier: LicenseRef-Qt-Commercial OR
> GFDL-1.3-no-invariants-only
> src/shadertools/qspirvshaderremap_p.h:// SPDX-License-Identifier:
> LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
> src/shadertools/qspirvshader.cpp:// SPDX-License-Identifier:
> LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
> src/shadertools/qshaderbaker.h:// SPDX-License-Identifier:
> LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
> src/shadertools/qtshadertoolsglobal_p.h:// SPDX-License-Identifier:
> LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
> src/glslang/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause
> tests/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause
> tests/auto/cmake/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause
> tests/auto/qshaderbaker/tst_qshaderbaker.cpp:// SPDX-License-Identifier:
> LicenseRef-Qt-Commercial OR GPL-3.0-only
> tests/auto/qshaderbaker/CMakeLists.txt:# SPDX-License-Identifier:
> BSD-3-Clause
> tests/auto/buildtimeqsb/CMakeLists.txt:# SPDX-License-Identifier:
> BSD-3-Clause
> tests/auto/buildtimeqsb/tst_buildtimeqsb.cpp:// SPDX-License-Identifier:
> LicenseRef-Qt-Commercial OR GPL-3.0-only
> tests/manual/qmlappshadermacro/main.cpp:// SPDX-License-Identifier:
> LicenseRef-Qt-Commercial OR GPL-3.0-only
> tests/manual/qmlappshadermacro/main.qml:// SPDX-License-Identifier:
> LicenseRef-Qt-Commercial OR GPL-3.0-only
> tests/manual/qmlappshadermacro/CMakeLists.txt:# SPDX-License-Identifier:
> BSD-3-Clause
> tools/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause
> tools/qsb/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause
> tools/qsb/qsb.cpp:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR
> GPL-3.0-only WITH Qt-GPL-exception-1.0
> tools/qsb/Qt6ShaderToolsMacros.cmake:# SPDX-License-Identifier:
> BSD-3-Clause
>
> So, I've summarized that as:
>
> +QT6SHADERTOOLS_LICENSE = \
> +       Apache-2.0 or MIT (SPIRV-Cross), \
> +       GPL-2.0 or LGPL-3.0 or GPL-3.0, \
> +       GPL-3.0 (tests), GFDL-1.3 no invariants (docs), \
> +       GPL-3.0 WITH Qt-GPL-exception-1.0 (tools)
>
> > +QT6SHADERTOOLS_LICENSE_FILES = \
> > +     LICENSES/GPL-2.0-only.txt \
> > +     LICENSES/GPL-3.0-only.txt \
> > +     LICENSES/LGPL-3.0-only.txt \
> > +     LICENSES/GFDL-1.3-no-invariants-only.txt
>
> I've added:
>
> LICENSES/Qt-GPL-exception-1.0.txt
>
> Could you do a similar review on *existing* qt6 packages? I'll do the
> review for the next qt6 packages in your series, while applying them.
>
> I've applied your patch with those changes.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000461c2f061d30f8d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Thomas,</div><div><br></div><div>Thanks for the ex=
ample, I&#39;ll do a review as soon as possible.</div><div><br></div><div>B=
est Regards,</div><div>Roy<br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">fre. 12. juli 2024 kl. 10:51 skrev Thom=
as Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.pet=
azzoni@bootlin.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Hello Roy,<br>
<br>
On Tue, 25 Jun 2024 23:18:30 +0200<br>
Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com" targ=
et=3D"_blank">roykollensvendsen@gmail.com</a>&gt; wrote:<br>
<br>
&gt; diff --git a/package/qt6/qt6shadertools/Config.in b/package/qt6/qt6sha=
dertools/Config.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1b47dc6132<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/qt6/qt6shadertools/Config.in<br>
&gt; @@ -0,0 +1,13 @@<br>
&gt; +config BR2_PACKAGE_QT6SHADERTOOLS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;qt6shadertools&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_QT6BASE_GUI<br>
<br>
I&#39;ve added a comment above this line (taken from your commit log) to<br=
>
explain why we are selecting this, as it&#39;s not obvious.<br>
<br>
<br>
&gt; +QT6SHADERTOOLS_LICENSE =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0GPL-2.0+ or LGPL-3.0, \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0GPL-3.0, GFDL-1.3 no invariants (docs)<br>
<br>
This licensing information looked not correct, and actually the<br>
licensing info was also not correct for qt6languageserver, it seems to<br>
just be copy/pasted. So I&#39;m wondering if the licensing information for<=
br>
qt6 packages we already have in the tree is correct. Could you do a<br>
review?<br>
<br>
To do this review, just do:<br>
<br>
grep -r SPDX *<br>
<br>
in the source tree.<br>
<br>
For shadertools, this gives us:<br>
<br>
buildroot-build/include/QtShaderTools/qtshadertoolsexports.h:// SPDX-Licens=
e-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR =
GPL-3.0-only<br>
buildroot-build/include/QtShaderTools/6.7.2/QtShaderTools/private/qtshadert=
oolsexports_p.h:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGP=
L-3.0-only OR GPL-2.0-only OR GPL-3.0-only<br>
buildroot-build/lib/cmake/Qt6BuildInternals/StandaloneTests/QtShaderToolsTe=
stsConfig.cmake:# SPDX-License-Identifier: BSD-3-Clause<br>
buildroot-build/lib/cmake/Qt6ShaderTools/Qt6ShaderToolsConfig.cmake:# SPDX-=
License-Identifier: BSD-3-Clause<br>
buildroot-build/lib/cmake/Qt6ShaderTools/Qt6ShaderToolsDependencies.cmake:#=
 SPDX-License-Identifier: BSD-3-Clause<br>
buildroot-build/lib/cmake/Qt6ShaderTools/Qt6ShaderToolsConfigVersion.cmake:=
# SPDX-License-Identifier: BSD-3-Clause<br>
CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause<br>
licenseRule.json:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;spdx: list of SPDX-License-Expression&#39;s allow=
ed in the matching files.&quot;,<br>
src/SPIRV-Cross/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause<br>
src/3rdparty/SPIRV-Cross/spirv_hlsl.cpp: * SPDX-License-Identifier: Apache-=
2.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_hlsl.hpp: * SPDX-License-Identifier: Apache-=
2.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/GLSL.std.450.h: * SPDX-License-Identifier: MIT<br>
src/3rdparty/SPIRV-Cross/spirv_glsl.hpp: * SPDX-License-Identifier: Apache-=
2.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_cross_parsed_ir.hpp: * SPDX-License-Identifi=
er: Apache-2.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_cross_containers.hpp: * SPDX-License-Identif=
ier: Apache-2.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_cpp.cpp: * SPDX-License-Identifier: Apache-2=
.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_cross_c.h: * SPDX-License-Identifier: Apache=
-2.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_cfg.hpp: * SPDX-License-Identifier: Apache-2=
.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_cross_util.hpp: * SPDX-License-Identifier: A=
pache-2.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_msl.hpp: * SPDX-License-Identifier: Apache-2=
.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_parser.hpp: * SPDX-License-Identifier: Apach=
e-2.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_cross_util.cpp: * SPDX-License-Identifier: A=
pache-2.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_cfg.cpp: * SPDX-License-Identifier: Apache-2=
.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_cross_c.cpp: * SPDX-License-Identifier: Apac=
he-2.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_cross_error_handling.hpp: * SPDX-License-Ide=
ntifier: Apache-2.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_parser.cpp: * SPDX-License-Identifier: Apach=
e-2.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_cross.cpp: * SPDX-License-Identifier: Apache=
-2.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_reflect.cpp: * SPDX-License-Identifier: Apac=
he-2.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_cpp.hpp: * SPDX-License-Identifier: Apache-2=
.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_common.hpp: * SPDX-License-Identifier: Apach=
e-2.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_glsl.cpp: * SPDX-License-Identifier: Apache-=
2.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_cross_parsed_ir.cpp: * SPDX-License-Identifi=
er: Apache-2.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_cross.hpp: * SPDX-License-Identifier: Apache=
-2.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_reflect.hpp: * SPDX-License-Identifier: Apac=
he-2.0 OR MIT<br>
src/3rdparty/SPIRV-Cross/spirv_msl.cpp: * SPDX-License-Identifier: Apache-2=
.0 OR MIT<br>
src/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause<br>
src/shadertools/qshaderrewriter_p.h:// SPDX-License-Identifier: LicenseRef-=
Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only<br>
src/shadertools/qspirvshader_p.h:// SPDX-License-Identifier: LicenseRef-Qt-=
Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only<br>
src/shadertools/qspirvcompiler.cpp:// SPDX-License-Identifier: LicenseRef-Q=
t-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only<br>
src/shadertools/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause<br>
src/shadertools/qspirvcompiler_p.h:// SPDX-License-Identifier: LicenseRef-Q=
t-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only<br>
src/shadertools/qspirvshaderremap.cpp:// SPDX-License-Identifier: LicenseRe=
f-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only<br>
src/shadertools/qtshadertoolsglobal.h:// SPDX-License-Identifier: LicenseRe=
f-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only<br>
src/shadertools/qshaderrewriter.cpp:// SPDX-License-Identifier: LicenseRef-=
Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only<br>
src/shadertools/qshaderbaker.cpp:// SPDX-License-Identifier: LicenseRef-Qt-=
Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only<br>
src/shadertools/doc/src/qtshadertools-index.qdoc:// SPDX-License-Identifier=
: LicenseRef-Qt-Commercial OR GFDL-1.3-no-invariants-only<br>
src/shadertools/doc/src/qtshadertools-qsb.qdoc:// SPDX-License-Identifier: =
LicenseRef-Qt-Commercial OR GFDL-1.3-no-invariants-only<br>
src/shadertools/doc/src/qtshadertools-overview.qdoc:// SPDX-License-Identif=
ier: LicenseRef-Qt-Commercial OR GFDL-1.3-no-invariants-only<br>
src/shadertools/doc/src/qtshadertools-build.qdoc:// SPDX-License-Identifier=
: LicenseRef-Qt-Commercial OR GFDL-1.3-no-invariants-only<br>
src/shadertools/qspirvshaderremap_p.h:// SPDX-License-Identifier: LicenseRe=
f-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only<br>
src/shadertools/qspirvshader.cpp:// SPDX-License-Identifier: LicenseRef-Qt-=
Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only<br>
src/shadertools/qshaderbaker.h:// SPDX-License-Identifier: LicenseRef-Qt-Co=
mmercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only<br>
src/shadertools/qtshadertoolsglobal_p.h:// SPDX-License-Identifier: License=
Ref-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only<br>
src/glslang/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause<br>
tests/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause<br>
tests/auto/cmake/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause<br>
tests/auto/qshaderbaker/tst_qshaderbaker.cpp:// SPDX-License-Identifier: Li=
censeRef-Qt-Commercial OR GPL-3.0-only<br>
tests/auto/qshaderbaker/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Cla=
use<br>
tests/auto/buildtimeqsb/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Cla=
use<br>
tests/auto/buildtimeqsb/tst_buildtimeqsb.cpp:// SPDX-License-Identifier: Li=
censeRef-Qt-Commercial OR GPL-3.0-only<br>
tests/manual/qmlappshadermacro/main.cpp:// SPDX-License-Identifier: License=
Ref-Qt-Commercial OR GPL-3.0-only<br>
tests/manual/qmlappshadermacro/main.qml:// SPDX-License-Identifier: License=
Ref-Qt-Commercial OR GPL-3.0-only<br>
tests/manual/qmlappshadermacro/CMakeLists.txt:# SPDX-License-Identifier: BS=
D-3-Clause<br>
tools/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause<br>
tools/qsb/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause<br>
tools/qsb/qsb.cpp:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR G=
PL-3.0-only WITH Qt-GPL-exception-1.0<br>
tools/qsb/Qt6ShaderToolsMacros.cmake:# SPDX-License-Identifier: BSD-3-Claus=
e<br>
<br>
So, I&#39;ve summarized that as:<br>
<br>
+QT6SHADERTOOLS_LICENSE =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Apache-2.0 or MIT (SPIRV-Cross), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GPL-2.0 or LGPL-3.0 or GPL-3.0, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GPL-3.0 (tests), GFDL-1.3 no invariants (docs),=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GPL-3.0 WITH Qt-GPL-exception-1.0 (tools)<br>
<br>
&gt; +QT6SHADERTOOLS_LICENSE_FILES =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LICENSES/GPL-2.0-only.txt \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LICENSES/GPL-3.0-only.txt \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LICENSES/LGPL-3.0-only.txt \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LICENSES/GFDL-1.3-no-invariants-only.txt<br>
<br>
I&#39;ve added:<br>
<br>
LICENSES/Qt-GPL-exception-1.0.txt<br>
<br>
Could you do a similar review on *existing* qt6 packages? I&#39;ll do the<b=
r>
review for the next qt6 packages in your series, while applying them.<br>
<br>
I&#39;ve applied your patch with those changes.<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000461c2f061d30f8d0--

--===============0539200605172139145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0539200605172139145==--
