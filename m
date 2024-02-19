Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DFEC48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 20:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7E6740242;
	Mon, 19 Feb 2024 20:52:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EgbyOHQsD3kq; Mon, 19 Feb 2024 20:52:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C94440B8C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C94440B8C;
	Mon, 19 Feb 2024 20:52:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 492741BF41C
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 20:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4373F60813
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 20:52:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3VoXCfbg_tlZ for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 20:52:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 483B660810
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 483B660810
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 483B660810
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 20:52:02 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41JKpwob110061;
 Mon, 19 Feb 2024 14:51:58 -0600
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41JKpwDJ022104
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 19 Feb 2024 14:51:58 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 Feb 2024 14:51:58 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 Feb 2024 14:51:57 -0600
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41JKpvW8034464;
 Mon, 19 Feb 2024 14:51:57 -0600
Date: Mon, 19 Feb 2024 14:51:57 -0600
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Message-ID: <20240219205157.5ukm426gmzbvn33f@dasso>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-15-dario.binacchi@amarulasolutions.com>
 <95a8a71f608575339cd61ba5ed09b93d8714c01c.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95a8a71f608575339cd61ba5ed09b93d8714c01c.camel@gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1708375918;
 bh=mVuBttPyYmVLFMy7B/a01CBufEWxqEhMZ8R0I0n56vQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=xuPR38VXhWR4KjW5oolrsmekSHqQLBu/SH5UQBZ45/tS2VyN4IpaYS2vIehp1HV4j
 O7GVtMaUOwkr8CgcjyJy7/riHcFfJIiAPmmFHr6lS0IFprQXgcMyHWuap8eSA8uyY2
 xz4CoVvlPyVJZMnm0iHlrz7RiWbyMl87OhDb+XSY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=xuPR38VX
Subject: Re: [Buildroot] [PATCH v4 14/20] boot/uboot: set BINMAN_INDIRS for
 TI K3 DM
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Feb 17, 2024 at 09:44:29PM +0100, Alexander Sverdlin wrote:
> Hi Dario,
> =

> On Sat, 2024-02-17 at 17:02 +0100, Dario Binacchi wrote:
> > As explained in [1], adding support for AM62x LP SK in U-Boot, requires
> > binman for building bootloader images. The BINMAN_INDIRS environment
> > variable is used to provide a space-separated list of directories to
> > search for binary blobs.
> > =

> > [1] https://patchwork.ozlabs.org/project/uboot/patch/20231030110138.134=
7603-3-n-yadav@ti.com/
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > =

> > ---
> > =

> > no changes since v1:
> > =

> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> > =A0boot/uboot/uboot.mk | 3 ++-
> > =A01 file changed, 2 insertions(+), 1 deletion(-)
> > =

> > diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> > index dda606a88059..cf70f86a4132 100644
> > --- a/boot/uboot/uboot.mk
> > +++ b/boot/uboot/uboot.mk
> > @@ -189,7 +189,8 @@ endif
> > =A0ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_DM),y)
> > =A0UBOOT_TI_K3_DM_SOCNAME =3D $(call qstrip,$(BR2_TARGET_UBOOT_TI_K3_DM=
_SOCNAME))
> > =A0UBOOT_DEPENDENCIES +=3D ti-k3-boot-firmware
> > -UBOOT_MAKE_OPTS +=3D DM=3D$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNA=
ME)/ipc_echo_testb_mcu1_0_release_strip.xer5f
> > +UBOOT_MAKE_OPTS +=3D DM=3D$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNA=
ME)/ipc_echo_testb_mcu1_0_release_strip.xer5f \
> =

> Is the above actually still required with binman?
> The names are hardcoded in U-Boot in arch/arm/dts/k3-am625-sk-binman.dtsi
> =

> > +	BINMAN_INDIRS=3D$(BINARIES_DIR)
> =

> This seems to be the only required part.

Correct. 'DM=3D' is no longer used, also see the official U-Boot build
instructions for TI platforms in the SDK documentation [1] (technically
speaking this documentation is for the U-Boot vendor tree, but the same
principle applies to upstream U-Boot builds).

Reviewed-by: Andreas Dannenberg <dannenberg@ti.com>

[1] https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/09_01_00_08/ex=
ports/docs/linux/Foundational_Components/U-Boot/UG-General-Info.html



> =

> > =A0endif
> > =A0
> > =A0ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
> =

> -- =

> Alexander Sverdlin.
> =

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
