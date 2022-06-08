Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14231C43334
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 10:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76DAD61089;
	Wed,  8 Jun 2022 10:50:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2AqeJLrBOJ2l; Wed,  8 Jun 2022 10:50:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27A886103D;
	Wed,  8 Jun 2022 10:50:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24FEE1BF575
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 10:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 133F384213
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 10:50:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P2yf7VaM-b9Q for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 10:49:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2612983EF4
 for <buildroot@busybox.net>; Wed,  8 Jun 2022 10:49:59 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id r12so16614050vsg.8
 for <buildroot@busybox.net>; Wed, 08 Jun 2022 03:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=IpE5lMCqP720A6HWU9EJoXP91G74e1YcUOAqOee6VzI=;
 b=BluBzTvkuy9JqWsi/9Axu/Qn6pyT3rUWOqsbpy65XrcZ0xEE6qSfBpJ1hUwnxGBqc4
 I6XzICaMmOB169XMtv2O5xdR7pbnsMa0Q/zF6G+CBqpR8aifjRXTkRBkUK1me7j8yuXq
 bbTpKRxAsiZZ5kaSUvhfLADPMEG3Vl+hKUuysQuuy1UqCVNvAn2HrRZXQtHCPoNZuhxP
 twwqyg94V+jWywZxLnUIaCp7fHAJoO6dLrbL5mUzlOxDGAlWEyzy1nC+3Hfjx19h5ZiY
 URXTz4a71HilQHagX7mKTs2crkY5/jySVcjdXy8C7v4ikSRIspkCF2nbKzQk/8fj7Ibi
 Cnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=IpE5lMCqP720A6HWU9EJoXP91G74e1YcUOAqOee6VzI=;
 b=rHow1SRiS0Rf5aY9c1V2jU6PfI0OqF/cBh8EOAvwR7myey8QfsgH0mI8nnVpT/8sbq
 iAHOwkg4sqDBw9BWBFB8xQmdsnhNKtuTZbsWdIlfWHeoVP33kTzIRwDm9Eec4kLqjAuT
 I8aZ7CDf7CISl9d6o4chVbHVssUXKF+0IZ013rc6qnxhQWQDvnov2OiI3ckfBvuBaW9x
 rG779EGF8p9Kbg4xEWBIBaVqUB6wRZBtrYsw2MjWAftCERT7PZHxN1fV2wZEDBqQVzkz
 rBZJn/JJk0PA4Q5YiYNKlcTCH/icgV5QjV5HJz7CBi+HYpI01wYsE4F2IDCHFl+kwmRY
 FdGw==
X-Gm-Message-State: AOAM5332Rx4tuX8QXwayLauQkQAzY+n4FhQ9oBqUoItapGfkVRLSg9jN
 fIV26CqCFRp3fi6mFPgGP9WyQDJbdNlZHlDDf4rTY4qihN0xNw==
X-Google-Smtp-Source: ABdhPJxMS9T0wNOMpOA0zhRKw+wfoT631wJ04KkLV7XQ/4keWhsSSvz+hVTvOo+SjrLtmB2ckNA/OBoKU9fVbv4Q2vM=
X-Received: by 2002:a05:6102:109b:b0:349:d58b:4c10 with SMTP id
 s27-20020a056102109b00b00349d58b4c10mr15372509vsr.30.1654685398021; Wed, 08
 Jun 2022 03:49:58 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <fperrad@gmail.com>
Date: Wed, 8 Jun 2022 12:49:47 +0200
Message-ID: <CAGhdn57DSZhXfA_MCam2h3SorNAVmxUnQivP2e6W2xwRDPvN2g@mail.gmail.com>
To: buildroot <buildroot@busybox.net>
Subject: [Buildroot] [PATCH] package/gnutls: bump to version 3.7.6
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
Content-Type: multipart/mixed; boundary="===============2050426713716785746=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2050426713716785746==
Content-Type: multipart/alternative; boundary="0000000000005d3a7e05e0ed77d1"

--0000000000005d3a7e05e0ed77d1
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index c09e4665e..ff191278c 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.4.tar.xz.sig
-sha256  e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f
 gnutls-3.7.4.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.6.tar.xz.sig
+sha256  77065719a345bfb18faa250134be4c53bef70c1bd61f6c0c23ceb8b44f0262ff
 gnutls-3.7.6.tar.xz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b
 doc/COPYING
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3
 doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index f7f3e046e..f1af1e7b3 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -6,7 +6,7 @@

 # When bumping, make sure *all* --without-libfoo-prefix options are in
GNUTLS_CONF_OPTS
 GNUTLS_VERSION_MAJOR = 3.7
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).4
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).6
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE =
https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
-- 
2.34.1

--0000000000005d3a7e05e0ed77d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:f=
rancois.perrad@gadz.org">francois.perrad@gadz.org</a>&gt;<br>---<br>=C2=A0p=
ackage/gnutls/gnutls.hash | 4 ++--<br>=C2=A0package/gnutls/<a href=3D"http:=
//gnutls.mk">gnutls.mk</a> =C2=A0 | 2 +-<br>=C2=A02 files changed, 3 insert=
ions(+), 3 deletions(-)<br><br>diff --git a/package/gnutls/gnutls.hash b/pa=
ckage/gnutls/gnutls.hash<br>index c09e4665e..ff191278c 100644<br>--- a/pack=
age/gnutls/gnutls.hash<br>+++ b/package/gnutls/gnutls.hash<br>@@ -1,6 +1,6 =
@@<br>=C2=A0# Locally calculated after checking pgp signature<br>-# <a href=
=3D"https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.4.tar.xz.sig">h=
ttps://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.4.tar.xz.sig</a><br>=
-sha256 =C2=A0e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f62174=
51f =C2=A0gnutls-3.7.4.tar.xz<br>+# <a href=3D"https://www.gnupg.org/ftp/gc=
rypt/gnutls/v3.7/gnutls-3.7.6.tar.xz.sig">https://www.gnupg.org/ftp/gcrypt/=
gnutls/v3.7/gnutls-3.7.6.tar.xz.sig</a><br>+sha256 =C2=A077065719a345bfb18f=
aa250134be4c53bef70c1bd61f6c0c23ceb8b44f0262ff =C2=A0gnutls-3.7.6.tar.xz<br=
>=C2=A0# Locally calculated<br>=C2=A0sha256 =C2=A0e79e9c8a0c85d735ff9818591=
8ec94ed7d175efc377012787aebcf3b80f0d90b =C2=A0doc/COPYING<br>=C2=A0sha256 =
=C2=A06095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 =C2=
=A0doc/COPYING.LESSER<br>diff --git a/package/gnutls/<a href=3D"http://gnut=
ls.mk">gnutls.mk</a> b/package/gnutls/<a href=3D"http://gnutls.mk">gnutls.m=
k</a><br>index f7f3e046e..f1af1e7b3 100644<br>--- a/package/gnutls/<a href=
=3D"http://gnutls.mk">gnutls.mk</a><br>+++ b/package/gnutls/<a href=3D"http=
://gnutls.mk">gnutls.mk</a><br>@@ -6,7 +6,7 @@<br>=C2=A0<br>=C2=A0# When bu=
mping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_O=
PTS<br>=C2=A0GNUTLS_VERSION_MAJOR =3D 3.7<br>-GNUTLS_VERSION =3D $(GNUTLS_V=
ERSION_MAJOR).4<br>+GNUTLS_VERSION =3D $(GNUTLS_VERSION_MAJOR).6<br>=C2=A0G=
NUTLS_SOURCE =3D gnutls-$(GNUTLS_VERSION).tar.xz<br>=C2=A0GNUTLS_SITE =3D <=
a href=3D"https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)"=
>https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)</a><br>=
=C2=A0GNUTLS_LICENSE =3D LGPL-2.1+ (core library)<br>-- <br>2.34.1<br><br><=
br></div>

--0000000000005d3a7e05e0ed77d1--

--===============2050426713716785746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2050426713716785746==--
