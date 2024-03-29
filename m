Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04692CD1283
	for <buildroot@archiver.kernel.org>; Fri, 29 Mar 2024 17:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7327841798;
	Fri, 29 Mar 2024 17:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f5K6YPzzffic; Fri, 29 Mar 2024 17:21:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACEA940665
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACEA940665;
	Fri, 29 Mar 2024 17:21:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0320B1BF37F
 for <buildroot@lists.busybox.net>; Fri, 29 Mar 2024 17:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3A6782C21
 for <buildroot@lists.busybox.net>; Fri, 29 Mar 2024 17:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nik0NydkNgCB for <buildroot@lists.busybox.net>;
 Fri, 29 Mar 2024 17:21:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 97C7182C04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97C7182C04
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97C7182C04
 for <buildroot@busybox.net>; Fri, 29 Mar 2024 17:21:46 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-222b6a05bb1so1391965fac.3
 for <buildroot@busybox.net>; Fri, 29 Mar 2024 10:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711732905; x=1712337705;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qLM4hQwaifBczc45CZJy1cQYtu7o/8VPk+vlunQCqGE=;
 b=PvwbXOXXsfLm1/JFInEkrz37PYQWInt4lQwijnQ/YDWWOoxbnZArr9iwIlsT0ZAL2z
 yV3L26BJ5UHIg/3bWLdt8p5AuSY/YBhhu4rmMmbQB5uOaM4cEnOeJk4s5DhxEdaCXHZ9
 XPS6JFyFbOYWssrz7eQ6fqE0OZUtofs/NMsBqkTufjuk2sWL1pnBw8e8CMYQ8qBdXAYb
 G1sTFp2PB4dQANSZIwwyol68yx2pp+vnUSZwTfpYVXLCSvgns+GA2uMqFF9ytKKn/FF3
 4kDjeoGPvtF5oLP/2HVXFbVuq9uEkghYiTnhRTuMLb9kajH3NFdBYx1asYZ2Nf/DLX7e
 hO/Q==
X-Gm-Message-State: AOJu0Yy6olo58f+IBieTf/01cAFmW6Pbydoy8CShlQV+QrKMKPe6LsSR
 saRYFUeh/0c24kYe5Wkd3Snfk0xiFiNi3TFa6JEvrhxnt/KB3eoapfmBUdJCjxkG8p0BuBznx+w
 MmsAP46oLCacOZT17t/Ya8I4XGtw=
X-Google-Smtp-Source: AGHT+IFUebjtQdwdm6ErqCZjdz/IohmsyVKtH6skG0raKdehFBNcVUd9HVqz0gbWlvicOy4WDRWNRJtQEFGEhA6AtvI=
X-Received: by 2002:a05:6871:71c3:b0:221:a881:df51 with SMTP id
 mj3-20020a05687171c300b00221a881df51mr2604930oac.44.1711732905390; Fri, 29
 Mar 2024 10:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240307165218.10027-1-ps.report@gmx.net>
In-Reply-To: <20240307165218.10027-1-ps.report@gmx.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 29 Mar 2024 11:21:33 -0600
Message-ID: <CADvTj4obpt2KevT7pCZ6j=VdOefb8x-iU_-NLRJOVz_MS0Ng1A@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711732905; x=1712337705; darn=busybox.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qLM4hQwaifBczc45CZJy1cQYtu7o/8VPk+vlunQCqGE=;
 b=Tf3V6hkNhAAfawR+llY3jW/PD/3OPPYsoZHPRBvwpvEECnTOtFd9Fbwn8B4D5mm0jY
 LZtKjn59LU20CCMUg8CJI8FJ1X2DMVv/fc9G6iMZXREsiQaafQDwrh7CTzrbiFuzJmr9
 iwGr1xZV9OAduQrRML2KWrIVEsqESdui0OibQAW+Ztp3Sy3s+DYqHWLo2Z2mAaiQFOz/
 nd5inDBHCIXOc3qqprkKLnYDHc8CUuOP+MzwbOuUpZv3/uPOyRydGUdMQJxLvyNbkaxc
 nw2SnWrsG6GdDXuckvTBaufJmCPllOjYJH7udCR4TZSi+slHwA1D/zLVFbf6+J/+KUBd
 V2xg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Tf3V6hkN
Subject: Re: [Buildroot] [PATCH v1 1/4] package/xz: bump version to 5.6.0
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
Cc: buildroot@busybox.net, Samuel Martin <s.martin49@gmail.com>
Content-Type: multipart/mixed; boundary="===============5934185590612823878=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5934185590612823878==
Content-Type: multipart/alternative; boundary="000000000000c6b81f0614cfdf15"

--000000000000c6b81f0614cfdf15
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024 at 9:52=E2=80=AFAM Peter Seiderer via buildroot <
buildroot@buildroot.org> wrote:

> - bump version to 5.6.0
> - change homepage URL to https://xz.tukaani.org/xz-utils/
> - add BSD-0-Clause and update license file hash accordingly (see [1], [2]=
,
>   and [3])
>
> For details see [4].
>
> [1]
> https://github.com/tukaani-project/xz/commit/b1ee6cf259bb49ce91abe9f62229=
4524e37edf4c
> [2]
> https://github.com/tukaani-project/xz/commit/689e0228baeb95232430e90d6283=
79db89583d71
> [3]
> https://github.com/tukaani-project/xz/commit/28ce45e38fbed4b5f54f2013e38d=
ab47d22bf699
> [4] https://github.com/tukaani-project/xz/blob/master/NEWS
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/xz/Config.in | 2 +-
>  package/xz/xz.hash   | 7 ++++---
>  package/xz/xz.mk     | 6 +++---
>  3 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/package/xz/Config.in b/package/xz/Config.in
> index 687bd55482..7130fa5e8e 100644
> --- a/package/xz/Config.in
> +++ b/package/xz/Config.in
> @@ -12,4 +12,4 @@ config BR2_PACKAGE_XZ
>           invoked via appropriate symlinks will emulate the behavior
>           of the commands in the lzma package.
>
> -         https://tukaani.org/xz/
> +         https://xz.tukaani.org/xz-utils/
> diff --git a/package/xz/xz.hash b/package/xz/xz.hash
> index e8025a8065..71c2c65a3e 100644
> --- a/package/xz/xz.hash
> +++ b/package/xz/xz.hash
> @@ -1,9 +1,10 @@
>  # Locally calculated after checking pgp signature
> -#
> https://github.com/tukaani-project/xz/releases/download/v5.4.6/xz-5.4.6.t=
ar.bz2.sig
> -sha256
> <https://github.com/tukaani-project/xz/releases/download/v5.4.6/xz-5.4.6.=
tar.bz2.sig-sha256>
> 913851b274e8e1d31781ec949f1c23e8dbcf0ecf6e73a2436dc21769dd3e6f49
> xz-5.4.6.tar.bz2
> +#
> https://github.com/tukaani-project/xz/releases/download/v5.6.0/xz-5.6.0.t=
ar.bz2.sig
> +sha256
> <https://github.com/tukaani-project/xz/releases/download/v5.6.0/xz-5.6.0.=
tar.bz2.sig+sha256>
> 88c8631cefba91664fdc47b14bb753e1876f4964a07db650821d203992b1e1ea
> xz-5.6.0.tar.bz2
>
>  # Hash for license files
> -sha256  29a1e305b2e34eefe5d4602d00cde1d528b71c5d9f2eec5106972cf6ddb6f73f
> COPYING
> +sha256  0864e508475f20b43a2393957fdb5a966558099ffa8fed1e3e73fe2b3eebb145
> COPYING
> +sha256  0b01625d853911cd0e2e088dcfb743261034a091bb379246cb25a14cc4c74bf1
> COPYING.0BSD
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> COPYING.GPLv2
>  sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986
> COPYING.GPLv3
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551
> COPYING.LGPLv2.1
> diff --git a/package/xz/xz.mk b/package/xz/xz.mk
> index 40fa59ca7c..e35fbc0268 100644
> --- a/package/xz/xz.mk
> +++ b/package/xz/xz.mk
> @@ -4,13 +4,13 @@
>  #
>
>  ########################################################################=
########
>
> -XZ_VERSION =3D 5.4.6
> +XZ_VERSION =3D 5.6.0
>

Is this version backdoored?
https://www.openwall.com/lists/oss-security/2024/03/29/4


>  XZ_SOURCE =3D xz-$(XZ_VERSION).tar.bz2
>  XZ_SITE =3D
> https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
>  XZ_INSTALL_STAGING =3D YES
>  XZ_CONF_ENV =3D ac_cv_prog_cc_c99=3D'-std=3Dgnu99'
> -XZ_LICENSE =3D Public Domain, GPL-2.0+, GPL-3.0+, LGPL-2.1+
> -XZ_LICENSE_FILES =3D COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.=
1
> +XZ_LICENSE =3D Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1=
+
> +XZ_LICENSE_FILES =3D COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3
> COPYING.LGPLv2.1
>  XZ_CPE_ID_VENDOR =3D tukaani
>
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> --
> 2.44.0
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000c6b81f0614cfdf15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 7, 2024 at 9:52=E2=80=AFA=
M Peter Seiderer via buildroot &lt;<a href=3D"mailto:buildroot@buildroot.or=
g">buildroot@buildroot.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">- bump version to 5.6.0<br>
- change homepage URL to <a href=3D"https://xz.tukaani.org/xz-utils/" rel=
=3D"noreferrer" target=3D"_blank">https://xz.tukaani.org/xz-utils/</a><br>
- add BSD-0-Clause and update license file hash accordingly (see [1], [2],<=
br>
=C2=A0 and [3])<br>
<br>
For details see [4].<br>
<br>
[1] <a href=3D"https://github.com/tukaani-project/xz/commit/b1ee6cf259bb49c=
e91abe9f622294524e37edf4c" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/tukaani-project/xz/commit/b1ee6cf259bb49ce91abe9f622294524e37edf4c<=
/a><br>
[2] <a href=3D"https://github.com/tukaani-project/xz/commit/689e0228baeb952=
32430e90d628379db89583d71" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/tukaani-project/xz/commit/689e0228baeb95232430e90d628379db89583d71<=
/a><br>
[3] <a href=3D"https://github.com/tukaani-project/xz/commit/28ce45e38fbed4b=
5f54f2013e38dab47d22bf699" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/tukaani-project/xz/commit/28ce45e38fbed4b5f54f2013e38dab47d22bf699<=
/a><br>
[4] <a href=3D"https://github.com/tukaani-project/xz/blob/master/NEWS" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/tukaani-project/xz/blo=
b/master/NEWS</a><br>
<br>
Signed-off-by: Peter Seiderer &lt;<a href=3D"mailto:ps.report@gmx.net" targ=
et=3D"_blank">ps.report@gmx.net</a>&gt;<br>
---<br>
=C2=A0package/xz/Config.in | 2 +-<br>
=C2=A0package/xz/xz.hash=C2=A0 =C2=A0| 7 ++++---<br>
=C2=A0package/xz/<a href=3D"http://xz.mk" rel=3D"noreferrer" target=3D"_bla=
nk">xz.mk</a>=C2=A0 =C2=A0 =C2=A0| 6 +++---<br>
=C2=A03 files changed, 8 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/package/xz/Config.in b/package/xz/Config.in<br>
index 687bd55482..7130fa5e8e 100644<br>
--- a/package/xz/Config.in<br>
+++ b/package/xz/Config.in<br>
@@ -12,4 +12,4 @@ config BR2_PACKAGE_XZ<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 invoked via appropriate symlinks will em=
ulate the behavior<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of the commands in the lzma package.<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://tukaani.org/xz/" rel=
=3D"noreferrer" target=3D"_blank">https://tukaani.org/xz/</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://xz.tukaani.org/xz-uti=
ls/" rel=3D"noreferrer" target=3D"_blank">https://xz.tukaani.org/xz-utils/<=
/a><br>
diff --git a/package/xz/xz.hash b/package/xz/xz.hash<br>
index e8025a8065..71c2c65a3e 100644<br>
--- a/package/xz/xz.hash<br>
+++ b/package/xz/xz.hash<br>
@@ -1,9 +1,10 @@<br>
=C2=A0# Locally calculated after checking pgp signature<br>
-# <a href=3D"https://github.com/tukaani-project/xz/releases/download/v5.4.=
6/xz-5.4.6.tar.bz2.sig-sha256" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/tukaani-project/xz/releases/download/v5.4.6/xz-5.4.6.tar.bz2.si=
g<br>
-sha256</a>=C2=A0 913851b274e8e1d31781ec949f1c23e8dbcf0ecf6e73a2436dc21769d=
d3e6f49=C2=A0 xz-5.4.6.tar.bz2<br>
+# <a href=3D"https://github.com/tukaani-project/xz/releases/download/v5.6.=
0/xz-5.6.0.tar.bz2.sig+sha256" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/tukaani-project/xz/releases/download/v5.6.0/xz-5.6.0.tar.bz2.si=
g<br>
+sha256</a>=C2=A0 88c8631cefba91664fdc47b14bb753e1876f4964a07db650821d20399=
2b1e1ea=C2=A0 xz-5.6.0.tar.bz2<br>
<br>
=C2=A0# Hash for license files<br>
-sha256=C2=A0 29a1e305b2e34eefe5d4602d00cde1d528b71c5d9f2eec5106972cf6ddb6f=
73f=C2=A0 COPYING<br>
+sha256=C2=A0 0864e508475f20b43a2393957fdb5a966558099ffa8fed1e3e73fe2b3eebb=
145=C2=A0 COPYING<br>
+sha256=C2=A0 0b01625d853911cd0e2e088dcfb743261034a091bb379246cb25a14cc4c74=
bf1=C2=A0 COPYING.0BSD<br>
=C2=A0sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a40401052=
1b880643=C2=A0 COPYING.GPLv2<br>
=C2=A0sha256=C2=A0 3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9=
dfb36986=C2=A0 COPYING.GPLv3<br>
=C2=A0sha256=C2=A0 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab=
032fe551=C2=A0 COPYING.LGPLv2.1<br>
diff --git a/package/xz/<a href=3D"http://xz.mk" rel=3D"noreferrer" target=
=3D"_blank">xz.mk</a> b/package/xz/<a href=3D"http://xz.mk" rel=3D"noreferr=
er" target=3D"_blank">xz.mk</a><br>
index 40fa59ca7c..e35fbc0268 100644<br>
--- a/package/xz/<a href=3D"http://xz.mk" rel=3D"noreferrer" target=3D"_bla=
nk">xz.mk</a><br>
+++ b/package/xz/<a href=3D"http://xz.mk" rel=3D"noreferrer" target=3D"_bla=
nk">xz.mk</a><br>
@@ -4,13 +4,13 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-XZ_VERSION =3D 5.4.6<br>
+XZ_VERSION =3D 5.6.0<br></blockquote><div><br></div><div>Is this version b=
ackdoored?</div><div><a href=3D"https://www.openwall.com/lists/oss-security=
/2024/03/29/4">https://www.openwall.com/lists/oss-security/2024/03/29/4</a>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0XZ_SOURCE =3D xz-$(XZ_VERSION).tar.bz2<br>
=C2=A0XZ_SITE =3D <a href=3D"https://github.com/tukaani-project/xz/releases=
/download/v$(XZ_VERSION)" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)</a><br>
=C2=A0XZ_INSTALL_STAGING =3D YES<br>
=C2=A0XZ_CONF_ENV =3D ac_cv_prog_cc_c99=3D&#39;-std=3Dgnu99&#39;<br>
-XZ_LICENSE =3D Public Domain, GPL-2.0+, GPL-3.0+, LGPL-2.1+<br>
-XZ_LICENSE_FILES =3D COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1<=
br>
+XZ_LICENSE =3D Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+<=
br>
+XZ_LICENSE_FILES =3D COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPY=
ING.LGPLv2.1<br>
=C2=A0XZ_CPE_ID_VENDOR =3D tukaani<br>
<br>
=C2=A0ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)<br>
-- <br>
2.44.0<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--000000000000c6b81f0614cfdf15--

--===============5934185590612823878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5934185590612823878==--
