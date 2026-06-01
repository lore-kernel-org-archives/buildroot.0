Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4F3CD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 21:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC3A060770;
	Mon,  1 Jun 2026 21:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNYrub3Dfgwq; Mon,  1 Jun 2026 21:15:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BCAE6076F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780348558;
	bh=uJS9yvfxHTXPt1Q6viRxatlaPmv0f7En5A/t18vjbiU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NItxgq1/SmhYkSp+DWzI34VC+2/qnDpOpPVBwY78schzWZMFnog6sxzBnivZsif4E
	 qdZVwmXULtWTi53nBxXr69BzIzGV8tUuSsj/mrmfEwxqNwot2TTEHQdvOq5RYxc/Ix
	 48EFva3Ay3d33nLHqFLQrNLgLoPiqS4TLu2aInyrdsBLFAsbkHbhd4OGajYJ4d3yqY
	 33P1CUNNRw62c5wueTyl2QyMSS/B0sdmXIifNWjEerzH6+1a9+l/JUfWPleLnnZG7r
	 nLRhKI6yxuYgjlGJmg0vjcKjKeh7qwtMxS8XnqirbgROqnHPC6eVOVCO37tAIodr7A
	 8TTXN0NeBP08A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BCAE6076F;
	Mon,  1 Jun 2026 21:15:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 06612F4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 21:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCEA0811E9
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 21:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ppIDYm60Yk9 for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 21:15:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD138811E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD138811E7
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD138811E7
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 21:15:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 46A4CB97C77B; Mon,  1 Jun 2026 23:15:53 +0200 (CEST)
Message-ID: <7085d622-123f-4a91-b473-51d1755a5b4f@rnout.be>
Date: Mon, 1 Jun 2026 23:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Ernberg <j@j-ernberg.se>, buildroot@buildroot.org
Cc: John Ernberg <john.ernberg@actia.se>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20260601204735.888967-1-j@j-ernberg.se>
 <20260601204735.888967-4-j@j-ernberg.se>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260601204735.888967-4-j@j-ernberg.se>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780348554; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=mJwBDkkrFryD3JZnwlx0t/QdhwqpLpX9Ssnr0VXqc+o=;
 b=WFS/HLzFiBVLDQBMvUotqHqQUZrt9En+QuW3yWPO2JvCx9Aah+3A9fr8iQ17F2FuN6VvUO
 aRv9oG/rEUERq2Az1657MZg+HvPoqGuY1jhiys3DdMPQhy4B8lyze/3vHqJb9tYCRuGxov
 LrkZRi5k/aEa1bih3jyOB3OTqA4EU8z7cWV+gtv3ZrguxKqWma13vo9uAz+13Jp34JCtRp
 5dmlWZCtPr451ttUQG1olBrwv/gq3LPE3ZxJi9FFr0seDpaAi5kwZVE6untXawOtpxn8Gf
 5cjlvYuDjdW9v5XlmKvrEtciR+FJupiQbdlGKEPUyrI6dzDAQQ+/GmhIUZHiIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=WFS/HLzF
Subject: Re: [Buildroot] [RFC PATCH 3/9] package/rtl8188eu: Select
 linux-firmware for the firmware
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/06/2026 22:47, John Ernberg wrote:
> Due to partial rtl8188eu support in the upstream Linux kernel
> linux-firmware packages the firmware for this chip now.
> 
> It's packaged under the same filename, but is a later version (v28) from
> 2017 [1] while the firmware blob bundled in the repository is from over 13
> years ago [2].

  It's very likely that the driver doesn't work with the new firmware blob.

  I think the proper solution is to force-disable the upstream version with a 
KCONFIG_DISABLE_OPT.

  Regards,
  Arnout

> 
> The LICENSE is updated for the same reason, the appropriate license will
> be provided by the linux-firmware package.
> 
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/WHENCE?id=fe1a0a75caa69da62849cbf549c32531c6d1da4b#n3628
> Link: https://github.com/Benetti-Engineering/rtl8188eu/commit/a27737ea39d72040d7421600949373982d78a0d2
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: John Ernberg <j@j-ernberg.se>
> 
> ---
> 
> RFC/RFT: I don't have any of the hardware for this chip and cannot test
> that this doesn't break stuff.
> ---
>   package/rtl8188eu/Config.in    | 2 ++
>   package/rtl8188eu/rtl8188eu.mk | 8 +-------
>   2 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/package/rtl8188eu/Config.in b/package/rtl8188eu/Config.in
> index 102e8d7bf7..397ce4c080 100644
> --- a/package/rtl8188eu/Config.in
> +++ b/package/rtl8188eu/Config.in
> @@ -2,6 +2,8 @@ config BR2_PACKAGE_RTL8188EU
>   	bool "rtl8188eu"
>   	depends on !BR2_s390x
>   	depends on BR2_LINUX_KERNEL
> +	select BR2_PACKAGE_LINUX_FIRMWARE # runtime
> +	select BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX # runtime
>   	help
>   	  A standalone driver for the RTL8188EU USB Wi-Fi adapter.
>   
> diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
> index 5f378e0b6e..a4b6b89e3d 100644
> --- a/package/rtl8188eu/rtl8188eu.mk
> +++ b/package/rtl8188eu/rtl8188eu.mk
> @@ -6,7 +6,7 @@
>   
>   RTL8188EU_VERSION = cca7c28087db740d7d745e81e4096c9eb9084f9a
>   RTL8188EU_SITE = $(call github,benetti-engineering,rtl8188eu,$(RTL8188EU_VERSION))
> -RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
> +RTL8188EU_LICENSE = GPL-2.0
>   RTL8188EU_LICENSE_FILES = COPYING
>   RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m
>   
> @@ -18,11 +18,5 @@ define RTL8188EU_LINUX_CONFIG_FIXUPS
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
>   endef
>   
> -define RTL8188EU_INSTALL_FIRMWARE
> -	$(INSTALL) -D -m 644 $(@D)/rtl8188eufw.bin \
> -		$(TARGET_DIR)/lib/firmware/rtlwifi/rtl8188eufw.bin
> -endef
> -RTL8188EU_POST_INSTALL_TARGET_HOOKS += RTL8188EU_INSTALL_FIRMWARE
> -
>   $(eval $(kernel-module))
>   $(eval $(generic-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
