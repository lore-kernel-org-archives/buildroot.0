Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960E1C3ABCB
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 06:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 436EE6103E;
	Wed, 14 May 2025 06:32:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2nndMAUcw1dz; Wed, 14 May 2025 06:32:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 548ED61036
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 548ED61036;
	Wed, 14 May 2025 06:32:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E676512A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 06:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCD87404D8
 for <buildroot@buildroot.org>; Wed, 14 May 2025 06:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQSifFelx0ft for <buildroot@buildroot.org>;
 Wed, 14 May 2025 06:32:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CACF041FD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CACF041FD2
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CACF041FD2
 for <buildroot@buildroot.org>; Wed, 14 May 2025 06:32:46 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-708ac7dfc19so57153997b3.3
 for <buildroot@buildroot.org>; Tue, 13 May 2025 23:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747204365; x=1747809165;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gqUWh2BqymemFsH6dTfSoutubit/NHCYYb6Mf7u0voc=;
 b=oDSWfR4NjkeuvMv0kDwT/IQH7ev2wmmYe7686E4l+nWYf+aMk41lQU/9l+S+/gDxyJ
 StpMdILVHjkPFILbTxbEvZBAyCEH3+Wx2I1+RkPknjmjzWRNHY5A7ot7z1Jfaw9YfKE1
 vGYkgO3JKqxRli8fMtKvtAvsWUXaWrMk9E8gGFz0kaMSqU0xb3Xg1qJeHYIIGw+UCxnG
 O3lJFMDxUYE8ERhlhyrlGHBFfznHlDhHbJkGCuLfBRS9RmPbSyIDRvDoL/1D8HYT8dVW
 IlV9oHgtaHI2Ip6n9bcfgcRCl5RkWWg5Rbi07IJHilSbXGphGt5dzrZ5qe1HJ2YTYQGh
 oeOg==
X-Gm-Message-State: AOJu0YwgZr3ffcEniTPy9aNguyi1D0EiIOWhVVRq2eQJpkTy4YmeTLb0
 Hot6KTMX41HIcLx3wfC8JtkPaLc7Sz5vcCkGleuMIFHzpnFFbz5CJr9YPzQxFSSdW7a48NNc1kx
 0pughffe08+cw9Es6rzv1idsMz+Hd8g2x7goSOM0lYEB3mef/f9U=
X-Gm-Gg: ASbGncvZfIqlk071HLeuBoUSCXYjFNKSl5kh5wWArKhA8T5KghkJk2IjsVAoyRB0TuT
 Ogklhj2xa/YDia2geh9FH630XL51qBlMabjqmZ3iHxP5OIUTwOA+G1P3w+/4vVtRxghA5j08Qxx
 oe7TcIeNvx/RIPqjvqqG0F4xku3WP/HOXznuB/UsNj
X-Google-Smtp-Source: AGHT+IGPN98I96ecjOGrn7/DUZ+b0ltjrpTYKyrzZ8QL4CEzaPhGdiQEvlYkfYo1SQ4ReCEKBZdLHebb4Us+mkfrVW0=
X-Received: by 2002:a05:690c:7444:b0:709:1529:c22a with SMTP id
 00721157ae682-70c7f10aea1mr33677177b3.3.1747204365316; Tue, 13 May 2025
 23:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <CADvTj4owRO4eStPZLpQNW4_ogyNj1xSw1iD1PJeepQ10rMFWDw@mail.gmail.com>
In-Reply-To: <CADvTj4owRO4eStPZLpQNW4_ogyNj1xSw1iD1PJeepQ10rMFWDw@mail.gmail.com>
Date: Tue, 13 May 2025 23:32:34 -0700
X-Gm-Features: AX0GCFuJ_ZwXVH2QLSLLkC7u7GPuqXhsXE5WvqGlOtHBChv2np9CAF3fQ3cJY0k
Message-ID: <CAEpB38P3bvUVjTU1AvgZMepCeD8=zZ4jxyF8PfgRwUt+GirR7A@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1747204365; x=1747809165; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gqUWh2BqymemFsH6dTfSoutubit/NHCYYb6Mf7u0voc=;
 b=ZLo+BamxRKj1rNZMy8bo25tHutfSdstAP1cs2KNVrJXSVpBhzNDLnGbuONOnQFpbR/
 jSqap8CsZSrZvteEfiAL2nmAALH68sbhXHoaF4GRozHVmNIWYhaQvLKhTsciJQC8xB20
 36S43qzkCxuL7Wgj9y3EckBpJv35ypG+qGuWOKbsTm0UFhLZjiZPsuiYBELij//U1Hle
 g45sAxEciyzx06YBUcF8QZqQz8VhNqKxEoRj1BRKe7sX9EUKEeMvQlkmYTpnN3zAWP3L
 MSaLnA3/OC2Q7ETa8r32hMvfFR9tCte8ps/0b3xAlmf5BvVyZgK7MLPwUWuxY1PMRRAa
 22DA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=ZLo+Bamx
Subject: Re: [Buildroot] go-bootstrap-stage1 broken on hosts with gcc 15
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: multipart/mixed; boundary="===============8814441729891275911=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8814441729891275911==
Content-Type: multipart/alternative; boundary="0000000000008b905a063512b7cc"

--0000000000008b905a063512b7cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi James,

Thanks for reporting this, I'll take a look.

On Tue, May 13, 2025 at 10:54=E2=80=AFPM James Hilliard <james.hilliard1@gm=
ail.com>
wrote:

> I noticed go-bootstrap-stage1 is failing to build on hosts with gcc 15
> toolchains like my arch linux autobuilder.
>
>
> https://autobuild.buildroot.net/results/8c1/8c1f00ef09c246db58a0af8248305=
461238a5b0d/build-end.log
>
> I made a quick attempt at trying to work around this but it doesn't
> seem to get picked up, any idea how best to handle this?
>
> diff --git a/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
> b/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
> index 3e4ee57432..009c42d1ca 100644
> --- a/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
> +++ b/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
> @@ -25,6 +25,10 @@ HOST_GO_BOOTSTRAP_STAGE1_MAKE_ENV =3D \
>         CC=3D$(HOSTCC_NOCCACHE) \
>         CGO_ENABLED=3D0
>
> +ifeq ($(BR2_HOST_GCC_AT_LEAST_15),y)
> +HOST_GO_BOOTSTRAP_STAGE1_MAKE_ENV +=3D CFLAGS=3D"$(HOST_CFLAGS) -std=3Dg=
nu17"
> +endif
> +
>  define HOST_GO_BOOTSTRAP_STAGE1_BUILD_CMDS
>         cd $(@D)/src && $(HOST_GO_BOOTSTRAP_STAGE1_MAKE_ENV) ./make.bash
>  endef
>

Christian Stewart

--0000000000008b905a063512b7cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi James,</div><div><br></div><div>T=
hanks for reporting this, I&#39;ll take a look.</div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, May 13, 2025 at 10:54=E2=80=AFPM James Hilliard &lt;<a href=3D"ma=
ilto:james.hilliard1@gmail.com">james.hilliard1@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">I noticed go-boots=
trap-stage1 is failing to build on hosts with gcc 15<br>
toolchains like my arch linux autobuilder.<br>
<br>
<a href=3D"https://autobuild.buildroot.net/results/8c1/8c1f00ef09c246db58a0=
af8248305461238a5b0d/build-end.log" rel=3D"noreferrer" target=3D"_blank">ht=
tps://autobuild.buildroot.net/results/8c1/8c1f00ef09c246db58a0af82483054612=
38a5b0d/build-end.log</a><br>
<br>
I made a quick attempt at trying to work around this but it doesn&#39;t<br>
seem to get picked up, any idea how best to handle this?<br>
<br>
diff --git a/package/go/go-bootstrap-stage1/<a href=3D"http://go-bootstrap-=
stage1.mk" rel=3D"noreferrer" target=3D"_blank">go-bootstrap-stage1.mk</a><=
br>
b/package/go/go-bootstrap-stage1/<a href=3D"http://go-bootstrap-stage1.mk" =
rel=3D"noreferrer" target=3D"_blank">go-bootstrap-stage1.mk</a><br>
index 3e4ee57432..009c42d1ca 100644<br>
--- a/package/go/go-bootstrap-stage1/<a href=3D"http://go-bootstrap-stage1.=
mk" rel=3D"noreferrer" target=3D"_blank">go-bootstrap-stage1.mk</a><br>
+++ b/package/go/go-bootstrap-stage1/<a href=3D"http://go-bootstrap-stage1.=
mk" rel=3D"noreferrer" target=3D"_blank">go-bootstrap-stage1.mk</a><br>
@@ -25,6 +25,10 @@ HOST_GO_BOOTSTRAP_STAGE1_MAKE_ENV =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CC=3D$(HOSTCC_NOCCACHE) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CGO_ENABLED=3D0<br>
<br>
+ifeq ($(BR2_HOST_GCC_AT_LEAST_15),y)<br>
+HOST_GO_BOOTSTRAP_STAGE1_MAKE_ENV +=3D CFLAGS=3D&quot;$(HOST_CFLAGS) -std=
=3Dgnu17&quot;<br>
+endif<br>
+<br>
=C2=A0define HOST_GO_BOOTSTRAP_STAGE1_BUILD_CMDS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd $(@D)/src &amp;&amp; $(HOST_GO_BOOTSTRAP_STA=
GE1_MAKE_ENV) ./make.bash<br>
=C2=A0endef<br></blockquote><div><br></div><div>Christian Stewart <br></div=
></div></div>

--0000000000008b905a063512b7cc--

--===============8814441729891275911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8814441729891275911==--
