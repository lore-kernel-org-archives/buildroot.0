Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287F4EB64D9
	for <buildroot@archiver.kernel.org>; Tue, 27 Jun 2023 11:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7AB561196;
	Tue, 27 Jun 2023 11:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7AB561196
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QuUhtcbBQ2SP; Tue, 27 Jun 2023 11:49:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82CC760BBD;
	Tue, 27 Jun 2023 11:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82CC760BBD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A0201BF369
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 11:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80F61607B4
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 11:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80F61607B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PZplq3XC4uSL for <buildroot@lists.busybox.net>;
 Tue, 27 Jun 2023 11:49:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DF1360FC7
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DF1360FC7
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 11:49:10 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-4718f761333so1748721e0c.0
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 04:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687866549; x=1690458549;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BwEiYhoviY7wVQ6JrJgdMUJ/RQ8H9pAVSCSW6vH+CM8=;
 b=AaEhnaWMAekxS2xsyZGZpHsOb1rx34JdRX8TkGgwypzvBdhumBsjuekA7kg6KDQaz+
 IgQNZa6F9IZT+6ddF/nK9N6Hd6UpkHqsiiMmciwv76yx1hHlAZom3nnnqIyYCzFQ+pTQ
 pHpqKH74EfbzhKIGopKpDIo1mYM0lUAstWtp8SAzr27lwICJOWrjHaNkdJdFXbbz9L24
 3A3bKUvb6vs6t+2Ynm8ozbBIFnNdw0TdAxC877NdS8hung2mPQ0l28qA74+A+ccr+Bkf
 G5K9dA4ZqAMG6OmgaIm4c5/1rYOUB1khfG7ordacw6qAC0sgYd3mMOrOA/Mq0tyxkLWY
 c7jQ==
X-Gm-Message-State: AC+VfDz6IeBsCgFBEgre9knisxxyQsVLxAoND6qAMIgPQWswO7V8n4Mn
 w2qx//qksv7/3wsP5eiLqvFWPtl1ebYe8RThB0Vx5ZVBw5w=
X-Google-Smtp-Source: ACHHUZ4hxjHJIQsPX0nAWg/CnaVcfvy/tAw3/3aRr/QazMTpifiG6sFm6zpmGbZb0VK3lmD5OJJS6lZ2qwozemfyflg=
X-Received: by 2002:a67:b910:0:b0:443:5d36:4a75 with SMTP id
 q16-20020a67b910000000b004435d364a75mr3023932vsn.31.1687866548712; Tue, 27
 Jun 2023 04:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230605054912.2287333-1-marcus.folkesson@gmail.com>
In-Reply-To: <20230605054912.2287333-1-marcus.folkesson@gmail.com>
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 27 Jun 2023 13:50:51 +0200
Message-ID: <CAM8FrK+jcsNhMmfyG157E3ni8PQvh+DVO0yC88bkUsZdeRa29A@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687866549; x=1690458549;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BwEiYhoviY7wVQ6JrJgdMUJ/RQ8H9pAVSCSW6vH+CM8=;
 b=j9he3BMsCtsxn4tP11X47fthfFxHf/YFOrzaLkdkDZyNTWU2qSvdgMpHwBW3hCXf3W
 BmtdvLEfWMld/Bpn7vZ7iH0xST9Un9sAxLJdn6X9uza4RLeFxRHnXpPW+bYdxTWXHbPs
 DK1BDBfkF3Ph5tD4s+1vp6DmsqyM/K3BsphOIHlhW6lLD6MelPrdaswHMfukwrTW1YXi
 9CJoevx7CUEuLjI5iUlaMJHs7kId8ouRvaabuGqyCyaoJyjyAPGt1/tOCDINbFilGu9v
 YtR0EWCn9AUbwyglMvrsyzZSH59YFQ4dT5YggBqBYNy938bpLpqBvl+AbMpMU6H6Phzd
 jrvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=j9he3BMs
Subject: Re: [Buildroot] [PATCH] package/libostree: bump to version 2023.3
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
Content-Type: multipart/mixed; boundary="===============0594051239968801512=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0594051239968801512==
Content-Type: multipart/alternative; boundary="000000000000107db005ff1b0ef3"

--000000000000107db005ff1b0ef3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bump.

Med v=C3=A4nliga h=C3=A4lsningar / Best regards
Marcus Folkesson


Den m=C3=A5n 5 juni 2023 kl 07:47 skrev Marcus Folkesson <
marcus.folkesson@gmail.com>:

> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  package/libostree/libostree.hash | 2 +-
>  package/libostree/libostree.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/libostree/libostree.hash
> b/package/libostree/libostree.hash
> index db99b4b07b..088650a86f 100644
> --- a/package/libostree/libostree.hash
> +++ b/package/libostree/libostree.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  ceb0788755a0bff5738d44543552fbf883cf71df481baa3ca7288da7a402bb85
> libostree-2023.2.tar.xz
> +sha256  9c575a094da2c307769f0aee15de95470c3b5550cbff211fbbc4f6fc75f333b1
> libostree-2023.3.tar.xz
>  sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c
> COPYING
> diff --git a/package/libostree/libostree.mk b/package/libostree/
> libostree.mk
> index 367a833ac9..5c39090654 100644
> --- a/package/libostree/libostree.mk
> +++ b/package/libostree/libostree.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ########################################################################=
########
>
> -LIBOSTREE_VERSION =3D 2023.2
> +LIBOSTREE_VERSION =3D 2023.3
>  LIBOSTREE_SOURCE =3D libostree-$(LIBOSTREE_VERSION).tar.xz
>  LIBOSTREE_SITE =3D
> https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSIO=
N)
>
> --
> 2.40.1
>
>

--000000000000107db005ff1b0ef3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Bump.<div><br clear=3D"all"><div><div dir=3D"ltr" class=3D=
"gmail_signature" data-smartmail=3D"gmail_signature">Med v=C3=A4nliga h=C3=
=A4lsningar / Best regards<br>Marcus Folkesson</div></div><br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Den m=
=C3=A5n 5 juni 2023 kl 07:47 skrev Marcus Folkesson &lt;<a href=3D"mailto:m=
arcus.folkesson@gmail.com">marcus.folkesson@gmail.com</a>&gt;:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Marcus Folkes=
son &lt;<a href=3D"mailto:marcus.folkesson@gmail.com" target=3D"_blank">mar=
cus.folkesson@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/libostree/libostree.hash | 2 +-<br>
=C2=A0package/libostree/<a href=3D"http://libostree.mk" rel=3D"noreferrer" =
target=3D"_blank">libostree.mk</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/libostree/libostree.hash b/package/libostree/libostree=
.hash<br>
index db99b4b07b..088650a86f 100644<br>
--- a/package/libostree/libostree.hash<br>
+++ b/package/libostree/libostree.hash<br>
@@ -1,3 +1,3 @@<br>
=C2=A0# Locally calculated<br>
-sha256=C2=A0 ceb0788755a0bff5738d44543552fbf883cf71df481baa3ca7288da7a402b=
b85=C2=A0 libostree-2023.2.tar.xz<br>
+sha256=C2=A0 9c575a094da2c307769f0aee15de95470c3b5550cbff211fbbc4f6fc75f33=
3b1=C2=A0 libostree-2023.3.tar.xz<br>
=C2=A0sha256=C2=A0 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512=
acebd69c=C2=A0 COPYING<br>
diff --git a/package/libostree/<a href=3D"http://libostree.mk" rel=3D"noref=
errer" target=3D"_blank">libostree.mk</a> b/package/libostree/<a href=3D"ht=
tp://libostree.mk" rel=3D"noreferrer" target=3D"_blank">libostree.mk</a><br=
>
index 367a833ac9..5c39090654 100644<br>
--- a/package/libostree/<a href=3D"http://libostree.mk" rel=3D"noreferrer" =
target=3D"_blank">libostree.mk</a><br>
+++ b/package/libostree/<a href=3D"http://libostree.mk" rel=3D"noreferrer" =
target=3D"_blank">libostree.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-LIBOSTREE_VERSION =3D 2023.2<br>
+LIBOSTREE_VERSION =3D 2023.3<br>
=C2=A0LIBOSTREE_SOURCE =3D libostree-$(LIBOSTREE_VERSION).tar.xz<br>
=C2=A0LIBOSTREE_SITE =3D <a href=3D"https://github.com/ostreedev/ostree/rel=
eases/download/v$(LIBOSTREE_VERSION)" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)=
</a><br>
<br>
-- <br>
2.40.1<br>
<br>
</blockquote></div>

--000000000000107db005ff1b0ef3--

--===============0594051239968801512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0594051239968801512==--
