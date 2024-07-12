Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1098BC3DA4B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 13:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE2774196D;
	Fri, 12 Jul 2024 13:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ye3TNPbxxIi3; Fri, 12 Jul 2024 13:59:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D4C2418CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D4C2418CA;
	Fri, 12 Jul 2024 13:59:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6BBE1BF232
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4BB6401C7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:59:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHeKlzVX8fTy for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 13:59:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7280240185
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7280240185
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7280240185
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:59:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05F791C0003;
 Fri, 12 Jul 2024 13:59:31 +0000 (UTC)
Date: Fri, 12 Jul 2024 15:59:31 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240712155931.38420795@windsurf>
In-Reply-To: <20240622114621.447904-1-ju.o@free.fr>
References: <20240622114621.447904-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720792772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qxlTWa+H/C3b982OtC6w+RGiAq2b4CAuKZj+ZHiRi7k=;
 b=afMRTgLG8iG++0yEoLHsVBM6c05pDHkxq/Uxy/f/Vp0qkLm8ITbPrbwbQZal+qeZi1L+U7
 Hd6QcA6MQuz+PTxp7tVYezduGYj2n6ClEZpOdWCxtP5biRfczkVFHCD1+jIgm9LMRs/Cg9
 LvENGR48JFN7xd4v4MvAqAUV3YCnW/cWysJaKK7DKwSgu7dBW2/RIxWzXzu1ortXBN66gu
 /t2/uox8upahWNDuMwImoXD0VCUk8mrTm3UcpLPRMiyz5hU2rBrViTHTkg83C/deIH78HC
 hui0BQWK+U+zM6qOiQsct/Tggk06/0GtdcDttSKvDJ+GF6/uAHlkNqdAyF6OWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=afMRTgLG
Subject: Re: [Buildroot] [PATCH 1/1] configs/spike_riscv32: new defconfig
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 22 Jun 2024 13:46:21 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Buildroot commit [1] updated riscv-isa-sim (Spike), which now includes
> a NS16550 uart emulation. This can be used by RV32 Linux Kernel. This
> commit introduce a defconfig for running Linux on Spike RISC-V 32-bit
> ISA simulator.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/853b7661bf5ddca5d4b81964ef1a19a133beac85
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit 853b766 with commands:

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
