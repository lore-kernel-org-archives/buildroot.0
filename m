Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5095AC0218C
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 11:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9B4E40720;
	Wed, 22 Jan 2025 11:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJcEbk8ZcIRy; Wed, 22 Jan 2025 11:09:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B4374038E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B4374038E;
	Wed, 22 Jan 2025 11:09:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 103BE959
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 11:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A7F241953
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 11:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1z8lMuVOZEqF for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 11:09:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=mwalle@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E4A9E41950
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4A9E41950
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4A9E41950
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 11:09:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F09E85C44F4;
 Wed, 22 Jan 2025 11:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5440C4CED6;
 Wed, 22 Jan 2025 11:09:25 +0000 (UTC)
Date: Wed, 22 Jan 2025 12:09:22 +0100
Message-Id: <D78K00ISVHNK.L2HSLYUAUNIT@kernel.org>
Cc: "Chris Packham" <judge.packham@gmail.com>, "Sergey Matyukevich"
 <geomatsi@gmail.com>, "Kilian Zinnecker" <kilian.zinnecker@mail.de>
To: "Arnout Vandecappelle" <arnout@mind.be>, "Romain Naour"
 <romain.naour@smile.fr>, "Edgar Bonet" <bonet@grenoble.cnrs.fr>, "Buildroot
 development" <buildroot@buildroot.org>
X-Mailer: aerc 0.16.0
References: <93f83afb-6987-441c-8e06-dab4d43b828f@grenoble.cnrs.fr>
 <D6UG5Z1HUN9N.GWVHB4L823ZC@kernel.org>
 <5576c173-c1a6-4c85-91dc-b8a6b0a54ba6@smile.fr>
 <5de84d6d-dafb-432c-9308-0b8d7e93fdd3@mind.be>
In-Reply-To: <5de84d6d-dafb-432c-9308-0b8d7e93fdd3@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1737544166;
 bh=tY84IDODuh/1rp5oyqdkp2hav9ellenEPx43iwm+djc=;
 h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
 b=t1UjOGNv8AQGqwXnRf8UVdFWr86F2KdOvrajHu6G0MFpqWi7YMlUdmY55yaB1dceU
 USnX4clIJhkY1gNnLOFXSo6lgTKjtE6BPGiz0PEHsydUfutp/twf3n5lrdrO4HpnXc
 rLzUOhs8Zj/dlncuXsPe4wAr8M6rnyu0F0j/3l4MXDgCZH5rLIA8Q+ewwghsVA2t9y
 qPuSf8goQzGtKsG0YObGhN0TNXXl3oIB0ZT1NXktA+4/T//eb+oCXsxldOvkJ/w2zQ
 2Zm9/esscsysgpkxU+AQFkaI+e3vTP4CMdhHjEjq2Y+yEjQKv+/HlhRdBUhFuFQ+2H
 LJiG+G+JLnyLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=t1UjOGNv
Subject: Re: [Buildroot] [PATCH v3 1/1] linux: make out-of-tree DTS work
 with newest kernels
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
From: Michael Walle via buildroot <buildroot@buildroot.org>
Reply-To: Michael Walle <mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2165020820927007276=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2165020820927007276==
Content-Type: multipart/signed;
 boundary=bcfd6b3ef5d24f7ced3661a10c13e596fd7b68dbd69aa96326b7340f3cb6;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--bcfd6b3ef5d24f7ced3661a10c13e596fd7b68dbd69aa96326b7340f3cb6
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Jan 22, 2025 at 11:52 AM CET, Arnout Vandecappelle wrote:
>
>
> On 22/01/2025 11:40, Romain Naour wrote:
> [snip]
> > The problem is that we define the path to the OOT dts file like this:
> >=20
> > BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=3D"board/acmesystems/acqua-a5/at91-sam=
a5d3_acqua.dts"
> >=20
> > So we can't extract the vendor prefix from it even if it would look lik=
e this:
> >=20
> > BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=3D"board/acmesystems/acqua-a5/dts/micr=
ochip/at91-sama5d3_acqua.dts"
> >=20
> > Note: the vendor prefix is not always one sub-directory:
> >=20
> >    arch/arm/boot/dts/ti/omap/dra7.dtsi
> >    arch/arm64/boot/dts/exynos/google/gs101.dtsi
> >=20
> > We probably need a new option to provide something like a dts "overlay"
> > BR2_LINUX_KERNEL_CUSTOM_DTS_OVERLAY (similar to BR2_ROOTFS_OVERLAY) to =
copy a
> > dts directory directly to $(LINUX_ARCH_PATH)/boot/dts/
> >=20
> >    BR2_LINUX_KERNEL_CUSTOM_DTS_OVERLAY=3D"board/acmesystems/acqua-a5/dt=
s"
> >=20
> >    board/acmesystems/acqua-a5/dts/
> >    =E2=94=94=E2=94=80=E2=94=80 microchip
> >        =E2=94=94=E2=94=80=E2=94=80 at91-sama5d3_acqua.dts
> >=20
> > Doing so, the BR2_LINUX_KERNEL_CUSTOM_DTS_PATH should be deprecated.
>
>   Alternatively, we can define an additional config variable=20
> BR2_LINUX_KERNEL_CUSTOM_DTS_DIRECTORY that contains the subdirectory to w=
hich=20
> the custom DTS is copied. So `microchip`, `ti/omap`, or `exynos/google`.
>
>   Disadvantage: we can't support multiple dts from different vendors.

As explained earlier, I'd aim for a solution which works in any
case.

> Not sure=20
> if that is going to be an actual use case, but people do crazy things... =
But I=20
> think for the common case (of only a single or a low number of DTSes that=
 all=20
> use the same CPU (family) so are in the same directory) it works well and=
 is=20
> much easier for the user.

The kernel supports multi (sub) arch. I'd prefer it if buildroot
would support the same. Think of an OEM who wants to build common
generic image shared between all its boards.

Esp. if it would be as 'easy' as splitting the current configuration
into a config for "/path/to/dts/files" and "list/of/board.dts
or/list/of/overlay.dtso". The later could also be the same option as
used for the in-tree kernel dts list. From a POV that might even be
easier. Also, the first option (which Romain calls _OVERLAY) could
also be a list, no?

-michael

--bcfd6b3ef5d24f7ced3661a10c13e596fd7b68dbd69aa96326b7340f3cb6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZ5DR4hIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ih5AGAgBQNwJIrostwTZ3q+9z44u5DtFaom5gQ
1/tQvkZ6ZegqOqxd8qZY1KG1PysZhO01AX44zAwAfOiWUM4dtoBncCAbufC0iIyK
GvqmLNYzlXtANIJtDBjbkhyiE6O7KelIjqE=
=UrCi
-----END PGP SIGNATURE-----

--bcfd6b3ef5d24f7ced3661a10c13e596fd7b68dbd69aa96326b7340f3cb6--

--===============2165020820927007276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2165020820927007276==--
