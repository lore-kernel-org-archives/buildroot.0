Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2D6CCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 09:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F00E681E19;
	Sun, 12 Oct 2025 09:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WEatfS9feuJ6; Sun, 12 Oct 2025 09:32:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F01FC81E05
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F01FC81E05;
	Sun, 12 Oct 2025 09:32:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CCA012B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 09:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DEC681E05
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 09:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ic_tC2unuqR1 for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 09:32:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3FEBA81DE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FEBA81DE8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FEBA81DE8
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 09:32:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A44456013C;
 Sun, 12 Oct 2025 11:32:21 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Oct 2025 11:32:21 +0200
MIME-Version: 1.0
Date: Sun, 12 Oct 2025 11:32:21 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251012085933.3442742-1-bernd@kuhls.net>
References: <20251012085933.3442742-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <abcc1672f754eca1991e549487947de6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760261542;
 bh=Dv+rsSRFWeejL0Ksryw9qE47W2139Y8NqcUo+CMnKyo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XaYyygX+eoSTATytMxSBs2sreE9yth0Zt52848ouV55rERo/xkl4AL4XSgbyrf4p7
 6r5c2a317ABoSuGfSJLuPeEh8s39cWF1EGUd0iWtBbYC/8NV19hoB8VtvM08zSD+Y5
 87cqvFfqmG2+G8a4UI8/HLg8OP9+nVFXBY5u8YWWPDstnTrv5CYfPH/sHcjaPP5z41
 aEVjp2cs4AtbakZlVr0FOxLffEUKH/38hdTOA2t+HegsK6jRXbuTp0BIPZSfntjpGJ
 MDX+gWZdkah5tQAqOOC4CdxuZpuvBSukMqOXTzi09AsvBCRato7Ag1qIG2t7qAUe09
 EKv+83xgpOlww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XaYyygX+
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20251011
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

On 12/10/2025 10:59, Bernd Kuhls wrote:
> Updating the hash of the WHENCE file, due to firmware additions and
> firmware changes, but no changes to the redistribution/licensing
> conditions.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/linux-firmware/linux-firmware.hash | 4 ++--
>  package/linux-firmware/linux-firmware.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
[...]
> diff --git a/package/linux-firmware/linux-firmware.mk 
> b/package/linux-firmware/linux-firmware.mk
> index 287f896c87..e43ba37798 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LINUX_FIRMWARE_VERSION = 20250627
> +LINUX_FIRMWARE_VERSION = 20251011

Testing this new version with all firmwares selected fails
with error messages:

     tar: iwlwifi-100-*.ucode: Cannot stat: No such file or directory
     tar: iwlwifi-1000-*.ucode: Cannot stat: No such file or directory
     tar: iwlwifi-105-*.ucode: Cannot stat: No such file or directory
     ...

This is due to upstream source tree reorganization, such as:
https://gitlab.com/kernel-firmware/linux-firmware/-/commit/078946281c84e8477222e51f29416439a037d83d

There is many other commits moving firmware files around.

Could you please send an updated patch taking those changes into
account? Please make sure to test with a config selecting all
firmwares at once (and run a "make linux-firmware-legal-info" too).

>  LINUX_FIRMWARE_SOURCE = 
> linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
>  LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
>  LINUX_FIRMWARE_INSTALL_IMAGES = YES
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
