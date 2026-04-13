Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB221F34C78
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 17:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92ABD80784;
	Mon, 13 Apr 2026 17:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IOqJ997TrLZU; Mon, 13 Apr 2026 17:35:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29FCC80779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776101707;
	bh=2Dn9ZulLQEsgSZnVc4ClELG9FdEO1o/F/Azy53mWNpM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jZaEfRUzaqcNJ0WISq6p9Sltzsy7kGR7HvYW5Jgmq2YT+0hbiR63EPS1b8sATboYb
	 CyQpkag3+EnhSfL/n2OjVrPVuRRm4sNFKbEyUMZV4I+8nD4G31jdFwbfFXVUZy4z/B
	 OUzlIBPVuUHDDvvtksY+Qe+Z2kjGmHnDZine7FcMujm0BXJYxHx0dVWxUxXzfruE/u
	 zCYQ+SJesekXd/MluUkJRlwidY9qgIvsIOMuiQu4gG8URdkSujgKbjspqRE11Pj/sr
	 fcMmqjHGBMZt0wjmujNYNkgz+P2kHhTeYXXk46fbwKOhJxlKnMw+KGXmZ1gZ3vKJUt
	 4H11jjJO6oqTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29FCC80779;
	Mon, 13 Apr 2026 17:35:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F608283
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 17:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 758DE40226
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 17:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xIomVWsj4vAJ for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 17:35:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 501AA40216
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 501AA40216
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 501AA40216
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 17:35:04 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 1F30B2C80CDB;
 Mon, 13 Apr 2026 19:35:01 +0200 (CEST)
Message-ID: <67e6f7f4-4e43-4230-b2c8-e5bb98d1ccc9@bubu1.eu>
Date: Mon, 13 Apr 2026 19:35:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nicolas Serafini <nicolas.serafini@flyability.com>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, Simon Richter <simon@sinic.eu>,
 David Pierret <david.pierret@smile.fr>, Danilo Bargen <mail@dbrgn.ch>,
 Bernd Kuhls <bernd@kuhls.net>, Graeme Smecher
 <gsmecher@threespeedlogic.com>, Julien Olivain <ju.o@free.fr>,
 Torben Voltmer <mail@t-voltmer.net>,
 James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>,
 Alexander Shirokov <shirokovalexs@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
References: <20260410224221.1185631-1-nicolas.serafini@flyability.com>
Content-Language: en-US
In-Reply-To: <20260410224221.1185631-1-nicolas.serafini@flyability.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1776101702; bh=S6x3n/rBnO8zUb6RAaGgb3V+iznCX5ksbfe23mQk5+Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=YMHQS9YPoIz1OGDMQiGjZFZa5qXx3fiYMxvmNRMHtGXkI1IBPJ4B9iK1IozNePLHf
 AxAMFAWbTvQsVgtH1+0u4kETBjdIwgnDr7+lno/nD3bqFVukJd1SZPKOK+1aozkprT
 atkZ+xZugtwbvHKdqQQSie73KWkypvhcCsJygpd2crFNoCaE+MUXe/59R3ikGuI4Ze
 fexfjryzopN6l0LHH+9NZLKWQGiCWRahkJ/aJAk5MmYQd98Vpx2ZUmqqN3UhnGKstW
 wCHTZKxnQrXuVWpg6cmRBw76nb5llbbUNZ5cG89wDae//SmoAxLYYyWkP0fpXL2K8S
 s3Z88Res671kQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=YMHQS9YP
Subject: Re: [Buildroot] [PATCH 0/4] package/rust: bump to 1.94.1 and fix
 bootstrap
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Nicolas,

thanks for taking care of this! I've done a test build of the rust 
bootstrap and a few packages with that and everything worked, so series

Tested-by: Marcus Hoffmann <buildroot@bubu1.eu>

I did noticed that quite a few things during the bootstrap get built 
twice. Once in the host-rustc-build step and then again in 
host-rustc-install. Do you know why this is the case? This (sometimes?) 
happens for normal rust packages as well, but during the many-hour long 
bootstrap it was especially noticeable here.

On 4/11/26 00:42, Nicolas Serafini via buildroot wrote:
> Apologies for the resend, my previous submission bounced as I was
> not subscribed to the mailing list with this email address.
> 
> Rust remained at version 1.88.0 because, starting from version
> 1.89.0, the bootstrap process was redesigned, and attempting to
> bootstrap host-rust from source resulted in the following errors:
> 
> error[E0463]: can't find crate for `std`
> error[E0463]: can't find crate for `core`
> 
> Several attempts to bump Rust were submitted but none were merged:
>    - Bernd Kuhls, bump to 1.92.0 (Dec 2025)
>      https://patchwork.ozlabs.org/project/buildroot/patch/20251218222527.3861751-1-bernd@kuhls.net/
>    - Simon Richter, bump to 1.93.1 (Feb 2026)
>      https://patchwork.ozlabs.org/project/buildroot/patch/20260226073135.64960-1-simon@sinic.eu/
> 
> This series bump Rust to 1.94.1 and fixes the bootstrap issue:
>    [1/4] Bump Rust from 1.88.0 to 1.94.1
>    [2/4] Fix the bootstrap build for Rust >= 1.89.0: set
>          local-rebuild = true in config.toml and replace the broken
>          relative symlinks in host-rust-bin with hardlink copies.
>    [3/4] Bump the cargo vendor suffix from -cargo4 to -cargo5 and
>          update SHA256 hashes for all 34 affected packages, as the
>          vendored content changed following the Rust bump.
>    [4/4] Add riscv64gc-unknown-linux-musl target support, rebased
>          from Mariusz Bialonczyk's earlier patch (Oct 2025) and
>          also part of the patch series for the bump to 1.92.0:
>          https://patchwork.ozlabs.org/project/buildroot/patch/20251028045833.2792350-1-manio@skyboo.net/
>          https://patchwork.ozlabs.org/project/buildroot/patch/20251218222527.3861751-3-bernd@kuhls.net/
> 
> Tested with:
> utils/docker-run support/testing/run-tests \
>       -k -d dl -o output_folder tests.package.test_rust
> 
> Nicolas Serafini (4):
>    package/rust: bump version to 1.94.1
>    package/rust{,-bin}: fix bootstrap build for Rust >= 1.89.0
>    package: update cargo suffix to -cargo5 and fix hashes
>    rust: add support for riscv64gc-unknown-linux-musl target
> 

Best,
Marcus



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
