Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A7EC77B61
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 10:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D939860F40;
	Mon, 24 Apr 2023 10:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D939860F40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g9x9ky5HldLX; Mon, 24 Apr 2023 10:48:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEB4D60D67;
	Mon, 24 Apr 2023 10:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEB4D60D67
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32B691C2AC7
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 10:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C97A40C2C
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 10:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C97A40C2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sa42FRQssH8O for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 10:48:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E31E40B8D
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [IPv6:2607:f8b0:4864:20::a30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E31E40B8D
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 10:48:44 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-44054215485so2685383e0c.3
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 03:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682333323; x=1684925323;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5gjcczJqGKqWpTKNgSGnDq1MpzDQPWs5+LOYlHXJbEE=;
 b=fnCvaFgEVNKltD1iCM8HaGIVKL8VY3HsZtTEIlPpgGau+9pzgUl5DvHjsrauQKYibd
 cpWTvIXgUWQebtUY9QxiciQRTt9+dTb8yocwLR+E7wK0aHTjd4bJxOHKR6wIE3lrZnha
 nWCSp/oHDCtbDqX+rMH+xp7CAhTb6zbHn11JHUv18HLtMNwomPZzXmDKlHJH0p8jNWNW
 hrZIrW1OTsCyue0dwm3Vd73iSZ92NNqZ1dOnKN7PNPBpEP0j9g5E0Xnjr8/VwQ/A7gVv
 TRhJiNQvlDlbadrShw2oFeZRVUjJZ2v3YmSYl5S4w3VEvbq1Z7dGqQQjYlFXN+u2Ezcp
 2nEQ==
X-Gm-Message-State: AAQBX9fSO2TRB6GyE3gYqbZmSnY6fV1rTn/i2uQ3XBbv/3K4xb1yzc8P
 Em/jcnQG7oLeKB55DEiyqA+1/Xy95/eI5sa9vtesbs7T
X-Google-Smtp-Source: AKy350ZG9TMomuJ2/BErZAsspp65J3A24843rJAcjg70+IQH9lMGCoZDbdWnn69WVqDPuOJUzb/FhXdZdWt86L9Xp+M=
X-Received: by 2002:a1f:cfc7:0:b0:440:7261:c77e with SMTP id
 f190-20020a1fcfc7000000b004407261c77emr3277330vkg.1.1682333323077; Mon, 24
 Apr 2023 03:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230327053702.517399-1-marcus.folkesson@gmail.com>
In-Reply-To: <20230327053702.517399-1-marcus.folkesson@gmail.com>
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 24 Apr 2023 12:49:10 +0200
Message-ID: <CAM8FrKLzUySOdX9VSYQyKt82yYZVNBF2HLsTsxGoR14ZJ2QoiA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682333323; x=1684925323;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5gjcczJqGKqWpTKNgSGnDq1MpzDQPWs5+LOYlHXJbEE=;
 b=p7cnawWvZVzJGjX8+Ir8O7gqrhyPE4VoFVZaDar1yqxt0btbf3w5dr+3nHRhTuN4y1
 hehkER/ojyXXMtYQvJdGKhxdb9iSuztlX6xfTqgH8TO2MdOrNfFd86BpE9HzBG9lqZfj
 7T/BEpdXiHHKOLV0/koL732FFXrpYpw5pl/YQyfbh/+5+IzZoJYMZYnobEarY8ARGUhO
 3GmLjZOk1bJ05Q9nvNkQRYmDDaAdZgwNtBnZIzd6gU8RvkrqK+iCnnGbhhgrDTj0Q5UJ
 wVX7CQjrqQCjfb8VxGJ/U4HVQmWTVrFMj+/xnZ3awxcUH85w7fghJng0GfHFcHcyLXol
 PM+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=p7cnawWv
Subject: Re: [Buildroot] [PATCH] package/libostree: bump to version 2023.2
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
Content-Type: multipart/mixed; boundary="===============0475940581028149398=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0475940581028149398==
Content-Type: multipart/alternative; boundary="0000000000001dae6b05fa12c099"

--0000000000001dae6b05fa12c099
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping

Med v=C3=A4nliga h=C3=A4lsningar / Best regards
Marcus Folkesson


Den m=C3=A5n 27 mars 2023 kl 07:37 skrev Marcus Folkesson <
marcus.folkesson@gmail.com>:

> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  package/libostree/libostree.hash | 2 +-
>  package/libostree/libostree.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/libostree/libostree.hash
> b/package/libostree/libostree.hash
> index 63dfe98d80..db99b4b07b 100644
> --- a/package/libostree/libostree.hash
> +++ b/package/libostree/libostree.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  dd792b167693a1971c9f6e3168013d906ac035100ff6c719a3b322eb44b96f55
> libostree-2023.1.tar.xz
> +sha256  ceb0788755a0bff5738d44543552fbf883cf71df481baa3ca7288da7a402bb85
> libostree-2023.2.tar.xz
>  sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c
> COPYING
> diff --git a/package/libostree/libostree.mk b/package/libostree/
> libostree.mk
> index 4b17fcf391..367a833ac9 100644
> --- a/package/libostree/libostree.mk
> +++ b/package/libostree/libostree.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ########################################################################=
########
>
> -LIBOSTREE_VERSION =3D 2023.1
> +LIBOSTREE_VERSION =3D 2023.2
>  LIBOSTREE_SOURCE =3D libostree-$(LIBOSTREE_VERSION).tar.xz
>  LIBOSTREE_SITE =3D
> https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSIO=
N)
>
> --
> 2.39.2
>
>

--0000000000001dae6b05fa12c099
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping<div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"=
gmail_signature" data-smartmail=3D"gmail_signature">Med v=C3=A4nliga h=C3=
=A4lsningar / Best regards<br>Marcus Folkesson</div></div><br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Den m=
=C3=A5n 27 mars 2023 kl 07:37 skrev Marcus Folkesson &lt;<a href=3D"mailto:=
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
index 63dfe98d80..db99b4b07b 100644<br>
--- a/package/libostree/libostree.hash<br>
+++ b/package/libostree/libostree.hash<br>
@@ -1,3 +1,3 @@<br>
=C2=A0# Locally calculated<br>
-sha256=C2=A0 dd792b167693a1971c9f6e3168013d906ac035100ff6c719a3b322eb44b96=
f55=C2=A0 libostree-2023.1.tar.xz<br>
+sha256=C2=A0 ceb0788755a0bff5738d44543552fbf883cf71df481baa3ca7288da7a402b=
b85=C2=A0 libostree-2023.2.tar.xz<br>
=C2=A0sha256=C2=A0 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512=
acebd69c=C2=A0 COPYING<br>
diff --git a/package/libostree/<a href=3D"http://libostree.mk" rel=3D"noref=
errer" target=3D"_blank">libostree.mk</a> b/package/libostree/<a href=3D"ht=
tp://libostree.mk" rel=3D"noreferrer" target=3D"_blank">libostree.mk</a><br=
>
index 4b17fcf391..367a833ac9 100644<br>
--- a/package/libostree/<a href=3D"http://libostree.mk" rel=3D"noreferrer" =
target=3D"_blank">libostree.mk</a><br>
+++ b/package/libostree/<a href=3D"http://libostree.mk" rel=3D"noreferrer" =
target=3D"_blank">libostree.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-LIBOSTREE_VERSION =3D 2023.1<br>
+LIBOSTREE_VERSION =3D 2023.2<br>
=C2=A0LIBOSTREE_SOURCE =3D libostree-$(LIBOSTREE_VERSION).tar.xz<br>
=C2=A0LIBOSTREE_SITE =3D <a href=3D"https://github.com/ostreedev/ostree/rel=
eases/download/v$(LIBOSTREE_VERSION)" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)=
</a><br>
<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div>

--0000000000001dae6b05fa12c099--

--===============0475940581028149398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0475940581028149398==--
