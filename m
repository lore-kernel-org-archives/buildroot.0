Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72300CAC598
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 05:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20F4D40B7C;
	Wed, 17 Sep 2025 05:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id apcj-9EUuF1E; Wed, 17 Sep 2025 05:20:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEE8440B98
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEE8440B98;
	Wed, 17 Sep 2025 05:20:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7427E199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 05:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A34D42383
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 05:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6CP6ZBYxtLUz for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 05:20:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B3D5B40314
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3D5B40314
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3D5B40314
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 05:20:27 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-25669596921so64578135ad.1
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 22:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758086426; x=1758691226;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wPHl0sZdZRohYc20EAjvcYwEAE5TrOptQ6Vs00CG8RY=;
 b=WGYS9O656P0gZZqJGoAjeu6uBdieb6ezNGF0Frej2YrKE+U0jXm6RHDCLjqmTABLq2
 SqDCcKMNYQAiL8tQ6JFJC62cGMXqnjJXpbmmb0GdAEvSOOU/SyoD4qQZbviAsE5T8awT
 1SoKKm9qwrynK/BcSoXJNu1Xdi/0HW/gtOu+ODoIQUdvjty9p+FEt9DNyd3TGnUwzD0S
 NzjUt8LTEX61LsHg/U6gO5T+DjrLF90X+f2lrT6AYKY5KS/swEQiNQMvtgRN/8ocuErK
 ofO8SEBi4a/sb8ocKCO3OuvGoRAPw6haeopq2vJTecly1mxsjMEajmKhyP+jWbIkSui8
 nnxw==
X-Gm-Message-State: AOJu0YxIOVRiKYjknchq02gY5mrZx7KxF+4Z50t9aNJjXNV4ccjO/fpl
 lwKhJ/Hadgc/p4yXsC84joJCI+3NwqAGiaX6sfpiNPBA9aXspBtwqk2okEGR5w==
X-Gm-Gg: ASbGncvqFneOhXf/jcOO1rexSqS6lkjPRHYTF+QJ6ESMxBHZLzWgfCXHoAHv+i5vPkB
 5UfEBv33cCV/J9ls/gLuOosvr39xtheZKsGA5hLgL5UPLKDNWLOZ694GDxpP7CEKww3IdyqPj6V
 c2KighvSizPW+DXm669cLONVl8MSsigLZKf21HKZ/05UWMVHEgFmMqwCaSM9lzqYAHz69Ml9hUk
 8Y4GABLLcs0J3VdwUA3mH+E3Spx3Ay0i9asFhugepJFyJeYJ0ua+Wj06E/FLUleMErmZTYkH3xi
 gDjPZTWFA6hJivb3zawzp/m8/YRbq5cy0gEgy1i64hgU/He8Hu5FDVNNZVvtj6J9M88xwMfwbTA
 HD7ry6S96Ma1FAGcZHpa3Yg==
X-Google-Smtp-Source: AGHT+IHDNU386uIUwUF/mHnf/bgqwaRjmZOlnO+lItWsTHBze3iNn5zEBFyLd0IA/2YhYBktJjqc2w==
X-Received: by 2002:a17:903:2309:b0:268:cbf:5267 with SMTP id
 d9443c01a7336-26813f1d18emr8819845ad.59.1758086426237; 
 Tue, 16 Sep 2025 22:20:26 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2651ca217f8sm88625545ad.47.2025.09.16.22.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 22:20:25 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 37B31420A80B; Wed, 17 Sep 2025 12:20:23 +0700 (WIB)
Date: Wed, 17 Sep 2025 12:20:22 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Cc: Buildroot Development <buildroot@buildroot.org>
Message-ID: <aMpFFo96JmNi24Zq@archie.me>
References: <aMjHPLJ5qHp_TTju@archie.me>
 <20250916084217.4db9aa85@pc-1>
MIME-Version: 1.0
In-Reply-To: <20250916084217.4db9aa85@pc-1>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758086426; x=1758691226; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wPHl0sZdZRohYc20EAjvcYwEAE5TrOptQ6Vs00CG8RY=;
 b=XDuUZO+20hokvwskrHNjUoDcEZbidmbvLuk/WLsPWQybqKOxQTVjUPdraSuqFw7A4k
 BvCMbkb3gAJDfSU0fgnCgKaWxd0nNiEV7P5LuRctryvyIYPJlblWP4wVAXhLejb7Jga1
 SHD9Wh8rFnTgWMZmytjCN6YdLdzawsdban4wbWuf8sBzfz+z/lSRFQEJw1EpUpHAvYDH
 MCWherp3QwlbcZ5yt5GW1m0KaEvPaQ0RGKAgdXKEC1JW2fHG6SmaCKni/14vqi1Gt4iZ
 q538P2jbqhNgtG+hCn740wUzJi0y+tjYjgsuTZNYB8WnLVE9E3yFxjnjkjiE8PXHqLIC
 IOTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XDuUZO+2
Subject: Re: [Buildroot] libreadline undefined symbol error when generating
 rootfs tarball
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
Content-Type: multipart/mixed; boundary="===============3933055223837714820=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============3933055223837714820==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4ulvG9+Y1E5ig3sw"
Content-Disposition: inline


--4ulvG9+Y1E5ig3sw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 08:42:17AM +0200, Peter Seiderer wrote:
> The following patch fixed the problem for me:
>=20
> diff --git a/package/readline/readline.mk b/package/readline/readline.mk
> index f69cbe45e2..078607a0c5 100644
> --- a/package/readline/readline.mk
> +++ b/package/readline/readline.mk
> @@ -15,6 +15,10 @@ READLINE_CONF_OPTS =3D \
>  	--disable-install-examples \
>  	--with-curses \
>  	--with-shared-termcap-library
> +HOST_READLINE_CONF_OPTS =3D \
> +	--disable-install-examples \
> +	--with-curses \
> +	--with-shared-termcap-library
>  READLINE_LICENSE =3D GPL-3.0+
>  READLINE_LICENSE_FILES =3D COPYING
>  READLINE_CPE_ID_VENDOR =3D gnu

Applying your patch, I get another build error (this time on gdb):

```
  CXX    init.o
  CXXLD  gdb
/usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: und=
efined reference to `tgoto@NCURSES6_TINFO_5.0.19991023'
/usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: und=
efined reference to `UP@NCURSES6_TINFO_5.0.19991023'
/usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: und=
efined reference to `tgetent@NCURSES6_TINFO_5.0.19991023'
/usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: und=
efined reference to `tgetnum@NCURSES6_TINFO_5.0.19991023'
/usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: und=
efined reference to `PC@NCURSES6_TINFO_5.0.19991023'
/usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: und=
efined reference to `tgetstr@NCURSES6_TINFO_5.0.19991023'
/usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: und=
efined reference to `tgetflag@NCURSES6_TINFO_5.0.19991023'
/usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: und=
efined reference to `BC@NCURSES6_TINFO_5.0.19991023'
/usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: und=
efined reference to `tputs@NCURSES6_TINFO_5.0.19991023'
collect2: error: ld returned 1 exit status
make[3]: *** [Makefile:2232: gdb] Error 1
```

Thanks.
=20
--=20
An old man doll... just what I always wanted! - Clara

--4ulvG9+Y1E5ig3sw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRbrR26Mw290jZcYHIVJRcAOONI5wUCaMpFDgAKCRAVJRcAOONI
5zJZAQCGue9aiZqVsydPcUUvrG56PhAbRt2WvM0XSC8n/hKftQEAu3zvL/Tlh16t
DwOKireEAfuCnJlQIkDgjnwttnMk5wI=
=Q7jN
-----END PGP SIGNATURE-----

--4ulvG9+Y1E5ig3sw--

--===============3933055223837714820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3933055223837714820==--
