Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30768EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 17:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D530680BAD;
	Thu, 20 Jul 2023 17:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D530680BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ja00m8p3bVhu; Thu, 20 Jul 2023 17:31:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF8DE80BBC;
	Thu, 20 Jul 2023 17:31:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF8DE80BBC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A285D1BF5DA
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BC5580BBC
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BC5580BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EnM8Ng42r8O6 for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 17:31:35 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4E3280BAD
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 17:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4E3280BAD
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fb863edcb6so1677963e87.0
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 10:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689874292; x=1690479092;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z/sJL5Pza7r4hqDMV//M8k+IgzQjRdD6mLOe6DWDUXo=;
 b=XHA4AQ/I00hvHn3KrynY89Fi+oA2VhNjG0UjqnQFt9RHBckcbVqXT62fTlSU7WGRDm
 gHS4KuZVV43o7mAsGLXySs3uMTZhzDpViegxht5GgCbEKLqn65qHIv9sLO2EY6LTAu1x
 VTL86F5tNEKuataSAP13hFeaE5k69KhI46yJsgvKeIrfDdzYlHbELc6TrfWflRmT+PjP
 AxkAvObbbnvAtI1INNzsOIvQXsGlsIHX78Hx4RgE8KgM4NBCTOWBZfaMS/Ltn6pKs8/7
 /FNJWSbhm4KO5zr5AGY1tfh7N5DgfEoJjZTT0O7rJICFt+VhfcIsXlja0Z5IqDsOcISh
 Owsw==
X-Gm-Message-State: ABy/qLZxsGCBNjLDEqSeWUIsveBTKeoqTaKSvx/LlBLhRwXnfLs0FAaB
 weLnh3Ypb9/D+0NXRl4ZbXIdE8oV8luEKRzFtaWPAyDDY185eA==
X-Google-Smtp-Source: APBJJlFwCnkzidgHfsbs8IXPBei2JG2fCe3O9GJKk0FCCV0CMblEbino9MZlPW8v3hR+Oax/teL1Cfevm3OISnk+/Xc=
X-Received: by 2002:a05:6512:2394:b0:4f8:62a6:8b2 with SMTP id
 c20-20020a056512239400b004f862a608b2mr3698903lfv.46.1689874292386; Thu, 20
 Jul 2023 10:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230615134315.494330-1-sebastian.weyer@smile.fr>
 <20230615134315.494330-3-sebastian.weyer@smile.fr>
In-Reply-To: <20230615134315.494330-3-sebastian.weyer@smile.fr>
From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 20 Jul 2023 10:31:20 -0700
Message-ID: <CAFSsvmq5b6C4KOB+nkodmR7bc8D+QgBxXyt+KG78dY4Gwq6L9A@mail.gmail.com>
To: Sebastian Weyer <sebastian.weyer@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689874292; x=1690479092;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z/sJL5Pza7r4hqDMV//M8k+IgzQjRdD6mLOe6DWDUXo=;
 b=Zt8ZC5u8fFrurI/3DZ8yPnQIlCSO0NPkvT+heg2w9e1IndygILz/B8QgM0R2N4n4r7
 CDUsBleil9f4RHxkfDwmk9G8COkMgETIZwtWBilA7ZjCwbh+08ZbO9AX6f4vOFmqZr3E
 ooK5Mx5IS15tbzvYUpl2iUlZ24b/5tpYu9nRChNIlRJ0JIPuHt5IEVORMHV2WdPG1LJQ
 uEyLCgWPNDTNMJFLPpkiEX+EfvswlJG6K0cpxc8/izlkCqJ2A7Gc8++OPpGrgkQ9nnnN
 HwHEec/UL+w6BJZXIT+wuJ/pvgit0T0zwYUpId0j22J1odW/xjx12LBeexCOeQoU3TkO
 mnbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Zt8ZC5u8
Subject: Re: [Buildroot] [PATCH v4 02/10] package/llvm: move to llvm-project
 folder
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Lang Daniel <d.lang@abatec.at>,
 buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: multipart/mixed; boundary="===============2281972219233375173=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2281972219233375173==
Content-Type: multipart/alternative; boundary="000000000000e9aece0600ee84d8"

--000000000000e9aece0600ee84d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>

On Thu, Jun 15, 2023 at 6:44=E2=80=AFAM Sebastian Weyer <sebastian.weyer@sm=
ile.fr>
wrote:

> From: Lang Daniel <d.lang@abatec.at>
>
> To make updating easier, move llvm into the llvm-project folder
> and use the defined information.
>
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> Reviewed-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> ---
>  DEVELOPERS                                                  | 6 +++---
>  package/Config.in                                           | 2 +-
>  .../llvm/0001-nfc-Fix-missing-include.patch                 | 0
>  package/{ =3D> llvm-project}/llvm/Config.in                   | 0
>  package/{ =3D> llvm-project}/llvm/llvm.hash                   | 0
>  package/{ =3D> llvm-project}/llvm/llvm.mk                     | 5 ++---
>  6 files changed, 6 insertions(+), 7 deletions(-)
>  rename package/{ =3D> llvm-project}/llvm/0001-nfc-Fix-missing-include.pa=
tch
> (100%)
>  rename package/{ =3D> llvm-project}/llvm/Config.in (100%)
>  rename package/{ =3D> llvm-project}/llvm/llvm.hash (100%)
>  rename package/{ =3D> llvm-project}/llvm/llvm.mk (98%)
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 56316201af..c4273c5f85 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1639,7 +1639,7 @@ F:        package/earlyoom/
>  F:     package/gconf/
>  F:     package/libnss/
>  F:     package/lld/
> -F:     package/llvm/
> +F:     package/llvm-project/llvm/
>  F:     package/python-cython/
>  F:     package/python-pycups/
>  F:     package/python-raven/
> @@ -2538,7 +2538,7 @@ F:        package/libgta/
>  F:     package/libiec61850/
>  F:     package/libspatialindex/
>  F:     package/linux-syscall-support/
> -F:     package/llvm/
> +F:     package/llvm-project/llvm/
>  F:     package/lugaru/
>  F:     package/mcelog/
>  F:     package/mesa3d/
> @@ -2949,7 +2949,7 @@ N:        Valentin Korenblit <
> valentinkorenblit@gmail.com>
>  F:     package/clang/
>  F:     package/clinfo/
>  F:     package/libclc/
> -F:     package/llvm/
> +F:     package/llvm-project/llvm/
>
>  N:     Vanya Sergeev <vsergeev@gmail.com>
>  F:     package/lua-periphery/
> diff --git a/package/Config.in b/package/Config.in
> index bff090a661..dffffc195b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2128,7 +2128,7 @@ comment "linux-pam plugins"
>         source "package/libpam-tacplus/Config.in"
>  endif
>         source "package/liquid-dsp/Config.in"
> -       source "package/llvm/Config.in"
> +       source "package/llvm-project/llvm/Config.in"
>         source "package/lttng-libust/Config.in"
>         source "package/matio/Config.in"
>         source "package/mpc/Config.in"
> diff --git a/package/llvm/0001-nfc-Fix-missing-include.patch
> b/package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch
> similarity index 100%
> rename from package/llvm/0001-nfc-Fix-missing-include.patch
> rename to package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch
> diff --git a/package/llvm/Config.in b/package/llvm-project/llvm/Config.in
> similarity index 100%
> rename from package/llvm/Config.in
> rename to package/llvm-project/llvm/Config.in
> diff --git a/package/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash
> similarity index 100%
> rename from package/llvm/llvm.hash
> rename to package/llvm-project/llvm/llvm.hash
> diff --git a/package/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
> similarity index 98%
> rename from package/llvm/llvm.mk
> rename to package/llvm-project/llvm/llvm.mk
> index 977c0a08c2..1adad17b16 100644
> --- a/package/llvm/llvm.mk
> +++ b/package/llvm-project/llvm/llvm.mk
> @@ -4,9 +4,8 @@
>  #
>
>  ########################################################################=
########
>
> -# LLVM, Clang and lld should be version bumped together
> -LLVM_VERSION =3D 11.1.0
> -LLVM_SITE =3D
> https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_VER=
SION)
> +LLVM_VERSION =3D $(LLVM_PROJECT_VERSION)
> +LLVM_SITE =3D $(LLVM_PROJECT_SITE)
>  LLVM_SOURCE =3D llvm-$(LLVM_VERSION).src.tar.xz
>  LLVM_LICENSE =3D Apache-2.0 with exceptions
>  LLVM_LICENSE_FILES =3D LICENSE.TXT
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000e9aece0600ee84d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tested-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett=
@amarulasolutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com<=
/a>&gt;<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, Jun 15, 2023 at 6:44=E2=80=AFAM Sebastian Weyer &lt;<a h=
ref=3D"mailto:sebastian.weyer@smile.fr">sebastian.weyer@smile.fr</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Lang =
Daniel &lt;<a href=3D"mailto:d.lang@abatec.at" target=3D"_blank">d.lang@aba=
tec.at</a>&gt;<br>
<br>
To make updating easier, move llvm into the llvm-project folder<br>
and use the defined information.<br>
<br>
Signed-off-by: Daniel Lang &lt;<a href=3D"mailto:d.lang@abatec.at" target=
=3D"_blank">d.lang@abatec.at</a>&gt;<br>
Reviewed-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr" targ=
et=3D"_blank">romain.naour@smile.fr</a>&gt;<br>
Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr" ta=
rget=3D"_blank">romain.naour@smile.fr</a>&gt;<br>
Signed-off-by: Sebastian Weyer &lt;<a href=3D"mailto:sebastian.weyer@smile.=
fr" target=3D"_blank">sebastian.weyer@smile.fr</a>&gt;<br>
---<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 +++---<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0.../llvm/0001-nfc-Fix-missing-include.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0package/{ =3D&gt; llvm-project}/llvm/Config.in=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0package/{ =3D&gt; llvm-project}/llvm/llvm.hash=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0package/{ =3D&gt; llvm-project}/llvm/<a href=3D"http://llvm.mk" rel=
=3D"noreferrer" target=3D"_blank">llvm.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 ++---<br>
=C2=A06 files changed, 6 insertions(+), 7 deletions(-)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/llvm/0001-nfc-Fix-missing-incl=
ude.patch (100%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/llvm/Config.in (100%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/llvm/llvm.hash (100%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/llvm/<a href=3D"http://llvm.mk=
" rel=3D"noreferrer" target=3D"_blank">llvm.mk</a> (98%)<br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 56316201af..c4273c5f85 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -1639,7 +1639,7 @@ F:=C2=A0 =C2=A0 =C2=A0 =C2=A0 package/earlyoom/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/gconf/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libnss/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/lld/<br>
-F:=C2=A0 =C2=A0 =C2=A0package/llvm/<br>
+F:=C2=A0 =C2=A0 =C2=A0package/llvm-project/llvm/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/python-cython/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/python-pycups/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/python-raven/<br>
@@ -2538,7 +2538,7 @@ F:=C2=A0 =C2=A0 =C2=A0 =C2=A0 package/libgta/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libiec61850/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libspatialindex/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/linux-syscall-support/<br>
-F:=C2=A0 =C2=A0 =C2=A0package/llvm/<br>
+F:=C2=A0 =C2=A0 =C2=A0package/llvm-project/llvm/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/lugaru/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/mcelog/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/mesa3d/<br>
@@ -2949,7 +2949,7 @@ N:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Valentin Korenblit &lt;=
<a href=3D"mailto:valentinkorenblit@gmail.com" target=3D"_blank">valentinko=
renblit@gmail.com</a>&gt;<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/clang/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/clinfo/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libclc/<br>
-F:=C2=A0 =C2=A0 =C2=A0package/llvm/<br>
+F:=C2=A0 =C2=A0 =C2=A0package/llvm-project/llvm/<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Vanya Sergeev &lt;<a href=3D"mailto:vsergeev@gm=
ail.com" target=3D"_blank">vsergeev@gmail.com</a>&gt;<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/lua-periphery/<br>
diff --git a/package/Config.in b/package/Config.in<br>
index bff090a661..dffffc195b 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -2128,7 +2128,7 @@ comment &quot;linux-pam plugins&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/libpam-tacplus/Config.in&q=
uot;<br>
=C2=A0endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/liquid-dsp/Config.in&quot;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/llvm/Config.in&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/llvm-project/llvm/Config.i=
n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/lttng-libust/Config.in&quo=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/matio/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/mpc/Config.in&quot;<br>
diff --git a/package/llvm/0001-nfc-Fix-missing-include.patch b/package/llvm=
-project/llvm/0001-nfc-Fix-missing-include.patch<br>
similarity index 100%<br>
rename from package/llvm/0001-nfc-Fix-missing-include.patch<br>
rename to package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch<br>
diff --git a/package/llvm/Config.in b/package/llvm-project/llvm/Config.in<b=
r>
similarity index 100%<br>
rename from package/llvm/Config.in<br>
rename to package/llvm-project/llvm/Config.in<br>
diff --git a/package/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash<b=
r>
similarity index 100%<br>
rename from package/llvm/llvm.hash<br>
rename to package/llvm-project/llvm/llvm.hash<br>
diff --git a/package/llvm/<a href=3D"http://llvm.mk" rel=3D"noreferrer" tar=
get=3D"_blank">llvm.mk</a> b/package/llvm-project/llvm/<a href=3D"http://ll=
vm.mk" rel=3D"noreferrer" target=3D"_blank">llvm.mk</a><br>
similarity index 98%<br>
rename from package/llvm/<a href=3D"http://llvm.mk" rel=3D"noreferrer" targ=
et=3D"_blank">llvm.mk</a><br>
rename to package/llvm-project/llvm/<a href=3D"http://llvm.mk" rel=3D"noref=
errer" target=3D"_blank">llvm.mk</a><br>
index 977c0a08c2..1adad17b16 100644<br>
--- a/package/llvm/<a href=3D"http://llvm.mk" rel=3D"noreferrer" target=3D"=
_blank">llvm.mk</a><br>
+++ b/package/llvm-project/llvm/<a href=3D"http://llvm.mk" rel=3D"noreferre=
r" target=3D"_blank">llvm.mk</a><br>
@@ -4,9 +4,8 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-# LLVM, Clang and lld should be version bumped together<br>
-LLVM_VERSION =3D 11.1.0<br>
-LLVM_SITE =3D <a href=3D"https://github.com/llvm/llvm-project/releases/dow=
nload/llvmorg-$(LLVM_VERSION)" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_VERSION)</a>=
<br>
+LLVM_VERSION =3D $(LLVM_PROJECT_VERSION)<br>
+LLVM_SITE =3D $(LLVM_PROJECT_SITE)<br>
=C2=A0LLVM_SOURCE =3D llvm-$(LLVM_VERSION).src.tar.xz<br>
=C2=A0LLVM_LICENSE =3D Apache-2.0 with exceptions<br>
=C2=A0LLVM_LICENSE_FILES =3D LICENSE.TXT<br>
-- <br>
2.34.1<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--000000000000e9aece0600ee84d8--

--===============2281972219233375173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2281972219233375173==--
