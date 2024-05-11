Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91E1C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 20:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACBB6400E5;
	Sat, 11 May 2024 20:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ovVSdpI0BKuH; Sat, 11 May 2024 20:52:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4F80403F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4F80403F9;
	Sat, 11 May 2024 20:52:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED9C01BF57C
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D81FD84231
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMWFmswoXS93 for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 20:52:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C3A1F8422F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3A1F8422F
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3A1F8422F
 for <buildroot@buildroot.org>; Sat, 11 May 2024 20:52:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FBD1E0004;
 Sat, 11 May 2024 20:52:28 +0000 (UTC)
Date: Sat, 11 May 2024 22:52:27 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240511225227.02f8cfe0@windsurf>
In-Reply-To: <Zj9c87ghyA63Enj9@waldemar-brodkorb.de>
References: <Zj9c87ghyA63Enj9@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715460748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K2cKa/cbQ2caF4o16MLDXmTT12DxZg1tfiKFycGp2pk=;
 b=Ke2WywQHwzrx2y2WD8ibmGP1JyVS3bZ3tqvVZ3Twz5DHkJjZ47tX+chzokw3wcXFx6L5M5
 QRjKqB6PwV6Sehs/7iuE+FnF4iVt9HTVMDIb1kYHQI7fBKoJXodm+AIe+KYIhmRyoX27Dt
 4dogc+n3/JtG8ddTEfWjcTzLQ4jZEMGhJudOKRp7DmoM4dGXCs1iOauKM7IrmRrWwvEuhO
 IXRxfU2Y99Q3RlQH7cUidrofk9KZ2p2Bsm2qZLruM4agOp3r1ZFnBpvyMPTws7tpoY2TYF
 E/gUT+nhhL1xU1LGeCznbiY3nidh6WBR0SptXnN1MNEU335GIX38zt6phsYFXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ke2WywQH
Subject: Re: [Buildroot] [PATCH 1/3] package/gcc: add version 14.x
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
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, 11 May 2024 13:56:35 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> +config BR2_GCC_VERSION_14_X
> +	bool "gcc 14.x"
> +	# powerpc spe support has been deprecated since gcc 8.x.
> +	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
> +	depends on !BR2_POWERPC_CPU_HAS_SPE
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_14

This BR2_TOOLCHAIN_GCC_AT_LEAST_14 option did not exist, so I pushed a
preparation commit that adds it, and then applied your commit on top.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
