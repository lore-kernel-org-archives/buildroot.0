Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6C8C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 10:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C99C41830;
	Sat, 18 Feb 2023 10:16:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C99C41830
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Zkoje9pEkmw; Sat, 18 Feb 2023 10:16:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28CDC41C88;
	Sat, 18 Feb 2023 10:16:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28CDC41C88
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD8851BF5DB
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 10:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8719841C88
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 10:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8719841C88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HPSy5C4KzMiE for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 10:16:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E8C441830
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E8C441830
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 10:16:31 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 gt5-20020a17090af2c500b00233d7314c1cso432183pjb.5
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 02:16:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dm+kAgCufdamw7PdIuDAxPcfrWU7nsf1flFOFGauirg=;
 b=Fwug2cJOqfbC3kPHp8N6WnSetW5JPyqGqiLLkUUaSrF/42XmJqEmtpOMHbMpDMIZZQ
 epQ87uoBVkGwWYHENjYx4PNtxT7ZO1sDwSOuDtihDa3b+Oh32QlzjjaB4bb1qZIxJ2b0
 Jxw1M6xQOV1/sTAUOB0GUusEMt1gJT2yFt6G85loOSEtt1fJH0WOVjZLMOPEdiicEaWJ
 l8JcoGTgSuYQerdDpTJykU1Thisvv88vRic0qxcrbsMjLn/5tEHtWU850qKIJ60JIs6Y
 Gss6maRPvSLH0lMCavlZ0dEsYbBqcDmaKl6AFYF9UcZE3ukPlwVXlXYEHGX2AGvYLxvS
 RPOg==
X-Gm-Message-State: AO0yUKVp1Ay59I8Cv24NFAxHv7t+b/tfAe1UFW7GAaHbShHl5uzC6MhH
 mQqLKZJQNW8VFkjJQLCGVfnTEt5FxlQ=
X-Google-Smtp-Source: AK7set88cn1GCWkB+QRA1VT2RBLSYViFz/DDJP8sNextOy4TEI0wBqYTcHjNaI9aUi7CKfVgYiD23w==
X-Received: by 2002:a17:90a:50:b0:233:f371:35db with SMTP id
 16-20020a17090a005000b00233f37135dbmr329787pjb.4.1676715390402; 
 Sat, 18 Feb 2023 02:16:30 -0800 (PST)
Received: from debian.me (subs28-116-206-12-56.three.co.id. [116.206.12.56])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a17090a950100b002308e6e645bsm4122563pjo.49.2023.02.18.02.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Feb 2023 02:16:29 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id 6BBAF105E25; Sat, 18 Feb 2023 17:16:27 +0700 (WIB)
Date: Sat, 18 Feb 2023 17:16:27 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot <buildroot@buildroot.org>
Message-ID: <Y/ClewHezrg+Z3hx@debian.me>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Dm+kAgCufdamw7PdIuDAxPcfrWU7nsf1flFOFGauirg=;
 b=h3CtfQ1TQ15SrxgiVNAHt87ldIvkfC3m9q037X/4Ch42r8RI0JF591MdPknYRnb6Yy
 +DbvIsl2+juQkgUyyiF+HxTW6DNERsRJle8gp1jXorqE+5pZxpjA1GW1dBWKuEMKixEY
 YKdJf2/Z+dH52ELNlNcWKFXh3qr1sKpc0Ys6yLPSG+KTZXjqBSbzLdJv+yO2E3prNHu2
 dQ9GZjtcP367g+FS+2OjFUgefS2j5f4UCm8jEPhj1lUY22gyQsoc/U5gp1UY8DbwjH7r
 m4P20uifmRDgR6IGPQPlcG2oc9BcEjMr24mQMWVKMr3Hx3M2wx3pTUucEgPo0UrVEcMs
 imJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=h3CtfQ1T
Subject: [Buildroot] (no subject)
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
Cc: Michael Fischer <mf@go-sys.de>, Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: multipart/mixed; boundary="===============4594022975438843410=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4594022975438843410==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iPn+4lyGXZ6QJhn1"
Content-Disposition: inline


--iPn+4lyGXZ6QJhn1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

(resend again with revert patch removed)

Hi,

I found that package/gnupg2 (version 2.4.0) fails to build, complaining
about unsafe search path for cross-compilation. I found this when
test-building for my git bump at [1].

The excerpt from the build log was:

make[4]: Entering directory '/home/bagas/repo/buildroot/output/build/gnupg2=
-2.4.0/common'
/home/bagas/repo/buildroot/output/host/bin/aarch64-linux-gcc -DHAVE_CONFIG_=
H -I. -I..  -DLOCALEDIR=3D\"/usr/share/locale\" -DGNUPG_BINDIR=3D"\"/usr/bi=
n\"" -DGNUPG_LIBEXECDIR=3D"\"/usr/libexec\"" -DGNUPG_LIBDIR=3D"\"/usr/lib/g=
nupg\"" -DGNUPG_DATADIR=3D"\"/usr/share/gnupg\"" -DGNUPG_SYSCONFDIR=3D"\"/e=
tc/gnupg\"" -DGNUPG_LOCALSTATEDIR=3D"\"/var\""        -D_LARGEFILE_SOURCE -=
D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -I/home/bagas/repo/buildroot/=
output/host/aarch64-buildroot-linux-gnu/sysroot/include -I/usr/include -I/u=
sr/include -I/usr/include -Wall -Wno-format-zero-length -Wno-pointer-sign -=
Wpointer-arith -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BIT=
S=3D64  -Os -g0 -D_FORTIFY_SOURCE=3D1 -c -o t-stringhelp.o t-stringhelp.c
/home/bagas/repo/buildroot/output/host/bin/aarch64-linux-gcc -DHAVE_CONFIG_=
H -I. -I..  -DLOCALEDIR=3D\"/usr/share/locale\" -DGNUPG_BINDIR=3D"\"/usr/bi=
n\"" -DGNUPG_LIBEXECDIR=3D"\"/usr/libexec\"" -DGNUPG_LIBDIR=3D"\"/usr/lib/g=
nupg\"" -DGNUPG_DATADIR=3D"\"/usr/share/gnupg\"" -DGNUPG_SYSCONFDIR=3D"\"/e=
tc/gnupg\"" -DGNUPG_LOCALSTATEDIR=3D"\"/var\""        -D_LARGEFILE_SOURCE -=
D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -I/home/bagas/repo/buildroot/=
output/host/aarch64-buildroot-linux-gnu/sysroot/include -I/usr/include -I/u=
sr/include -I/usr/include -I/usr/include -DWITHOUT_NPTH=3D1 -Wall -Wno-form=
at-zero-length -Wno-pointer-sign -Wpointer-arith -D_LARGEFILE_SOURCE -D_LAR=
GEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -Os -g0 -D_FORTIFY_SOURCE=3D1 -c =
-o libcommon_a-i18n.o `test -f 'i18n.c' || echo './'`i18n.c
aarch64-linux-gcc: ERROR: unsafe header/library path used in cross-compilat=
ion: '-I/usr/include'
make[4]: *** [Makefile:1283: t-stringhelp.o] Error 1

Reverting 0f868e97f6b4 ("package/gnupg2: bump to version 2.4.0") made the e=
rror above
gone, thus the problem was in upstream code.

This issue is also confirmed by autobuilder (example log is [2]).

The full build log is attached.

If the revert is desired, the patch is at [3].

Thanks.

[1]: https://lore.kernel.org/buildroot/20230218085837.350535-1-bagasdotme@g=
mail.com/
[2]: http://autobuild.buildroot.net/results/5bf00af86da6e41d1a48abc7304bf33=
9908a0150/build-end.log
[3]: https://lore.kernel.org/buildroot/20230218101426.630874-1-bagasdotme@g=
mail.com/

--=20
An old man doll... just what I always wanted! - Clara

--iPn+4lyGXZ6QJhn1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQQJRmM4Nl+8BKPNGvtCNk3+7YYOdAUCY/ClewAKCRBCNk3+7YYO
dAKNAP9GWEAah9A/bdG9c4Mq0qmsTaIn9CnXjkI2tpPxm5tHgAEAgKqanqvM8OTU
1wRKo71+OEbG9dJXnyO/p523SUgjLLo=
=0haz
-----END PGP SIGNATURE-----

--iPn+4lyGXZ6QJhn1--

--===============4594022975438843410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4594022975438843410==--
