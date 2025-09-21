Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E81CAC59A
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 16:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4106C40855;
	Sun, 21 Sep 2025 16:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9qSexP8hDeP; Sun, 21 Sep 2025 16:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 687BD41356
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 687BD41356;
	Sun, 21 Sep 2025 16:50:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42C55D3
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 16:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 342A9814EE
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 16:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hTlhIcxP_Uo for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 16:50:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2701D816A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2701D816A2
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2701D816A2
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 16:50:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9BA874E40D86
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 16:50:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 72B0060634;
 Sun, 21 Sep 2025 16:50:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7E526102F17C0; 
 Sun, 21 Sep 2025 18:50:36 +0200 (CEST)
Date: Sun, 21 Sep 2025 18:50:34 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20250921185034.7025c654@windsurf>
In-Reply-To: <20250921161721.2070176-1-ju.o@free.fr>
References: <20250921161721.2070176-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1758473438; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Jx/0DDTYE9UUQn0ka9jnljndGksMnglEqWX+eWsm8hM=;
 b=GWowSvUV2IcA/Bsn4kI1hz2ygi+Sm0ZdnFOxdu7B+Rj49uP4b4vzWK+lQacBUociq/B73j
 4t/qHdj9eEQVD2ZwIwBF81RljzcODEj2YXTPngve1LctpN/1gVBgJp/tyoFFA7AbmeBGtk
 Swa5UUFHG4u9HZB+V5UgqA2dsTdm2FYng4Y9Y/92zbiQTJGT7gTY+icYdq1VBqTLCnkWUL
 AovxQ8QW91SX4wjGOSems7bW06ccvG0kHK3aZd8vsPLTRFgXv2qJtlWy1dHX0Q9jsx7GY1
 0flfzdwu9V73GAVvWmCdsGIWJt+i2GOF08UYvTtFKawM9bkPIsQQ6E3t0VRWQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=GWowSvUV
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/gen-bootlin-toolchains:
 avoid selecting _HAS_THREADS multiple times
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 21 Sep 2025 18:17:21 +0200
Julien Olivain <ju.o@free.fr> wrote:

> The Bootlin external toolchain file Config.in.options contains multiple
> occurrences of "select BR2_TOOLCHAIN_HAS_THREADS". See for example [1].
> 
> This file is generated by the support/scripts/gen-bootlin-toolchains
> script from the information published at [2].
> 
> Those multiple occurrences happens with toolchains having
> BR2_TOOLCHAIN_HAS_THREADS_DEBUG and/or BR2_TOOLCHAIN_HAS_THREADS_NPTL.
> 
> Since the script uses the startswith() method, the _HAS_THREADS
> selection is also generated for _HAS_THREADS_DEBUG and
> _HAS_THREADS_NPTL. See [3].
> 
> This commit solve the issue by adding a '=' character to make sure the
> test will be distinct from other strings having the same prefix.
> 
> Note: there is no functional problem due to those multiple selections,
> since it is allowed by Kconfig. This commit is simply cosmetic, for
> correctness.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options#L167
> [2] https://toolchains.bootlin.com/
> [3] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08/support/scripts/gen-bootlin-toolchains#L366
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
