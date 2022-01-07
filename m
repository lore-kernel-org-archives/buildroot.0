Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEEAC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 10:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3134C429B0;
	Fri,  7 Jan 2022 10:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8QyaAISRjcII; Fri,  7 Jan 2022 10:05:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98D52428D6;
	Fri,  7 Jan 2022 10:05:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C568F1BF2EC
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0ABF4019B
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aTAs-W1u0Ark for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 10:05:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78CF4400CC
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 10:05:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5F4A020000A;
 Fri,  7 Jan 2022 10:05:23 +0000 (UTC)
Date: Fri, 7 Jan 2022 11:05:22 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220107110522.523586ae@windsurf>
In-Reply-To: <20220107090348.3947187-1-romain.naour@smile.fr>
References: <20220107090348.3947187-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCHv4] package/bat: new package
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
Cc: Romain Naour <romain.naour@gmail.com>,
 David Pierret <david.pierret@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri,  7 Jan 2022 10:03:48 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> index bf1436a86b..e2fe104cf3 100644
> --- a/package/pkg-cargo.mk
> +++ b/package/pkg-cargo.mk
> @@ -110,6 +110,7 @@ ifndef $(2)_INSTALL_TARGET_CMDS
>  define $(2)_INSTALL_TARGET_CMDS
>  	cd $$(@D) && \
>  	$$(TARGET_MAKE_ENV) $$($(2)_CARGO_ENV) \
> +		CC_$$(subst -,_,$$(RUSTC_TARGET_NAME))=$$(TARGET_CC) \

But we don't even pass this variable at build time.. why would it be
needed at install time? Due to the fact that "bar" builds stuff during
the install step, I understand that we might need extra variable during
the installation step, but I would expect to only need variables that
are already passed during the build step.

Any idea?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
