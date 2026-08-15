Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F04C5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 19:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA45E80E75;
	Sat, 15 Aug 2026 19:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7KIja8SnTUM; Sat, 15 Aug 2026 19:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F82880DDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786821715;
	bh=4OjjeCRcRNEGWWkWyhMGQ2cH6wWANaqnwR8v6O0wDbM=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=k0fpNBOmJ8CyauOyAmzS10l/HwrC0XUOj/pnHx/BjkqEtwQuNxxM/5lE80E9ngSmR
	 CwKbHn721C2lfp1erArHafiT7U1YhYqZq13u+HlVoQt/g0rWDQMa5NtGuoh4AMfOp7
	 nlaCd+xtRMdeP+azqlQQVyRPH/eeWQ+Q6ppZf++cy1aNtVP+n2EeNALDXIlBcYyClx
	 VDwjCOn+qYgD+2v9TiMeKtqAeTpROrBoWYGwvmfx+iMVGzFE3ReCS0i+KR+weIMk+8
	 /fUcYFqHUZoaaTYNxHYq7fjfG/AHyaEBxnROh4bYkGqLbfMlUDCMEfUEvjZIVk1rIk
	 QImiiw8dYT5hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F82880DDE;
	Sat, 15 Aug 2026 19:21:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 65873334
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57AC380DDE
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DljFZGVzWhA6 for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 19:21:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4DDAB80DDB
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DDAB80DDB
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DDAB80DDB
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1786821711; bh=pUicERhtiH4SK4wAnEI2e4mcISmEwgDQ5NtveofcxKM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VpyYoy27Zj3/l7X7hlKHX/e2evB3l/xUyfu25Jb1fntf/l10JqJNUVUoe6EJ4agMm
 bBiIcmOsuQMGEdZiPTGMD+0PExV2CswRTDhOKju0DVhHstMN72+r9ATfbTUKaTkEAD
 qt1J/xyT2VVXhzmnw8Qc8G9iCCgP17gx5Ut9giS8ueIr8F9OZATwfHprHUhsFEyus2
 ZzkKzb3+jU3YMGISWaFvNPZKDQ+g5+gfdZ4JX10XG6fokW/UbKGg5iYpnmtgi4HXX0
 ZPjJ0smOqSVryjH2jXf+A4h8h1WBts5/sO28r+H1nIjpxiXLvUU8bxhKv94Qrn7m6H
 AvCwl86NVhOnw==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 2DAE731E0555; Sat, 15 Aug 2026 21:21:51 +0200 (CEST)
Date: Sat, 15 Aug 2026 21:21:51 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <aoC8T910-K9DIofo@waldemar-brodkorb.de>
References: <20260815121004.2036403-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260815121004.2036403-1-romain.naour@smile.fr>
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: Re: [Buildroot] [PATCH] package/uclibc: disable SSP support for
 riscv32
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Romain,
Romain Naour wrote,

> On modern 32-bit architectures like RISC-V (riscv32), legacy 32-bit
> time syscalls like __NR_gettimeofday are intentionally omitted because
> RV32 implements a strict time64-only ABI to avoid the Year 2038 bug.
> 
> But uclibc-ng code [1] is using a direct __NR_gettimeofday syscall that
> is not defined for riscv32.
> 
> [1] https://github.com/wbx-github/uclibc-ng/blob/ae4a98f9612c7050b1bceb9c8340fe5ef9345e22/ldso/include/dl-syscall.h#L263
> 
> As a workaround, we have to disable the SSP support for uclibc-ng
> toolchain on riscv32 for now.

Thanks for your patch.

I would rather like to fix it inside uClibc-ng like suggested here:
https://lists.buildroot.org/pipermail/buildroot/2026-August/807581.html
https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/WIKMWPXJYAPTVVZ2MMZINUJNPIJXBMOE/

best regards
 Waldemar
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
