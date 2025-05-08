Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320DFC3ABBE
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 17:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 035D083B54;
	Thu,  8 May 2025 17:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGonUJ5joY8V; Thu,  8 May 2025 17:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1813817ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1813817ED;
	Thu,  8 May 2025 17:36:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E47D615A
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4C7A41465
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXMv1kkJr2Nn for <buildroot@buildroot.org>;
 Thu,  8 May 2025 17:36:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 30B3D41460
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30B3D41460
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30B3D41460
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:36:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E2EE719F58A;
 Thu,  8 May 2025 19:36:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 08 May 2025 19:36:25 +0200
MIME-Version: 1.0
Date: Thu, 08 May 2025 19:36:25 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250507201419.1505990-1-thomas.petazzoni@bootlin.com>
References: <20250507201419.1505990-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <d2204ef77aa6cc1f631fc45f692be7ab@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746725787;
 bh=hK5qSsjSbjHLb8WusMDy4Hg/GQFaUcwERIAcsOcFH/4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i9hkiTC+WPJZAWy1FhGBe+4AAnESzKt59cBNFLkLmplRN98DBm7/7kdPTCkt47Asx
 Ds54OBjMko1TP0kqBjCddT8zpFQEqfFY3UfEVM+yGk6ECFY2jd/9A9lWGtmvWh1ZN4
 XSxeKoYu33FrOlj4e3BxyWF1AbyWRbu0rxHUCcu1h1CCzg9Yb1JGKTNPulH7QlYcM3
 Yp4zEpn2grabQbP9G/SktNl37iCcMETsLZSuwz6tYmwxwzV+eVgHmn8LvEILMB+E6b
 +hkCrlFxAMkCgVU/lDkyE0977RSoghW7otvNHQ9o93XxLaLiOFISoXD6VBteOOIUlD
 Phg+BmEI+lboQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=i9hkiTC+
Subject: Re: [Buildroot] [PATCH] package/gdb: bump 16.x series to 16.3
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

On 07/05/2025 22:14, Thomas Petazzoni via buildroot wrote:
> Changes:
> 
>  Set GDB version number to 16.3.
>  gstack: [downstream regression] Output file names and line numbers
>  Fix build failure for gdbserver's raw_compare self test
>  Fix gdbserver crashes on SVE/SME-enabled systems
>  gdb: allow selecting default fg/bg colors in tui mode
>  gdb: Fix assertion failure when inline frame #0 is duplicated
>  [gdb/tdep] Rewrite i386_canonicalize_syscall
>  [gdb/record] Fix out-of-bounds write in 
> aarch64_record_asimd_load_store
>  gdb/dwarf: save DWARF version in dwarf2_loclist_baton, remove it from 
> dwarf2_per_cu
>  Fix segfault if target_fileio_read_alloc fails
>  gdb/tui: use wrefresh if output is not surpressed
>  [gdb/corefiles] Fix segfault in core_target_open
>  Bump GDB's version number to 16.2.90.DATE-git.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
