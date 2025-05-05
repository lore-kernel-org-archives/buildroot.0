Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED6CC369C2
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 06:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16A3540750;
	Mon,  5 May 2025 06:41:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ef0rCxBxQ-RY; Mon,  5 May 2025 06:41:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EF974074C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EF974074C;
	Mon,  5 May 2025 06:41:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FAA716B
 for <buildroot@buildroot.org>; Mon,  5 May 2025 06:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EACC81317
 for <buildroot@buildroot.org>; Mon,  5 May 2025 06:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c33WEPYa6D9u for <buildroot@buildroot.org>;
 Mon,  5 May 2025 06:41:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 52E998136A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52E998136A
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52E998136A
 for <buildroot@buildroot.org>; Mon,  5 May 2025 06:41:08 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-3105ef2a06cso38158031fa.2
 for <buildroot@buildroot.org>; Sun, 04 May 2025 23:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746427266; x=1747032066;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XiYY7z54Rpvw5nUrF6EaEgL726mdoYjTrFmAsE3qnNY=;
 b=Tfvg0arGhRiRz9for1sn3QAlXCo9bhkldHFA7Zo7RvWgEHe4AlU8VkTPlq0TM5Ko5e
 4cjjZN185k0/WZasbb3b+Qw4CzjVp8tOCPSvuQT+vC3qTZD430V69p6rIE2FdEcUsNSj
 ZnTpVLlldo1tNQ8/1ygCXPHX8ZiCJltQw9wXk0hmkiWOXZM/VSY46tl0zi6CDM7y3Zpc
 4BlwEkJrTvRg5Qn6XguTILKhWVTNScFgbJLefN8L1jUO1hb1mz+ZVkcQLhfnc0liXxtx
 zt17B40NFYpVxZ2+OUfCkzVHfGGX8Sul4GxHs6rtMqFU4iMZ9POhExvvVlPG1r0bPSq1
 eaMg==
X-Gm-Message-State: AOJu0YzGc3UrRYjID1YxU8ZY5hIfrOFVYwUq9ggwn1qXXEolwq34V2TQ
 eF2gJTw6hBUJiaqxHzbuD/wrcz8ERMAW0rXqeLZ4rEm+PymPEwKRt/FWmLyNNntNysBRWZ7AaaH
 OiBNxPn+WJWH1TMIMJmXeTc+lnkt9UYgAdDQ=
X-Gm-Gg: ASbGncthJ3QpIUYbenUcz0PALutYT5MkLp3CqlSfJ1dlSX9KOprb5QDh6VUY1o3zYfj
 wjuVgWHAxPbCY14Ho+cY+ViOEXlEG2J0XwBN5bPSEP9EhJYxJKWAXmGdjBKr5aDve5txXDkvO2M
 N2OZGAwa0BthGU4zC5uLLB3A5BU6rT+W+G/rpGcmYYLRiviQeNSXhSY/sp
X-Google-Smtp-Source: AGHT+IHKQodkGD1vSbL5u7pGWSQu7QfO9U/WUFdCLOo4mua71sEBYBZfOCMDYy1WOoMNExM15YEkbXIDMDTBX1OZFmQ=
X-Received: by 2002:a2e:b891:0:b0:30b:f775:bae5 with SMTP id
 38308e7fff4ca-321daae4358mr22328021fa.6.1746427265543; Sun, 04 May 2025
 23:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250502132924.3775738-1-lazzer@gmail.com>
 <20250502132924.3775738-4-lazzer@gmail.com>
In-Reply-To: <20250502132924.3775738-4-lazzer@gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 5 May 2025 08:40:53 +0200
X-Gm-Features: ATxdqUEqUElf1vZj_O6s12bwq2T062-QAFru8RhJuJQbkNw72RDMHS26TEicc8w
Message-ID: <CAEyMn7Yq65OATiqEqC4pECt=2Wm3dU-qeoSYiMtTDh3wvsdM0Q@mail.gmail.com>
To: =?UTF-8?Q?Mattias_Walstr=C3=B6m?= <lazzer@gmail.com>
Cc: buildroot@buildroot.org,
 =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746427266; x=1747032066; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XiYY7z54Rpvw5nUrF6EaEgL726mdoYjTrFmAsE3qnNY=;
 b=gd4Ctlgsd3feyAg9i5fnPRrXgRB/k3zwLCxQVxJajuLsWL6Qc/XNHoL1+Y84akd4/F
 xGrCQVZSKMvj5YV7yKtIPrepvMUWGV2Dn+fNNk4BjJT8HlgqneA+jILzfHDKt0XDqm+M
 iJrtfa2PJuhYFbeaybpAPJTQtDyKQO9sndDTtC4wqN2UotglIp3rJaCLhagl94sALku0
 rGV4pWvYuL6S5ygN+fbY+QkjMnJOYxHTy0eir/3YlLBTkWFnDV4fZZj8p+wCW/ClFwwI
 2c+t6fQIEMIhS01/m5zmzgKV17Ldn8bL3JWgJ8wUL5shtgd6dn1tDPc+JPUoQZWId68f
 HVxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gd4Ctlgs
Subject: Re: [Buildroot] [PATCH 3/4] package/libnetconf2: bump to version
 3.7.1
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
Content-Type: multipart/mixed; boundary="===============3639836349496339038=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3639836349496339038==
Content-Type: multipart/alternative; boundary="000000000000c9f5da06345dc8db"

--000000000000c9f5da06345dc8db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mattias,

Unfortunately, this bump cannot be done so easily, because something has
changed in the dependencies. I had already worked on it, but could not
finish it due to lack of time. You can find Thomas' comments here:

https://patchwork.ozlabs.org/project/buildroot/patch/20250114072947.284965-=
3-heiko.thiery@gmail.com/


Am Fr., 2. Mai 2025 um 15:29 Uhr schrieb Mattias Walstr=C3=B6m <lazzer@gmai=
l.com
>:

> Changelog:
>   error-path data node
>    now using proper format so in rpc-reply uses XML XPath format instead
> of JSON
>   several bugfixes and improvements
>
> Depend on libyang v3.12.2
> https://github.com/CESNET/libyang/releases/tag/v3.12.2
>
> Signed-off-by: Mattias Walstr=C3=B6m <lazzer@gmail.com>
> ---
>  package/libnetconf2/libnetconf2.hash | 2 +-
>  package/libnetconf2/libnetconf2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/libnetconf2/libnetconf2.hash
> b/package/libnetconf2/libnetconf2.hash
> index 675c76a500..2d6394e81b 100644
> --- a/package/libnetconf2/libnetconf2.hash
> +++ b/package/libnetconf2/libnetconf2.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  72e9a6461fadbd22f0cf0d23ba68d62b297c8f564f7f2bee069748fb67fc3a24
> libnetconf2-2.1.28.tar.gz
> +sha256  c95c00ad887295d1fa31098c859c74e330eead78b2eee8d008701af2d9df80e5
> libnetconf2-3.7.1.tar.gz
>  sha256  bd962ab457c8a8cb8faaaa36c11484680f3c9a47dbc336507817ae8935384064
> LICENSE
> diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/
> libnetconf2.mk
> index 88163926c0..0d74bd736d 100644
> --- a/package/libnetconf2/libnetconf2.mk
> +++ b/package/libnetconf2/libnetconf2.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ########################################################################=
########
>
> -LIBNETCONF2_VERSION =3D 2.1.28
> +LIBNETCONF2_VERSION =3D 3.7.1
>  LIBNETCONF2_SITE =3D $(call
> github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
>  LIBNETCONF2_INSTALL_STAGING =3D YES
>  LIBNETCONF2_LICENSE =3D BSD-3-Clause
> --
> 2.43.0
>

BR,
Heiko

--000000000000c9f5da06345dc8db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Mattias,<div><br></div><div>Unfortunat=
ely, this bump cannot be done so easily, because something has changed in t=
he dependencies. I had already worked on it, but could not finish it due to=
 lack of time. You can find Thomas&#39; comments here:</div><div><br></div>=
<div><a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/202501=
14072947.284965-3-heiko.thiery@gmail.com/">https://patchwork.ozlabs.org/pro=
ject/buildroot/patch/20250114072947.284965-3-heiko.thiery@gmail.com/</a><br=
></div><div><br></div></div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">Am Fr., 2. Mai 2025 um 15:29=C2=
=A0Uhr schrieb Mattias Walstr=C3=B6m &lt;<a href=3D"mailto:lazzer@gmail.com=
">lazzer@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Changelog:<br>
=C2=A0 error-path data node<br>
=C2=A0 =C2=A0now using proper format so in rpc-reply uses XML XPath format =
instead of JSON<br>
=C2=A0 several bugfixes and improvements<br>
<br>
Depend on libyang v3.12.2 <a href=3D"https://github.com/CESNET/libyang/rele=
ases/tag/v3.12.2" rel=3D"noreferrer" target=3D"_blank">https://github.com/C=
ESNET/libyang/releases/tag/v3.12.2</a><br>
<br>
Signed-off-by: Mattias Walstr=C3=B6m &lt;<a href=3D"mailto:lazzer@gmail.com=
" target=3D"_blank">lazzer@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/libnetconf2/libnetconf2.hash | 2 +-<br>
=C2=A0package/libnetconf2/<a href=3D"http://libnetconf2.mk" rel=3D"noreferr=
er" target=3D"_blank">libnetconf2.mk</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/libnetconf2/libnetconf2.hash b/package/libnetconf2/lib=
netconf2.hash<br>
index 675c76a500..2d6394e81b 100644<br>
--- a/package/libnetconf2/libnetconf2.hash<br>
+++ b/package/libnetconf2/libnetconf2.hash<br>
@@ -1,3 +1,3 @@<br>
=C2=A0# Locally calculated<br>
-sha256=C2=A0 72e9a6461fadbd22f0cf0d23ba68d62b297c8f564f7f2bee069748fb67fc3=
a24=C2=A0 libnetconf2-2.1.28.tar.gz<br>
+sha256=C2=A0 c95c00ad887295d1fa31098c859c74e330eead78b2eee8d008701af2d9df8=
0e5=C2=A0 libnetconf2-3.7.1.tar.gz<br>
=C2=A0sha256=C2=A0 bd962ab457c8a8cb8faaaa36c11484680f3c9a47dbc336507817ae89=
35384064=C2=A0 LICENSE<br>
diff --git a/package/libnetconf2/<a href=3D"http://libnetconf2.mk" rel=3D"n=
oreferrer" target=3D"_blank">libnetconf2.mk</a> b/package/libnetconf2/<a hr=
ef=3D"http://libnetconf2.mk" rel=3D"noreferrer" target=3D"_blank">libnetcon=
f2.mk</a><br>
index 88163926c0..0d74bd736d 100644<br>
--- a/package/libnetconf2/<a href=3D"http://libnetconf2.mk" rel=3D"noreferr=
er" target=3D"_blank">libnetconf2.mk</a><br>
+++ b/package/libnetconf2/<a href=3D"http://libnetconf2.mk" rel=3D"noreferr=
er" target=3D"_blank">libnetconf2.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-LIBNETCONF2_VERSION =3D 2.1.28<br>
+LIBNETCONF2_VERSION =3D 3.7.1<br>
=C2=A0LIBNETCONF2_SITE =3D $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_=
VERSION))<br>
=C2=A0LIBNETCONF2_INSTALL_STAGING =3D YES<br>
=C2=A0LIBNETCONF2_LICENSE =3D BSD-3-Clause<br>
-- <br>
2.43.0<br></blockquote><div><br></div><div>BR,</div><div>Heiko=C2=A0</div><=
/div></div>

--000000000000c9f5da06345dc8db--

--===============3639836349496339038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3639836349496339038==--
