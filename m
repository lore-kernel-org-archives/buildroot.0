Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE47E77197
	for <buildroot@archiver.kernel.org>; Sun,  5 Jan 2025 17:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C564F81216;
	Sun,  5 Jan 2025 17:16:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fGckAkRRpKBS; Sun,  5 Jan 2025 17:16:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E407F81219
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E407F81219;
	Sun,  5 Jan 2025 17:16:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B7646B
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 17:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 569E981217
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 17:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xeqKVUGKd4Q9 for <buildroot@buildroot.org>;
 Sun,  5 Jan 2025 17:16:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ACA3981215
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACA3981215
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACA3981215
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 17:16:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id F05F8B00571;
 Sun,  5 Jan 2025 18:15:56 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:57244])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Jan 2025 18:15:56 +0100
MIME-Version: 1.0
Date: Sun, 05 Jan 2025 18:15:56 +0100
From: Julien Olivain <ju.o@free.fr>
To: Saeed Kazemi <kazemi.ms@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20240723070439.4119145-1-kazemi.ms@gmail.com>
References: <20240723070439.4119145-1-kazemi.ms@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <bd194b2a7ce4c16fe170ba26080ff7f6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736097358;
 bh=FYuD1GrNB9jlksSVFor5hwHowKfmV/t9nv6byHhgd9M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OZpMFg252VEVDo64NhwKqQakw2n3VPqfchM6aSN4ZbUziPBtGuvdK/j1M/M5UhcHD
 pMOwH8oOcP9ySLytXhj2ILUl3qdaR9ocu/RETDZcdqx4vY04Xz1LCxluU6tICKCvP8
 9EI86ZqmjQmEJpLPRXLImjRiv76rFXZ9QsJjzW6RmpkIavOf3WKNXo/xHSos5LO349
 RyNmN275bEmu9jzB+GLjukOEzO7Uni/WdiTOSfMJAUpqhAqbUfweq/H7vtFKpFuFzC
 JFlxEEnu431vrJoVy5z21BulJpSsf7vnfg1omE4PJ+QTtYm7uzybjnZz9DH65rCa26
 7uTzrkyjA/L9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OZpMFg25
Subject: Re: [Buildroot] [PATCH 1/1] package/parsec: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Saeed,

On 23/07/2024 09:04, Saeed Kazemi wrote:
> Hardware/platform abstraction service for TPMs, HSMs, and Root of Trust
> 
> https://github.com/parallaxsecond/parsec.git
> 
> Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>

Thanks for the patch. I applied to master.

I had to add an upstream patch (probably due to a newer version
of Rust in Buildroot). See:
https://gitlab.com/buildroot.org/buildroot/-/commit/04a5fa5ff797de55d85db97d4dd58a73ed8c5a35

Could you provide me an usage example of parsec/parsec-tool that could 
run
in a Qemu emulator, so I can write a runtime test?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
