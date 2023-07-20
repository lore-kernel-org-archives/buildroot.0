Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EF9EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 17:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67F1981AF6;
	Thu, 20 Jul 2023 17:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67F1981AF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qUrUP2c2ChfV; Thu, 20 Jul 2023 17:32:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2996A82B3E;
	Thu, 20 Jul 2023 17:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2996A82B3E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 468271BF980
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EBC1812FA
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EBC1812FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Pbi6dM4zK7P for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 17:32:06 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B662D82360
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 17:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B662D82360
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fba03becc6so2822512e87.0
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 10:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689874323; x=1690479123;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WT8KKOaDLYiEr1RgsSouAPFpjYOSgoKCjUZZtFAmdnI=;
 b=dku0imr2Ewlgp7w3YEB9fjMFN309y03nBuFfqhAd3J4tIWPTIDUxdFgjqTUp3wiIvq
 YUdfbNoIxzaDzmuFOQwMEHOjGsNRYNSDJrrnAE7T/UPY5CUXW+ab7vT70nS1QtiydX5o
 OSOWdsEF5gBEv6EkDtfMDoJm5smzxpwXTb3cOGYUyXQGfY3Dg9NK2NVH2a/4ScDufBR5
 7Ef/IuBDFq9s+BpT5Fi3jjM9NL2BwM7rfOADdZqCSgMcreHZE+ytJYa4KSfu5LLMHx7Q
 RiQYlPapl00HdA48Z+Qe5JZJlQg/D/HLPXl4Hk7ueh73ySxWp8B6C6WNRmRYCfGs/WAa
 Cn7Q==
X-Gm-Message-State: ABy/qLbWMeAZZcHB7mE99yLPzbV/90JXsPU7QCNXzgudH0iIf+sJu6MT
 S4kebtr5Hu3/aEaczx4CORjl5JucpfUNHrz1WyU=
X-Google-Smtp-Source: APBJJlGhRuze7fDhKaZn6hBcOeaOP7u2BKCF4fvN9I5nvf/mnkUusRecKoGys4NaLilzGTn97RDBqMbXKuEjhmqFzKc=
X-Received: by 2002:a05:6512:31d5:b0:4f8:75d5:e14f with SMTP id
 j21-20020a05651231d500b004f875d5e14fmr1339182lfe.28.1689874323513; Thu, 20
 Jul 2023 10:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230615134315.494330-1-sebastian.weyer@smile.fr>
 <20230615134315.494330-7-sebastian.weyer@smile.fr>
In-Reply-To: <20230615134315.494330-7-sebastian.weyer@smile.fr>
From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 20 Jul 2023 10:31:52 -0700
Message-ID: <CAFSsvmrcDJSsWQg+DPC3atG=FD3Yj1QLbDfgKPRc5JpHa=kE_g@mail.gmail.com>
To: Sebastian Weyer <sebastian.weyer@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689874323; x=1690479123;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WT8KKOaDLYiEr1RgsSouAPFpjYOSgoKCjUZZtFAmdnI=;
 b=I92fQBGAGdfUX73c2fMltXyfaLqFDsFsm5gqZ8LDOgrEjXIR7fWKvDkQi7urSe5ZzC
 QBc+m4W9n62rrDrGNuv72NrYV0fJ+U1jyFMkGsvytWCKokOshCRUOr/w4UbX/KeoTzwF
 GHn8klXMo2Jdc/OIzBvXmPz5gb2Ip0eoQ8xLaPsF83xLZ7ZpoeLEfEutHlf36N/Vy/fD
 09/jIh0MbDEJn4EvUFaJD4LEFwPkG+NXz0V5SxUoQ/bZnzSXq0gUEmnYH5iTip16rHzs
 iWPSSwQ0jhxELyoH7NGixBB9iP1cMZkNFyFjWZ9+D6iu8bomwfMw67O46LhQ47lg4o3J
 SDKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=I92fQBGA
Subject: Re: [Buildroot] [PATCH v4 06/10] package/libclc: move to
 llvm-project subfolder
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
Cc: Lang Daniel <d.lang@abatec.at>, Romain Naour <romain.naour@smile.fr>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5128804745983671591=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5128804745983671591==
Content-Type: multipart/alternative; boundary="000000000000c4a7540600ee86a6"

--000000000000c4a7540600ee86a6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>

On Thu, Jun 15, 2023 at 6:45=E2=80=AFAM Sebastian Weyer <sebastian.weyer@sm=
ile.fr>
wrote:

> From: Lang Daniel <d.lang@abatec.at>
>
> To make version bumping easier, move libclc to a new llvm-project subfold=
er
> and specify site for the project. Since the version of libclc is more
> recent than the version specified in LLVM_PROJECT_VERSION, don't change
> it for now until a later update.
>
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> ---
> v4: change inaccuracies in commit message
>     - move llvm -> move libclc
>     - libclc version is not specified through LLVM_PROJECT_VERSION since
>       it is already at version 13.0.1 as opposed to version 11.1.0
>
> v3: move libclc before llvm 15.0.3 version bump commit
>     move libclc entry in package/Config.in
> ---
>  DEVELOPERS                                                    | 4 ++--
>  package/Config.in                                             | 2 +-
>  .../libclc/0001-support-out-of-tree-build.patch               | 0
>  package/{ =3D> llvm-project}/libclc/Config.in                   | 0
>  package/{ =3D> llvm-project}/libclc/libclc.hash                 | 0
>  package/{ =3D> llvm-project}/libclc/libclc.mk                   | 2 +-
>  6 files changed, 4 insertions(+), 4 deletions(-)
>  rename package/{ =3D>
> llvm-project}/libclc/0001-support-out-of-tree-build.patch (100%)
>  rename package/{ =3D> llvm-project}/libclc/Config.in (100%)
>  rename package/{ =3D> llvm-project}/libclc/libclc.hash (100%)
>  rename package/{ =3D> llvm-project}/libclc/libclc.mk (93%)
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1fb8295a7a..48907a5cd8 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2532,12 +2532,12 @@ F:      package/irrlicht/
>  F:     package/liblinear/
>  F:     package/lensfun/
>  F:     package/libbpf/
> -F:     package/libclc/
>  F:     package/libgta/
>  F:     package/libiec61850/
>  F:     package/libspatialindex/
>  F:     package/linux-syscall-support/
>  F:     package/llvm-project/clang/
> +F:     package/llvm-project/libclc/
>  F:     package/llvm-project/llvm/
>  F:     package/lugaru/
>  F:     package/mcelog/
> @@ -2947,8 +2947,8 @@ F:        package/tinyssh/
>
>  N:     Valentin Korenblit <valentinkorenblit@gmail.com>
>  F:     package/clinfo/
> -F:     package/libclc/
>  F:     package/llvm-project/clang/
> +F:     package/llvm-project/libclc/
>  F:     package/llvm-project/llvm/
>
>  N:     Vanya Sergeev <vsergeev@gmail.com>
> diff --git a/package/Config.in b/package/Config.in
> index 17343a8e86..42cf0b170e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2065,7 +2065,6 @@ menu "Other"
>         source "package/libcap/Config.in"
>         source "package/libcap-ng/Config.in"
>         source "package/libcgroup/Config.in"
> -       source "package/libclc/Config.in"
>         source "package/libcofi/Config.in"
>         source "package/libcorrect/Config.in"
>         source "package/libcrossguid/Config.in"
> @@ -2128,6 +2127,7 @@ endif
>         source "package/liquid-dsp/Config.in"
>         source "package/llvm-project/clang/Config.in"
>         source "package/llvm-project/compiler-rt/Config.in"
> +       source "package/llvm-project/libclc/Config.in"
>         source "package/llvm-project/llvm/Config.in"
>         source "package/lttng-libust/Config.in"
>         source "package/matio/Config.in"
> diff --git a/package/libclc/0001-support-out-of-tree-build.patch
> b/package/llvm-project/libclc/0001-support-out-of-tree-build.patch
> similarity index 100%
> rename from package/libclc/0001-support-out-of-tree-build.patch
> rename to package/llvm-project/libclc/0001-support-out-of-tree-build.patc=
h
> diff --git a/package/libclc/Config.in
> b/package/llvm-project/libclc/Config.in
> similarity index 100%
> rename from package/libclc/Config.in
> rename to package/llvm-project/libclc/Config.in
> diff --git a/package/libclc/libclc.hash
> b/package/llvm-project/libclc/libclc.hash
> similarity index 100%
> rename from package/libclc/libclc.hash
> rename to package/llvm-project/libclc/libclc.hash
> diff --git a/package/libclc/libclc.mk b/package/llvm-project/libclc/
> libclc.mk
> similarity index 93%
> rename from package/libclc/libclc.mk
> rename to package/llvm-project/libclc/libclc.mk
> index 5d246cf4f8..406adfdb53 100644
> --- a/package/libclc/libclc.mk
> +++ b/package/llvm-project/libclc/libclc.mk
> @@ -5,7 +5,7 @@
>
>  ########################################################################=
########
>
>  LIBCLC_VERSION =3D 13.0.1
> -LIBCLC_SITE =3D
> https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LIBCLC_V=
ERSION)
> +LIBCLC_SITE =3D $(LLVM_PROJECT_SITE)
>  LIBCLC_SOURCE =3D libclc-$(LIBCLC_VERSION).src.tar.xz
>  LIBCLC_LICENSE =3D Apache-2.0 with exceptions or MIT
>  LIBCLC_LICENSE_FILES =3D LICENSE.TXT
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000c4a7540600ee86a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tested-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett=
@amarulasolutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com<=
/a>&gt;<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, Jun 15, 2023 at 6:45=E2=80=AFAM Sebastian Weyer &lt;<a h=
ref=3D"mailto:sebastian.weyer@smile.fr">sebastian.weyer@smile.fr</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Lang =
Daniel &lt;<a href=3D"mailto:d.lang@abatec.at" target=3D"_blank">d.lang@aba=
tec.at</a>&gt;<br>
<br>
To make version bumping easier, move libclc to a new llvm-project subfolder=
<br>
and specify site for the project. Since the version of libclc is more<br>
recent than the version specified in LLVM_PROJECT_VERSION, don&#39;t change=
<br>
it for now until a later update.<br>
<br>
Signed-off-by: Daniel Lang &lt;<a href=3D"mailto:d.lang@abatec.at" target=
=3D"_blank">d.lang@abatec.at</a>&gt;<br>
Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr" ta=
rget=3D"_blank">romain.naour@smile.fr</a>&gt;<br>
Signed-off-by: Sebastian Weyer &lt;<a href=3D"mailto:sebastian.weyer@smile.=
fr" target=3D"_blank">sebastian.weyer@smile.fr</a>&gt;<br>
---<br>
v4: change inaccuracies in commit message<br>
=C2=A0 =C2=A0 - move llvm -&gt; move libclc<br>
=C2=A0 =C2=A0 - libclc version is not specified through LLVM_PROJECT_VERSIO=
N since<br>
=C2=A0 =C2=A0 =C2=A0 it is already at version 13.0.1 as opposed to version =
11.1.0<br>
<br>
v3: move libclc before llvm 15.0.3 version bump commit<br>
=C2=A0 =C2=A0 move libclc entry in package/Config.in<br>
---<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0.../libclc/0001-support-out-of-tree-build.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0package/{ =3D&gt; llvm-project}/libclc/Config.in=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0package/{ =3D&gt; llvm-project}/libclc/libclc.hash=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0package/{ =3D&gt; llvm-project}/libclc/<a href=3D"http://libclc.mk" r=
el=3D"noreferrer" target=3D"_blank">libclc.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A06 files changed, 4 insertions(+), 4 deletions(-)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/libclc/0001-support-out-of-tre=
e-build.patch (100%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/libclc/Config.in (100%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/libclc/libclc.hash (100%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/libclc/<a href=3D"http://libcl=
c.mk" rel=3D"noreferrer" target=3D"_blank">libclc.mk</a> (93%)<br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 1fb8295a7a..48907a5cd8 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -2532,12 +2532,12 @@ F:=C2=A0 =C2=A0 =C2=A0 package/irrlicht/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/liblinear/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/lensfun/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libbpf/<br>
-F:=C2=A0 =C2=A0 =C2=A0package/libclc/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libgta/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libiec61850/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libspatialindex/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/linux-syscall-support/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/llvm-project/clang/<br>
+F:=C2=A0 =C2=A0 =C2=A0package/llvm-project/libclc/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/llvm-project/llvm/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/lugaru/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/mcelog/<br>
@@ -2947,8 +2947,8 @@ F:=C2=A0 =C2=A0 =C2=A0 =C2=A0 package/tinyssh/<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Valentin Korenblit &lt;<a href=3D"mailto:valent=
inkorenblit@gmail.com" target=3D"_blank">valentinkorenblit@gmail.com</a>&gt=
;<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/clinfo/<br>
-F:=C2=A0 =C2=A0 =C2=A0package/libclc/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/llvm-project/clang/<br>
+F:=C2=A0 =C2=A0 =C2=A0package/llvm-project/libclc/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/llvm-project/llvm/<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Vanya Sergeev &lt;<a href=3D"mailto:vsergeev@gm=
ail.com" target=3D"_blank">vsergeev@gmail.com</a>&gt;<br>
diff --git a/package/Config.in b/package/Config.in<br>
index 17343a8e86..42cf0b170e 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -2065,7 +2065,6 @@ menu &quot;Other&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/libcap/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/libcap-ng/Config.in&quot;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/libcgroup/Config.in&quot;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/libclc/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/libcofi/Config.in&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/libcorrect/Config.in&quot;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/libcrossguid/Config.in&quo=
t;<br>
@@ -2128,6 +2127,7 @@ endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/liquid-dsp/Config.in&quot;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/llvm-project/clang/Config.=
in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/llvm-project/compiler-rt/C=
onfig.in&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/llvm-project/libclc/Config=
.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/llvm-project/llvm/Config.i=
n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/lttng-libust/Config.in&quo=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/matio/Config.in&quot;<br>
diff --git a/package/libclc/0001-support-out-of-tree-build.patch b/package/=
llvm-project/libclc/0001-support-out-of-tree-build.patch<br>
similarity index 100%<br>
rename from package/libclc/0001-support-out-of-tree-build.patch<br>
rename to package/llvm-project/libclc/0001-support-out-of-tree-build.patch<=
br>
diff --git a/package/libclc/Config.in b/package/llvm-project/libclc/Config.=
in<br>
similarity index 100%<br>
rename from package/libclc/Config.in<br>
rename to package/llvm-project/libclc/Config.in<br>
diff --git a/package/libclc/libclc.hash b/package/llvm-project/libclc/libcl=
c.hash<br>
similarity index 100%<br>
rename from package/libclc/libclc.hash<br>
rename to package/llvm-project/libclc/libclc.hash<br>
diff --git a/package/libclc/<a href=3D"http://libclc.mk" rel=3D"noreferrer"=
 target=3D"_blank">libclc.mk</a> b/package/llvm-project/libclc/<a href=3D"h=
ttp://libclc.mk" rel=3D"noreferrer" target=3D"_blank">libclc.mk</a><br>
similarity index 93%<br>
rename from package/libclc/<a href=3D"http://libclc.mk" rel=3D"noreferrer" =
target=3D"_blank">libclc.mk</a><br>
rename to package/llvm-project/libclc/<a href=3D"http://libclc.mk" rel=3D"n=
oreferrer" target=3D"_blank">libclc.mk</a><br>
index 5d246cf4f8..406adfdb53 100644<br>
--- a/package/libclc/<a href=3D"http://libclc.mk" rel=3D"noreferrer" target=
=3D"_blank">libclc.mk</a><br>
+++ b/package/llvm-project/libclc/<a href=3D"http://libclc.mk" rel=3D"noref=
errer" target=3D"_blank">libclc.mk</a><br>
@@ -5,7 +5,7 @@<br>
=C2=A0#####################################################################=
###########<br>
<br>
=C2=A0LIBCLC_VERSION =3D 13.0.1<br>
-LIBCLC_SITE =3D <a href=3D"https://github.com/llvm/llvm-project/releases/d=
ownload/llvmorg-$(LIBCLC_VERSION)" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/llvm/llvm-project/releases/download/llvmorg-$(LIBCLC_VERSIO=
N)</a><br>
+LIBCLC_SITE =3D $(LLVM_PROJECT_SITE)<br>
=C2=A0LIBCLC_SOURCE =3D libclc-$(LIBCLC_VERSION).src.tar.xz<br>
=C2=A0LIBCLC_LICENSE =3D Apache-2.0 with exceptions or MIT<br>
=C2=A0LIBCLC_LICENSE_FILES =3D LICENSE.TXT<br>
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

--000000000000c4a7540600ee86a6--

--===============5128804745983671591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5128804745983671591==--
