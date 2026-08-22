Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8629C5DF97
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 20:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65F4C606F5;
	Sat, 22 Aug 2026 20:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id prav_pbyjoPA; Sat, 22 Aug 2026 20:15:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787429704;
	bh=/Hm0GPJkfxekuJTSlT2nk4yN4aNnDTB88K5waH5xcIE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z9qNMJbT+dLBnIg7/lKfhSq5GidomXcflQHDNuL/17smvYd4F0c1OILAXQprTK3gT
	 nUKI9Ag6+V5LEbcNsXeWrRkle2iqFXeWepNKR5uJKAp93mvoyWOrj6NLPJhkKBwxa+
	 8gzvi0/6S9uyHtpvej89KyDYlCArGIRyd4Gakpj9gdgWD9AWWrpR/d3vVgLXygcrPK
	 MiopHow+AImK2eye4uuf0s2RONtccO++MKYnHvdS7B0dX1r/QGmRPLAJhGr3gw7GM9
	 0YPTW5SMOvwlONTYaN4xps1eyCii3DQCRTI9t5EeAd4kN1ObZgz07RjGfMBRMHZtlD
	 JplYwNWhhQYXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2479A60615;
	Sat, 22 Aug 2026 20:15:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 47B9229B
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 20:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D8ED40561
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 20:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FDI5QUbE5rH6 for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 20:15:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C46A4055E
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 20:14:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id DD54B5FFAF;
 Sat, 22 Aug 2026 22:14:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Aug 2026 22:14:52 +0200
MIME-Version: 1.0
Date: Sat, 22 Aug 2026 22:14:52 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Thierry Bultel <tbultel@free.fr>
In-Reply-To: <20260818110025.876790-1-fiona.klute@gmx.de>
References: <20260818110025.876790-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.18
Message-ID: <a7c54cad97e39bc913e7b16071edf1c0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/dracut: disable dracut-cpio if
 host-rustc is not available
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

On 18/08/2026 13:00, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>
> 
> Since upstream commit 89a86dcb0a3248606824de50f5c63f61cfe0369c (first
> release: 106) if cargo exists on PATH the Dracut configure script
> enables building dracut-cpio by default, and calls "cargo --version"
> to check if cargo works. This fails on the autobuilders:
> 
> error: rustup could not choose a version of cargo to run, because one 
> wasn't specified explicitly, and no default is configured.
> help: run 'rustup default stable' to download the latest stable release 
> of Rust and set it as your default toolchain.
> dracut couldn't find cargo for dracut-cpio build
> 
> The affected configs either don't have BR2_PACKAGE_HOST_RUSTC enabled,
> or build-time.log.gz shows host-rustc was not installed before the
> host-dracut build, so presumably the "cargo" that produces the rustup
> error is an external one already installed on the autobuilders.
> 
> To fix this, enable dracut-cpio only if BR2_PACKAGE_HOST_RUSTC=y, and
> add a dependency on host-rustc in that case. According to the
> documentation [1, see "enhanced_cpio"] dracut-cpio is supposed to
> optimize archive creation for copy-on-write filesystems, so it should
> not matter much for Buildroot. The --disable-dracut-cpio option was
> added in upstream commit 4a4ab928a49e81e02104ec5466160664e59c3965
> (same release).
> 
> Fixes: 
> https://autobuild.buildroot.org/results/5f557d708cce997e7f039f17e30640b02ba9180a/
> Fixes: 
> https://autobuild.buildroot.org/results/f04ca3c4598f62a7e87d84bc111eb8b161b34a70/
> (and more)
> 
> [1] 
> https://dracut-ng.github.io/dracut/man/dracut.conf.5.html#_configuration_options
> 
> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
