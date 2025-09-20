Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D99CAC5A0
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 07:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 377A5821FB;
	Sat, 20 Sep 2025 07:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3bWQMdBG23l; Sat, 20 Sep 2025 07:05:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DF2981E77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DF2981E77;
	Sat, 20 Sep 2025 07:05:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BAF6CE7
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 07:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABEF36158C
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 07:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GCBsXE8MyPrO for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 07:05:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9949C61577
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9949C61577
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9949C61577
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 07:05:29 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2445805aa2eso28501365ad.1
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 00:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758351928; x=1758956728;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wx26/4ehoFp3uGanuYxNVsnTCbd+a9G2UA3Eb/wzi/A=;
 b=IMQxDfJA3OgKOGwN8etZCDSnk8rtbNo/EII8kot8jcu9GRD/jHPL2LD/ho+0vGDNP6
 BL/y+GbVpG1cZVSBvve0kDU+OSZ25LJ7Cj/seYr/zbch6PRV7BxkJs5u5oIdurDLxMCd
 ZEGckH2RrOgnM2zdLeKmXPbjbJIdcVE5cJW+zWsnpcR+jIUt0hQTFpqMD+VVVadageON
 MsgMyijtd7UxxEREAj95mDvlshQxX7JJrsoQ79FYbP5xxToph3p8Y/iOFNcW6tZSci2J
 71GBdimnQ8jOFGlrKLy3l0nNiAIkWZYYbiQ2LXfirn7NWbUtF1FQ0OrTVwAzppNstaUQ
 5KJQ==
X-Gm-Message-State: AOJu0Yz3Hvv2lbxHS2bV7cDVDnsO5u60z0ZzvlLV9jCY1CC+89XwT+0m
 BDL6vCJyTv1PHX9JdWQM0wqh6isQ4dtVGb0F6Uhkt7jS0HwneR9Atd+UeVYw7M2Q
X-Gm-Gg: ASbGncvun5cFPZt4RwJ3yfyfIawQbm5Ej7ORG42WcoGkXJgBlgGYW3pWR04kmQvR3UV
 xnlrxTLI3I1ihkM2MjjD240O+J/pHJMQ55AalGnmIbI7dnFHFVsgmKOa87FmJZU7bQidqGWfyCN
 Scdc/gLfH40v9du/NDecAEobjGqiLLeYPPPm46xxhTKvbAkQ2KPDYwCbTlm8Z+Ws8i9jJozzscB
 VhlXOQWwarJiFj04SwzfJbfUMTTr9nL/CBMHHSBatrtgcPlY3Dc6IrO2PLgeSnFWpvNt40od/n2
 RKzp0AGPFuRjtvkqf8C0t3CDJb75Ils0h9r0nB/cf4jfDIU1CSByYmdRRJdUBj0sNZXcp3jj6NY
 QXcMQGNMrTSQya6i9Wy/wRA==
X-Google-Smtp-Source: AGHT+IEl1maKYl7OxTHNbSdJPQ4JtFE3K+Lc8SRyb9UsLj4JW/P9UtTf7NVIKJhMPWOEZ5YHZvlmfg==
X-Received: by 2002:a17:903:1b6c:b0:261:1521:17a8 with SMTP id
 d9443c01a7336-269ba43dfffmr90333785ad.16.1758351928166; 
 Sat, 20 Sep 2025 00:05:28 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-269802de96esm73070585ad.76.2025.09.20.00.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 00:05:26 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 28C10420A80B; Sat, 20 Sep 2025 14:05:24 +0700 (WIB)
Date: Sat, 20 Sep 2025 14:05:23 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Cc: Buildroot Development <buildroot@buildroot.org>
Message-ID: <aM5SMwzk5RLYAn2U@archie.me>
References: <aMjHPLJ5qHp_TTju@archie.me> <20250916084217.4db9aa85@pc-1>
 <aMpFFo96JmNi24Zq@archie.me> <20250917172021.36e9bc72@pc-1>
 <9e835e4d-95bc-4b08-b5c5-65b4876a59bf@gmail.com>
 <20250918085231.0a1a6c88@pc-1>
 <0dd0aaf4-2777-4c3f-8e7e-83143c8e8836@gmail.com>
 <20250919162048.63853d57@pc-1>
MIME-Version: 1.0
In-Reply-To: <20250919162048.63853d57@pc-1>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758351928; x=1758956728; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Wx26/4ehoFp3uGanuYxNVsnTCbd+a9G2UA3Eb/wzi/A=;
 b=fZvdw+EBi7dIJVf0RIUY2fUGkblIIj5DbJsIHYy1cbXd8TNbycKmlEqgRG3aGIRYu1
 k31aPa3AGdbGum5i7qQCW5HFOF5qC5b0FazMMs0tIZ28XWJkh2bcuxn8hSS1rBdfnJP/
 QBo878JVFalCR2Jly5RB404p8whWy1xw8u2i8EucHj1gAT4t8SE3bptEo0Cy1h6xSXYi
 ZuIwqwBGMl2/0th75dQcXy1EiVCN+8QIY6MyulU12DUfkXoN0P8sUylNhDioqtSwthRw
 DD8AXzKajEzkkErYFCvoTrOsDGMIIkP3elz1DV0G7gqYdCc0IGT3QWKTnaWIKd5wVqaw
 3ngw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fZvdw+EB
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
Content-Type: multipart/mixed; boundary="===============1492891943094018763=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1492891943094018763==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AFbXgBIGSKl4N+mx"
Content-Disposition: inline


--AFbXgBIGSKl4N+mx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 04:20:48PM +0200, Peter Seiderer wrote:
> On my system:
>=20
>         $ nm -A ./host/lib64/*.so | grep tputs@NCURSES6_TINFO_5.0.19991023
> ./host/lib64/libreadline.so:                 U tputs@NCURSES6_TINFO_5.0.1=
9991023
>=20
>         $ ldd ./host/lib64/libreadline.so
>         linux-vdso.so.1 (0x00007f6e7f520000)
>         libtinfo.so.6 =3D> /lib64/libtinfo.so.6 (0x00007f6e7f452000)
>         libc.so.6 =3D> /lib64/libc.so.6 (0x00007f6e7f200000)
>         /lib64/ld-linux-x86-64.so.2 (0x00007f6e7f522000)
>=20
> With the following patch:
>=20
> diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
> index 864f62b57c..a837ac96bf 100644
> --- a/package/ncurses/ncurses.mk
> +++ b/package/ncurses/ncurses.mk
> @@ -162,7 +162,9 @@ HOST_NCURSES_CONF_OPTS =3D \
>  	--without-ada \
>  	--with-default-terminfo-dir=3D/usr/share/terminfo \
>  	--disable-db-install \
> -	--without-normal
> +	--without-normal \
> +	--with-termlib \
> +	--disable-widec
> =20
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
>=20
>=20
> 	$ ldd ./host/lib64/libreadline.so
> 	linux-vdso.so.1 (0x00007f1b32fd3000)
> 	libtinfo.so.6 =3D> /home/seiderer/Work/Buildroot/build_aarch64_gdb_libre=
adline_001/host/lib/libtinfo.so.6 (0x00007f1b32f2a000)
> 	libc.so.6 =3D> /lib64/libc.so.6 (0x00007f1b32c00000)
> 	/lib64/ld-linux-x86-64.so.2 (0x00007f1b32fd5000)
>=20

Your patch works! I can generate SDK tarball now.

--=20
An old man doll... just what I always wanted! - Clara

--AFbXgBIGSKl4N+mx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaM5SLwAKCRD2uYlJVVFO
o0Q/AQDB4ZS7oNkdVskPUfztP0fK69LjCcBWS7C9vtb6/wW43QEAtDArzKYibaTu
RnoY3FZIK1LVjBMLIRRPVnolPesD4g0=
=qPa7
-----END PGP SIGNATURE-----

--AFbXgBIGSKl4N+mx--

--===============1492891943094018763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1492891943094018763==--
