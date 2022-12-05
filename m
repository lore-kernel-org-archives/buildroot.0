Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F342EC47089
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 08:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83228402A3;
	Mon,  5 Dec 2022 08:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83228402A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4AgilfVi6o0G; Mon,  5 Dec 2022 08:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64DF840252;
	Mon,  5 Dec 2022 08:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64DF840252
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D08E71BF2EA
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 08:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABB34813F4
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 08:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABB34813F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QwK5b8TUEBdu for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 08:43:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EA75813EA
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EA75813EA
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 08:43:17 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id q22so1122048uap.7
 for <buildroot@buildroot.org>; Mon, 05 Dec 2022 00:43:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0U4Jrj79PTgB7656Nrs552dHZwNMdqTakEzODMsgd2E=;
 b=Bj7Esn+psk+w8nQH8saWpxbLurobbduDvxdUagmfNxuzrYfh6WkUqFLTVFAK+l25pp
 oE0Ro5NCDb/XMIwMxbKj7EKeKtmPD38M/mBRFaedQdZCjz5tffkFhY+wFGkldIJoWwug
 WjBOblzbvCFx1p8SzQaAOvX3dsrtcUA8XLjDnLZgEIvNS7960d2P97fIpYw9yoGav1vB
 bz3e1hu8nbDCmNF1l9psKmzAde5Qaor+t45DIpo9tTc+CKdNqP56e7i7o2UJlnxioMX8
 2fQvsh1vRleI5dnaAxYvMXIpb0lHVUe50VKy4VWjK/x/T4ZsvuTxeWl7ZRsVCp9L08sq
 dAyA==
X-Gm-Message-State: ANoB5pkA0q3NJzuWD16qF1XxE0s6hao5Mxz800tgFCDsJAPEFKUE9Sds
 +Gh8g+f+r5hcs+dEgF/yIsuhzU8KZHd71VqfaaT7wRwv
X-Google-Smtp-Source: AA0mqf5tXoKVzW9L6vEawzWiXMAhBwO9ssSK/K6iy5hXivUTakH0Yphmy6nrkGznzENKzIDi/uAmU8rRzoTxS15fRfA=
X-Received: by 2002:a9f:22a7:0:b0:418:87ba:c43a with SMTP id
 36-20020a9f22a7000000b0041887bac43amr35137616uan.114.1670229795532; Mon, 05
 Dec 2022 00:43:15 -0800 (PST)
MIME-Version: 1.0
References: <20221128091158.5049-1-marcus.folkesson@gmail.com>
In-Reply-To: <20221128091158.5049-1-marcus.folkesson@gmail.com>
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 5 Dec 2022 09:43:04 +0100
Message-ID: <CAM8FrKJYV5b0u5aorY2WtvCdEL4R+ybb6ekXNqPDXrOLmQeRLg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0U4Jrj79PTgB7656Nrs552dHZwNMdqTakEzODMsgd2E=;
 b=Cuy7q4YBL4bDoDb4IktTGp06R/P/rpjrcg2ZvUL2um3mRvVdrEfo3SAhPnemoXqe+N
 Eidl9rxAUAe+mt54chlZ+XpkBCYGV8hp5LP6854SotJDep29aasudWl7UDhURw2QRm6n
 aoT35aV51apTC5VMog7BuvHLh+2WqXCvxwjJ6tg5aMj7q/93AC7r/cD0lw3gMZQ4LV4V
 Mden4dGhLUSAHBjrVWJJ9x2jKFSiw8xC/h4PCwp825P4m2C3w0vG8SfGxUPG0Hxf/x30
 svJ0I+go4uNN7XucPJOoLwRfMLObkef7woNzwLqHqZtgKNgytfqX7ySiR9zyiRLqrn98
 xw1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Cuy7q4YB
Subject: Re: [Buildroot] [PATCH] package/libostree: bump to version 2022.7
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
Content-Type: multipart/mixed; boundary="===============8765760355908961369=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8765760355908961369==
Content-Type: multipart/alternative; boundary="000000000000a7f45d05ef10ad7d"

--000000000000a7f45d05ef10ad7d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bump

Med v=C3=A4nliga h=C3=A4lsningar / Best regards
Marcus Folkesson


Den m=C3=A5n 28 nov. 2022 kl 10:12 skrev Marcus Folkesson <
marcus.folkesson@gmail.com>:

> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  package/libostree/libostree.hash | 2 +-
>  package/libostree/libostree.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/libostree/libostree.hash
> b/package/libostree/libostree.hash
> index 582af4b7b9..ed31109fdb 100644
> --- a/package/libostree/libostree.hash
> +++ b/package/libostree/libostree.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  835ef47d9a0b35a10c77ffd7f0fbd2e2b87f7cccb588da27442a05ff71ffad8c
> libostree-2022.6.tar.xz
> +sha256  8be2a9261c94e8b9ec4113380ffc480f8598245fb321a009bad4fae4b822411f
> libostree-2022.7.tar.xz
>  sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c
> COPYING
> diff --git a/package/libostree/libostree.mk b/package/libostree/
> libostree.mk
> index e99da9d2cb..8e8ec63213 100644
> --- a/package/libostree/libostree.mk
> +++ b/package/libostree/libostree.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ########################################################################=
########
>
> -LIBOSTREE_VERSION =3D 2022.6
> +LIBOSTREE_VERSION =3D 2022.7
>  LIBOSTREE_SOURCE =3D libostree-$(LIBOSTREE_VERSION).tar.xz
>  LIBOSTREE_SITE =3D
> https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSIO=
N)
>
> --
> 2.38.1
>
>

--000000000000a7f45d05ef10ad7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Bump<div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"=
gmail_signature" data-smartmail=3D"gmail_signature">Med v=C3=A4nliga h=C3=
=A4lsningar / Best regards<br>Marcus Folkesson</div></div><br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Den m=
=C3=A5n 28 nov. 2022 kl 10:12 skrev Marcus Folkesson &lt;<a href=3D"mailto:=
marcus.folkesson@gmail.com">marcus.folkesson@gmail.com</a>&gt;:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Marcus Folke=
sson &lt;<a href=3D"mailto:marcus.folkesson@gmail.com" target=3D"_blank">ma=
rcus.folkesson@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/libostree/libostree.hash | 2 +-<br>
=C2=A0package/libostree/<a href=3D"http://libostree.mk" rel=3D"noreferrer" =
target=3D"_blank">libostree.mk</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/libostree/libostree.hash b/package/libostree/libostree=
.hash<br>
index 582af4b7b9..ed31109fdb 100644<br>
--- a/package/libostree/libostree.hash<br>
+++ b/package/libostree/libostree.hash<br>
@@ -1,3 +1,3 @@<br>
=C2=A0# Locally calculated<br>
-sha256=C2=A0 835ef47d9a0b35a10c77ffd7f0fbd2e2b87f7cccb588da27442a05ff71ffa=
d8c=C2=A0 libostree-2022.6.tar.xz<br>
+sha256=C2=A0 8be2a9261c94e8b9ec4113380ffc480f8598245fb321a009bad4fae4b8224=
11f=C2=A0 libostree-2022.7.tar.xz<br>
=C2=A0sha256=C2=A0 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512=
acebd69c=C2=A0 COPYING<br>
diff --git a/package/libostree/<a href=3D"http://libostree.mk" rel=3D"noref=
errer" target=3D"_blank">libostree.mk</a> b/package/libostree/<a href=3D"ht=
tp://libostree.mk" rel=3D"noreferrer" target=3D"_blank">libostree.mk</a><br=
>
index e99da9d2cb..8e8ec63213 100644<br>
--- a/package/libostree/<a href=3D"http://libostree.mk" rel=3D"noreferrer" =
target=3D"_blank">libostree.mk</a><br>
+++ b/package/libostree/<a href=3D"http://libostree.mk" rel=3D"noreferrer" =
target=3D"_blank">libostree.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-LIBOSTREE_VERSION =3D 2022.6<br>
+LIBOSTREE_VERSION =3D 2022.7<br>
=C2=A0LIBOSTREE_SOURCE =3D libostree-$(LIBOSTREE_VERSION).tar.xz<br>
=C2=A0LIBOSTREE_SITE =3D <a href=3D"https://github.com/ostreedev/ostree/rel=
eases/download/v$(LIBOSTREE_VERSION)" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)=
</a><br>
<br>
-- <br>
2.38.1<br>
<br>
</blockquote></div>

--000000000000a7f45d05ef10ad7d--

--===============8765760355908961369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8765760355908961369==--
