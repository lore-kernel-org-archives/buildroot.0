Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1568C44520
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 16:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D62516072F;
	Mon, 20 Jul 2026 16:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQQxws4t0KV8; Mon, 20 Jul 2026 16:08:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9509B606C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784563711;
	bh=UZU95U9FIfnAOaD83MEVcR7qYj/Cyo0dCSVrcPPFXVI=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S7gly9pRl8pWJLnJ70X0/3aHT1ET4ACxYhOBQukK0+Qe3sBFdvi7hevVqfzkXiM1R
	 5i+IVfNt2lcHKqRJKSXmIGjEzh/0CXW+4bb71/v9qw0BWY2oOL4Gu0TKCHmopKYAu3
	 JzFYJpRP3vAmsgvgS0kGjt/e2m/uWfs+nOZCwZCapLaPjxJIw7d7RtmV6rl1UsgKGW
	 WWDP9oz7rOX1WnDBcYK/2xtyrZUvJisnjkrD98pu2cz0DY/4EgkhBgus/GZ9dFvG21
	 vNKbAMO2iFQ1U0PN4vBsJRYXAl27kDhMLmi5fE8y+SpnUSXyqVtw9SpLPMw8KNGkb4
	 1c4NVlKQkjaZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9509B606C6;
	Mon, 20 Jul 2026 16:08:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9077B2E5
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 16:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D97780CDC
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 16:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B8iiMb0kLZmc for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 16:08:28 +0000 (UTC)
X-Greylist: delayed 344 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 20 Jul 2026 16:08:28 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2692F80A9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2692F80A9F
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (unknown [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2692F80A9F
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 16:08:27 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 59570440A74;
 Mon, 20 Jul 2026 19:02:23 +0300 (IDT)
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net,  Francois Perrad <francois.perrad@gadz.org>
In-Reply-To: <20260720150236.243961-5-francois.perrad@gadz.org> (Francois
 Perrad's message of "Mon, 20 Jul 2026 17:02:31 +0200")
References: <20260720150236.243961-1-francois.perrad@gadz.org>
 <20260720150236.243961-5-francois.perrad@gadz.org>
User-Agent: mu4e 1.14.2; emacs 30.2
Date: Mon, 20 Jul 2026 19:02:40 +0300
Message-ID: <877bmpps2n.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1784563343;
 bh=B3Ofbn92rYo01Q3khGCPUVicYFcr1O7TkrxRHb1JX+I=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dxIiXc227ZU8iac9nunmINCoKNRqEL1Ckb+feW43R1nl2BDGFrodGZXcge/iZpXWM
 DYhTczyHOpCZP1JJtiamRjjeltk1o4fKPjM4hCHkXpHePDpFoqNHhm15oI+x1Ox23H
 wWzCwv4iDVPN+9YcqZRmU6TNtukn+gbf2vF/yXxKYw48sTXSX2WextaikXf6oNjF4v
 Y970+Q/prHU81cm9GKMBHXMqJJBeT6hyxnF+Ytxd3Ta8LzC7/SLudDAVoGs38kqEFC
 pFK9MS4CdfG+AQfGBplxNgkoepjPCkWFSzYZBkYylic6FO2y7ShhndD3CW/gpMaQNy
 dDTJb90tJIidg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=dxIiXc22
Subject: Re: [Buildroot] [PATCH v2 4/8] package/hare: new host package
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Francois,

On Mon, Jul 20 2026, Francois Perrad wrote:
> +ifeq ($(BR2_aarch64),y)
> +HOST_HARE_CONF_OPTS += \
> +	AARCH64_AS=$(TARGET_AS) \
> +	AARCH64_CC=$(TARGET_CC) \
> +	AARCH64_LD=$(TARGET_LD)
> +endif
> +
> +ifeq ($(BR2_RISCV_64),y)
> +HOST_HARE_CONF_OPTS += \
> +	RISCV64_AS=$(TARGET_AS) \
> +	RISCV64_CC=$(TARGET_CC) \
> +	RISCV64_LD=$(TARGET_LD)
> +endif
> +
> +ifeq ($(BR2_x86_64),y)
> +HOST_HARE_CONF_OPTS += \
> +	X86_64_AS=$(TARGET_AS) \
> +	X86_64_CC=$(TARGET_CC) \
> +	X86_64_LD=$(TARGET_LD)
> +endif

I think you can reduce code duplication with something like this
(untested):

ifeq ($(BR2_aarch64),y)
HOST_HARE_TARGET_ARCH = AARCH64
else ifeq ($(BR2_RISCV_64),y)
HOST_HARE_TARGET_ARCH = RISCV64
else ifeq ($(BR2_x86_64),y)
HOST_HARE_TARGET_ARCH = X86_64
endif

HOST_HARE_CONF_OPTS += \
	$(HOST_HARE_TARGET_ARCH)_AS=$(TARGET_AS) \
	$(HOST_HARE_TARGET_ARCH)_CC=$(TARGET_CC) \
	$(HOST_HARE_TARGET_ARCH)_LD=$(TARGET_LD)

Alternatively, instead of HOST_HARE_TARGET_ARCH, you can use a blind
config symbol similar to BR2_PACKAGE_FLUENT_BIT_WASM_ARCH.

baruch

> +
> +define HOST_HARE_CONFIGURE_CMDS
> +	cp $(@D)/configs/linux.mk $(@D)/config.mk
> +endef
> +
> +define HOST_HARE_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_HARE_CONF_OPTS) all
> +endef
> +
> +define HOST_HARE_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_HARE_CONF_OPTS) install
> +endef
> +
> +$(eval $(host-generic-package))

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
