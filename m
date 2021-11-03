Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B669C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:00:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0449660EB4
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0449660EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0BF760B0D;
	Wed,  3 Nov 2021 22:00:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tLMaVVJE9dzp; Wed,  3 Nov 2021 22:00:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B5E560B03;
	Wed,  3 Nov 2021 22:00:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 072921BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FB5C40523
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:00:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8RQSNH2ISShW for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 22:00:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5573740521
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 22:00:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 1E97D240005;
 Wed,  3 Nov 2021 22:00:22 +0000 (UTC)
Date: Wed, 3 Nov 2021 23:00:21 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20211103230021.597fc1ff@windsurf>
In-Reply-To: <20211103214718.1149331-1-aduskett@gmail.com>
References: <20211103214718.1149331-1-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/mender-grubenv: fix grub
 module checks
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Wed,  3 Nov 2021 14:47:18 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
> index 07df25512c..ce63323f2a 100644
> --- a/package/mender-grubenv/mender-grubenv.mk
> +++ b/package/mender-grubenv/mender-grubenv.mk
> @@ -31,9 +31,15 @@ MENDER_GRUBENV_DEFINES = \
>  # These grub modules must be built in for the grub scripts to work properly.
>  # Without them, the system will not boot.
>  MENDER_GRUBENV_MANDATORY_MODULES=loadenv hashsum echo halt gcry_sha256 test regexp
> +ifneq ($(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI),)
>  MENDER_GRUBENV_MODULES_MISSING = \
> -	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES)),\
> +	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI)),\
>  		$(MENDER_GRUBENV_MANDATORY_MODULES))
> +else
> +MENDER_GRUBENV_MODULES_MISSING = \
> +	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_PC)),\
> +		$(MENDER_GRUBENV_MANDATORY_MODULES))
> +endif

Now that I further think of this, I think this is still not correct.
Indeed, one of the major change recently brought to the grub2 package
is the ability in a single configuration to have grub support for x86
PC (legacy BIOS) x86 EFI. So in fact you can have
BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI and
BR2_TARGET_GRUB2_BUILTIN_MODULES_PC non-empty at the same time.

So if you want to do the right thing, you would have to check that
BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI doesn't miss any of the mandatory
modules if one of the EFI grub2 variant is selected *and* check that
BR2_TARGET_GRUB2_BUILTIN_MODULES_PC doesn't miss any of the mandatory
modules if one of the legacy BIOS grub2 variant is selected.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
