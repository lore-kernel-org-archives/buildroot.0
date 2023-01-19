Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6ECAC38142
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 08:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 224C241910;
	Thu, 19 Jan 2023 08:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 224C241910
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sfaZaqtL_lzP; Thu, 19 Jan 2023 08:10:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A61C541936;
	Thu, 19 Jan 2023 08:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A61C541936
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F98C1BF329
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 08:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 483BB8216D
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 08:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 483BB8216D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kDts-dO7md_W for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 08:10:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 503EA8214B
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 503EA8214B
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 08:10:11 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id p24so1590549plw.11
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 00:10:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aeiit7b+X4xZlPXS7N7oJAHaEeZOJbuDourYoXf85Cw=;
 b=MTXDB3ThNaXfkZ7s/dapOBFcvHH1zIVAEa7/hD3WGMcsp4MdpmgF+bMBMArOvDh9gX
 CKy4MnyoVllBLbPA8MOFtX00/yCR2sdUeOR9IOEUVMn3DIR4EuF6rKVPOChEQhth4gFA
 GspuwJmL3cvRsklx59vEJHbUeEMxtTgcFDqKemQTAitcaSmLE197Urk4b262am7dYvnM
 00i9wi6hweJr1RZ27T5rM/TjHkeQewKO9q9KBttOM4c7kLRGrzovOOEtmaMmVG+sclVG
 G2upbT+oRV1K1ec6tNpiWn4IseILeuu055ODSRVqCpOoe8Lp+8gHCVBs4c/OG3mUc5te
 ZygQ==
X-Gm-Message-State: AFqh2kqAzndL6e64TJukScgnQaYPZSVn+LeS7ZPn8WDBvgnRyBVkBlC7
 bBDWvMDcLBUPKNMgXwXt/o3QvRGkVt+RDg==
X-Google-Smtp-Source: AMrXdXvMNPHrlb+cLppxWc+wLcp5ZEwP6Cl2Lmw8xqq5IfX8UuV4UOx+Wk2CBlJbqFmu3V5+3uINjw==
X-Received: by 2002:a17:903:1209:b0:189:6f76:9b61 with SMTP id
 l9-20020a170903120900b001896f769b61mr14350130plh.39.1674115810518; 
 Thu, 19 Jan 2023 00:10:10 -0800 (PST)
Received: from debian.me (subs02-180-214-232-2.three.co.id. [180.214.232.2])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a170903234b00b00188f6cbd950sm3466522plh.226.2023.01.19.00.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 00:10:09 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id 070E6104FA9; Thu, 19 Jan 2023 15:10:04 +0700 (WIB)
Date: Thu, 19 Jan 2023 15:10:04 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Message-ID: <Y8j63Dj9XcD56e5n@debian.me>
References: <20230118213517.5946-1-ps.report@gmx.net>
MIME-Version: 1.0
In-Reply-To: <20230118213517.5946-1-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aeiit7b+X4xZlPXS7N7oJAHaEeZOJbuDourYoXf85Cw=;
 b=Heanq2Zn32TdqU+Os9xQ8F67tknFNjDp6fwk8nZDBuI7yuJjJWr9/UjSjvpiym3K9m
 GxOtIS9S/6Zc9yE9oFahd1cJVia6QNT4wyQ7FmwSrU/FQ0kZUL2JWnndNTBnYeHV7x32
 bdElTbTcNBzNKVAKjppNRznX3mZPh0STTJqsj0/+RVMFdetBVGcE/4/dMwIgo4wlqo9U
 wBi0igtyr+J0jwRubemjPL2+O0HLwsqAYn8o5Xk8a1tVfXNPIHQ/zMp7oCP4Y2kaJ5Wl
 u8ylIAQNOhNz4q6OAEbfiTG8swM0mDq8Bwph8DKSdRijcVIjnVTWbO9XOiqV78bKor56
 8bfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Heanq2Zn
Subject: Re: [Buildroot] [PATCH v1] package/git: bump version to 2.39.1
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: multipart/mixed; boundary="===============2491225921642352142=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2491225921642352142==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="etYPdnMzLJeHwR1j"
Content-Disposition: inline


--etYPdnMzLJeHwR1j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2023 at 10:35:17PM +0100, Peter Seiderer wrote:
> - fixes CVE-2022-41903 and CVE-2022-23521
>=20
> For details see [1].
>=20
> [1] https://lore.kernel.org/git/xmqq7cxl9h0i.fsf@gitster.g/
>=20

Ah! I'm about to submit the same bump. My bump builds fine, so I think
it is also applicable to yours.

Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/git/git.hash | 2 +-
>  package/git/git.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/package/git/git.hash b/package/git/git.hash
> index 57a77b2810..75398896e5 100644
> --- a/package/git/git.hash
> +++ b/package/git/git.hash
> @@ -1,5 +1,5 @@
>  # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
> -sha256  ba199b13fb5a99ca3dec917b0bd736bc0eb5a9df87737d435eddfdf10d69265b=
  git-2.39.0.tar.xz
> +sha256  40a38a0847b30c371b35873b3afcf123885dd41ea3ecbbf510efa97f3ce5c161=
  git-2.39.1.tar.xz
>  # Locally calculated
>  sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e=
  COPYING
>  sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a=
  LGPL-2.1
> diff --git a/package/git/git.mk b/package/git/git.mk
> index 9918d4c1ef..1d728e1964 100644
> --- a/package/git/git.mk
> +++ b/package/git/git.mk
> @@ -4,7 +4,7 @@
>  #
>  ########################################################################=
########
> =20
> -GIT_VERSION =3D 2.39.0
> +GIT_VERSION =3D 2.39.1
>  GIT_SOURCE =3D git-$(GIT_VERSION).tar.xz
>  GIT_SITE =3D $(BR2_KERNEL_MIRROR)/software/scm/git
>  GIT_LICENSE =3D GPL-2.0, LGPL-2.1+

The package patches apply here (with fuzz), so you need to refresh these
against v2.39.1:

---- >8 ----
diff --git a/package/git/0001-git-compat-util-avoid-redefining-system-funct=
ion-nam.patch b/package/git/0001-git-compat-util-avoid-redefining-system-fu=
nction-nam.patch
index dbde87940a..cb6c3a6dbb 100644
--- a/package/git/0001-git-compat-util-avoid-redefining-system-function-nam=
=2Epatch
+++ b/package/git/0001-git-compat-util-avoid-redefining-system-function-nam=
=2Epatch
@@ -1,4 +1,4 @@
-From 385f67eb2254edb1fb4cf523e5e3d5a8f123d72c Mon Sep 17 00:00:00 2001
+From a70fa5257ee347fa3a21734b7066803064657445 Mon Sep 17 00:00:00 2001
 From: Jeff King <peff@peff.net>
 Date: Wed, 30 Nov 2022 16:15:14 -0500
 Subject: [PATCH] git-compat-util: avoid redefining system function names
@@ -57,14 +57,14 @@ but without redeclaring the system function names.
=20
 Signed-off-by: Jeff King <peff@peff.net>
 Signed-off-by: Junio C Hamano <gitster@pobox.com>
-[Bagas: cherry-picked from e0c08a4f738b3dea7a4e8fe3511c323cf1f41942 on nex=
t branch]
+[Bagas: refresh against v2.39.1]
 Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
 ---
  git-compat-util.h | 13 ++++++++-----
  1 file changed, 8 insertions(+), 5 deletions(-)
=20
 diff --git a/git-compat-util.h b/git-compat-util.h
-index a76d0526f7..e3456bdd0d 100644
+index af05077560..f6882b9b50 100644
 --- a/git-compat-util.h
 +++ b/git-compat-util.h
 @@ -341,11 +341,12 @@ struct itimerval {
@@ -83,7 +83,7 @@ index a76d0526f7..e3456bdd0d 100644
  #endif
 =20
  #ifndef NO_LIBGEN_H
-@@ -1471,14 +1472,16 @@ int open_nofollow(const char *path, int flags);
+@@ -1479,14 +1480,16 @@ int open_nofollow(const char *path, int flags);
  #endif
 =20
  #ifndef _POSIX_THREAD_SAFE_FUNCTIONS
diff --git a/package/git/0002-git-compat-util-undefine-system-names-before-=
redecla.patch b/package/git/0002-git-compat-util-undefine-system-names-befo=
re-redecla.patch
index 9e3c9b662c..9a9d2362b0 100644
--- a/package/git/0002-git-compat-util-undefine-system-names-before-redecla=
=2Epatch
+++ b/package/git/0002-git-compat-util-undefine-system-names-before-redecla=
=2Epatch
@@ -1,4 +1,4 @@
-From 6d406390b870fdb2cd9d18b12ebfabc12f5096df Mon Sep 17 00:00:00 2001
+From 1528273a611e331bfce4da1d4fb0f76d9463ab02 Mon Sep 17 00:00:00 2001
 From: Jeff King <peff@peff.net>
 Date: Fri, 2 Dec 2022 06:05:38 -0500
 Subject: [PATCH] git-compat-util: undefine system names before redeclaring
@@ -22,14 +22,14 @@ defensive about the other macro wrappers added in the p=
revious patch.
=20
 Signed-off-by: Jeff King <peff@peff.net>
 Signed-off-by: Junio C Hamano <gitster@pobox.com>
-[Bagas: cherry-picked from e1a95b78d8a26762ea04332de8b7c3878da51522 on nex=
t branch]
+[Bagas: refresh against v2.39.1]
 Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
 ---
  git-compat-util.h | 4 ++++
  1 file changed, 4 insertions(+)
=20
 diff --git a/git-compat-util.h b/git-compat-util.h
-index e3456bdd0d..211861da0f 100644
+index f6882b9b50..dadb9e55cb 100644
 --- a/git-compat-util.h
 +++ b/git-compat-util.h
 @@ -346,6 +346,7 @@ static inline int git_setitimer(int which,
@@ -40,7 +40,7 @@ index e3456bdd0d..211861da0f 100644
  #define setitimer(which,value,ovalue) git_setitimer(which,value,ovalue)
  #endif
 =20
-@@ -1480,6 +1481,9 @@ static inline void git_funlockfile(FILE *fh)
+@@ -1488,6 +1489,9 @@ static inline void git_funlockfile(FILE *fh)
  {
  	; /* nothing */
  }

When the refresh is applied, don't forget to add:

Co-developed-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--etYPdnMzLJeHwR1j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARMIAB0WIQQJRmM4Nl+8BKPNGvtCNk3+7YYOdAUCY8j61AAKCRBCNk3+7YYO
dOmRAP4oHBOsaK/Mk0E1iwToyTxvbu9ndLWxlwNTS9HMEecU1gEAoE9BliT6ywIX
liMQMawSKcTo8ZiWOMNPtOtJC5ZwHFs=
=QCzR
-----END PGP SIGNATURE-----

--etYPdnMzLJeHwR1j--

--===============2491225921642352142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2491225921642352142==--
