Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E94C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 08:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E43E4214F;
	Sun, 12 May 2024 08:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Re8CFlmdUYr; Sun, 12 May 2024 08:15:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30023421B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30023421B5;
	Sun, 12 May 2024 08:15:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 916351BF3F6
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 08:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E20B40BBB
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 08:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wFU_byjFNhVK for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 08:15:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE52F40015
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE52F40015
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE52F40015
 for <buildroot@buildroot.org>; Sun, 12 May 2024 08:15:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 35DB51BF203;
 Sun, 12 May 2024 08:15:08 +0000 (UTC)
Date: Sun, 12 May 2024 10:15:07 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240512101507.5b678cd4@windsurf>
In-Reply-To: <CAPi7W808FakSM3CDpHEDrVh4HgHgfbZjd0SzK0W-pav1ub=3ww@mail.gmail.com>
References: <20240307122806.102726-1-fontaine.fabrice@gmail.com>
 <20240307134916.32738b5e@windsurf>
 <CAPi7W803mjZL9-rRu2wdcG=5t=D1wtDJET2S_SHfjCc_uvViVA@mail.gmail.com>
 <20240311123512.09c1c77d@windsurf>
 <CAPi7W808FakSM3CDpHEDrVh4HgHgfbZjd0SzK0W-pav1ub=3ww@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715501709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+7pV/6GGAZpv5ptyjDwR1hsQu5XlCqUdNb6x69a7ggA=;
 b=Eb7n3IEJYsdQMS96kdjtyrFby7LtGi49jJe1f57t0c2yLQLAXgDddXidlt8gEJrHDfOv9h
 ZYIzmIBscK2oLTYBqk3yANEkr2WLbEFKHPWR+M1/wk9Pon82tJhtPichgUpXGzu/RW7ocf
 DpDA6ugT3Skwpe2Qd7lYGdnZ9xI9lGdRZr2oBttYp9yxvQyc5SVU0TRTzaNSSIXhcLl8rR
 j8aj+3KNUI0uxGsx/zcaGGu6S0iQmbhl8JgFEfxDRxMGR5QzyhtMgMjP54jzvAezfT9bIW
 rTRxlGiifbu0kDtZvb6WTx3ERwLSN9H5gpvTHGm0EjsU34Y0j3SeR96/CMOdrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Eb7n3IEJ
Subject: Re: [Buildroot] [PATCH 1/1] toolchain/Config.in: enable libatomic
 with BR2_BINFMT_FLAT
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Tue, 12 Mar 2024 08:18:35 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> How should I proceed for my v2?
> Should I replace !BR2_BINFMT_FLAT by (!BR2_BINFMT_FLAT=y ||
> (BR2_TOOLCHAIN_GCC_AT_LEAST_10 && BR2_arm))?
> An other option would be to add default y if
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE (more simple but
> ugly).

The latter is indeed ugly. Something like the below?

config BR2_TOOLCHAIN_HAS_LIBATOMIC
	bool
	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
	depends on BR2_TOOLCHAIN_HAS_THREADS
	depends on BR2_BINFMT_ELF || (BR2_BINFMT_FLAT && BR2_arm && BR2_TOOLCHAIN_GCC_AT_LEAST_10)

What do you think ? The comment above the BR2_TOOLCHAIN_HAS_LIBATOMIC
would need to be updated accordingly, of course.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
