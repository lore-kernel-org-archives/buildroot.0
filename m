Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A007EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 17:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CEA682093;
	Thu, 20 Jul 2023 17:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CEA682093
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xCd3QmvLIZYt; Thu, 20 Jul 2023 17:33:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D55982BC4;
	Thu, 20 Jul 2023 17:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D55982BC4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDAE31BF5DA
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3B7D416FA
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3B7D416FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4hwZdLN9mGxG for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 17:32:27 +0000 (UTC)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90B4D416C4
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 17:32:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90B4D416C4
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b703cbfaf5so15844411fa.1
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 10:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689874345; x=1690479145;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=auOqOLCrdmj9pprbqCMJK/2Gd5lmbst/2g5CINgj+G4=;
 b=U7yCNJzUsiTUNWpNpwzHkrkL4o6NH8RNkDrd5WOA0C4DUSCX4x8Ljo4Qe1YsG4fI79
 dQ/jzwJWDrwgayLwpCHav9g9Ta04Jzcy0YjAz5aS9PdxRoiqvFOjmpeOZQ7is/gAj0p0
 FTrgYfSALJdR35G+kkTTxBlnAFCUPgH8ZuJqtoI5HbwCaPib+HGzSR7JSSJrl1RWR8h5
 jq/R0ILQPuWhSqLkXexos1l/dnVB9oyLIq/Y3jpVApnTDlZ5Kt1J2ZaNGqK848Jq2Jjy
 15GEdwi9nLF+vh6Y7eWBkTBfHYCpF15/glsSgvdAS1ZTFjPF1OyLc0Ks8I2PO1Led7nU
 mvtA==
X-Gm-Message-State: ABy/qLb4La207MpxTDg6nPBAa03Lm+U902WyF/KTQmWM2SzCYaiBbaXm
 7XJYfe6FV8zU4WUubnViMJKYFIyrapKdR6vCMJg=
X-Google-Smtp-Source: APBJJlEPsoo9qN9L5+teclP65gq7bBZ5QJn424ZC+zvJrb/U0SsqZxDu9fBRvjm/LA/cxqtAKhp+kgYoeSrRDykispY=
X-Received: by 2002:a2e:8199:0:b0:2b4:83c3:d285 with SMTP id
 e25-20020a2e8199000000b002b483c3d285mr3063474ljg.38.1689874345252; Thu, 20
 Jul 2023 10:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230615134315.494330-1-sebastian.weyer@smile.fr>
 <20230615134315.494330-11-sebastian.weyer@smile.fr>
In-Reply-To: <20230615134315.494330-11-sebastian.weyer@smile.fr>
From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 20 Jul 2023 10:32:13 -0700
Message-ID: <CAFSsvmpgBN70tSCkkO0C9iCk+QDMaevjNtcnuRmSWZ-o2t0wdA@mail.gmail.com>
To: Sebastian Weyer <sebastian.weyer@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689874345; x=1690479145;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=auOqOLCrdmj9pprbqCMJK/2Gd5lmbst/2g5CINgj+G4=;
 b=hh/FO66Wz6P/yHvoxLwi2VEcDGK1q/2ahHr5Hol74N/tili43W7FpQQ3sy/LGSYrPR
 FeWJMAts3rpooDgC+p8nOecfAlHG5UdvHHU+oLkEfOY2zBztLhAbaInITqhhl37XXbBK
 qxHCvXRAKhg36rtKEyxUw8PBdZAjdev113VfI6oqNne6vSkr8Q2MvInuYGeOSw5dnjqL
 gxvA15l5HoP68K2eU2l2jUXandZz7fIBQj1u11kN0RiuHwMbXPQQfa96+hHrn7D/g1gv
 Tv6SDFSr04UaJ7VbtwecGUnwWE6sA5cvj+isRE12GGuEjSJnvevF7dZ4DVqHuWL27q3b
 qJhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=hh/FO66W
Subject: Re: [Buildroot] [PATCH v4 10/10] DEVELOPERS: add Daniel Lang for
 llvm-project
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
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1322530597692471815=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1322530597692471815==
Content-Type: multipart/alternative; boundary="000000000000105cd00600ee8868"

--000000000000105cd00600ee8868
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>

On Thu, Jun 15, 2023 at 6:46=E2=80=AFAM Sebastian Weyer <sebastian.weyer@sm=
ile.fr>
wrote:

> From: Lang Daniel <d.lang@abatec.at>
>
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 48907a5cd8..a9987ce1e6 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -654,6 +654,7 @@ F:  package/glibmm2_66/
>  F:     package/gtkmm3/
>  F:     package/libsigc/
>  F:     package/libsigc2/
> +F:     package/llvm-project/
>  F:     package/paho-mqtt-cpp/
>  F:     package/pangomm/
>  F:     package/pangomm2_46/
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000105cd00600ee8868
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tested-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett=
@amarulasolutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com<=
/a>&gt;<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, Jun 15, 2023 at 6:46=E2=80=AFAM Sebastian Weyer &lt;<a h=
ref=3D"mailto:sebastian.weyer@smile.fr">sebastian.weyer@smile.fr</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Lang =
Daniel &lt;<a href=3D"mailto:d.lang@abatec.at" target=3D"_blank">d.lang@aba=
tec.at</a>&gt;<br>
<br>
Signed-off-by: Daniel Lang &lt;<a href=3D"mailto:d.lang@abatec.at" target=
=3D"_blank">d.lang@abatec.at</a>&gt;<br>
Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr" ta=
rget=3D"_blank">romain.naour@smile.fr</a>&gt;<br>
Signed-off-by: Sebastian Weyer &lt;<a href=3D"mailto:sebastian.weyer@smile.=
fr" target=3D"_blank">sebastian.weyer@smile.fr</a>&gt;<br>
---<br>
=C2=A0DEVELOPERS | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 48907a5cd8..a9987ce1e6 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -654,6 +654,7 @@ F:=C2=A0 package/glibmm2_66/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/gtkmm3/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libsigc/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libsigc2/<br>
+F:=C2=A0 =C2=A0 =C2=A0package/llvm-project/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/paho-mqtt-cpp/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/pangomm/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/pangomm2_46/<br>
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

--000000000000105cd00600ee8868--

--===============1322530597692471815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1322530597692471815==--
