Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6C5EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 17:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3026D80BF0;
	Thu, 20 Jul 2023 17:31:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3026D80BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7HLLRzm5-Svd; Thu, 20 Jul 2023 17:31:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ADEE82036;
	Thu, 20 Jul 2023 17:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ADEE82036
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F21A91BF5DA
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D868F416FA
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D868F416FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PGQQtHiUxkN1 for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 17:31:43 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 759AA416C4
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 17:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 759AA416C4
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fdd31bf179so1693666e87.2
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 10:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689874301; x=1690479101;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JxtVFl6FVJdV1ia7EyhG3Xz6cR5L4jiGqkNRZbvGwSI=;
 b=FYJMN9JpGbVVlY4hNjFTDX7jWH3k38eG5fp+YhOnFqNIR4NBcryPimsVc71SW+aOWT
 LhNchiX9ZdNMgE1XONKHKFTrLX4xSkXeBT+3GNbY+VSZ3gjEhpo355xViryBoOQKSFp5
 A56xAcpII0rxvnLbo9xMOA8oCYLzzAxjm3xrQz5UJ58gei1WQkU7+tezZ0SWd7AdYtzj
 RKAJ4zm2NbR3BtNIAGdLOPvDJlv0zyhBGOSwV0s3pjC82PoltpfXfeI1ZN5SSc+TLw7J
 0S6Zx580Utk89Q/3q5X95sCYC55PIy3DzUXNXmFIDxfK7pNOhg/IrCAJV1AfQFdo3/Of
 Uu/A==
X-Gm-Message-State: ABy/qLatHB2nB5VSmFqJZ2qj/MEJwSQ+kyG2vk5ETOnmt4+4c1LJKmpj
 9NFi3OZ8tgniyG6B/bQ9g/o/kTVtSeCUswqtJ6SeGbtEdmYNBQ==
X-Google-Smtp-Source: APBJJlFU7pDUnWC5baxQ1gTCEPxwRPK1Jd6fewXfCjY35dXyoZxJ5FH9thrpHOCDhZa87JHajNDBzvZW98IQcqmVLbk=
X-Received: by 2002:a05:6512:3282:b0:4fb:be3c:d8b7 with SMTP id
 p2-20020a056512328200b004fbbe3cd8b7mr2499408lfe.51.1689874301125; Thu, 20 Jul
 2023 10:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230615134315.494330-1-sebastian.weyer@smile.fr>
 <20230615134315.494330-4-sebastian.weyer@smile.fr>
In-Reply-To: <20230615134315.494330-4-sebastian.weyer@smile.fr>
From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 20 Jul 2023 10:31:29 -0700
Message-ID: <CAFSsvmqWSbZaw+zrB0A2jWy4WDRCRc7J611=Hci8ke9+CJax3w@mail.gmail.com>
To: Sebastian Weyer <sebastian.weyer@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689874301; x=1690479101;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JxtVFl6FVJdV1ia7EyhG3Xz6cR5L4jiGqkNRZbvGwSI=;
 b=XYvQdtFr/UyP2sHjMMNDdOsdvexnFDZoVv0FPAWuDCW4Oi+pWlVdBGOIMPF3MJ4fFy
 6lCHnizaF6tizhY879pTd+clo/OtWPFJURfz2n/2AclvT0vbroViSLTWQt/NJYGrC7qo
 zlr2ImDtVMtBV0A3RhjBOO3HLiryMNqb/sRnckGi5MFKk9mL6+D1bqzF73cB0w9c84NR
 VIC+L8Au6rHum3ngyZbEmn+aFsHdGWGypVrM9Ryr9g2471Y6V/u3op05SSKOyI5kxM4T
 PgJO6OMjdURIAQz7G1JWmi6CSJPa6jCFJIULfInldgSc7bAE1VXZcZc2TICTbywRIdqz
 Ejug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=XYvQdtFr
Subject: Re: [Buildroot] [PATCH v4 03/10] package/lld: move to llvm-project
 subfolder
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
 Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1656510350460222104=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1656510350460222104==
Content-Type: multipart/alternative; boundary="0000000000006f0cf70600ee8526"

--0000000000006f0cf70600ee8526
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>

On Thu, Jun 15, 2023 at 6:44=E2=80=AFAM Sebastian Weyer <sebastian.weyer@sm=
ile.fr>
wrote:

> From: Lang Daniel <d.lang@abatec.at>
>
> To make version bumping easier, move lld to a new llvm-project subfolder
> and specify site and version for the project.
>
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> Reviewed-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> ---
> v4: change inaccuracy in commit message (move llvm -> move lld)
> ---
>  DEVELOPERS                                    | 2 +-
>  package/Config.in.host                        | 2 +-
>  package/{ =3D> llvm-project}/lld/Config.in.host | 0
>  package/{ =3D> llvm-project}/lld/lld.hash       | 0
>  package/{ =3D> llvm-project}/lld/lld.mk         | 5 ++---
>  5 files changed, 4 insertions(+), 5 deletions(-)
>  rename package/{ =3D> llvm-project}/lld/Config.in.host (100%)
>  rename package/{ =3D> llvm-project}/lld/lld.hash (100%)
>  rename package/{ =3D> llvm-project}/lld/lld.mk (87%)
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c4273c5f85..befafff1d0 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1638,7 +1638,7 @@ F:        package/clang/
>  F:     package/earlyoom/
>  F:     package/gconf/
>  F:     package/libnss/
> -F:     package/lld/
> +F:     package/llvm-project/lld/
>  F:     package/llvm-project/llvm/
>  F:     package/python-cython/
>  F:     package/python-pycups/
> diff --git a/package/Config.in.host b/package/Config.in.host
> index dcadbfdfc1..9addc88522 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -51,7 +51,7 @@ menu "Host utilities"
>         source "package/jsmin/Config.in.host"
>         source "package/kmod/Config.in.host"
>         source "package/libp11/Config.in.host"
> -       source "package/lld/Config.in.host"
> +       source "package/llvm-project/lld/Config.in.host"
>         source "package/lpc3250loader/Config.in.host"
>         source "package/lttng-babeltrace/Config.in.host"
>         source "package/lzma-alone/Config.in.host"
> diff --git a/package/lld/Config.in.host
> b/package/llvm-project/lld/Config.in.host
> similarity index 100%
> rename from package/lld/Config.in.host
> rename to package/llvm-project/lld/Config.in.host
> diff --git a/package/lld/lld.hash b/package/llvm-project/lld/lld.hash
> similarity index 100%
> rename from package/lld/lld.hash
> rename to package/llvm-project/lld/lld.hash
> diff --git a/package/lld/lld.mk b/package/llvm-project/lld/lld.mk
> similarity index 87%
> rename from package/lld/lld.mk
> rename to package/llvm-project/lld/lld.mk
> index 4bf903cda0..46ec3b13ff 100644
> --- a/package/lld/lld.mk
> +++ b/package/llvm-project/lld/lld.mk
> @@ -4,9 +4,8 @@
>  #
>
>  ########################################################################=
########
>
> -# LLVM, Clang and lld should be version bumped together
> -LLD_VERSION =3D 11.1.0
> -LLD_SITE =3D
> https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLD_VERS=
ION)
> +LLD_VERSION =3D $(LLVM_PROJECT_VERSION)
> +LLD_SITE =3D $(LLVM_PROJECT_SITE)
>  LLD_SOURCE =3D lld-$(LLD_VERSION).src.tar.xz
>  LLD_LICENSE =3D Apache-2.0 with exceptions
>  LLD_LICENSE_FILES =3D LICENSE.TXT
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000006f0cf70600ee8526
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
To make version bumping easier, move lld to a new llvm-project subfolder<br=
>
and specify site and version for the project.<br>
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
v4: change inaccuracy in commit message (move llvm -&gt; move lld)<br>
---<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<b=
r>
=C2=A0package/Config.in.host=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0package/{ =3D&gt; llvm-project}/lld/Config.in.host | 0<br>
=C2=A0package/{ =3D&gt; llvm-project}/lld/lld.hash=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 0<br>
=C2=A0package/{ =3D&gt; llvm-project}/lld/<a href=3D"http://lld.mk" rel=3D"=
noreferrer" target=3D"_blank">lld.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 5 ++---<br>
=C2=A05 files changed, 4 insertions(+), 5 deletions(-)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/lld/Config.in.host (100%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/lld/lld.hash (100%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/lld/<a href=3D"http://lld.mk" =
rel=3D"noreferrer" target=3D"_blank">lld.mk</a> (87%)<br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index c4273c5f85..befafff1d0 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -1638,7 +1638,7 @@ F:=C2=A0 =C2=A0 =C2=A0 =C2=A0 package/clang/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/earlyoom/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/gconf/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libnss/<br>
-F:=C2=A0 =C2=A0 =C2=A0package/lld/<br>
+F:=C2=A0 =C2=A0 =C2=A0package/llvm-project/lld/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/llvm-project/llvm/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/python-cython/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/python-pycups/<br>
diff --git a/package/Config.in.host b/package/Config.in.host<br>
index dcadbfdfc1..9addc88522 100644<br>
--- a/package/Config.in.host<br>
+++ b/package/Config.in.host<br>
@@ -51,7 +51,7 @@ menu &quot;Host utilities&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/jsmin/Config.in.host&quot;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/kmod/Config.in.host&quot;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/libp11/Config.in.host&quot=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/lld/Config.in.host&quot;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/llvm-project/lld/Config.in=
.host&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/lpc3250loader/Config.in.ho=
st&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/lttng-babeltrace/Config.in=
.host&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/lzma-alone/Config.in.host&=
quot;<br>
diff --git a/package/lld/Config.in.host b/package/llvm-project/lld/Config.i=
n.host<br>
similarity index 100%<br>
rename from package/lld/Config.in.host<br>
rename to package/llvm-project/lld/Config.in.host<br>
diff --git a/package/lld/lld.hash b/package/llvm-project/lld/lld.hash<br>
similarity index 100%<br>
rename from package/lld/lld.hash<br>
rename to package/llvm-project/lld/lld.hash<br>
diff --git a/package/lld/<a href=3D"http://lld.mk" rel=3D"noreferrer" targe=
t=3D"_blank">lld.mk</a> b/package/llvm-project/lld/<a href=3D"http://lld.mk=
" rel=3D"noreferrer" target=3D"_blank">lld.mk</a><br>
similarity index 87%<br>
rename from package/lld/<a href=3D"http://lld.mk" rel=3D"noreferrer" target=
=3D"_blank">lld.mk</a><br>
rename to package/llvm-project/lld/<a href=3D"http://lld.mk" rel=3D"norefer=
rer" target=3D"_blank">lld.mk</a><br>
index 4bf903cda0..46ec3b13ff 100644<br>
--- a/package/lld/<a href=3D"http://lld.mk" rel=3D"noreferrer" target=3D"_b=
lank">lld.mk</a><br>
+++ b/package/llvm-project/lld/<a href=3D"http://lld.mk" rel=3D"noreferrer"=
 target=3D"_blank">lld.mk</a><br>
@@ -4,9 +4,8 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-# LLVM, Clang and lld should be version bumped together<br>
-LLD_VERSION =3D 11.1.0<br>
-LLD_SITE =3D <a href=3D"https://github.com/llvm/llvm-project/releases/down=
load/llvmorg-$(LLD_VERSION)" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/llvm/llvm-project/releases/download/llvmorg-$(LLD_VERSION)</a><br=
>
+LLD_VERSION =3D $(LLVM_PROJECT_VERSION)<br>
+LLD_SITE =3D $(LLVM_PROJECT_SITE)<br>
=C2=A0LLD_SOURCE =3D lld-$(LLD_VERSION).src.tar.xz<br>
=C2=A0LLD_LICENSE =3D Apache-2.0 with exceptions<br>
=C2=A0LLD_LICENSE_FILES =3D LICENSE.TXT<br>
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

--0000000000006f0cf70600ee8526--

--===============1656510350460222104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1656510350460222104==--
