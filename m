Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2BEC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 19:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70CC940211;
	Mon, 15 Jul 2024 19:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRE1vq4LvFA5; Mon, 15 Jul 2024 19:44:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3591C4029C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3591C4029C;
	Mon, 15 Jul 2024 19:44:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 046481BF3D4
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 19:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2C2F40376
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 19:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5wgt-rIsS8eP for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 19:44:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AAD9B4044B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAD9B4044B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAD9B4044B
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 19:44:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B092C60003;
 Mon, 15 Jul 2024 19:44:15 +0000 (UTC)
Date: Mon, 15 Jul 2024 21:44:14 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240715214414.4c4f2e96@windsurf>
In-Reply-To: <20240228202414.719244-1-buildroot@bubu1.eu>
References: <20240228202414.719244-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721072656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ykewRzUaBhU/uFMHmlMt/dJuukMUT//XgjF13ct5rJU=;
 b=fxklRWpkaBU4Q6RGxlmpj8eLoSck5ejopRQ+5BASDK12kvGzEKgdbMlbG88Ds4rP4lPMup
 4/LJY6iUi+FAaH7I55TUcnF1NyFlwSqickXk+GnSfnyM+CzATWwWZgSu3AV+NSJu1TfLlQ
 xmZjE+lFGWpM984FLuq/y6jv4TzIt9lbpqK25cyv1vj4O9GM98OuhnCZ/VxnmDPv0glBmV
 cEJoFMIiLUXwvJ6ZOltc3aEwfSmjdtl+kFmfOwtzCnZYsRceTiJn0C/DYtcTEK9Ot/yiVJ
 iT6K+++taqEZGLXMPb8LjTmU53h76HjA2eAF62QlszUWI1SQQ2uA2cp9Y/Hn+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fxklRWpk
Subject: Re: [Buildroot] [PATCH v2 1/2] package/pico-sdk: new package
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
Cc: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 28 Feb 2024 21:24:12 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

>  package/Config.in              |  1 +
>  package/pico-sdk/Config.in     |  9 +++++++++
>  package/pico-sdk/pico-sdk.hash |  3 +++
>  package/pico-sdk/pico-sdk.mk   | 20 ++++++++++++++++++++
>  4 files changed, 33 insertions(+)
>  create mode 100644 package/pico-sdk/Config.in
>  create mode 100644 package/pico-sdk/pico-sdk.hash
>  create mode 100644 package/pico-sdk/pico-sdk.mk

Entry in DEVELOPERS file was missing, so I added one.

> +define PICO_SDK_INSTALL_STAGING_CMDS
> +	mkdir -p $(STAGING_DIR)/usr/include/pico-sdk
> +	cp -r $(@D)/* $(STAGING_DIR)/usr/include/pico-sdk

Since it's not just headers, but a big pile of stuff, I changed to
install it to usr/share/pico-sdk instead.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
