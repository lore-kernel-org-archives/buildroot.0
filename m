Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03623CD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 15:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B036661385;
	Thu, 18 Jun 2026 15:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9IVBKVtApMk; Thu, 18 Jun 2026 15:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD3306137E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781797130;
	bh=P9hQDpjawXQKL4sKhq0A6v15E8dJD23SdrOmNdbR3vM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vhp3xv3WQeBho7YsjTeRumsUaI575TOCeK73PZiaPpUVOWO3LaHdZ56maL3WTSV1N
	 m0efrra0l4nZkPrv+Se2sc91/F9y6z9Q26rIX4qxq5yMI4rC29uJbFUfw0esMOqO45
	 lvKMbZfLhf8ok+oSGP58snqnvB7Gs2PjOLWE7hcBpmrx8IfMeWr/cjGloqh/NsAlkg
	 dZRb3qMyTA8ZUA4u/JwUsyMRZZ9YcNQ738pRieLjSEyCfmhtQNUMlna4XpH5Ws5uT8
	 mwVMYcPtrniE0/L2P2Choh8C0JL426/QjH2rCm4WZzHfgpmPJMYn4PjtKNjEMTA9TQ
	 4W9+LKA9F4NkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD3306137E;
	Thu, 18 Jun 2026 15:38:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 645DD2BA
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 15:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E96640EEB
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 15:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lRYtAwkeleMD for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 15:38:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6019140F35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6019140F35
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6019140F35
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 15:38:48 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-399389dae7fso11273901fa.0
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 08:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781797126; x=1782401926;
 h=user-agent:mime-version:date:organization:references:in-reply-to:cc
 :to:from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+IDS1zrwlweO9q560r6OlyRDnJM6hhSQ56nhaf9mhCk=;
 b=C0JbapGPOWbPAz+aWc4kgKszu6C+BrKqy2xaxtRfTn0wXeUmBiQ+mloLSVLbkhp9ga
 xF9NTDAIRj0t6neclQaOxfj6vV//jbtuSWwR9y9vAkhYyR3uv0e82aCWo+1tGw6LRNQZ
 WOe7RnJhqLpkMUr6/hg3tCQptCktXybENL5IIXC92GgUfRdFG+DUvu9oAaHgWHZmdlMw
 E9qJNsUnqrjqg+6Kjg3eAtbHDzmJYarmk2TEA0LsdbQX+2VSzcEGAekXX4s1tYGZZ7RP
 viueS2a+jfSdycMCuPB+Ajz+1z8iWt1rhVqF3n1Mi2y4YxMY+Qdh7HUW4NIetxyazcm5
 +Q2Q==
X-Gm-Message-State: AOJu0YwuhEopiP2WzM0a6xdv6cVstQycWeQ/x2fD/fGrS6gkN+u+7G4A
 udd0iiTUks7dS5ePyBZ6cVPP9c1Cw4pvR5Ln6Yb51U1j5yTYULaeCViot0mB7Q==
X-Gm-Gg: AfdE7cm6IfYZDm5IoO2vKmI1F3B+JviQ3t4OEyLCJt6TUovLqHdWDL4oEKcQs97wwty
 qGDFV3ln5fpmorLvevY537O3uhfkJOQDThUlPuYKalee5q2HdD3urPG3G5m0XVnJdjvZcwy4QKn
 Jumn1LAWPMLwZtX9xs7YgNiUW8PktdMDI/YcfM4rOrHdpYYGLvjW6As3QZMVFc6o2a6RAAdE1HO
 ZpzaLdV3W8sU/C+2BDHppsMD0ZjHVi00Uy+5ZbtX3CIvodE5cLCDZTuJakGlJTQDmktUab2WOwk
 KCKTGDzNpFChNwzRZKLEXEr991zUrmvClBRVZjYHEi3nKnwJSQxoU8woQod/pt/Gr/dLMKkkQIr
 PwFuLvA6Cr90hqQyvGvn5x5TWXneB9C0OrnFgy1fzc1G51/bFddec/s2x+Wt2cBh5x+6anDyXFN
 I6LdoJrjkfX5pGPI4C59cmCzwqRSiiR6oSv5Iz6HJCWZ0Yoqx5HNby
X-Received: by 2002:a2e:bc28:0:b0:38e:8082:63fe with SMTP id
 38308e7fff4ca-3997761d4cdmr12859461fa.11.1781797125749; 
 Thu, 18 Jun 2026 08:38:45 -0700 (PDT)
Received: from [192.168.0.42] (h-158-174-22-86.NA.cust.bahnhof.se.
 [158.174.22.86]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-39973801cedsm12504531fa.40.2026.06.18.08.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 08:38:44 -0700 (PDT)
Message-ID: <858fbaec338f0231fb1bdac2fd0bbcc645565add.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org
In-Reply-To: <61a708aa-e992-4b77-9d50-adff450cb378@bubu1.eu>
References: <20260606182032.3803327-1-fiona.klute@gmx.de>
 <61a708aa-e992-4b77-9d50-adff450cb378@bubu1.eu>
Organization: wires.se
Date: Thu, 18 Jun 2026 17:38:44 +0200
MIME-Version: 1.0
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781797126; x=1782401926; darn=buildroot.org;
 h=user-agent:mime-version:date:organization:references:in-reply-to:cc
 :to:from:subject:message-id:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+IDS1zrwlweO9q560r6OlyRDnJM6hhSQ56nhaf9mhCk=;
 b=mvV3a0dX9V1SgFTQiQYObHOxOvURX/65bFAbPLN3I8FpZIj/g1EL4e45cRFx7kS51c
 BZyb9+yw7WhuFD0g4pVDZrVvrj1CdwPiMIew16ka/2s7uBEyTAN7o9sjB/mbQUNFgv7x
 nDAhZGpVNnZe7/AmNwfsi7IFLRKWGZYgVjsiRbQyU94jNbv0HByFHP2iRRU0xljkv8gv
 ee1D1l9N0taIHXqX9UZ7nAJIZzK+YRmfzhOKhVZ9nBgZ8uiex/vR8xJb1030FziacCga
 2VOTPexK59zEqqb1cJiDK7hwyma4QYnTv8Sw9amwHxw+tZSthaOPpjCf4QaZKyZxeeKh
 Pd3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=mvV3a0dX
Subject: Re: [Buildroot] [PATCH 0/4] fix shellcheck 0.10 & 0.11 warnings
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
Content-Type: multipart/mixed; boundary="===============4316830180935415818=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4316830180935415818==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-UHl16le9b+KIX+0XhMri"


--=-UHl16le9b+KIX+0XhMri
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-06-17 at 14:28 +0200, Marcus Hoffmann wrote:
> Joachim, you submitted and are mentioned in the DEVELOPERS file for=20
> mdnsd, do you think you can submit a runtime test for it?
>=20
> https://nightly.buildroot.org/manual.html#_using_the_runtime_tests_framew=
ork

Sure, just went on vacation, so this could a fun little project =F0=9F=99=
=82
I'll see what I can do.

Best regards
 /Joachim


--=-UHl16le9b+KIX+0XhMri
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEShHhOTSGNO9JnOys7Kgmo3tsdAkFAmo0EQMACgkQ7Kgmo3ts
dAnyKxAAj+CQd6hwCtv5h+8HGlB27x3OCDaA5YFORpY/FK40N3I0B8fsxQgQ3r7Z
pLLXh3ZptxgAl2Xf2sWGdcqH9IRwJPAPHjgp8fMYT2KEuCrI5Q1Zol512kUQF6id
3t2XKJa84kB1Jj7gddO4x+f/fFK52eIytAi+JQUwHs7b0GF9rVkk0DogdX9W+kUc
0SEmkHBkQPM7PpOPwTbdYRHEPHjAA2s3i+dOz+i39gyz6vP+dgpVosE8M6DasXir
/Yn/koQl0Tc6el+q+RgmbDhyr9rCGxNixg+s8+DI8q4uOaLQhbkL+EWFiYCE9cqu
PePsCSzfGdDVZWoM9Wbdo8yx5qBGF0yJTmXk2hfyoQVUpJUKY/gehhppvMqEJ+mq
9znfFGBWHifh7Cs/V/jMDl3iUeoMDFRC54b9tILP4R0JWnR5+QUpWMz8mXyOjmjw
mJmePnMz/GxqJbCATigpIhn/kpYcRpC9q+lnw93ifM8KOwkPbkYaxSl75oosAk8s
f5z7yfGQBhhpt12zzTKgUvt86BKswk/Krbv5/0f6wrP/XGD8gSBBH4CEGm33RQdF
iSPCLCQ5PvWAEqstI4d7wgDieWO0o98jLTiY2Q+3g5sv0xqoZQy/qKE7TECwCf9c
yJB+KL7xn9CnjhyqyCAh1+nc8HYr7L9E3wXsUxmaIWqPUpVQQNQ=
=smS/
-----END PGP SIGNATURE-----

--=-UHl16le9b+KIX+0XhMri--

--===============4316830180935415818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4316830180935415818==--
