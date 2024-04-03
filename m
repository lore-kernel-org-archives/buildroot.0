Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E702CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 13:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE4BF40AF9;
	Wed,  3 Apr 2024 13:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P91gX_8iwDL5; Wed,  3 Apr 2024 13:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0FAB41710
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0FAB41710;
	Wed,  3 Apr 2024 13:00:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 01B361BF28B
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 13:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED1EE8179B
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 13:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4b1dxs7tpWsb for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 13:00:07 +0000 (UTC)
X-Greylist: delayed 480 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 03 Apr 2024 13:00:06 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2BE888135C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BE888135C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:4f8:c0c:9d57::1;
 helo=mail.3ffe.de; envelope-from=michael@walle.cc; receiver=<UNKNOWN> 
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BE888135C
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 13:00:06 +0000 (UTC)
Received: from localhost (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id CB0F7957;
 Wed,  3 Apr 2024 14:52:03 +0200 (CEST)
Date: Wed, 03 Apr 2024 14:52:02 +0200
Message-Id: <D0AI2GKZER72.370J2MVIQONWP@walle.cc>
To: "Romain Naour" <romain.naour@smile.fr>, "Dario Binacchi"
 <dario.binacchi@amarulasolutions.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.16.0
References: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
 <37a25304-2bd9-4125-8031-da3857708294@smile.fr>
In-Reply-To: <37a25304-2bd9-4125-8031-da3857708294@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=walle.cc; s=mail2022082101; t=1712148723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=nJaxxoJmYVABXH2leXvCUPRrxPkc6yVG8mnXSRwrct0=;
 b=ff5PMKnKGLloscJWr+MUpUzT7Y72VWRBlUlG9JeNaeYWMfxM0whRUCPghH+kG0T8xBWLyi
 Cfzg8ZopJ9HNAV1BZyB0phkJee5Ql8RAL60OZKkAxsZYYt64KItmooxnP0q+/8mG7F2NS6
 NQnukMSTq9F0IKm7mZZTckrJyJiyuLQHc90a2jemMsxhpKrdoEeQgHFsRiFbYbf9Y5D5P3
 IwU68oZINbWbc+ylEq55wrjZ2IbK7gLNDV1EeeFbN34XLR2S1UoB9l+z0tn/Rm1HzzPlYf
 iz4kiILBJeVG8fLUYPcAixPhjnI8pKgFUMXgkMrIZK7BxZv+I4bLVrJ91casCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=walle.cc
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2022082101 header.b=ff5PMKnK
Subject: Re: [Buildroot] [PATCH v10 00/12] Add support for AM62x-SK HS-FS
 devices
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
From: Michael Walle via buildroot <buildroot@buildroot.org>
Reply-To: Michael Walle <michael@walle.cc>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, "Yann E . Morin" <yann.morin.1998@free.fr>,
 bryce@redpinelabs.com, Andreas Dannenberg <dannenberg@ti.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9185616359215962433=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9185616359215962433==
Content-Type: multipart/signed;
 boundary=e0118b7873c82132b4e72d8ca6e14d8bcfcea0330b009ae2f3db2bca23c1;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--e0118b7873c82132b4e72d8ca6e14d8bcfcea0330b009ae2f3db2bca23c1
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Romain and all,

On Wed Apr 3, 2024 at 11:17 AM CEST, Romain Naour wrote:
> Le 30/03/2024 =C3=A0 17:02, Dario Binacchi a =C3=A9crit=C2=A0:
> > The SK-AM62B-P1 is the newest version of SK-AM62 which includes
> > high-security field-securable (HS-FS) silicon to optionally customize k=
eys
> > and encryption for security applications.
> > This requires enabling the BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS opt=
ion,
> > which, however, was buggy. This series fixes the errors and bumps the L=
inux
> > kernel and U-Boot required for such a new device.
> >=20
> > Furthermore, this version complete the series by updating the
> > ti_am64x_sk_defconfig as requested by Romain Naour:
> > https://patchwork.ozlabs.org/project/buildroot/patch/20240224205654.154=
6744-17-dario.binacchi@amarulasolutions.com/
> > I have successfully executed compilation tests for all possible combina=
tions of platform and security type:
> > am62x -> GP, HS, HS-FS
> > am64x -> GP, HS, HS-FS
> >=20
> > The AM62x HS-FS configuration has also been tested on the SK-AM62B-P1 b=
oard.
> >=20
> > Version 9 has merged the first 10 patches into the mainline. This versi=
on
> > therefore contains the remaining patches to which the patch suggested b=
y
> > Yann E. Morin has been added ("boot/ti-k3-r5-loader: drop hash for vers=
ion
> > 2022.10" [1]), and has removed the patch "boot/ti-k3-image-gen: remove
> > package", which is not strictly required by the series and does not cau=
se
> > regressions.
>
> Thanks for this new iteration (and thanks to all tester).
>
> I would like to rework this series to improve and complete the TI K3 SoC =
support
> post a V11.

Great, thanks!

> We are confident that the BSP (ti-k3-boot-firmware, u-boot 2024.01 with b=
inman
> and kernel 6.1.18) is working well on AM62, AM64 and even j721e (with ano=
ther
> series on top).

FWIW, we are currently testing this on j722s (although there is no
u-boot support in mainline yet) and it is working almost fine, with
some minor issues for now, see my previous mail on 6/12.
Of course we are using more up to date versions of all the involved
components, but that seems to be just a version bump in the future.

-michael

--e0118b7873c82132b4e72d8ca6e14d8bcfcea0330b009ae2f3db2bca23c1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZg1Q8hEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+E2QAX9E8B/8u9lQ54bR0apenijzBN7KFi+p5cpa
Mo7VE8LvLfqgyrTxTIHDhJs8WDs0q1ABfiPs9hvjQ879z10LTP5ABZX25B6NzyZ8
BVow2H5fyeSHU/xR8M0NmDYw+l0kb4BLWA==
=f9vC
-----END PGP SIGNATURE-----

--e0118b7873c82132b4e72d8ca6e14d8bcfcea0330b009ae2f3db2bca23c1--

--===============9185616359215962433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9185616359215962433==--
