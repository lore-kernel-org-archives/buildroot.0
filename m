Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C20CD1284
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 11:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49629812BF;
	Thu,  4 Apr 2024 11:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qu4VFpcXJIw8; Thu,  4 Apr 2024 11:04:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E7B3812A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E7B3812A0;
	Thu,  4 Apr 2024 11:04:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6EEE81BF3C8
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 11:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6887A8129E
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 11:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xk2W0FRGXRlu for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 11:04:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:4f8:c0c:9d57::1;
 helo=mail.3ffe.de; envelope-from=michael@walle.cc; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 65CA78128B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65CA78128B
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65CA78128B
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 11:04:40 +0000 (UTC)
Received: from localhost (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id B7C9A855;
 Thu,  4 Apr 2024 13:04:37 +0200 (CEST)
Date: Thu, 04 Apr 2024 13:04:10 +0200
Message-Id: <D0BAEFA95U59.21GTZHTZRDS1A@walle.cc>
To: "Romain Naour" <romain.naour@smile.fr>, "Heiko Thiery"
 <heiko.thiery@gmail.com>
X-Mailer: aerc 0.16.0
References: <20240403195403.1359007-1-romain.naour@smile.fr>
 <CAEyMn7YZB0q1p56F4ECOemAEbJReDUDLUuKBQyp6H016gCL7Fg@mail.gmail.com>
 <edac4a6e-c07a-48ce-9f9a-13928f8c898a@smile.fr>
In-Reply-To: <edac4a6e-c07a-48ce-9f9a-13928f8c898a@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=walle.cc; s=mail2022082101; t=1712228677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=phKMvSgVe3di6wBqY7vb5HheYEmS7ydccEQZQ2tBBoc=;
 b=WI020KQG0hg6B+5RUVmvYrjLnBOoGumiAlF81RuQ1K9KsYZ9WjfLNSzpZuZZsPfTeTpSPp
 Pcx2GL6EZ3HLSMCeUz4vlxBL7d4zSzhKjRKVq0i7Kp/Llnqhpmfmc5nClz1g/pMwWrdePF
 OQmdcuHVWuiWPZVoyRBESZFNj8Z/6p6ESFVL0Lr3aNAX8o+av5VbyjwSUVkhfoMP2+p4+G
 aZkIHx2watlD+ljFunnWTYHVLdF54TOZubFZVCfqNo23kC67Jr1LonxtwtdmVHYZuh3rYX
 lCQ7wNCVglj1pDQ3eLqyY1yHl0Qg6y5/J9Wb0PiVUdDJf6RdEL+W5DZbIXpm2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=walle.cc
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=walle.cc header.i=@walle.cc
 header.a=rsa-sha256 header.s=mail2022082101 header.b=WI020KQG
Subject: Re: [Buildroot] [PATCH v11 00/17] Add support for AM62x-SK HS-FS
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
Cc: buildroot@buildroot.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6836851727084283468=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6836851727084283468==
Content-Type: multipart/signed;
 boundary=b1d44e1cc6e0c2c599a549ec2164903f6a7167f96cb756f9ca63fcddc7e1;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--b1d44e1cc6e0c2c599a549ec2164903f6a7167f96cb756f9ca63fcddc7e1
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Romain,

thanks for working on the series!

> > I know there are some discussions ongoing about the handling of the
> > BR2_PACKAGE_TI_K3_SECTYPE_X and BR2_PACKAGE_TI_K3_SOC_X. I see that
> > these variables are only used for selecting the right value for
> > BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN.  Since we can set this value
> > directly for each defconfig I think we can get rid of all this stuff.
> > Nevertheless there is a problem with the
> > BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN since it is not possible to
> > select a value in menuconfig because of the missing help text.
>
> It seems easier to select the SoC variant and the Sectype using two boole=
an than
> letting the user to provide the right file name in
> BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN from the defconfig.

Doesn't seem easier to me to update the package each time a new SoC
is introduced. Besides..

> Is a use case where the we must use a custom tiboot3*.bin name ?

..you are literally encoding the board name "-evm" of the TI EVM
into that name. So it is unusable for any other board. E.g.  there
is already this board upstream:
https://elixir.bootlin.com/u-boot/v2024.04/source/arch/arm/dts/k3-am625-phy=
core-som-binman.dtsi#L14

As I said, that filename is just a free form type of filename and
the dtsi author is free to choose its naming.

IMHO with the removal of the image gen package, there is no need
for the SOC and SECTYPE choice anymore, as it is just used to
assemble the board specific filename which will end up being the
tiboot3.bin. But u-boot is already choosing the default tiboot3.bin
for you:
https://elixir.bootlin.com/u-boot/v2024.04/source/arch/arm/dts/k3-am625-phy=
core-som-binman.dtsi#L60

Sorry for being so persistent, I really don't think this is the
correct approach. Just defaulting the binary name to tiboot3.bin
will probably handle most cases and for the oddballs, just set the
filename in the defconfig.

-michael

--b1d44e1cc6e0c2c599a549ec2164903f6a7167f96cb756f9ca63fcddc7e1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZg6JLBEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+MrIAX0XeOwknbcErPThDzHvq62BTog8Fn45JALS
ds69T47eqdO13527/WMLxI5nEiAPBb0Bf2kqGXeFftpZSUXwhIU+7tV1C/Z67GhN
bQUs1i0qK9kAFVdxNJh+bkI++HLoCuWIXw==
=xzUv
-----END PGP SIGNATURE-----

--b1d44e1cc6e0c2c599a549ec2164903f6a7167f96cb756f9ca63fcddc7e1--

--===============6836851727084283468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6836851727084283468==--
