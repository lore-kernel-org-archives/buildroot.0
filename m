Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFBED24463
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 02:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B3CB60C0F;
	Fri, 11 Oct 2024 02:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ljw3cVEg3K6m; Fri, 11 Oct 2024 02:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49B5660C15
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49B5660C15;
	Fri, 11 Oct 2024 02:18:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18E571BF37A
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 02:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05EA34017A
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 02:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKmzQzgoNJkX for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 02:18:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com;
 envelope-from=dtraft@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9092C400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9092C400D7
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9092C400D7
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 02:18:03 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-6dbc9a60480so15264497b3.0
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 19:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728613083; x=1729217883;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mkswwEZ6zRwUX8oHAWnJh864DEzWN/X0HfnxHKvGl70=;
 b=HR9Mpk7Qd8NEQeTz1DGMF9Rpkojp1/t7ilJVasgqlNkfKpjCfdl1zpt1HWreT0Ypmd
 O/tNWOVZ9WOG4uQaNPskXfJce+xEb+aqOQ/gzIohhXZNDASeP9xzqueYDxkGB/VhFL7m
 i/3z3AETcF8S6I29Lqa37l3FI4L4kMG1j7uULT9GrTB/OcGdWbjgCSNlRXcCpz4/mgTB
 da7iLss81Rhyc7UkihD9SPeTGUleF7W7XKWQ4KYyOkKjNTRaq2ZUAiZq5xXRjhZLhjsB
 UsDAdhZqTmQODGVp6lu1EEzyJR/F39zV5nfUOKE7OV2mv0aASERpfHBf+tRfZGwr/rmA
 5JXg==
X-Gm-Message-State: AOJu0YwmvTT5xRijFR2horaHmDAcQgpHaGa1wJPxtBEvc0hMDwcw8M9J
 dwNwOoSdJpub2W+dQ3u6t+maBQ9DCFqrcVoDrvHbl03YeP4ZjtbfDtxK/wCrK3CsNgTcJFlOAyM
 QLuFATNU+9qapGvhLzdA0Pn6ZL/S/dkXJ
X-Google-Smtp-Source: AGHT+IFlrGWS6uBjq8qI7rBZZ777NX7BqK/avHCGfDs0HKhwRakdUfGXNJe3XbGG8p5PfotlpmtiKs0yHQJwu5ravHo=
X-Received: by 2002:a05:690c:3686:b0:6e3:3357:9106 with SMTP id
 00721157ae682-6e3479b967fmr7811457b3.15.1728613082543; Thu, 10 Oct 2024
 19:18:02 -0700 (PDT)
MIME-Version: 1.0
From: Drew Traft <dtraft@gmail.com>
Date: Thu, 10 Oct 2024 22:17:51 -0400
Message-ID: <CADdAThchVWBsrNOa08HS6DR3oAUQO_KprRCkVxttrg0rSSCnbA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728613083; x=1729217883; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=mkswwEZ6zRwUX8oHAWnJh864DEzWN/X0HfnxHKvGl70=;
 b=ZpnBTlwGkEN0GywVQov/C8c0Ff6+AHi7FaKpvUbD9335ti2ZsntYbMYra2Fg/dr9Uu
 Or38J5085qnnKUzNsoCpRcoi+2w3yx2ODhCm4GlTXc/UAkopAZChiqvdWMpe9KIiO/5s
 aWuKXnyQYi+QuzVshq0yGNW5NQmFuU/KPknTL4C2fp9inSmDWhc7ZlvB7miaSS9oJfFq
 fD8gDNgZe8sX75kmrveeckcntcmzr0ABbbPpKzGdGH3vXxmqpia3mpVTwkjilHOK2bS8
 ZsyDDuovHXpKDojO3u6QfVgbvsY6CjIvno555/9IPKPv9ZNQDv6iIylAObvmO0KRDpkI
 DmsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZpnBTlwG
Subject: [Buildroot] [PATCH 1/1] package/fbv: update site to
 sources.buildroot.net
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
Content-Type: multipart/mixed; boundary="===============5655076258925210927=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5655076258925210927==
Content-Type: multipart/alternative; boundary="000000000000bd3d5806242a1865"

--000000000000bd3d5806242a1865
Content-Type: text/plain; charset="UTF-8"

This change was necessary as the previous url is no longer active.

Signed-off-by: Drew Trafton <dtraft@gmail.com>
---
 package/fbv/fbv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index a69e4ad518..5aab67ff1c 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -5,7 +5,7 @@
 ################################################################################

 FBV_VERSION = 1.0b
-FBV_SITE = http://s-tech.elsat.net.pl/fbv
+FBV_SITE = https://sources.buildroot.net/fbv

 FBV_LICENSE = GPL-2.0
 FBV_LICENSE_FILES = COPYING
-- 
2.39.3 (Apple Git-146)

--000000000000bd3d5806242a1865
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This change was necessary as the previous url is no longer=
 active.<br><br>Signed-off-by: Drew Trafton &lt;<a href=3D"mailto:dtraft@gm=
ail.com" target=3D"_blank">dtraft@gmail.com</a>&gt;<br>---<br>=C2=A0package=
/fbv/<a href=3D"http://fbv.mk" rel=3D"noreferrer" target=3D"_blank">fbv.mk<=
/a><span class=3D"gmail-Apple-converted-space">=C2=A0</span>| 2 +-<br>=C2=
=A01 file changed, 1 insertion(+), 1 deletion(-)<br><br>diff --git a/packag=
e/fbv/<a href=3D"http://fbv.mk" rel=3D"noreferrer" target=3D"_blank">fbv.mk=
</a><span class=3D"gmail-Apple-converted-space">=C2=A0</span>b/package/fbv/=
<a href=3D"http://fbv.mk" rel=3D"noreferrer" target=3D"_blank">fbv.mk</a><b=
r>index a69e4ad518..5aab67ff1c 100644<br>--- a/package/fbv/<a href=3D"http:=
//fbv.mk" rel=3D"noreferrer" target=3D"_blank">fbv.mk</a><br>+++ b/package/=
fbv/<a href=3D"http://fbv.mk" rel=3D"noreferrer" target=3D"_blank">fbv.mk</=
a><br>@@ -5,7 +5,7 @@<br>=C2=A0############################################=
####################################<br><br>=C2=A0FBV_VERSION =3D 1.0b<br>-=
FBV_SITE =3D<span class=3D"gmail-Apple-converted-space">=C2=A0</span><a hre=
f=3D"http://s-tech.elsat.net.pl/fbv" rel=3D"noreferrer" target=3D"_blank">h=
ttp://s-tech.elsat.net.pl/fbv</a><br>+FBV_SITE =3D<span class=3D"gmail-Appl=
e-converted-space">=C2=A0</span><a href=3D"https://sources.buildroot.net/fb=
v" rel=3D"noreferrer" target=3D"_blank">https://sources.<span class=3D"gmai=
l-il">buildroot</span>.net/fbv</a><br><br>=C2=A0FBV_LICENSE =3D GPL-2.0<br>=
=C2=A0FBV_LICENSE_FILES =3D COPYING<font color=3D"#888888"><br>--<span clas=
s=3D"gmail-Apple-converted-space">=C2=A0</span><br>2.39.3 (Apple Git-146)</=
font><br></div>

--000000000000bd3d5806242a1865--

--===============5655076258925210927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5655076258925210927==--
