Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327AFCD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 13:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B83B741719;
	Wed,  3 Apr 2024 13:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id If5i_M74OniF; Wed,  3 Apr 2024 13:05:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C92041704
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C92041704;
	Wed,  3 Apr 2024 13:05:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E77A1BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 13:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BB7782164
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 13:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bq39Nr12o1oy for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 13:05:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=mwalle@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E9B282168
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E9B282168
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E9B282168
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 13:05:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 73B846140F;
 Wed,  3 Apr 2024 13:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3603C43399;
 Wed,  3 Apr 2024 13:05:49 +0000 (UTC)
Date: Wed, 03 Apr 2024 15:05:46 +0200
Message-Id: <D0AICZ7BOW8A.2PLPZEPK1YG2E@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>,
 <buildroot@buildroot.org>
X-Mailer: aerc 0.16.0
References: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
 <20240330160244.3214733-7-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20240330160244.3214733-7-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1712149550;
 bh=iaY+ptNyfLHjfG1mZqiH7n9w55k+Ysh3Yfsxa5WpYOM=;
 h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
 b=buV7hCyc70dim/ikH4JdmvMtFmvQbYraohGD3RBreRdCkPEYNVbm8u3WfEWjz2UCJ
 lxjnQgX9wdgdHXV0GXgP9eWLRRo+tpXGqAM/tMTPcP5jNqTY+amgZR1mb35hYH5I20
 tMrQisis7T0xrHt93jHDgwaqucLcZoUhIb/29bb4NL51Jq1vdWk+bMDsA3FLiWsyCt
 Ul5U31HhXYNeX5REmwusBIpEopYUiJAcsjldy1JO1a9g07E2fBrgmEwTTdTac4sA0t
 edHjGdZldzdOQCbtqdI90lwuEw9UHifgb5vRHvXCk4TrEOpTCxIUZq5/WbzzHnCb3n
 /8nXjRtAao6VA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=buV7hCyc
Subject: Re: [Buildroot] [PATCH v10 06/12] boot/ti-k3/ti-k3-r5-loader:
 install tiboot3.bin
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
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>, heiko.thiery@gmail.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, "Yann E . Morin" <yann.morin.1998@free.fr>,
 bryce@redpinelabs.com, Andreas Dannenberg <dannenberg@ti.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4322179165048502640=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4322179165048502640==
Content-Type: multipart/signed;
 boundary=f3d704d24aabdec5e2a52c6f4cc4ae47caec84b45d2418aaa2aaf2842ca8;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--f3d704d24aabdec5e2a52c6f4cc4ae47caec84b45d2418aaa2aaf2842ca8
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

[resend because mail got bounced on the ML, sorry]

Hi Dario,

On Sat Mar 30, 2024 at 5:02 PM CET, Dario Binacchi wrote:
> Recent versions of U-Boot are capable of building tiboot3.bin using
> Binman. In this case, let's copy it to the binaries directory.
>
> The use of `find' command is justified by the need to use a regex
> expression to select the correct file. This is not possible with a
> simple `cp' command.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---
>
> Changes in v8:
> - Use the `find' command in pipe with the `cp' command.
>
> Changes in v6:
> - Replace `find' command with `cp' one.
>
> Changes in v5:
> - Replace tiboot3-*-$(TI_K3_R5_LOADER_SECTYPE)-*.bin with
>   tiboot3-$(TI_K3_R5_LOADER_SOC)-$(TI_K3_R5_LOADER_SECTYPE)-*.bin
>
> Added in v4
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-load=
er/ti-k3-r5-loader.mk
> index fdb058f3b72a..9a05d005067a 100644
> --- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> +++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> @@ -70,8 +70,12 @@ define TI_K3_R5_LOADER_BUILD_CMDS
>  	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LO=
ADER_MAKE_OPTS)
>  endef
> =20
> +TI_K3_R5_LOADER_SECTYPE =3D $(call qstrip,$(BR2_PACKAGE_TI_K3_SECTYPE))
> +TI_K3_R5_LOADER_SOC =3D $(call qstrip,$(BR2_PACKAGE_TI_K3_SOC))
> +
>  define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
>  	cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
> +	cd $(@D); find ./ -type f -regex "\.\/tiboot3-$(TI_K3_R5_LOADER_SOC)-$(=
TI_K3_R5_LOADER_SECTYPE)-[^-]*..bin" -exec cp {} $(BINARIES_DIR)/tiboot3.bi=
n \;

The filename should *not* be hardcoded to look like
<soc>-<sectype>.bin. This is just an artifact how TI is naming their
files in *their* u-boot binman files. Instead this should just be a
Kconfig variable (maybe K3_R5_LOADER_FILENAME?) which can be set by
the user/board config and which defaults to "tiboot3.bin".
"tiboot3.bin" is the filename which is used by the ROM in filesystem
boot mode and for which u-boot is already creating a symlink.
So this will then just be another simple "cp".

On a side node, we also found out that the "find . -regex" is rather
fragile in the sense that it might not copy anything at all without
generating an error.

-michael

--f3d704d24aabdec5e2a52c6f4cc4ae47caec84b45d2418aaa2aaf2842ca8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZg1UKhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/icGQF/XPwR1LRklGZ4/EZLFLNSsvwlZFVV/5Cc
QomJeIVi1JFp6V5w3mFKvuUnlFs8j8H8AYDXaBkp3fTiS+/vZWpCeJZ/HCFauilY
Z2hejsVFm6OUM7sWd/X7Z8nVF/+vXttV5EA=
=G/Cb
-----END PGP SIGNATURE-----

--f3d704d24aabdec5e2a52c6f4cc4ae47caec84b45d2418aaa2aaf2842ca8--

--===============4322179165048502640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4322179165048502640==--
