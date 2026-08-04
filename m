Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C73C55822
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 20:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59862405E1;
	Tue,  4 Aug 2026 20:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PmNEVF9moC8l; Tue,  4 Aug 2026 20:35:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6338B405EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785875710;
	bh=LXs4bqwgANZqHtFDJ5TnMoNL+sdEXkaE6aA+Bq5BfK0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ff7a0nGHpba2g3B4zOxg6h9Z0B7e09dBZ3ZfT7gRhf3q7HPyrIdKSxyWYPQyPgsC9
	 efqliIeqVewQjNeykO892dcarmPyV4Y2/BiGwmydzb8742zPlScRzHizcFQPgbpAQV
	 EsP0otEO8LHUSTbEuK3/PHrLwfPKhgE1ew6QlD71wvpaT0igH/O/kX3jUSjQW75+r/
	 jfFrmL3THB+m+1WXGRbiEWvA/fu17nYp6tCEuI1txgiJDuaCUQ0N/vUf3nEfa4Xr5W
	 XNUc1BqGTG5dTJY70JhLt3/SRdKnfuJ/TbSq9t9DEI55NxXiTKXl30hQudQxADxboM
	 ztEJMuKcUKMyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6338B405EE;
	Tue,  4 Aug 2026 20:35:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D3724288
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D11AE80880
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VZdLLK7cISf1 for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 20:35:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DEDFD8087C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEDFD8087C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEDFD8087C
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:35:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0731B60159;
 Tue,  4 Aug 2026 22:35:03 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 04 Aug 2026 22:35:03 +0200
MIME-Version: 1.0
Date: Tue, 04 Aug 2026 22:35:03 +0200
To: Waldemar Brodkorb <wbx@openadk.org>, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <amLXynHKF2zuPoI2@waldemar-brodkorb.de>
References: <20260721184249.1579381-1-dario.binacchi@amarulasolutions.com>
 <20260721184249.1579381-2-dario.binacchi@amarulasolutions.com>
 <59d2eac82e3a58e006e67d3ee35f3bf6@free.fr>
 <amLXynHKF2zuPoI2@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <39a2183cd7ae82634b3d698acabc7272@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785875706;
 bh=PfGmunxyWdcnVK1y2C2eKSrGDnHCS2uh57NMbTIOcTE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K1vwPaZqhFstCLbQ+kqfvY5TEtAfeSduBou7mEHr5/22xh9K0b7sqZVIdsw85BkOM
 ZhMXkCQHi4V3jqspPts1PjLN30H3cuVS+CTMevA/wMIEmdq94TFYNT9ML9LeJMZZLW
 3suvcgeJKQjLoawThEzixPu28wIpZI0q8D2kpKMD/jV3MKyxODhbQDstKxZOZ2xX0L
 CM2ElXBxlxtbkwFSIWmEfD4nJHGnjdXEtmTm54VMJFjrybk2UHWoJiU0J+PVTFVd2h
 jc34kyWc4lmmBLs2okOWQnXx6Vlr6rJe+FclLm+PB4ROdl6PYae4gKviiq4OkovzV+
 YlFv958+4TZaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=K1vwPaZq
Subject: Re: [Buildroot] [PATCH 1/6] configs/stm32f429_disco_xip: fix boot
 failure after uClibc bump
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Waldemar,

On 24/07/2026 05:11, Waldemar Brodkorb wrote:
> Hi Julien,
> Julien Olivain via buildroot wrote,
> 
>> Hi Dario,
>> 
>> On 21/07/2026 20:42, Dario Binacchi wrote:
>> > Since uClibc was bumped to 1.0.58 (c7fef3704c70, "package/uclibc:
>> > bump to 1.0.58"), the board fails to boot:
>> >
>> >     sh: out of memory
>> >     Kernel panic - not syncing: Attempted to kill init!
>> > exitcode=0x00000100
>> >     CPU: 0 PID: 1 Comm: init Not tainted 6.1.167 #2
>> >     Hardware name: STM32 (Device Tree Support)
>> >     Function entered at [<0800ea1e>] from [<0800de7b>]
>> >     Function entered at [<0800de7b>] from [<080e4991>]
>> >     Function entered at [<080e4991>] from [<080e2d19>]
>> >     Function entered at [<080e2d19>] from [<080125eb>]
>> >     Function entered at [<080125eb>] from [<08012b09>]
>> >     Function entered at [<08012b09>] from [<08012b69>]
>> >     ---[ end Kernel panic - not syncing: Attempted to kill init!
>> > exitcode=0x00000100 ]---
>> >
>> > The STM32F429 has no MMU, and uClibc's standard malloc() implementation
>> > returns NULL for allocations performed during early init on this target,
>> > causing init to abort immediately.
>> >
>> > Fix this by switching to MALLOC_SIMPLE, a plain mmap-based allocator
>> > meant for small/noMMU systems, via a uClibc config fragment. The
>> > fragment is placed under board/stmicroelectronics/common/stm32f4xx/,
>> > rather than under the board-specific directory, so that it can be
>> > shared with the STM32F469, another Cortex-M4/noMMU board affected by
>> > the same issue, which will be fixed in a subsequent patch.
>> 
>> For info, the issue may have been introduced by uclibc commit:
>> https://github.com/wbx-github/uclibc-ng/commit/487af14988c3c923aa661f204642597cff356a83
>> 
>> There is an upstream fix, not released yet,  which seems to fix the 
>> issue:
>> https://github.com/wbx-github/uclibc-ng/commit/7730f0d05a51cd89a7123bd696e4638c3c035d7b
>> 
>> You could possibly drop this malloc config change after the next 
>> uclibc
>> bump.
>> 
>> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>> 
>> In the meantime, I applied this series to master, thanks.
> 
> I sent following patch to avoid any breakage before the next
> release:
> https://patchwork.ozlabs.org/project/buildroot/patch/ai6stJaA2hWFBHDW@waldemar-brodkorb.de/
> 
> But it was not accepted, yet. Xtensa and M68k noMMU is also
> affected.

Thanks for pointing that out.

Dario, I have merged the uclibc fix in:
https://gitlab.com/buildroot.org/buildroot/-/commit/35d3927e85645d0dbfe608bd5954bfa6704200e8

So you should be able to revert those malloc uclibc config changes.

> best regards
>  Waldemar

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
