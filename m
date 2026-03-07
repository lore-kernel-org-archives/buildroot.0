Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7C1F513ED
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 14:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67B4083F5A;
	Sat,  7 Mar 2026 14:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1qjA5D8JDBd5; Sat,  7 Mar 2026 14:15:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93BD183F7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772892903;
	bh=IMT7Sxr0dvEOr2K+YT2iGZNVsT3LbxXj1UWgFeU6az8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kwiz5oJTU6BnMMD8PxiGz/5lyYdPIVi+MipsfjNxCBQRIMmDTqYduavuVFCHaQFOQ
	 tI8PgZV7870EaF8UOQa4koC+OMqoiaKWgTVkqZT5qOQODjwmDiCeMnk7BEulPJ9o7u
	 ho3cgAld0no/U9zIsUw+SxUWsgdYLKjKV8n3ToCJqnGUkfCXxz6jYY/fddZSTUyR6j
	 y2fRoHrUZ0YOP0WfXEihMFhPNczIvzME0bMWIHPPm7ulEtadNXxS+KlAbTwuhpxgGG
	 IKGU+eFK0bovaEGvt25OUAZqt8+oslGtPfnQWjvWf8VIYdbVOew5cIBVTrz37Xuh1s
	 nxjOSrRG/tIJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93BD183F7C;
	Sat,  7 Mar 2026 14:15:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CEFAD169
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 14:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0C9340724
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 14:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-KhZq9iHyy5 for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 14:15:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6FBED40443
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FBED40443
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FBED40443
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 14:15:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id BA9895FFB7;
 Sat,  7 Mar 2026 15:14:56 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 15:14:56 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 15:14:56 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Steve Kenton <skenton@ou.edu>
In-Reply-To: <20260306232533.466162-1-bernd@kuhls.net>
References: <20260306232533.466162-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <ab76c2e089657f778c4e6bc20287f9b4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772892898;
 bh=4MqNYLIatY6u5MOJgrCnkqOLDanH75iVTdlXsaeNaSE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bnTE8KwJZkxc1XCGapNMiJ2yKJg5hPfT3DgO/uy+dfEmBau5uP7vqsRjpz1Y5Jg9H
 bJ4b2xS1nvy16qp2chwUjFHevdzp5X99y+wLZN2Sm0edPqJf2CxbqewELOWdFrlEA6
 GpzR8WS9X14gySc2eqfC2QqpjElBr9BNWfQxxhqGofnEdiMusEjCgi+Q4e03V9m9E1
 oVLCLS/eL2FVGo+NRjssXb4hy3k48bVyvdYRXuZEYyLBFqxyWKhQbp8Yk62Yyar6L4
 xUNY8wZx3n15FwXZTYfByzcEjsatYPUuNfmU665O0DioN4qcXJ64pzPZMYl7x7H17Y
 MMD0xhvcoCeug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bnTE8KwJ
Subject: Re: [Buildroot] [PATCH 1/1] package/memtest86: bump version to 8.00
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

On 07/03/2026 00:25, Bernd Kuhls wrote:
> https://github.com/memtest86plus/memtest86plus/releases/tag/v8.00
> 
> Upstream merged memtest.bin and memtest.efi into mt86plus:
> https://github.com/memtest86plus/memtest86plus/commit/71d061a4c7cd22fe882bb025b3a061745d952d4c
> 
> and renamed the build directories:
> https://github.com/memtest86plus/memtest86plus/commit/a10664a2515a81b07ab8ae999f91e8151a87eec6
> 
> Upstream commit
> https://github.com/memtest86plus/memtest86plus/commit/6f4ec848c4e9291626236bca457baf7b95542325
> removed the override of $CC, for details of the problem see this 
> thread:
> https://lists.buildroot.org/pipermail/buildroot/2023-December/366174.html
> 
> and in fact the first build command now reads
> 
> /home/bernd/buildroot/output/per-package/memtest86/host/bin/i686-buildroot-linux-gnu-gcc
>  -m32 -x assembler-with-cpp -c -I../../boot -o boot/x86/startup.o 
> ../../boot/x86/startup32.S
> 
> instead of this command seen with version 7.20:
> gcc -m32 -x assembler-with-cpp -c -I../boot -o boot/startup.o 
> ../boot/startup32.S
> 
> This should hopefully fix the build on non-x86 hosts:
> https://autobuild.buildroot.net/results/fc1/fc14be4f2e5b1db2f7313156b50c9e2e298b06e9/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
