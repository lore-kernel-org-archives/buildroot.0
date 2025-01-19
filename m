Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84464C02183
	for <buildroot@archiver.kernel.org>; Sun, 19 Jan 2025 12:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 307C540569;
	Sun, 19 Jan 2025 12:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MIKNkceTSRH9; Sun, 19 Jan 2025 12:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D35A940687
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D35A940687;
	Sun, 19 Jan 2025 12:32:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 25C6FD2
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 12:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13E9982D17
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 12:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Czl-1ekiwa-G for <buildroot@buildroot.org>;
 Sun, 19 Jan 2025 12:32:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 07C578237D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07C578237D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07C578237D
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 12:32:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3A6EB13F86E;
 Sun, 19 Jan 2025 13:32:02 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42602])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Jan 2025 13:32:02 +0100
MIME-Version: 1.0
Date: Sun, 19 Jan 2025 13:32:02 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250119084511.2816892-5-thomas.petazzoni@bootlin.com>
References: <20250119084511.2816892-1-thomas.petazzoni@bootlin.com>
 <20250119084511.2816892-5-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <8cb7eeb2adac1069fd2d6fcb8565df66@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737289923;
 bh=LLHs4g6GS0I05tC1IeTaVXaHTMsFlv7OGb0wD32r0HQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=igmlNiknweLJ/1Iy10Nshs3+0AGDA9PDLLBnCgBBLsDDmlxsTKIbSPTpnvOx9tI9q
 cBnA3pjCArelnIqaZg4ZKdjBpRdIMzgFIWRRSfVD7KrAIceY/279mQ9EpLfXgI0aVp
 p/Za5KX1XIhWDIDRF84WEbXAHPdoIDM6yWc/WLregZWErU2juUSyDqbcKTI9YZ2kZ2
 TKGHGeQ74VnLfPgIN8rY7Y77AwqoomJoTlQEV7gDILs0PrAOB+qlptvHYfKCyZvchm
 ekJ4Wb6ydsS6UfHXWgZfGlF0+BARtmlcnHOyNga5flVwd9cj+Y/cFxJRxYBeY4m6+Q
 rFkColLkn1BIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=igmlNikn
Subject: Re: [Buildroot] [PATCH 4/4] package/gnu-efi: change upstream,
 bump to 4.0.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Thanks for the patches! I applied patches 1 to 3 of this series.

For this patch, "make gnu-efi-legal-info" is failing. See below.

On 19/01/2025 09:45, Thomas Petazzoni wrote:
> https://sourceforge.net/projects/gnu-efi/ is dead and stuck at version
> 3.0.18. At https://sourceforge.net/p/gnu-efi/feature-requests/11/ the
> upstream maintainer has indicated that the project is now maintained
> at https://github.com/ncroxon/gnu-efi/, so let's use this as upstream.
> 
> We can drop patches 0002 and 0003 since they are upstream. Patch 0001
> is just slightly refreshed.
> 
> Changes 3.0.18 -> 3.0.19:
>   https://github.com/ncroxon/gnu-efi/releases/tag/3.0.19
> 
> Changes 3.0.19 -> 4.0.0:
>   https://github.com/ncroxon/gnu-efi/releases/tag/4.0.0

[...]

> diff --git a/package/gnu-efi/gnu-efi.hash 
> b/package/gnu-efi/gnu-efi.hash
> index e059da867e..49d26f868e 100644
> --- a/package/gnu-efi/gnu-efi.hash
> +++ b/package/gnu-efi/gnu-efi.hash
> @@ -1,6 +1,3 @@
> -# From http://sourceforge.net/projects/gnu-efi/files
> -md5  0b93ad70dff96991dd87978fc4275bd1  gnu-efi-3.0.18.tar.bz2
> -sha1  4f12dc4ab3e7940070c87affea17bf8a6209957a  gnu-efi-3.0.18.tar.bz2
>  # Locally computed
> -sha256  
> 7f212c96ee66547eeefb531267b641e5473d7d8529f0bd8ccdefd33cf7413f5c  
> gnu-efi-3.0.18.tar.bz2
> +sha256  
> a2e5dfd25e7fc0cd2027d75dc2517b4c74d94f801ff4784eca557ac1b9835899  
> gnu-efi-4.0.0.tar.gz
>  sha256  
> 42d352e9c28dd446fd0209cd6f75588c8e41f0934540bb382bbd61c752360265  
> README.efilib

It seems the license file "README.efilib" has beed renamed to
"licenses/LICENSE.efilib", see:
https://github.com/ncroxon/gnu-efi/commit/2a3244d2e532ea3c73d8cb2b58d1870c7bcd0c90

Also, new license files "LICENSE" and "licenses/LICENSE.edk2" has
been added in:
https://github.com/ncroxon/gnu-efi/commit/2a3244d2e532ea3c73d8cb2b58d1870c7bcd0c90

> diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
> index 2eed4e40d2..4b9a6a7cd5 100644
> --- a/package/gnu-efi/gnu-efi.mk
> +++ b/package/gnu-efi/gnu-efi.mk
> @@ -4,9 +4,8 @@
>  #
>  
> ################################################################################
> 
> -GNU_EFI_VERSION = 3.0.18
> -GNU_EFI_SOURCE = gnu-efi-$(GNU_EFI_VERSION).tar.bz2
> -GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi
> +GNU_EFI_VERSION = 4.0.0
> +GNU_EFI_SITE = $(call github,ncroxon,gnu-efi,$(GNU_EFI_VERSION))
>  GNU_EFI_INSTALL_STAGING = YES
>  GNU_EFI_LICENSE = BSD-3-Clause and/or GPL-2.0+ (gnuefi), BSD-3-Clause 
> (efilib)

We should add "BSD-2-Clause-Patent (EDK2 routines)" in _LICENSE.

>  GNU_EFI_LICENSE_FILES = README.efilib

Here, we should have something like:
GNU_EFI_LICENSE_FILES = LICENSE licenses/LICENSE.edk2 
licenses/LICENSE.efilib

Can you send a v2 with those license info updated, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
