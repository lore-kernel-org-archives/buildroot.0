Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2FCC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 08:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 796914143A;
	Fri, 12 Jul 2024 08:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OnepIH5QpOWx; Fri, 12 Jul 2024 08:51:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2595412B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2595412B8;
	Fri, 12 Jul 2024 08:51:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4911A1BF584
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3683260AE3
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id usmvIpKHKPaW for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 08:51:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7FE1C608C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FE1C608C3
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FE1C608C3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 08:51:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AC414000B;
 Fri, 12 Jul 2024 08:51:39 +0000 (UTC)
Date: Fri, 12 Jul 2024 10:51:38 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240712105138.4e28f65d@windsurf>
In-Reply-To: <20240625211847.1419944-6-roykollensvendsen@gmail.com>
References: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-6-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720774299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f3/kRTPYZcB86vOwM1C4krFRjZz/C9qAZccH5KZ1TIY=;
 b=PDbWbfTsHnmIHj+V5jRO7hScOLMozF0fzSI39ODEPdRFhAignLOaLdUMK9x42tvqKW7+GO
 mrPsU1IouUe+fRE358BVBP7pbR9O03/1lfwcveJoQ8rs1efbvmHAa+jv+aUW/7eASVV33h
 qDwLWa2yZbDk8ksBU/+3IY68XB4GI5UM032lZjzOeHA64m1uRiTCp9M3JoFbPexJmCi3WZ
 flJC8dfqNYouHyJclLNwNfD1DVHIb6LTuy5M9UFnwH/reOzSmlfsW2sK81Xl52QkeNJWKf
 EmQPIeO0DOUhX7LvsCw78sMt4k615rz7cdu8kPC5NxflqRXc+/cD1iEwWjzNDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PDbWbfTs
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roy,

On Tue, 25 Jun 2024 23:18:30 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> diff --git a/package/qt6/qt6shadertools/Config.in b/package/qt6/qt6shadertools/Config.in
> new file mode 100644
> index 0000000000..1b47dc6132
> --- /dev/null
> +++ b/package/qt6/qt6shadertools/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_QT6SHADERTOOLS
> +	bool "qt6shadertools"
> +	select BR2_PACKAGE_HOST_QT6BASE_GUI

I've added a comment above this line (taken from your commit log) to
explain why we are selecting this, as it's not obvious.


> +QT6SHADERTOOLS_LICENSE = \
> +	GPL-2.0+ or LGPL-3.0, \
> +	GPL-3.0, GFDL-1.3 no invariants (docs)

This licensing information looked not correct, and actually the
licensing info was also not correct for qt6languageserver, it seems to
just be copy/pasted. So I'm wondering if the licensing information for
qt6 packages we already have in the tree is correct. Could you do a
review?

To do this review, just do:

grep -r SPDX *

in the source tree.

For shadertools, this gives us:

buildroot-build/include/QtShaderTools/qtshadertoolsexports.h:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
buildroot-build/include/QtShaderTools/6.7.2/QtShaderTools/private/qtshadertoolsexports_p.h:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
buildroot-build/lib/cmake/Qt6BuildInternals/StandaloneTests/QtShaderToolsTestsConfig.cmake:# SPDX-License-Identifier: BSD-3-Clause
buildroot-build/lib/cmake/Qt6ShaderTools/Qt6ShaderToolsConfig.cmake:# SPDX-License-Identifier: BSD-3-Clause
buildroot-build/lib/cmake/Qt6ShaderTools/Qt6ShaderToolsDependencies.cmake:# SPDX-License-Identifier: BSD-3-Clause
buildroot-build/lib/cmake/Qt6ShaderTools/Qt6ShaderToolsConfigVersion.cmake:# SPDX-License-Identifier: BSD-3-Clause
CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause
licenseRule.json:                     "spdx: list of SPDX-License-Expression's allowed in the matching files.",
src/SPIRV-Cross/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause
src/3rdparty/SPIRV-Cross/spirv_hlsl.cpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_hlsl.hpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/GLSL.std.450.h: * SPDX-License-Identifier: MIT
src/3rdparty/SPIRV-Cross/spirv_glsl.hpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_cross_parsed_ir.hpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_cross_containers.hpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_cpp.cpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_cross_c.h: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_cfg.hpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_cross_util.hpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_msl.hpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_parser.hpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_cross_util.cpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_cfg.cpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_cross_c.cpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_cross_error_handling.hpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_parser.cpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_cross.cpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_reflect.cpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_cpp.hpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_common.hpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_glsl.cpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_cross_parsed_ir.cpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_cross.hpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_reflect.hpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/3rdparty/SPIRV-Cross/spirv_msl.cpp: * SPDX-License-Identifier: Apache-2.0 OR MIT
src/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause
src/shadertools/qshaderrewriter_p.h:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
src/shadertools/qspirvshader_p.h:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
src/shadertools/qspirvcompiler.cpp:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
src/shadertools/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause
src/shadertools/qspirvcompiler_p.h:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
src/shadertools/qspirvshaderremap.cpp:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
src/shadertools/qtshadertoolsglobal.h:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
src/shadertools/qshaderrewriter.cpp:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
src/shadertools/qshaderbaker.cpp:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
src/shadertools/doc/src/qtshadertools-index.qdoc:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GFDL-1.3-no-invariants-only
src/shadertools/doc/src/qtshadertools-qsb.qdoc:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GFDL-1.3-no-invariants-only
src/shadertools/doc/src/qtshadertools-overview.qdoc:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GFDL-1.3-no-invariants-only
src/shadertools/doc/src/qtshadertools-build.qdoc:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GFDL-1.3-no-invariants-only
src/shadertools/qspirvshaderremap_p.h:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
src/shadertools/qspirvshader.cpp:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
src/shadertools/qshaderbaker.h:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
src/shadertools/qtshadertoolsglobal_p.h:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
src/glslang/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause
tests/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause
tests/auto/cmake/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause
tests/auto/qshaderbaker/tst_qshaderbaker.cpp:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only
tests/auto/qshaderbaker/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause
tests/auto/buildtimeqsb/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause
tests/auto/buildtimeqsb/tst_buildtimeqsb.cpp:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only
tests/manual/qmlappshadermacro/main.cpp:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only
tests/manual/qmlappshadermacro/main.qml:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only
tests/manual/qmlappshadermacro/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause
tools/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause
tools/qsb/CMakeLists.txt:# SPDX-License-Identifier: BSD-3-Clause
tools/qsb/qsb.cpp:// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only WITH Qt-GPL-exception-1.0
tools/qsb/Qt6ShaderToolsMacros.cmake:# SPDX-License-Identifier: BSD-3-Clause

So, I've summarized that as:

+QT6SHADERTOOLS_LICENSE = \
+       Apache-2.0 or MIT (SPIRV-Cross), \
+       GPL-2.0 or LGPL-3.0 or GPL-3.0, \
+       GPL-3.0 (tests), GFDL-1.3 no invariants (docs), \
+       GPL-3.0 WITH Qt-GPL-exception-1.0 (tools)

> +QT6SHADERTOOLS_LICENSE_FILES = \
> +	LICENSES/GPL-2.0-only.txt \
> +	LICENSES/GPL-3.0-only.txt \
> +	LICENSES/LGPL-3.0-only.txt \
> +	LICENSES/GFDL-1.3-no-invariants-only.txt

I've added:

LICENSES/Qt-GPL-exception-1.0.txt

Could you do a similar review on *existing* qt6 packages? I'll do the
review for the next qt6 packages in your series, while applying them.

I've applied your patch with those changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
