Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32F0CD128A
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE64360EB3;
	Wed, 10 Apr 2024 21:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97pr4NTGSHMf; Wed, 10 Apr 2024 21:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FC1960EC0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FC1960EC0;
	Wed, 10 Apr 2024 21:46:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 517171BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B5CF41528
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:46:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRfc0eIzTtMd for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:46:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 63821407A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63821407A8
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63821407A8
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:46:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E459FF802;
 Wed, 10 Apr 2024 21:46:49 +0000 (UTC)
Date: Wed, 10 Apr 2024 23:46:48 +0200
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20240410234648.70732fa4@windsurf>
In-Reply-To: <20240327162319.149021-1-romain.naour@smile.fr>
References: <20240327162319.149021-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712785609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BJvfB46r09lV/Nt35w+/j37YXVSTsU9vgPdw3AOJ2ic=;
 b=OYbQyl1e9Tl7MXx03IKvuZV3+Jm7B2lE/ipopB0OEGPF5vSIEVkIYbFXQKeuHoHsxOcZmy
 SQUQ49UloGXMrWPJwEy3+Eimx69NY22yu8B62f0fCaV/OQcfYLG4/ffTM54v1rTN2NE8Yn
 Ei6s8pK3dmDB69QHkhs3hnEcdNbv9dUOgvltY2Q94ZCSv1ujRJx5r0eVW9CAVdpqSyAA/u
 7TDObaQGMhvAihxBYmOedQb9sp7cxqA8i+A6CEBmIQ7nYTuPHNl5qyifTFlA77kmrF3qu9
 AMlASsXZMUsb/9mlUKvsGr0fNnkhvWHi3k7eLBYNm1ugItA7z5NnL3Ve3lq0Cg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OYbQyl1e
Subject: Re: [Buildroot] [PATCH] support/testing: TestFileCapabilities:
 update kernel to 4.19.310
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

On Wed, 27 Mar 2024 17:23:19 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> Since the toolchain Bootlin update to 2023.11-1 [1], the arm Linux
> kernel build is broken with binutils >= 2.41 with:
> 
>   arch/arm/mm/proc-v7.S: Assembler messages:
>   arch/arm/mm/proc-v7.S:640: Error: junk at end of line, first unrecognized character is `#'
> 
> A similar issue has already be fixed for qemu m68k [2].
> 
> Bump to the latest kernel 4.19 that already include the backport
> of 790756c7e022 ("ARM: 8933/1: replace Sun/Solaris style flag on section directive")
> 
> [1] 7e0e6e3b8618ab942f25b11ee72fbc5a4deefdf1
> [2] a1ce9474e40f731f327035d8c0962abb16f00ff7
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6414160106 (TestFileCapabilities)
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  support/testing/tests/core/test_file_capabilities.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
