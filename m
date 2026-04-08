Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751C8FD5F6E
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 06:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EC1540E4E;
	Wed,  8 Apr 2026 06:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vKtfBxeEOEor; Wed,  8 Apr 2026 06:16:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2399E40F57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775629019;
	bh=OtlZClK+/6x/o7zOvJdzn+/kTJ+7R6n9pBNNFCB/tXE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=io3Yf3X+Qy3G1hT95E/anUETF8SX2BYavV4PwTYwC8weqKjIQ1tueCBCdZOjriLpe
	 vmm72QfwJ6aqKlG2zDKNLlcL2rerl+/6v8BETZOkOdCijrrXIWTf5GlJMyDDsl/bfc
	 qQEjWen37sb2IixYb9BP/QE6MSLg4f5ES01FW6saDLuMqVQzubzrVdcFnLkR+r+OrQ
	 l1n7hIwbx/l4nrLyKWhx/xwgXCCZJD1Yl2nJNwGrXeSJiXiSL+/LlL7/Tmvw6aPKTD
	 5Q1HwFz4UfRaAOVr5OG419YgoSaBx9XE9s0IOpYFiz0yDZmtSamavS2GgTm4IKQTt6
	 e3dH7KTNDgsuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2399E40F57;
	Wed,  8 Apr 2026 06:16:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2D24237
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 06:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98CF840F57
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 06:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1XMagtz2eK7L for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 06:16:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 47CFD40E4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47CFD40E4E
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47CFD40E4E
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 06:16:56 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-65c4152313fso7589209a12.1
 for <buildroot@buildroot.org>; Tue, 07 Apr 2026 23:16:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775629014; cv=none;
 d=google.com; s=arc-20240605;
 b=THipOEFParZ+USzhWcA6hMFt2G4zoxXA8bCInFmeOIi3lQFtbiwIG9Xzjojrah062z
 62MADU7FUTOEXgkyEzTziP5YqseNil6GkZ7fzUzUJf3b9oaWrq9Y8ZoIRsw6sw4Ptpd+
 tLR2p5qbFSZ9QnaWC3hGAIy1eTaf9Yl4HFsAhWJVXEvG0nzGHfQTUQeW2SzTq+uRtcyv
 YNsaypXhMlz2NR08GtPt9/SZvX7mndA3nfaEVQryuBEANhVEMdi2OuqrndchaEsBeRTc
 7I5CVrAYt+FZgnDhh2cZv7p5SW/SE9Z/dPKVQnU5Fv+cPdi1HINwUhnZLvGk2nNCBSSe
 fCDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=V/p04OKPSIRFWBiqN0eqvtU24T2NDm/WYPTS+RMsfM8=;
 fh=siEEGlK4OxgQsxxDJxK74FwhxxtTUd9xjx4ss01wdDI=;
 b=TCCFDzsvrUIFEg8EezRzPKLpWUebfjF8eVh4YR1clLBLmY6sE7vBqym0sSE0hNdIA0
 hASSEmhxHqJXUTi5dN3NauLVtMoVpm5PpLt+Ox0ghA+HsrmEAaJHX4NdA6en/7UXZGvy
 d4RUp7FXeMELt6LT5N1b22P+zHEv70072mAVga48972J0b1EAnaX+mvQPtjBtduvhvfs
 JQIcm4TCMnKimPOU+JQ4KYUU05iGMLgsqYnfpzR2KZlj0j7lnHqQkhmYEeT12Plf10jb
 2j69DHVKxfMqNI2QsHzcMWpbT9x0Ol6dEMlm8KNVyEqaKQo8DQSXCx5scwDFKw6fU/iH
 4VyA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775629014; x=1776233814;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V/p04OKPSIRFWBiqN0eqvtU24T2NDm/WYPTS+RMsfM8=;
 b=J+fjPFQYA54a8MC8MaCYc0SmwUQhm+FyICi29CARc3TS+ztg5mfsFb7ZIYlFVy1nNS
 rZ2QIyuuklNu6xiOQ5CTNWB787QI1Dq4hW+FyAv+mN//qcSIMSL+R4/j2CSSopAUIR2L
 OQXtvCjU6PfMQbyG98kzl11+GVU+LFlpa02T/tvDuAFv/8eDbXaIv5+g7X1IBEayEwVS
 ouGX3VUoRSIWh06PD6jqB2azGXJmO57M48s3okI0kU9TOwNNprhx0dwC8Uw9Zzk/1jAe
 tkcfpZuJgmpTUcJJJK5X1JLB0SJ25kF5rpig0J7qovQM+i6SymihVBOcekilDCy3U9Lg
 likw==
X-Gm-Message-State: AOJu0YyMVhCcWgj8e8Fx3b2ndrRSTBRdzHmzEnfpDa7MN2MrtlWRHFVK
 0ltz2fGDTkGkEdmV9sHdQm0TFPqRAExZqULFmA9dGDQEGoAXIjfk0DrzkWrA8QbN4uPDJOvxfk9
 UuacugwD9ORdUtI4QImGJ0NlE5yRBHaR9bg==
X-Gm-Gg: AeBDies6smuu6jvrBTvP9Sz+tbaVk2GBMILA9kbmimD6rTOogBBxaEjcGI/Xnobrz8l
 6y1z9E5X1UqowEjAMC1eYVA4UXV1dTCBOLSxFaxpUe4u2Yk1ZT7nQ9mm5Qlevxp7eeKd3SjH7K3
 fbs4pCiSxgR0xVAhfhxVkt9aIc0qBFlZANszgZmX/E2WGXYCR9xhlpPto4UGrMBHUcNX686JqBD
 SUQTYXFdUxoSo8KGxuLXRtDCPgDOtax8LOZgu5MFIvFAWOhpWIAOdBzRJNHE2rPu+YMIPeXmd4t
 8UMN
X-Received: by 2002:a05:6402:5256:b0:66b:aa56:ee5b with SMTP id
 4fb4d7f45d1cf-66e3f85414amr9758300a12.28.1775629013456; Tue, 07 Apr 2026
 23:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260404100127.75303-1-chakrabortyshubham66@gmail.com>
 <feb48f962690a47352cf75a74f704871@free.fr>
In-Reply-To: <feb48f962690a47352cf75a74f704871@free.fr>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Wed, 8 Apr 2026 11:46:41 +0530
X-Gm-Features: AQROBzBoq9TIxsHxL7FPrCYBsL4NdbrDv45sOatk7zAHviNR3Bi8HCucIiLuYA8
Message-ID: <CABvxksycKdJ8WEQvAdMo2=HNbDy5Hh3q=i3Xy9EX0i6w=2vNvg@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775629014; x=1776233814; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V/p04OKPSIRFWBiqN0eqvtU24T2NDm/WYPTS+RMsfM8=;
 b=QZLdNRTSrnEU4nEcpfjjLKiMByaR9ULFoJ+Q+ErP6cd8c+aB0diPfXX5JabAtujyPW
 qXQ3dcW6fEFU3dlhpCuRVX/MveX4lnRTbJeRZS8xqrnSPBd8z4IxCuAwQ9TqpKDH/Ttk
 hNSXwNKne6u1jODfZc9zKajQeBbL28MJHfTrd4wSySgFMryBuQ2dS1/sF1var7xTV+9A
 BfdlKr6CQLV/cGStvf2t3S2WW24Yr2+4NpgaSa6Z7EaKebt0g8NYzyFBT6E42ykyXcfA
 D/p9ES6R9gWlvrHeosooZ/Hvk7XimCId8YPl2IIF9KFRw9LACLHcIEeMurSmOOJpvM+I
 eonA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=QZLdNRTS
Subject: Re: [Buildroot] [PATCH] package/eigen: bump to version 5.0.1
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
Content-Type: multipart/mixed; boundary="===============2656515871694936065=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2656515871694936065==
Content-Type: multipart/alternative; boundary="000000000000999963064eecd89e"

--000000000000999963064eecd89e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Thanks for catching those two points. I missed updating
`.checkpackageignore`.

I will send v2 shortly that removes the patch file reference and adds the
dependency to gtkiostream, opencv4-contrib, and tensorflow-lite Config.in
files.

Best regards,

Shubham

On Wed, Apr 8, 2026 at 1:09=E2=80=AFAM Julien Olivain <ju.o@free.fr> wrote:

> Hi Shubham,
>
> Thanks for the patch.
>
> On 04/04/2026 12:01, Shubham Chakraborty wrote:
> > Update Eigen from 3.4.0 to 5.0.1.
> >
> > Remove the downstream CMake patch because the BLAS, LAPACK and
> > CMake package toggles are now provided upstream in 5.0.1.
> >
> > Refresh the source and license hashes to match the new release and
> > update the package license metadata to reflect the current upstream
> > licensing files.
> >
> > Add a gcc >=3D 5 dependency in Config.in because Eigen 5.x requires
> > C++14 support.
> >
> > Update the project homepage to the current upstream GitLab URL.
> >
> > Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> > ---
> >  ...ptions-for-controlling-build-compone.patch | 88 -------------------
> >  package/eigen/Config.in                       |  7 +-
> >  package/eigen/eigen.hash                      | 11 ++-
> >  package/eigen/eigen.mk                        |  6 +-
> >  4 files changed, 12 insertions(+), 100 deletions(-)
> >  delete mode 100644
> >
> package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.p=
atch
> >
> > diff --git
> >
> a/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone=
.patch
>
> >
> b/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone=
.patch
> > deleted file mode 100644
>
> If you are removing the patch here, you should remove the entry
> in ".checkpackageignore". This is detected by the command:
> "utils/docker-run make check-package" which report the error:
>
> .checkpackageignore:311: ignored file
> package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.p=
atch
>
> is missing
>
> > index 737e7d39b7..0000000000
> > ---
> >
> a/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone=
.patch
> > +++ /dev/null
> [...]
> > diff --git a/package/eigen/Config.in b/package/eigen/Config.in
> > index ef0a16f2f7..b1746da9e9 100644
> > --- a/package/eigen/Config.in
> > +++ b/package/eigen/Config.in
> > @@ -1,6 +1,7 @@
> >  config BR2_PACKAGE_EIGEN
> >       bool "eigen"
> >       depends on BR2_INSTALL_LIBSTDCPP
> > +     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
>
> If you add a new dependency on gcc 5 here, it should be propagated
> on all packages selecting eigen. You can have the list with the
> command:
>
> git grep 'select BR2_PACKAGE_EIGEN'
>
> Which gives gtkiostream, opencv4-contrib and tensorflow-lite.
> So this patch should add in the Config.in for those package the
> new dependency:
>
> depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # eigen
>
> >       help
> >         Eigen is a C++ template library for linear algebra: vectors,
> >         matrices, and related algorithms. It is versatile, fast,
> > @@ -11,7 +12,7 @@ config BR2_PACKAGE_EIGEN
> >         right away. There is no binary to link to. Eigen is a pure
> >         template library defined in the headers.
> >
> > -       http://eigen.tuxfamily.org/
> > +       https://gitlab.com/libeigen/eigen
> >
> > -comment "eigen needs a toolchain w/ C++"
> > -     depends on !BR2_INSTALL_LIBSTDCPP
> > +comment "eigen needs a toolchain w/ C++, gcc >=3D 5"
> > +     depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_=
5
>
> Could you send an updated pactch addressing those issue, please?
>
> Best regards,
>
> Julien.
>

--000000000000999963064eecd89e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Julien,<br><br>Thanks for catching those two points. I =
missed updating `.checkpackageignore`.<br><br>I will send v2 shortly that r=
emoves the patch file reference and adds the dependency to gtkiostream, ope=
ncv4-contrib, and tensorflow-lite Config.in files.<br><br>Best regards,<br>=
<br>Shubham</div><br><div class=3D"gmail_quote gmail_quote_container"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 8, 2026 at 1:09=E2=80=AFAM Jul=
ien Olivain &lt;<a href=3D"mailto:ju.o@free.fr">ju.o@free.fr</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Shubham,<br>
<br>
Thanks for the patch.<br>
<br>
On 04/04/2026 12:01, Shubham Chakraborty wrote:<br>
&gt; Update Eigen from 3.4.0 to 5.0.1.<br>
&gt; <br>
&gt; Remove the downstream CMake patch because the BLAS, LAPACK and<br>
&gt; CMake package toggles are now provided upstream in 5.0.1.<br>
&gt; <br>
&gt; Refresh the source and license hashes to match the new release and<br>
&gt; update the package license metadata to reflect the current upstream<br=
>
&gt; licensing files.<br>
&gt; <br>
&gt; Add a gcc &gt;=3D 5 dependency in Config.in because Eigen 5.x requires=
<br>
&gt; C++14 support.<br>
&gt; <br>
&gt; Update the project homepage to the current upstream GitLab URL.<br>
&gt; <br>
&gt; Signed-off-by: Shubham Chakraborty &lt;<a href=3D"mailto:chakrabortysh=
ubham66@gmail.com" target=3D"_blank">chakrabortyshubham66@gmail.com</a>&gt;=
<br>
&gt; ---<br>
&gt;=C2=A0 ...ptions-for-controlling-build-compone.patch | 88 -------------=
------<br>
&gt;=C2=A0 package/eigen/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +-<br>
&gt;=C2=A0 package/eigen/eigen.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 ++-<br>
&gt;=C2=A0 package/eigen/<a href=3D"http://eigen.mk" rel=3D"noreferrer" tar=
get=3D"_blank">eigen.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +-<br>
&gt;=C2=A0 4 files changed, 12 insertions(+), 100 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 <br>
&gt; package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compon=
e.patch<br>
&gt; <br>
&gt; diff --git <br>
&gt; a/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-comp=
one.patch <br>
&gt; b/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-comp=
one.patch<br>
&gt; deleted file mode 100644<br>
<br>
If you are removing the patch here, you should remove the entry<br>
in &quot;.checkpackageignore&quot;. This is detected by the command:<br>
&quot;utils/docker-run make check-package&quot; which report the error:<br>
<br>
.checkpackageignore:311: ignored file <br>
package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.pat=
ch <br>
is missing<br>
<br>
&gt; index 737e7d39b7..0000000000<br>
&gt; --- <br>
&gt; a/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-comp=
one.patch<br>
&gt; +++ /dev/null<br>
[...]<br>
&gt; diff --git a/package/eigen/Config.in b/package/eigen/Config.in<br>
&gt; index ef0a16f2f7..b1746da9e9 100644<br>
&gt; --- a/package/eigen/Config.in<br>
&gt; +++ b/package/eigen/Config.in<br>
&gt; @@ -1,6 +1,7 @@<br>
&gt;=C2=A0 config BR2_PACKAGE_EIGEN<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;eigen&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14<b=
r>
<br>
If you add a new dependency on gcc 5 here, it should be propagated<br>
on all packages selecting eigen. You can have the list with the<br>
command:<br>
<br>
git grep &#39;select BR2_PACKAGE_EIGEN&#39;<br>
<br>
Which gives gtkiostream, opencv4-contrib and tensorflow-lite.<br>
So this patch should add in the Config.in for those package the<br>
new dependency:<br>
<br>
depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # eigen<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Eigen is a C++ template library for l=
inear algebra: vectors,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0matrices, and related algorithms. It =
is versatile, fast,<br>
&gt; @@ -11,7 +12,7 @@ config BR2_PACKAGE_EIGEN<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0right away. There is no binary to lin=
k to. Eigen is a pure<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0template library defined in the heade=
rs.<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://eigen.tuxfamily.org/" re=
l=3D"noreferrer" target=3D"_blank">http://eigen.tuxfamily.org/</a><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://gitlab.com/libeigen/eig=
en" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/libeigen/eigen<=
/a><br>
&gt; <br>
&gt; -comment &quot;eigen needs a toolchain w/ C++&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0depends on !BR2_INSTALL_LIBSTDCPP<br>
&gt; +comment &quot;eigen needs a toolchain w/ C++, gcc &gt;=3D 5&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHA=
IN_GCC_AT_LEAST_5<br>
<br>
Could you send an updated pactch addressing those issue, please?<br>
<br>
Best regards,<br>
<br>
Julien.<br>
</blockquote></div>

--000000000000999963064eecd89e--

--===============2656515871694936065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2656515871694936065==--
