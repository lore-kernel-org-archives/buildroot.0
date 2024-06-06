Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21228C27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 19:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E31B541807;
	Thu,  6 Jun 2024 19:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AIHsmU35UBwM; Thu,  6 Jun 2024 19:25:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7921D41782
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7921D41782;
	Thu,  6 Jun 2024 19:25:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9B271BF57B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B60AC810E0
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJSpwVhXdUXu for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 19:25:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7F6BE811D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F6BE811D7
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F6BE811D7
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 19:25:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8A8062003AE;
 Thu,  6 Jun 2024 21:25:37 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46640])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 06 Jun 2024 21:25:37 +0200
MIME-Version: 1.0
Date: Thu, 06 Jun 2024 21:25:37 +0200
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20240605234131.3370484-2-james.hilliard1@gmail.com>
References: <20240605234131.3370484-1-james.hilliard1@gmail.com>
 <20240605234131.3370484-2-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.5
Message-ID: <2ecf3de13be3195cafaffacec85cb04f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717701940;
 bh=OqDGbjIYyAortWnv79RQEzN8vPXNzdJQP8+MZ+T9Xjc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ps718P0Fs/Y3hCMDT4YvinCWfVKn9kkgz8X57U4+VoYTgmgke3oR2T8VTcH2OGI14
 JkCHqZS2q0X5K+WITqIb10Hq2e3e1XPLhZS8dM31BEsNmIkxipMoo8w0icCcZSGWrP
 lajK72HG8hJLygt+hadwv8KqiQWTJxOxFbhOVuIibHfII0CpzflU+oVaIXp0tRUb6x
 MHG9bfLGiTq/l2x8NmFH2zgcNwyDhU7tXjJLwvohgwKWheFDTDsZ97/I3fSxoJPege
 HQ3PtbHWlTE7cdwUamcTwcJ3D7OABaWEJ2N8KPBK6E8mMktpFili71gI3Klmqzlq4H
 2HHH3fdLPOS4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ps718P0F
Subject: Re: [Buildroot] [PATCH 2/4] package/fwupd-efi: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

Thanks for the patch!

On 06/06/2024 01:41, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in                |  1 +
>  package/fwupd-efi/Config.in      |  8 ++++++++
>  package/fwupd-efi/fwupd-efi.hash |  3 +++
>  package/fwupd-efi/fwupd-efi.mk   | 25 +++++++++++++++++++++++++
>  4 files changed, 37 insertions(+)
>  create mode 100644 package/fwupd-efi/Config.in
>  create mode 100644 package/fwupd-efi/fwupd-efi.hash
>  create mode 100644 package/fwupd-efi/fwupd-efi.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 9a948c5536..2be39f98c7 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -519,6 +519,7 @@ endmenu
>  	source "package/fmtools/Config.in"
>  	source "package/freeipmi/Config.in"
>  	source "package/freescale-imx/Config.in"
> +	source "package/fwupd-efi/Config.in"
>  	source "package/fxload/Config.in"
>  	source "package/gcnano-binaries/Config.in"
>  	source "package/gpm/Config.in"
> diff --git a/package/fwupd-efi/Config.in b/package/fwupd-efi/Config.in
> new file mode 100644
> index 0000000000..3d82f480be
> --- /dev/null
> +++ b/package/fwupd-efi/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_FWUPD_EFI
> +	bool "fwupd-efi"
> +	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
> +	select BR2_PACKAGE_GNU_EFI
> +	help
> +	  EFI Application used by uefi-capsule plugin in fwupd.
> +
> +	  https://github.com/fwupd/fwupd-efi
> diff --git a/package/fwupd-efi/fwupd-efi.hash 
> b/package/fwupd-efi/fwupd-efi.hash
> new file mode 100644
> index 0000000000..35dc9625ca
> --- /dev/null
> +++ b/package/fwupd-efi/fwupd-efi.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  
> afd0805a2ad081a7caff2ef5bc004ce3a0147b538015e8eca966341716b1260e  
> fwupd-efi-1.6.tar.xz
> +sha256  
> dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  
> COPYING
> diff --git a/package/fwupd-efi/fwupd-efi.mk 
> b/package/fwupd-efi/fwupd-efi.mk
> new file mode 100644
> index 0000000000..575cf73b95
> --- /dev/null
> +++ b/package/fwupd-efi/fwupd-efi.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# fwupd-efi
> +#
> +################################################################################
> +
> +FWUPD_EFI_VERSION = 1.6
> +FWUPD_EFI_SITE = 
> https://github.com/fwupd/fwupd-efi/releases/download/$(FWUPD_EFI_VERSION)
> +FWUPD_EFI_SOURCE = fwupd-efi-$(FWUPD_EFI_VERSION).tar.xz
> +FWUPD_EFI_LICENSE = LGPL-2.1+
> +FWUPD_EFI_LICENSE_FILES = COPYING
> +FWUPD_EFI_INSTALL_STAGING = YES
> +FWUPD_EFI_DEPENDENCIES = gnu-efi
> +FWUPD_EFI_CONF_OPTS = \
> +	-Defi-libdir=$(STAGING_DIR)/usr/lib \
> +	-Defi-ldsdir=$(STAGING_DIR)/usr/lib \
> +	-Defi-includedir=$(STAGING_DIR)/usr/include/efi \
> +	-Defi_sbat_fwupd_generation=1 \
> +	-Defi_sbat_distro_id=buildroot \
> +	-Defi_sbat_distro_summary=Buildroot \
> +	-Defi_sbat_distro_pkgname=fwupd-efi \
> +	-Defi_sbat_distro_version=fwupd-efi-$(FWUPD_EFI_VERSION) \
> +	-Defi_sbat_distro_url=https://git.buildroot.net/buildroot/tree/package/fwupd-efi

According to:
https://gitlab.com/buildroot.org/buildroot/-/commit/3e3bcd633875db0e1f366e86fe8763b5b2d9112e
the official git repository is on gitlab.

Therefore, I think this line should be:

https://gitlab.com/buildroot.org/buildroot/-/tree/master/package/fwupd-efi


> +
> +$(eval $(meson-package))
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
