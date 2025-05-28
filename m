Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45030C5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 18:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5DA6808C8;
	Wed, 28 May 2025 18:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRe98wK4ZeMI; Wed, 28 May 2025 18:42:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40C3E80714
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40C3E80714;
	Wed, 28 May 2025 18:42:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A43519D
 for <buildroot@buildroot.org>; Wed, 28 May 2025 18:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 707C24088C
 for <buildroot@buildroot.org>; Wed, 28 May 2025 18:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U52Zp6DYpSp1 for <buildroot@buildroot.org>;
 Wed, 28 May 2025 18:42:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE94440832
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE94440832
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE94440832
 for <buildroot@buildroot.org>; Wed, 28 May 2025 18:42:17 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-32a6a1a5f6dso769781fa.1
 for <buildroot@buildroot.org>; Wed, 28 May 2025 11:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748457735; x=1749062535;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ilvFona22vORCjLk3NeQV4hbYa1d8i2gh7q5vySuaNs=;
 b=ZvwTFAsCVMINc3BfG+h50GlodOnKVUsp6ltVeHmK3tWGE5J6w6No28bsGBrlLvjfpc
 ak1eAhSqHaDi8kZuUMDxUiZaTj5acJs/Tg6FWbqmnLWnG9yBlmxm73LVWXQdrQ/BAnxY
 37X31cSVF8Tn9yNHPkpx+Cnmsm/rq3P8VXoy2uNd6c+mstOc16bdji+AZl86Gijp7WJh
 Hl8crfnvVt757koGrtJH2nzs2T/kyW9mAU0jXYm8ZchBfHsW3RHvbvSdHjfUd8aI3ZZs
 YOhWqybppKDfSC7GWgNi3z5t0eFOpr2sErigwnofo0mk4plqAMPI1R81vCfSgcbP2BI5
 iVEw==
X-Gm-Message-State: AOJu0YxFVeUFimx7QjmyqQ27CiGQpVXnQF34tDbHMwXKzau6552szgQY
 0LZxoUfXGK7LEt9HihmC3n3ZpqCuZ3cGimAlX33rLzwtb6Nb3TBff7F7RautHFgeK8piuqF6aV3
 bG1Gc+ZfkUuTut4xCKRw2KL5wnePBo4I=
X-Gm-Gg: ASbGncsjyaDuB6UyOuwnT0EywK6oUIEQ7c70e3DUB3FKo51Q/RcxaPl1dMJCwdNh3kE
 1mj7bQx2G0iS9zX9ihPaADVTiHWpBaN4rJQspEOnhtlRQexfImDkEVS7dNyJp7J/91Kvquw7MGK
 ttN36VbVkFSwVFNElF7c3+stlZbYXxRcsYNzxrLUst9+qjlzR0FnfaI7ZbZZoc+U8RBkVQjjMaY
 Unagw==
X-Google-Smtp-Source: AGHT+IFFZQ8a81QJ/z7lS0rDwWXTBLv0K1S/Z/ukszndoVGYNOQj7Mopz/o1LT0vCZO7PHW5UBSwEzfsm52yRNjVnkw=
X-Received: by 2002:a05:651c:3252:b0:30b:c6fe:4529 with SMTP id
 38308e7fff4ca-32a79a7e686mr10418901fa.8.1748457735056; Wed, 28 May 2025
 11:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250516171116.3366550-1-bernd@kuhls.net>
 <20250516171116.3366550-5-bernd@kuhls.net>
In-Reply-To: <20250516171116.3366550-5-bernd@kuhls.net>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 28 May 2025 20:42:02 +0200
X-Gm-Features: AX0GCFseY82-Vy2zE0NiQENZxMW5VgpAcZ61ZqC7Hbsh4ZMdwCTZ_X6aDJ5Tlis
Message-ID: <CAEyMn7Zt7gwUxJjkrNAeLvtojwCSQeyLmQoj5D4tabULRhHnXA@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Adam Duskett <adam.duskett@amarulasolutions.com>, 
 Daniel Lang <dalang@gmx.at>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748457735; x=1749062535; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ilvFona22vORCjLk3NeQV4hbYa1d8i2gh7q5vySuaNs=;
 b=Ni0QqkEfu1pyDNxlZaeybsM89j2HFngdfU97OTSoplZ2DpaepPwgVu+uvtFceX5ySq
 788lFdHH1bnKAmaQARj2+nH1J3pjnKTx4Yv+8oG+2RBbx/zCvBHYH3mLLVUDs5tUqR7+
 c39bggHLvzLiCtf75MX8RtXGMKCBMj9c1NErDaU9xtR26T9B+sVTSSr6FHaodWbj9itX
 HepIbNvpBhFN87gFfBozHJ1ev/zp/c4qG/11lauX7JL17XfWSqBI0BCx2ekXus0Q8Lqx
 5YYFooAWaZESvlYViE4rJ2Uq4fpqSEZmk4dS52FqyFB/WW/CesnQeK4y4YPVQzXHIsr/
 ivUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ni0QqkEf
Subject: Re: [Buildroot] [PATCH v12 5/5] package/{mesa3d,
 mesa3d-headers}: bump version to 25.0.6
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
Content-Type: multipart/mixed; boundary="===============1079123917935412891=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1079123917935412891==
Content-Type: multipart/alternative; boundary="00000000000033f1a80636368a96"

--00000000000033f1a80636368a96
Content-Type: text/plain; charset="UTF-8"

Hi Bernd,

Am Fr., 16. Mai 2025 um 19:13 Uhr schrieb Bernd Kuhls <bernd@kuhls.net>:

> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2024-May/000762.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-June/000763.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-June/000765.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-July/000766.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-July/000767.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-July/000771.html
>
> https://lists.freedesktop.org/archives/mesa-announce/2024-August/000773.html
>
> https://lists.freedesktop.org/archives/mesa-announce/2024-August/000776.html
>
> https://lists.freedesktop.org/archives/mesa-announce/2024-September/000778.html
>
> https://lists.freedesktop.org/archives/mesa-announce/2024-September/000779.html
>
> https://lists.freedesktop.org/archives/mesa-announce/2024-October/000780.html
>
> https://lists.freedesktop.org/archives/mesa-announce/2024-October/000781.html
>
> https://lists.freedesktop.org/archives/mesa-announce/2024-October/000782.html
>
> https://lists.freedesktop.org/archives/mesa-announce/2024-November/000784.html
>
> https://lists.freedesktop.org/archives/mesa-announce/2024-November/000786.html
>
> https://lists.freedesktop.org/archives/mesa-announce/2024-December/000788.html
> https://docs.mesa3d.org/relnotes/24.3.2.html
> https://docs.mesa3d.org/relnotes/24.3.3.html
> https://docs.mesa3d.org/relnotes/24.3.4.html
>
> https://lists.freedesktop.org/archives/mesa-announce/2025-February/000793.html
> https://lists.freedesktop.org/archives/mesa-announce/2025-March/000794.html
> https://lists.freedesktop.org/archives/mesa-announce/2025-March/000795.html
> https://lists.freedesktop.org/archives/mesa-announce/2025-April/000796.html
> https://lists.freedesktop.org/archives/mesa-announce/2025-April/000798.html
> https://lists.freedesktop.org/archives/mesa-announce/2025-April/000801.html
> https://lists.freedesktop.org/archives/mesa-announce/2025-May/000803.html
> ------------------------------------------------------------------------
> Changes needed for the bump to 24.1.x:
>
> Added dependency to llvm & Co. for iris driver due to upstream commit:
>
> https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=24.1&id=a512c2a8b572c5da360873320dbbd343c6223cd6
>
> Added host version of mesa tool intel_clc needed for target build of the
> iris driver.
>
> Added dependency to host-python-pycparser for etnaviv driver due to
> upstream commit:
>
> https://cgit.freedesktop.org/mesa/mesa/commit/src/etnaviv/hwdb/meson.build?h=24.1&id=2192e620bb0c68b75ff45165d0b117c7ecb77268
>
> Added dependency to host-python-ply for intel vulkan driver due to
> upstream commit:
>
> https://cgit.freedesktop.org/mesa/mesa/commit/src/intel/vulkan/grl/meson.build?h=24.1&id=dc1aedef2bd054884685ad971a3ef5be07ecd101
>
> Although this dependency exists since mesa3d 22.3 it is only needed when
> intel-clc is enabled, this dependency is added with this patch so no need
> to backport this dependency to older buildroot trees.
>
> Update configure parameter of glvnd option due to upstream commit:
>
> https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=24.1&id=4f25b84b2460524d375424a81b42faa4d99c8e60
> ------------------------------------------------------------------------
> Changes needed for the bump to 24.2.x:
>
> Added dependency to host-python-pyyaml to host and target build, needed
> due to upstream commit
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/a3813327575e8875c8c3ed24b5f45a0b7ba64446
>
> Rebased patch 0002 due to upstream commit:
>
> https://cgit.freedesktop.org/mesa/mesa/commit/src/gallium/drivers/vc4/meson.build?h=24.2&id=da70827656757cd070faac7aff5ca057f1e7fb8a
>
> Renamed BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST to
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE (also updated tests) and
> added new option BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LLVMPIPE due to
> upstream commit
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/010b2f9497ab256d9e8041207902948331af5b4b
> "gallium/meson: Deconflate swrast/softpipe/llvmpipe"
> ------------------------------------------------------------------------
> Changes needed for the bump to 24.3.x:
>
> Rebased patch 0002 again due to upstream commit:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/25ba90fd888cef431c2098c8afdb0a2bbd34b303
>
> Removed dri3 configure option:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/8f6fca89aa1812b03da6d9f7fac3966955abc41e
>
> Removed gallium-omx configure option:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/9b6c27a320ab4b0fcf1fb16220ae7c3d3f06f7df
>
> Removed gallium kmsro configure option:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/89863a050bea429d9574a307bc28953bb60accaf
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/70813c1c13b99cb029c8fa3537163650bdd17b6d
> No legacy option needed due to automatic handling by the mesa build
> system: "Automatically include it if we're building with a driver that
> depends on it, and don't include it if we're not."
> ------------------------------------------------------------------------
> Changes needed for the bump to 25.0.x:
>
> Rebased patch 0001, added license files and updated license hash
> due to upstream commits which restructured the license files:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/69849bc4d1dd3cb9e9dd5d83b2ff63b8b4edce9b#e672208340b30f973cdab11421f1c91b39d5c02e
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/c22d640fe94f6390068f79475fb6b2c45bb2557b
>
> Removed configure option opencl-spirv due to upstream commit:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/80c4ffb61a91ed252d45e38a96e893cec0771940
>
> Updated configure options for host-build clc which was also renamed from
> intel_clc to mesa_clc, added host version of vtn_bindgen:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32719
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/13fe5a597bb8ededaa7c1c83f3b64c4e90315618
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/5ddeea9a62f720e9fd3a6e5c76f74ef6e8b1fdf8
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v12: rebased
> v11: bumped to 25.0.6, rebased
>      Updated new configure hook HOST_MESA3D_INSTALL_CMDS due to
>      buildroot commit 4e95062f82, no need to backport
> v10: bumped to 25.0.2, rebased
> v9: bumped to 25.0.1
> v8: bumped to 25.0.0
> v7: removed kmsro configure option (Fiona), rebased
> v6: added comment why host-mesa3d is needed (Julien)
> v5: bumped to 24.3.4, rebased
> v4: bumped to 24.3.3
> v3: bumped to 24.3.2
>     renamed remaining occurences of
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
>     to BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE (Andreas)
> v2: sed -i 's/SWRAST/SOFTPIPE/g' support/testing/tests/package/test_*.py
>     (Julien)
>
>  [SNIP]
>

With the following config:

BR2_x86_i686=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK=y
BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y

I see the configure failure of the mesa3d package:

The Meson build system
Version: 1.7.0
Source dir:
/home/hthiery/sources/mainline/buildroot/output/build/mesa3d-25.0.6
Build dir:
/home/hthiery/sources/mainline/buildroot/output/build/mesa3d-25.0.6/buildroot-build
Build type: cross build
DEPRECATION: Option 'gallium-opencl' is deprecated
Project name: mesa
Project version: 25.0.6
C compiler for the host machine:
/home/hthiery/sources/mainline/buildroot/output/host/bin/i686-linux-gcc
(gcc 14.2.0 "i686-linux-gcc.br_real (Buildroot 2021.11-12449-g1bef613319)
14.2.0")
C linker for the host machine:
/home/hthiery/sources/mainline/buildroot/output/host/bin/i686-linux-gcc
ld.bfd 2.42
C++ compiler for the host machine:
/home/hthiery/sources/mainline/buildroot/output/host/bin/i686-linux-g++
(gcc 14.2.0 "i686-linux-g++.br_real (Buildroot 2021.11-12449-g1bef613319)
14.2.0")
C++ linker for the host machine:
/home/hthiery/sources/mainline/buildroot/output/host/bin/i686-linux-g++
ld.bfd 2.42
C compiler for the build machine: /usr/bin/gcc (gcc 12.2.0 "gcc (Debian
12.2.0-14) 12.2.0")
C linker for the build machine: /usr/bin/gcc ld.bfd 2.40
C++ compiler for the build machine: /usr/bin/g++ (gcc 12.2.0 "g++ (Debian
12.2.0-14) 12.2.0")
C++ linker for the build machine: /usr/bin/g++ ld.bfd 2.40
Build machine cpu family: x86_64
Build machine cpu: x86_64
Host machine cpu family: x86
Host machine cpu:
Target machine cpu family: x86
Target machine cpu:
Checking for size of "void*" : 4
output/build/mesa3d-25.0.6/meson.build:527: WARNING: cannot auto-detect
-mtls-dialect when cross-compiling, using compiler default
Dependency libglvnd skipped: feature glvnd disabled
Dependency vdpau skipped: feature gallium-vdpau disabled
Program glslangValidator found: YES
(/home/hthiery/sources/mainline/buildroot/output/host/bin/glslangValidator)
Dependency libva skipped: feature gallium-va disabled
Found pkg-config: YES
(/home/hthiery/sources/mainline/buildroot/output/host/bin/pkgconf) 2.3.0
Found CMake: /usr/bin/cmake (3.25.1)
Run-time dependency libclc found: NO (tried pkgconfig and cmake)

output/build/mesa3d-25.0.6/meson.build:850:12: ERROR: Dependency "libclc"
not found, tried pkgconfig and cmake

BR,
Heiko

--00000000000033f1a80636368a96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Bernd,</div><br><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Am Fr., 16=
. Mai 2025 um 19:13=C2=A0Uhr schrieb Bernd Kuhls &lt;<a href=3D"mailto:bern=
d@kuhls.net">bernd@kuhls.net</a>&gt;:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Release notes:<br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2024-May/00=
0762.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.o=
rg/archives/mesa-announce/2024-May/000762.html</a><br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2024-June/0=
00763.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.=
org/archives/mesa-announce/2024-June/000763.html</a><br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2024-June/0=
00765.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.=
org/archives/mesa-announce/2024-June/000765.html</a><br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2024-July/0=
00766.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.=
org/archives/mesa-announce/2024-July/000766.html</a><br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2024-July/0=
00767.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.=
org/archives/mesa-announce/2024-July/000767.html</a><br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2024-July/0=
00771.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.=
org/archives/mesa-announce/2024-July/000771.html</a><br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2024-August=
/000773.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedeskto=
p.org/archives/mesa-announce/2024-August/000773.html</a><br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2024-August=
/000776.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedeskto=
p.org/archives/mesa-announce/2024-August/000776.html</a><br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2024-Septem=
ber/000778.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedes=
ktop.org/archives/mesa-announce/2024-September/000778.html</a><br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2024-Septem=
ber/000779.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedes=
ktop.org/archives/mesa-announce/2024-September/000779.html</a><br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2024-Octobe=
r/000780.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedeskt=
op.org/archives/mesa-announce/2024-October/000780.html</a><br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2024-Octobe=
r/000781.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedeskt=
op.org/archives/mesa-announce/2024-October/000781.html</a><br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2024-Octobe=
r/000782.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedeskt=
op.org/archives/mesa-announce/2024-October/000782.html</a><br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2024-Novemb=
er/000784.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesk=
top.org/archives/mesa-announce/2024-November/000784.html</a><br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2024-Novemb=
er/000786.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesk=
top.org/archives/mesa-announce/2024-November/000786.html</a><br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2024-Decemb=
er/000788.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesk=
top.org/archives/mesa-announce/2024-December/000788.html</a><br>
<a href=3D"https://docs.mesa3d.org/relnotes/24.3.2.html" rel=3D"noreferrer"=
 target=3D"_blank">https://docs.mesa3d.org/relnotes/24.3.2.html</a><br>
<a href=3D"https://docs.mesa3d.org/relnotes/24.3.3.html" rel=3D"noreferrer"=
 target=3D"_blank">https://docs.mesa3d.org/relnotes/24.3.3.html</a><br>
<a href=3D"https://docs.mesa3d.org/relnotes/24.3.4.html" rel=3D"noreferrer"=
 target=3D"_blank">https://docs.mesa3d.org/relnotes/24.3.4.html</a><br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2025-Februa=
ry/000793.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesk=
top.org/archives/mesa-announce/2025-February/000793.html</a><br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2025-March/=
000794.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop=
.org/archives/mesa-announce/2025-March/000794.html</a><br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2025-March/=
000795.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop=
.org/archives/mesa-announce/2025-March/000795.html</a><br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2025-April/=
000796.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop=
.org/archives/mesa-announce/2025-April/000796.html</a><br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2025-April/=
000798.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop=
.org/archives/mesa-announce/2025-April/000798.html</a><br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2025-April/=
000801.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop=
.org/archives/mesa-announce/2025-April/000801.html</a><br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-announce/2025-May/00=
0803.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.o=
rg/archives/mesa-announce/2025-May/000803.html</a><br>
------------------------------------------------------------------------<br=
>
Changes needed for the bump to 24.1.x:<br>
<br>
Added dependency to llvm &amp; Co. for iris driver due to upstream commit:<=
br>
<a href=3D"https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=3D24=
.1&amp;id=3Da512c2a8b572c5da360873320dbbd343c6223cd6" rel=3D"noreferrer" ta=
rget=3D"_blank">https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=
=3D24.1&amp;id=3Da512c2a8b572c5da360873320dbbd343c6223cd6</a><br>
<br>
Added host version of mesa tool intel_clc needed for target build of the<br=
>
iris driver.<br>
<br>
Added dependency to host-python-pycparser for etnaviv driver due to<br>
upstream commit:<br>
<a href=3D"https://cgit.freedesktop.org/mesa/mesa/commit/src/etnaviv/hwdb/m=
eson.build?h=3D24.1&amp;id=3D2192e620bb0c68b75ff45165d0b117c7ecb77268" rel=
=3D"noreferrer" target=3D"_blank">https://cgit.freedesktop.org/mesa/mesa/co=
mmit/src/etnaviv/hwdb/meson.build?h=3D24.1&amp;id=3D2192e620bb0c68b75ff4516=
5d0b117c7ecb77268</a><br>
<br>
Added dependency to host-python-ply for intel vulkan driver due to<br>
upstream commit:<br>
<a href=3D"https://cgit.freedesktop.org/mesa/mesa/commit/src/intel/vulkan/g=
rl/meson.build?h=3D24.1&amp;id=3Ddc1aedef2bd054884685ad971a3ef5be07ecd101" =
rel=3D"noreferrer" target=3D"_blank">https://cgit.freedesktop.org/mesa/mesa=
/commit/src/intel/vulkan/grl/meson.build?h=3D24.1&amp;id=3Ddc1aedef2bd05488=
4685ad971a3ef5be07ecd101</a><br>
<br>
Although this dependency exists since mesa3d 22.3 it is only needed when<br=
>
intel-clc is enabled, this dependency is added with this patch so no need<b=
r>
to backport this dependency to older buildroot trees.<br>
<br>
Update configure parameter of glvnd option due to upstream commit:<br>
<a href=3D"https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=3D24=
.1&amp;id=3D4f25b84b2460524d375424a81b42faa4d99c8e60" rel=3D"noreferrer" ta=
rget=3D"_blank">https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=
=3D24.1&amp;id=3D4f25b84b2460524d375424a81b42faa4d99c8e60</a><br>
------------------------------------------------------------------------<br=
>
Changes needed for the bump to 24.2.x:<br>
<br>
Added dependency to host-python-pyyaml to host and target build, needed<br>
due to upstream commit<br>
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/commit/a3813327575e88=
75c8c3ed24b5f45a0b7ba64446" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.freedesktop.org/mesa/mesa/-/commit/a3813327575e8875c8c3ed24b5f45a0b7ba=
64446</a><br>
<br>
Rebased patch 0002 due to upstream commit:<br>
<a href=3D"https://cgit.freedesktop.org/mesa/mesa/commit/src/gallium/driver=
s/vc4/meson.build?h=3D24.2&amp;id=3Dda70827656757cd070faac7aff5ca057f1e7fb8=
a" rel=3D"noreferrer" target=3D"_blank">https://cgit.freedesktop.org/mesa/m=
esa/commit/src/gallium/drivers/vc4/meson.build?h=3D24.2&amp;id=3Dda70827656=
757cd070faac7aff5ca057f1e7fb8a</a><br>
<br>
Renamed BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST to<br>
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE (also updated tests) and<br>
added new option BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LLVMPIPE due to<br>
upstream commit<br>
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/commit/010b2f9497ab25=
6d9e8041207902948331af5b4b" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.freedesktop.org/mesa/mesa/-/commit/010b2f9497ab256d9e8041207902948331a=
f5b4b</a><br>
&quot;gallium/meson: Deconflate swrast/softpipe/llvmpipe&quot;<br>
------------------------------------------------------------------------<br=
>
Changes needed for the bump to 24.3.x:<br>
<br>
Rebased patch 0002 again due to upstream commit:<br>
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/commit/25ba90fd888cef=
431c2098c8afdb0a2bbd34b303" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.freedesktop.org/mesa/mesa/-/commit/25ba90fd888cef431c2098c8afdb0a2bbd3=
4b303</a><br>
<br>
Removed dri3 configure option:<br>
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/commit/8f6fca89aa1812=
b03da6d9f7fac3966955abc41e" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.freedesktop.org/mesa/mesa/-/commit/8f6fca89aa1812b03da6d9f7fac3966955a=
bc41e</a><br>
<br>
Removed gallium-omx configure option:<br>
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/commit/9b6c27a320ab4b=
0fcf1fb16220ae7c3d3f06f7df" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.freedesktop.org/mesa/mesa/-/commit/9b6c27a320ab4b0fcf1fb16220ae7c3d3f0=
6f7df</a><br>
<br>
Removed gallium kmsro configure option:<br>
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/commit/89863a050bea42=
9d9574a307bc28953bb60accaf" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.freedesktop.org/mesa/mesa/-/commit/89863a050bea429d9574a307bc28953bb60=
accaf</a><br>
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/commit/70813c1c13b99c=
b029c8fa3537163650bdd17b6d" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.freedesktop.org/mesa/mesa/-/commit/70813c1c13b99cb029c8fa3537163650bdd=
17b6d</a><br>
No legacy option needed due to automatic handling by the mesa build<br>
system: &quot;Automatically include it if we&#39;re building with a driver =
that<br>
depends on it, and don&#39;t include it if we&#39;re not.&quot;<br>
------------------------------------------------------------------------<br=
>
Changes needed for the bump to 25.0.x:<br>
<br>
Rebased patch 0001, added license files and updated license hash<br>
due to upstream commits which restructured the license files:<br>
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/commit/69849bc4d1dd3c=
b9e9dd5d83b2ff63b8b4edce9b#e672208340b30f973cdab11421f1c91b39d5c02e" rel=3D=
"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/mesa/mesa/-/c=
ommit/69849bc4d1dd3cb9e9dd5d83b2ff63b8b4edce9b#e672208340b30f973cdab11421f1=
c91b39d5c02e</a><br>
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/commit/c22d640fe94f63=
90068f79475fb6b2c45bb2557b" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.freedesktop.org/mesa/mesa/-/commit/c22d640fe94f6390068f79475fb6b2c45bb=
2557b</a><br>
<br>
Removed configure option opencl-spirv due to upstream commit:<br>
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/commit/80c4ffb61a91ed=
252d45e38a96e893cec0771940" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.freedesktop.org/mesa/mesa/-/commit/80c4ffb61a91ed252d45e38a96e893cec07=
71940</a><br>
<br>
Updated configure options for host-build clc which was also renamed from<br=
>
intel_clc to mesa_clc, added host version of vtn_bindgen:<br>
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32719"=
 rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/mesa/m=
esa/-/merge_requests/32719</a><br>
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/commit/13fe5a597bb8ed=
edaa7c1c83f3b64c4e90315618" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.freedesktop.org/mesa/mesa/-/commit/13fe5a597bb8ededaa7c1c83f3b64c4e903=
15618</a><br>
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/commit/5ddeea9a62f720=
e9fd3a6e5c76f74ef6e8b1fdf8" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.freedesktop.org/mesa/mesa/-/commit/5ddeea9a62f720e9fd3a6e5c76f74ef6e8b=
1fdf8</a><br>
<br>
Signed-off-by: Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net" target=3D=
"_blank">bernd@kuhls.net</a>&gt;<br>
---<br>
v12: rebased<br>
v11: bumped to 25.0.6, rebased<br>
=C2=A0 =C2=A0 =C2=A0Updated new configure hook HOST_MESA3D_INSTALL_CMDS due=
 to<br>
=C2=A0 =C2=A0 =C2=A0buildroot commit 4e95062f82, no need to backport<br>
v10: bumped to 25.0.2, rebased<br>
v9: bumped to 25.0.1<br>
v8: bumped to 25.0.0<br>
v7: removed kmsro configure option (Fiona), rebased<br>
v6: added comment why host-mesa3d is needed (Julien)<br>
v5: bumped to 24.3.4, rebased<br>
v4: bumped to 24.3.3<br>
v3: bumped to 24.3.2<br>
=C2=A0 =C2=A0 renamed remaining occurences of BR2_PACKAGE_MESA3D_GALLIUM_DR=
IVER_SWRAST<br>
=C2=A0 =C2=A0 to BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE (Andreas)<br>
v2: sed -i &#39;s/SWRAST/SOFTPIPE/g&#39; support/testing/tests/package/test=
_*.py<br>
=C2=A0 =C2=A0 (Julien)<br>
<br>=C2=A0[SNIP]<br></blockquote><div><br></div><div>With the following con=
fig:</div><div><br></div><div>BR2_x86_i686=3Dy<br>BR2_TOOLCHAIN_EXTERNAL=3D=
y<br>BR2_PACKAGE_MESA3D=3Dy<br>BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK=3Dy<b=
r>BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL=3Dy<br>BR2_PACKAGE_MESA3D_OPENGL_E=
GL=3Dy<br>BR2_PACKAGE_MESA3D_OPENGL_ES=3Dy<br></div><div>=C2=A0</div><div>I=
 see the configure failure of the mesa3d package:</div><div><br></div><div>=
The Meson build system<br>Version: 1.7.0<br>Source dir: /home/hthiery/sourc=
es/mainline/buildroot/output/build/mesa3d-25.0.6<br>Build dir: /home/hthier=
y/sources/mainline/buildroot/output/build/mesa3d-25.0.6/buildroot-build<br>=
Build type: cross build<br>DEPRECATION: Option &#39;gallium-opencl&#39; is =
deprecated<br>Project name: mesa<br>Project version: 25.0.6<br>C compiler f=
or the host machine: /home/hthiery/sources/mainline/buildroot/output/host/b=
in/i686-linux-gcc (gcc 14.2.0 &quot;i686-linux-gcc.br_real (Buildroot 2021.=
11-12449-g1bef613319) 14.2.0&quot;)<br>C linker for the host machine: /home=
/hthiery/sources/mainline/buildroot/output/host/bin/i686-linux-gcc ld.bfd 2=
.42<br>C++ compiler for the host machine: /home/hthiery/sources/mainline/bu=
ildroot/output/host/bin/i686-linux-g++ (gcc 14.2.0 &quot;i686-linux-g++.br_=
real (Buildroot 2021.11-12449-g1bef613319) 14.2.0&quot;)<br>C++ linker for =
the host machine: /home/hthiery/sources/mainline/buildroot/output/host/bin/=
i686-linux-g++ ld.bfd 2.42<br>C compiler for the build machine: /usr/bin/gc=
c (gcc 12.2.0 &quot;gcc (Debian 12.2.0-14) 12.2.0&quot;)<br>C linker for th=
e build machine: /usr/bin/gcc ld.bfd 2.40<br>C++ compiler for the build mac=
hine: /usr/bin/g++ (gcc 12.2.0 &quot;g++ (Debian 12.2.0-14) 12.2.0&quot;)<b=
r>C++ linker for the build machine: /usr/bin/g++ ld.bfd 2.40<br>Build machi=
ne cpu family: x86_64<br>Build machine cpu: x86_64<br>Host machine cpu fami=
ly: x86<br>Host machine cpu: <br>Target machine cpu family: x86<br>Target m=
achine cpu: <br>Checking for size of &quot;void*&quot; : 4 <br>output/build=
/mesa3d-25.0.6/meson.build:527: WARNING: cannot auto-detect -mtls-dialect w=
hen cross-compiling, using compiler default<br>Dependency libglvnd skipped:=
 feature glvnd disabled<br>Dependency vdpau skipped: feature gallium-vdpau =
disabled<br>Program glslangValidator found: YES (/home/hthiery/sources/main=
line/buildroot/output/host/bin/glslangValidator)<br>Dependency libva skippe=
d: feature gallium-va disabled<br>Found pkg-config: YES (/home/hthiery/sour=
ces/mainline/buildroot/output/host/bin/pkgconf) 2.3.0<br>Found CMake: /usr/=
bin/cmake (3.25.1)<br>Run-time dependency libclc found: NO (tried pkgconfig=
 and cmake)<br><br>output/build/mesa3d-25.0.6/meson.build:850:12: ERROR: De=
pendency &quot;libclc&quot; not found, tried pkgconfig and cmake<br></div><=
div><br></div><div>BR,</div><div>Heiko</div></div></div>

--00000000000033f1a80636368a96--

--===============1079123917935412891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1079123917935412891==--
