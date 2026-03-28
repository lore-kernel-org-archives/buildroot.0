Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDBB10F3DF2
	for <buildroot@archiver.kernel.org>; Sat, 28 Mar 2026 18:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF1BA80F81;
	Sat, 28 Mar 2026 18:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KIm-E16EnOk6; Sat, 28 Mar 2026 18:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB0BF80F88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774721777;
	bh=qdWIrUVpINDv39ve5mG6+zaIoMtR+XwDQMi8sXydhlc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pm+D6zx4AD+L+NXROtILIpOvuN/A1zPJfLx1XgQ72wgua7fdeg0zccAEsNdk9te/g
	 GQK8QVphcm3cQbtyncltWtLSQDmchF5vwPIhkX/BTQTNHaJ72FPEMKx8YGZnPL2zSB
	 RYxdUldoWVijBCDfCm39q3ErEQBlH0k4GDOO8UxLGZknNqQgM2NRQUayqlMIoaVV+x
	 KUZni2M0CZ4gLFygbz0nQ5gPeZ8vHaRrZe/oykCW/M3VMrUXspPs92tGsFcLZle+w+
	 3MJe57n+hfIpc73H0DYYa+LkYRSVTpqsYCUp5uxTOzQ/7efgwtohROWxMI7tCbIAP8
	 x5zaIzpaUbDRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB0BF80F88;
	Sat, 28 Mar 2026 18:16:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B636910F
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 18:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7D3280DA7
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 18:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-O5I2C9cluD for <buildroot@buildroot.org>;
 Sat, 28 Mar 2026 18:16:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E4EAA80CD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4EAA80CD4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4EAA80CD4
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 18:16:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A79E960137;
 Sat, 28 Mar 2026 19:16:06 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Mar 2026 19:16:06 +0100
MIME-Version: 1.0
Date: Sat, 28 Mar 2026 19:16:06 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260302210037.1931571-1-bernd@kuhls.net>
References: <20260302210037.1931571-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <008725f56633a02d56a2936c8996c140@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774721770;
 bh=EeCcx8KmLt1u1nNpq/5ogFWRfGJzRkRG0rdciwxqC6o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hzsIRjloQa2IrY1xre0bNXNE+nQoSoiYd10evb3+L3JQWSK6nyKGsOVrC5fF4wYa0
 XYUQxul7ap7BMwnbHHQlpbB4O0z6LChb9ricODyasaNp4mdyC2TLbTyAr61bfSs0hb
 fb96jq/64Y1ZE4OI4AmDS4cI9VD9+jYQnMrsyYcY5GCnfAeIeaWHYqVUpsE3jQUv+6
 dY0WjfuJru6qna+yhvfOSQPqZaLo53ajPEvwKTP+4FLYsbnaXeDulbDfzbHPjHw96R
 tIdG2Xxw52AJzBEvrgJXm0bc04T1pIU9yRqd5jmNHZ4vASoRjM991K2Km0t6cd47C2
 /ekqwYPC3Eeeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hzsIRjlo
Subject: Re: [Buildroot] [PATCH/next 1/2] package/gnu-efi: bump version to
 4.0.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Thanks for the patch.

On 02/03/2026 22:00, Bernd Kuhls wrote:
> https://github.com/ncroxon/gnu-efi/releases/tag/4.0.1
> https://github.com/ncroxon/gnu-efi/releases/tag/4.0.2
> https://github.com/ncroxon/gnu-efi/releases/tag/4.0.3
> https://github.com/ncroxon/gnu-efi/releases/tag/4.0.4
> 
> Removed patch due to upstream commit
> https://github.com/ncroxon/gnu-efi/commit/f3ececb9eba2ad3104b6d39bd33e579091fce888
> which contains a different fix.

Running the command "make gnu-efi-legal-info" fails.
Also the licenses were clarified. I suggest you add in the commit
log something like:

"""
LICENSE was claried and new license files were in:
https://github.com/ncroxon/gnu-efi/commit/71d5d1746ba50378e0e2d563f7d132c421b7b4f8

licenses/LICENSE.efilib: was updated in:
https://github.com/ncroxon/gnu-efi/commit/71b05279b196beea0c8ee4398c7dd0c7963d78ab

This commit reflects those changes by updating _LICENSE_FILES and
adding the new license hashes.
"""

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |  1 -
>  ...n-t-override-ARCH-when-cross-compili.patch | 32 -------------------
>  package/gnu-efi/gnu-efi.hash                  |  2 +-
>  package/gnu-efi/gnu-efi.mk                    |  2 +-
>  4 files changed, 2 insertions(+), 35 deletions(-)
>  delete mode 100644 
> package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch
> 
[...]
> diff --git a/package/gnu-efi/gnu-efi.hash 
> b/package/gnu-efi/gnu-efi.hash
> index 5a2f47cfae..d0bcb49514 100644
> --- a/package/gnu-efi/gnu-efi.hash
> +++ b/package/gnu-efi/gnu-efi.hash
> @@ -1,5 +1,5 @@
>  # Locally computed
> -sha256  
> a2e5dfd25e7fc0cd2027d75dc2517b4c74d94f801ff4784eca557ac1b9835899  
> gnu-efi-4.0.0.tar.gz
> +sha256  
> 40b61e842a4efcbf80f3e53b2f220c044e8cfe46eb4dd6396c83b751240b1c0d  
> gnu-efi-4.0.4.tar.gz
>  sha256  
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  
> LICENSE
>  sha256  
> 42d352e9c28dd446fd0209cd6f75588c8e41f0934540bb382bbd61c752360265  
> licenses/LICENSE.efilib
>  sha256  
> 7aa278b6f1a2125d0a0c596fa537caca5a41e7b03f7d2dd0489905f65ffdb984  
> licenses/LICENSE.edk2

Here you should add hashes for the new files.

> diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
> index 268e5350cf..aa2744ae1a 100644
> --- a/package/gnu-efi/gnu-efi.mk
> +++ b/package/gnu-efi/gnu-efi.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -GNU_EFI_VERSION = 4.0.0
> +GNU_EFI_VERSION = 4.0.4

This new version breaks test_syslinux. You can reproduce with:

utils/docker-run support/testing/run-tests \
     -k -d dl -o output_folder \
     tests.boot.test_syslinux.TestSysLinuxX86_64EFI

>  GNU_EFI_SITE = $(call github,ncroxon,gnu-efi,$(GNU_EFI_VERSION))
>  GNU_EFI_INSTALL_STAGING = YES
>  GNU_EFI_LICENSE = BSD-3-Clause and/or GPL-2.0+ (gnuefi), BSD-3-Clause 
> (efilib), BSD-2-Clause-Patent (EDK2 routines)

With the clarified licenses, we should have here:

GNU_EFI_LICENSE = \
         BSD-3-Clause and/or GPL-2.0+ (gnuefi), \
         BSD-3-Clause (efilib), \
         BSD-2-Clause-Patent (EDK2 routines)
GNU_EFI_LICENSE_FILES = \
         LICENSE \
         licenses/LICENSE.BSD-3-Clause \
         licenses/LICENSE.edk2 \
         licenses/LICENSE.efilib \
         licenses/LICENSE.GPL-2.0-or-later \
         licenses/LICENSE.GPL-3.0-or-later \
         licenses/LICENSE.LGPL-3.0-or-later

> --
> 2.47.3

Could you send and updated patch addressing those issues, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
