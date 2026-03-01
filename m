Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95869FD0057
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 12:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B47360BE2;
	Sun,  1 Mar 2026 12:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id daX1QMGJG6rO; Sun,  1 Mar 2026 12:03:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6720460BE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772366619;
	bh=UUdX2pUwef1FAIZOs/afTZYuSGbnNXIE28DiJWT7r4E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bponZLTorot97DrN578PofrLzHJhe6wQFzEvPuxCuP3JTN0TTNPBpaZ81cw3bKwZv
	 6sm6O3s2AcbiRoW2ChaQ4yhj6ri8CgYGy97MvCVH5RB+ebC/fVugJl3gpmbLfrJin3
	 12MFRdGUembgYVFCqPPQTk02BdbEaaK85ffDRVA2Cjf+K4BjX3/Fp2y4V79FAZ4Rdi
	 DaN5tdDlQ8i1SzE00iaUO+YV1Y3uF2Mpg2xEx5TBEgHNuoVvFgiq1mUnSgWcuRGrLi
	 VMRmCx8nzhaxX0tQbrMMB8DbPcL9bZ4t880ISo5lnQ8iPyBn+dljkgW6idmB6o4t2K
	 hjxuSEScJ+fKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6720460BE7;
	Sun,  1 Mar 2026 12:03:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B74F1EB
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 12:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C75B60BE7
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 12:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThiVi-m-1rZu for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 12:03:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 654FE60BE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 654FE60BE2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 654FE60BE2
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 12:03:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2F9F45FFAA;
 Sun,  1 Mar 2026 13:03:32 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Mar 2026 13:03:32 +0100
MIME-Version: 1.0
Date: Sun, 01 Mar 2026 13:03:32 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260228185331.1707665-1-bernd@kuhls.net>
References: <20260228185331.1707665-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <32c972caf35450dc2934979318371661@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772366614;
 bh=TOuGrmYHjwXH2SJw50BdY4wf17BXnQ0Su+XRvZFjcxs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X1N0cGQFokVstBIbrVCntegfMrIQ1KbAXLaKSNBmvnFhvnNjve30e1lrOAQts1Hqk
 /4wsm5mMggHXm+6aXWM54UGVUm3op2Xyv1cAIqVdZkv9AHTh8pICSCxXHsirTCwIY6
 hr+v5Og8HW0sT68Ye2w6NnFYnmz/KZ0VOb3UzInDTknNwlRkubhxqys1a6Og4YvZUW
 fnqwI1NP1o379nGW9vWgWri8u6XQfNtsLXslYzTSyLeNUGHIPly5zWefj3PHBwoZvt
 4wrdMYMC835oGr/0PS7Ms92I2bWUU0M2KOlEqpHzK0lAld/h+Al9Yt6qP9QO64BeQ6
 d8TKk6x4CJRSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X1N0cGQF
Subject: Re: [Buildroot] [PATCH/next 1/1] package/fwupd-efi: bump version to
 1.8
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

On 28/02/2026 19:53, Bernd Kuhls wrote:
> https://github.com/fwupd/fwupd-efi/releases/tag/1.8
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
[...]
> diff --git a/package/fwupd-efi/fwupd-efi.mk 
> b/package/fwupd-efi/fwupd-efi.mk
> index fbff5a9043..3e41056825 100644
> --- a/package/fwupd-efi/fwupd-efi.mk
> +++ b/package/fwupd-efi/fwupd-efi.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -FWUPD_EFI_VERSION = 1.7
> +FWUPD_EFI_VERSION = 1.8

When trying to build this package version with a minimal
config such as with the commands:

cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_FWUPD_EFI=y
EOF
make olddefconfig
make fwupd-efi

The build fails with error:

/usr/bin/ld.bfd: cannot represent machine `aarch64'

The previous fwupd-efi 1.7 works fine with the same commands.

Could you have a look, please?

>  FWUPD_EFI_SITE = $(call github,fwupd,fwupd-efi,$(FWUPD_EFI_VERSION))
>  FWUPD_EFI_LICENSE = LGPL-2.1+
>  FWUPD_EFI_LICENSE_FILES = COPYING
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
