Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48BDEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 00:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61350400C1;
	Tue, 18 Jul 2023 00:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61350400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QBU5qEQj7ShP; Tue, 18 Jul 2023 00:01:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1231A40908;
	Tue, 18 Jul 2023 00:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1231A40908
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 995BA1BF388
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 00:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 714A9403ED
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 00:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 714A9403ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fr3U3cJpnqLL for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 00:01:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60C50403CC
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60C50403CC
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 00:01:25 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fbb281eec6so8059218e87.1
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 17:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689638483; x=1692230483;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AxzWoYaH3Cv0+TYir0g8W2KtTUc1WrGHNdJBm+Q90lw=;
 b=UV2ZwcTVjdCJnT1cbnluiqhjH2nyYN4Kt8p2ewE7PwK3BE0+/1ttO9ia3rOsrkwiZu
 VyfBE0+COt9I1URQ16eQ9VLhHsFxNppbaAYn/LULSZHeUhLk6vw010eE34ezkY9s5/Uy
 OFj/Bo8sGOkkqLimhExEIlckHcD8oxG+JUUXcxGM1FHexP4WsEu7ujT4YioLTSdEIaBz
 kbsluAlcyWFiNofh6Q2Lx0tCIH5viUJpjyizS9qi496qpzdqKuHgbw7iHX9eCuE6elGZ
 URDJjSmEJuZcdyXvAslwr0rVrzYHPFmSgfCRyu1r1rihkkO4F4Wh9z2zpCdoZ80N6lLG
 WslQ==
X-Gm-Message-State: ABy/qLbGcOVKxOwWVxtoVcGR09ctRtAi4tV6qevLsxSmCsvobd6UzQV5
 s4uR3fA8r8DtnH1WgLnfpqLzN1feHl7MuZv0zh0=
X-Google-Smtp-Source: APBJJlGULa1Svi2A2nKYw0AMcgAvV29ZYAjHAPPLbApvmlqRNDFOKZS1wxZNlBHUZfcdp1v+JR13xddmS/fCK8jeQx4=
X-Received: by 2002:a05:6512:3a88:b0:4fb:925f:8be1 with SMTP id
 q8-20020a0565123a8800b004fb925f8be1mr10792993lfu.45.1689638482678; Mon, 17
 Jul 2023 17:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230615134315.494330-1-sebastian.weyer@smile.fr>
In-Reply-To: <20230615134315.494330-1-sebastian.weyer@smile.fr>
From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 17 Jul 2023 17:01:11 -0700
Message-ID: <CAFSsvmo0v8CwRXK=Qve0NLa_iCLTL3zpVBaYd9KiKTGwhEGwvQ@mail.gmail.com>
To: Sebastian Weyer <sebastian.weyer@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689638483; x=1692230483;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AxzWoYaH3Cv0+TYir0g8W2KtTUc1WrGHNdJBm+Q90lw=;
 b=eB1zL8NyKd63DEygn1xTb4rr5vACAIK5t/3Ambo16scA2IrOgphD7gzA0GtqHUloEF
 2aYB8APhxGtuX+ZRC5lvNxUMb1ikHOMkgiBIdMjqtkaeJwXFqE1fdamwudfgeCLCYp7/
 mCbe6AWJOAkJHx6OKkQkM5lEcR9efWY8IrAnhWZOZv/ByN9ptnOlnqPaLIreD/VvSs45
 AbeBwDbjbwv2i12+7hmqwk8dYqUyVAVuXa+c+T59+XzOT5+2JJjJ0/d8wswevLDkIBya
 h2xd6EjvEnoQ8aoX/kqSgZ5cRr6o6DBuAJm0GQ7XGeR7fmVsQnb5FLgBQfe+OtFT0Lx8
 11OQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=eB1zL8Ny
Subject: Re: [Buildroot] [PATCH v4 00/10] group llvm projects and bump to
 version 15.0.3
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6311803681924627803=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6311803681924627803==
Content-Type: multipart/alternative; boundary="0000000000008f18490600b79de0"

--0000000000008f18490600b79de0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Sebastian!

Thanks for the patch series! I can't see anything wrong with it so:

Tested-by: Adam Duskett <aduskett@gmail.com>


On Thu, Jun 15, 2023 at 6:44=E2=80=AFAM Sebastian Weyer <sebastian.weyer@sm=
ile.fr>
wrote:

> This series attempts two things:
> - Move the different llvm subprojects into one folder
> and share version and site information.
>
> - Bump the version to the latest 15.0.3
>
> Starting with version 12 different subprojects added
> dependencies or sources that would be available when
> building from the "monorepo". These have been added
> as new host packages.
>
> This update is needed in order to be able to use some packages in the
> future as for example mesa3d's RustiCL.
>
> v4:
> - change some inaccurate commit messages
> - bump spirv-llvm-translator version at the same time as other llvm
>   packages
> - remove package/llvm/0002-Add-missing-cstdint-header-to-Signals.h.patch
>   as it has been integrated in the newer version
>
> v3:
> - move libclc before llvm 15.0.3 version bump commit
> - force llvm-cmake and llvm-libunwind version to 15.0.3 since
>   LLVM_PROJECT_VERSION is still at 11.1.0
> - Keep cp as install command since there is no CMakefiles.txt
> - llvm, clang, lld: keep LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN since
>   this option is still used to check C++17 compiler support:
>   llvm/cmake/modules/CheckCompilerVersion.cmake
>
>
> Changes v1 -> v2:
> - Rebased onto current master
> - Bump to 15.0.3 instead of 15.0.1
> - llvm: use CMAKE_HOST_C_COMPILER instead of HOSTCC
> - libclc: Add missing change to package/Config.in
>
> Lang Daniel (10):
>   package/llvm-project: new group for llvm packages
>   package/llvm: move to llvm-project folder
>   package/lld: move to llvm-project subfolder
>   package/clang: move to llvm-project subfolder
>   package/compiler-rt: move to llvm-project subfolder
>   package/libclc: move to llvm-project subfolder
>   package/llvm-project/llvm-cmake: new package
>   package/llvm-project/llvm-libunwind: new package
>   package/llvm-project: bump to version 15.0.3
>   DEVELOPERS: add Daniel Lang for llvm-project
>
>  DEVELOPERS                                    | 19 ++++++-----
>  package/Config.in                             |  8 ++---
>  package/Config.in.host                        |  2 +-
>  ...hains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch |  0
>  package/{ =3D> llvm-project}/clang/Config.in    | 10 +++---
>  package/{ =3D> llvm-project}/clang/clang.hash   |  2 +-
>  package/{ =3D> llvm-project}/clang/clang.mk     | 15 +++-----
>  .../{ =3D> llvm-project}/compiler-rt/Config.in  |  6 ++--
>  .../compiler-rt/compiler-rt.hash              |  2 +-
>  .../compiler-rt/compiler-rt.mk                |  9 +++--
>  .../0001-support-out-of-tree-build.patch      |  0
>  package/{ =3D> llvm-project}/libclc/Config.in   |  6 ++--
>  package/{ =3D> llvm-project}/libclc/libclc.hash |  2 +-
>  package/{ =3D> llvm-project}/libclc/libclc.mk   |  4 +--
>  package/{ =3D> llvm-project}/lld/Config.in.host |  6 ++--
>  package/{ =3D> llvm-project}/lld/lld.hash       |  2 +-
>  package/{ =3D> llvm-project}/lld/lld.mk         | 13 ++-----
>  .../llvm-project/llvm-cmake/llvm-cmake.hash   |  2 ++
>  package/llvm-project/llvm-cmake/llvm-cmake.mk | 17 ++++++++++
>  .../llvm-libunwind/llvm-libunwind.hash        |  3 ++
>  .../llvm-libunwind/llvm-libunwind.mk          | 18 ++++++++++
>  package/llvm-project/llvm-project.mk          | 11 ++++++
>  package/{ =3D> llvm-project}/llvm/Config.in     | 10 +++---
>  package/{ =3D> llvm-project}/llvm/llvm.hash     |  2 +-
>  package/{ =3D> llvm-project}/llvm/llvm.mk       | 27 ++++++++-------
>  .../llvm/0001-nfc-Fix-missing-include.patch   | 24 -------------
>  ...-missing-cstdint-header-to-Signals.h.patch | 34 -------------------
>  package/mesa3d/Config.in                      | 10 +++---
>  .../spirv-llvm-translator.hash                |  2 +-
>  .../spirv-llvm-translator.mk                  |  4 +--
>  30 files changed, 126 insertions(+), 144 deletions(-)
>  rename package/{ =3D>
> llvm-project}/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX=
-in-.patch
> (100%)
>  rename package/{ =3D> llvm-project}/clang/Config.in (82%)
>  rename package/{ =3D> llvm-project}/clang/clang.hash (52%)
>  rename package/{ =3D> llvm-project}/clang/clang.mk (89%)
>  rename package/{ =3D> llvm-project}/compiler-rt/Config.in (87%)
>  rename package/{ =3D> llvm-project}/compiler-rt/compiler-rt.hash (50%)
>  rename package/{ =3D> llvm-project}/compiler-rt/compiler-rt.mk (82%)
>  rename package/{ =3D>
> llvm-project}/libclc/0001-support-out-of-tree-build.patch (100%)
>  rename package/{ =3D> llvm-project}/libclc/Config.in (73%)
>  rename package/{ =3D> llvm-project}/libclc/libclc.hash (51%)
>  rename package/{ =3D> llvm-project}/libclc/libclc.mk (92%)
>  rename package/{ =3D> llvm-project}/lld/Config.in.host (74%)
>  rename package/{ =3D> llvm-project}/lld/lld.hash (52%)
>  rename package/{ =3D> llvm-project}/lld/lld.mk (61%)
>  create mode 100644 package/llvm-project/llvm-cmake/llvm-cmake.hash
>  create mode 100644 package/llvm-project/llvm-cmake/llvm-cmake.mk
>  create mode 100644 package/llvm-project/llvm-libunwind/llvm-libunwind.ha=
sh
>  create mode 100644 package/llvm-project/llvm-libunwind/llvm-libunwind.mk
>  create mode 100644 package/llvm-project/llvm-project.mk
>  rename package/{ =3D> llvm-project}/llvm/Config.in (88%)
>  rename package/{ =3D> llvm-project}/llvm/llvm.hash (52%)
>  rename package/{ =3D> llvm-project}/llvm/llvm.mk (94%)
>  delete mode 100644 package/llvm/0001-nfc-Fix-missing-include.patch
>  delete mode 100644
> package/llvm/0002-Add-missing-cstdint-header-to-Signals.h.patch
>
> --
> 2.34.1
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000008f18490600b79de0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey Sebastian!=C2=A0<div><br></div><div>Thanks for the pat=
ch series! I can&#39;t see anything wrong with it so:</div><div><br></div><=
div><pre class=3D"gmail-content" style=3D"box-sizing:border-box;overflow:au=
to;font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font=
-size:13px;padding:9.5px;margin-top:0px;margin-bottom:10px;line-height:14.3=
px;color:rgb(51,51,51);word-break:break-all;border:0px;border-radius:0px"><=
span class=3D"gmail-tested-by" style=3D"box-sizing:border-box">Tested-by: A=
dam Duskett &lt;<a href=3D"mailto:aduskett@gmail.com">aduskett@gmail.com</a=
>&gt;</span></pre></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jun 15, 2023 at 6:44=E2=80=AFAM Sebastian W=
eyer &lt;<a href=3D"mailto:sebastian.weyer@smile.fr">sebastian.weyer@smile.=
fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">This series attempts two things:<br>
- Move the different llvm subprojects into one folder<br>
and share version and site information.<br>
<br>
- Bump the version to the latest 15.0.3<br>
<br>
Starting with version 12 different subprojects added<br>
dependencies or sources that would be available when<br>
building from the &quot;monorepo&quot;. These have been added<br>
as new host packages.<br>
<br>
This update is needed in order to be able to use some packages in the<br>
future as for example mesa3d&#39;s RustiCL.<br>
<br>
v4:<br>
- change some inaccurate commit messages<br>
- bump spirv-llvm-translator version at the same time as other llvm<br>
=C2=A0 packages<br>
- remove package/llvm/0002-Add-missing-cstdint-header-to-Signals.h.patch<br=
>
=C2=A0 as it has been integrated in the newer version<br>
<br>
v3:<br>
- move libclc before llvm 15.0.3 version bump commit<br>
- force llvm-cmake and llvm-libunwind version to 15.0.3 since<br>
=C2=A0 LLVM_PROJECT_VERSION is still at 11.1.0<br>
- Keep cp as install command since there is no CMakefiles.txt<br>
- llvm, clang, lld: keep LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN since<br>
=C2=A0 this option is still used to check C++17 compiler support:<br>
=C2=A0 llvm/cmake/modules/CheckCompilerVersion.cmake<br>
<br>
<br>
Changes v1 -&gt; v2:<br>
- Rebased onto current master<br>
- Bump to 15.0.3 instead of 15.0.1<br>
- llvm: use CMAKE_HOST_C_COMPILER instead of HOSTCC<br>
- libclc: Add missing change to package/Config.in<br>
<br>
Lang Daniel (10):<br>
=C2=A0 package/llvm-project: new group for llvm packages<br>
=C2=A0 package/llvm: move to llvm-project folder<br>
=C2=A0 package/lld: move to llvm-project subfolder<br>
=C2=A0 package/clang: move to llvm-project subfolder<br>
=C2=A0 package/compiler-rt: move to llvm-project subfolder<br>
=C2=A0 package/libclc: move to llvm-project subfolder<br>
=C2=A0 package/llvm-project/llvm-cmake: new package<br>
=C2=A0 package/llvm-project/llvm-libunwind: new package<br>
=C2=A0 package/llvm-project: bump to version 15.0.3<br>
=C2=A0 DEVELOPERS: add Daniel Lang for llvm-project<br>
<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 19 +++=
+++-----<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++---<br>
=C2=A0package/Config.in.host=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0...hains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch |=C2=A0 0<br>
=C2=A0package/{ =3D&gt; llvm-project}/clang/Config.in=C2=A0 =C2=A0 | 10 +++=
---<br>
=C2=A0package/{ =3D&gt; llvm-project}/clang/clang.hash=C2=A0 =C2=A0|=C2=A0 =
2 +-<br>
=C2=A0package/{ =3D&gt; llvm-project}/clang/<a href=3D"http://clang.mk" rel=
=3D"noreferrer" target=3D"_blank">clang.mk</a>=C2=A0 =C2=A0 =C2=A0| 15 +++-=
----<br>
=C2=A0.../{ =3D&gt; llvm-project}/compiler-rt/Config.in=C2=A0 |=C2=A0 6 ++-=
-<br>
=C2=A0.../compiler-rt/compiler-rt.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0.../compiler-rt/<a href=3D"http://compiler-rt.mk" rel=3D"noreferrer" =
target=3D"_blank">compiler-rt.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 9 +++--<br>
=C2=A0.../0001-support-out-of-tree-build.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
0<br>
=C2=A0package/{ =3D&gt; llvm-project}/libclc/Config.in=C2=A0 =C2=A0|=C2=A0 =
6 ++--<br>
=C2=A0package/{ =3D&gt; llvm-project}/libclc/libclc.hash |=C2=A0 2 +-<br>
=C2=A0package/{ =3D&gt; llvm-project}/libclc/<a href=3D"http://libclc.mk" r=
el=3D"noreferrer" target=3D"_blank">libclc.mk</a>=C2=A0 =C2=A0|=C2=A0 4 +--=
<br>
=C2=A0package/{ =3D&gt; llvm-project}/lld/Config.in.host |=C2=A0 6 ++--<br>
=C2=A0package/{ =3D&gt; llvm-project}/lld/lld.hash=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
=C2=A0package/{ =3D&gt; llvm-project}/lld/<a href=3D"http://lld.mk" rel=3D"=
noreferrer" target=3D"_blank">lld.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 13 ++-----<br>
=C2=A0.../llvm-project/llvm-cmake/llvm-cmake.hash=C2=A0 =C2=A0|=C2=A0 2 ++<=
br>
=C2=A0package/llvm-project/llvm-cmake/<a href=3D"http://llvm-cmake.mk" rel=
=3D"noreferrer" target=3D"_blank">llvm-cmake.mk</a> | 17 ++++++++++<br>
=C2=A0.../llvm-libunwind/llvm-libunwind.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 3 ++<br>
=C2=A0.../llvm-libunwind/<a href=3D"http://llvm-libunwind.mk" rel=3D"norefe=
rrer" target=3D"_blank">llvm-libunwind.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 18 ++++++++++<br>
=C2=A0package/llvm-project/<a href=3D"http://llvm-project.mk" rel=3D"norefe=
rrer" target=3D"_blank">llvm-project.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 11 ++++++<br>
=C2=A0package/{ =3D&gt; llvm-project}/llvm/Config.in=C2=A0 =C2=A0 =C2=A0| 1=
0 +++---<br>
=C2=A0package/{ =3D&gt; llvm-project}/llvm/llvm.hash=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
=C2=A0package/{ =3D&gt; llvm-project}/llvm/<a href=3D"http://llvm.mk" rel=
=3D"noreferrer" target=3D"_blank">llvm.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
7 ++++++++-------<br>
=C2=A0.../llvm/0001-nfc-Fix-missing-include.patch=C2=A0 =C2=A0| 24 --------=
-----<br>
=C2=A0...-missing-cstdint-header-to-Signals.h.patch | 34 ------------------=
-<br>
=C2=A0package/mesa3d/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++---<br>
=C2=A0.../spirv-llvm-translator.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0.../<a href=3D"http://spirv-llvm-translator.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">spirv-llvm-translator.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +--<br>
=C2=A030 files changed, 126 insertions(+), 144 deletions(-)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/clang/0001-lib-Driver-ToolChai=
ns-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch (100%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/clang/Config.in (82%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/clang/clang.hash (52%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/clang/<a href=3D"http://clang.=
mk" rel=3D"noreferrer" target=3D"_blank">clang.mk</a> (89%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/compiler-rt/Config.in (87%)<br=
>
=C2=A0rename package/{ =3D&gt; llvm-project}/compiler-rt/compiler-rt.hash (=
50%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/compiler-rt/<a href=3D"http://=
compiler-rt.mk" rel=3D"noreferrer" target=3D"_blank">compiler-rt.mk</a> (82=
%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/libclc/0001-support-out-of-tre=
e-build.patch (100%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/libclc/Config.in (73%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/libclc/libclc.hash (51%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/libclc/<a href=3D"http://libcl=
c.mk" rel=3D"noreferrer" target=3D"_blank">libclc.mk</a> (92%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/lld/Config.in.host (74%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/lld/lld.hash (52%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/lld/<a href=3D"http://lld.mk" =
rel=3D"noreferrer" target=3D"_blank">lld.mk</a> (61%)<br>
=C2=A0create mode 100644 package/llvm-project/llvm-cmake/llvm-cmake.hash<br=
>
=C2=A0create mode 100644 package/llvm-project/llvm-cmake/<a href=3D"http://=
llvm-cmake.mk" rel=3D"noreferrer" target=3D"_blank">llvm-cmake.mk</a><br>
=C2=A0create mode 100644 package/llvm-project/llvm-libunwind/llvm-libunwind=
.hash<br>
=C2=A0create mode 100644 package/llvm-project/llvm-libunwind/<a href=3D"htt=
p://llvm-libunwind.mk" rel=3D"noreferrer" target=3D"_blank">llvm-libunwind.=
mk</a><br>
=C2=A0create mode 100644 package/llvm-project/<a href=3D"http://llvm-projec=
t.mk" rel=3D"noreferrer" target=3D"_blank">llvm-project.mk</a><br>
=C2=A0rename package/{ =3D&gt; llvm-project}/llvm/Config.in (88%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/llvm/llvm.hash (52%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/llvm/<a href=3D"http://llvm.mk=
" rel=3D"noreferrer" target=3D"_blank">llvm.mk</a> (94%)<br>
=C2=A0delete mode 100644 package/llvm/0001-nfc-Fix-missing-include.patch<br=
>
=C2=A0delete mode 100644 package/llvm/0002-Add-missing-cstdint-header-to-Si=
gnals.h.patch<br>
<br>
--<br>
2.34.1<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--0000000000008f18490600b79de0--

--===============6311803681924627803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6311803681924627803==--
