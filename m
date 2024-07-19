Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64FEC3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 20:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25C6D83F09;
	Fri, 19 Jul 2024 20:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xpj1CpbKFCTK; Fri, 19 Jul 2024 20:32:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4741183F0B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4741183F0B;
	Fri, 19 Jul 2024 20:32:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B3561BF31F
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 20:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA0EA4102D
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 20:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DaWkuWbPIkT7 for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 20:32:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 61CB540175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61CB540175
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61CB540175
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 20:32:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AC9E60005;
 Fri, 19 Jul 2024 20:32:25 +0000 (UTC)
Date: Fri, 19 Jul 2024 22:32:24 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20240719223224.2b67a89f@windsurf>
In-Reply-To: <20240719-boot-uboot-env-select-v2-1-6abcd50db794@collins.com>
References: <20240719-boot-uboot-env-select-v2-1-6abcd50db794@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721421145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXqWagogndRc6+cxKH/xWzy5P/9PiQokMbiv6z5OMcA=;
 b=DLJQmKOpqWI32dZOpZyD/60MTvoFGWcb3VzfSWEIIIaVVhzKXMC6yeWz2uf3aO6MTgTY77
 G70QMsG4yHGzcawl8D+i99d3ttg4BovWtYYBPY4Ia6JA5wsIy7DYx9P8Q/+B8435mZ457O
 qt4+YkMmA05TVgVcrtG+q99PdqPK52NA/Pc3C6h3wYye22fm/oNEg05qkrRqi10bXqGxHB
 A1GAqlt7yIbpK3hOw8aAjmDA7K3XwnDBCDpnKO77y72mF3L/TS004FBwHzt4UUQ4r7CwEd
 GEep/6CUMub8cv/9oSgtqGK4d9efFZ5WWAD/icNc45DXEcM+kXkNwhAlAgUEzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DLJQmKOp
Subject: Re: [Buildroot] [PATCH v2] boot/uboot: fix Kconfig warning for
 DEFAULT_ENV_FILE
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 19 Jul 2024 14:50:26 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> +config BR2_TARGET_UBOOT_DEFAULT_ENV_FILE_HIDDEN

No need to resend for that, and even though I know I was the one
suggesting this name, I don't actually like it. Maybe:

config BR2_TARGET_UBOOT_DEFAULT_ENV_FILE_ENABLED

or something like that?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
