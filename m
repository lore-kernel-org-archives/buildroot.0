Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B85C07E9B
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:47:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ECF360E0C
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ECF360E0C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2549E4018D;
	Tue, 20 Jul 2021 21:47:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OJJveE6RoPD5; Tue, 20 Jul 2021 21:47:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B62F401C8;
	Tue, 20 Jul 2021 21:47:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 300FD1BF9B2
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2051181AF4
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:47:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OgRWWw8Qs7Wk for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 21:47:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CF7881801
 for <buildroot@busybox.net>; Tue, 20 Jul 2021 21:47:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id F3D69E0008;
 Tue, 20 Jul 2021 21:47:30 +0000 (UTC)
Date: Tue, 20 Jul 2021 23:47:29 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Stefan <buildroot-list_21@green-sparklet.de>
Message-ID: <20210720234729.04a7349c@windsurf>
In-Reply-To: <2e60c4dc-6a6f-7124-c512-2b4495482f4c@green-sparklet.de>
References: <2e60c4dc-6a6f-7124-c512-2b4495482f4c@green-sparklet.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] docs/manual/adding-packages-cargo.txt:
 re-add FOO_CARGO_MODE variable
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@busybox.net, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Stefan,

On Tue, 15 Jun 2021 15:55:54 +0200
Stefan <buildroot-list_21@green-sparklet.de> wrote:

> +16: FOO_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
> +17:
> +18: FOO_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(FOO_CARGO_MODE)
> +19:
> +20: FOO_CARGO_OPTS = \
> +21:    $(if $(BR2_ENABLE_DEBUG),,--release) \
> +22:    --target=$(RUSTC_TARGET_NAME) \
> +23:    --manifest-path=$(@D)/Cargo.toml
> +24:
> +25: define FOO_BUILD_CMDS
> +26:    $(TARGET_MAKE_ENV) $(FOO_CARGO_ENV) \
> +27:            cargo build $(FOO_CARGO_OPTS)
> +28: endef
> +29:
> +30: define FOO_INSTALL_TARGET_CMDS
> +31:    $(INSTALL) -D -m 0755 $(@D)/$(FOO_BIN_DIR)/foo \
> +32:            $(TARGET_DIR)/usr/bin/foo
> +33: endef
> +34:
> +35: $(eval $(generic-package))

Thanks for the patch. However, it seems like the only package that uses
this currently is not formatted like you're suggesting. See
package/ripgrep/ripgrep.mk. First, it uses BR2_ENABLE_RUNTIME_DEBUG
instead of BR2_ENABLE_DEBUG, and it does it in a different way.

Could you adjust the documentation according to what
package/ripgrep/ripgrep.mk is doing ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
