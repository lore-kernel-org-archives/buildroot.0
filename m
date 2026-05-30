Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8ADDCD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 20:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABDFD42C19;
	Sat, 30 May 2026 20:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGSR8SEVTiLv; Sat, 30 May 2026 20:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08AC442BD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780173426;
	bh=9RbuxJuV8ptp5KImGovELGiwfq7yTT/eG2H1TXbUv0s=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K/VC+YvcQ98/m8EL6JhJsmVtlSP5Db4z59J4DBvVgyc5lvquDi/f9Km0k5c1GOnZN
	 CDXgsSeVNO6gDgU0S8DpnRHck0WSbSKkr/ZRHIa9Z60C440jLUeCJpwTUjghBjdCjD
	 5QGPbW0Aof+BI/k1VzDV2njzq4TMrTWeSsLKePsLdriHPQQ53UVnWffcs4gGK24jrw
	 wnMHia54LZQRGK1sxqOezyCOjJ9yt4koBHbYN9NSvBDYj+2gKDZiMw3iLbVypUA/31
	 93kk73ExDiGHGj7jsKDXCvCnFskqszbx8vQLYX16E1hvEVEBNhOQ8wUQJfakJ2wPrq
	 LovBg2yoliMbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08AC442BD6;
	Sat, 30 May 2026 20:37:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EA71012F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC39C42BD6
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QklIxDM82NIB for <buildroot@buildroot.org>;
 Sat, 30 May 2026 20:37:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 06F9C42B98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06F9C42B98
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06F9C42B98
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:37:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2FF8B1A3752;
 Sat, 30 May 2026 20:37:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EB0B36073B;
 Sat, 30 May 2026 20:37:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8748810888CC7; 
 Sat, 30 May 2026 22:37:00 +0200 (CEST)
Date: Sat, 30 May 2026 22:36:59 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>, 
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <ahtKVlY-bPFhqTg7@windsurf>
References: <20260530155718.657095-1-bernd@kuhls.net>
 <20260530155718.657095-2-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260530155718.657095-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780173421; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=su/oAHw8PnPLUYvx2HmiqUG1fjVxW/rRe7sdxla6NHk=;
 b=ErjuVdgFVorHHBEwlQF51PcSLi84I0FEp+cBWU6+/el1If0pTKLqAr6RvPNViSAriC3xQM
 7nHVWDdvzT6/6HwQK6YAt0Z/zWA0JN0HkhGleuh3EXN1c/0UsRtOzhHtb9oRun2arB9weP
 7Rd3+CmY8tPqvdhXs3FuMHtG0hkxqsyPuzbwIftlLU9MT88u22mTNyfOCQHZYoGyneTq9j
 Th8XlA33O6WnMTR38Hx7JHV28+8i7WohI2pIDH6C83Im4ww+bneBpyk5PLjrP1rpqjDEky
 IdmYah1+F5XBAwjUckTCY2Vbu8j1brL7p618vllAuoSf4YN1z94efaDJJMG39g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=ErjuVdgF
Subject: Re: [Buildroot] [PATCH v2 2/5] package/stellarium: add extra
 downloads
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

Hello,

On Sat, May 30, 2026 at 05:57:15PM +0200, Bernd Kuhls wrote:
> Building Stellarium includes the download of external tarballs during
> configure.
> 
> This fails with host-cmake during configure stage:
> 
> CMake Error at md4c-subbuild/md4c-populate-prefix/src/md4c-populate-stamp/download-md4c-populate.cmake:163 (message):
>   Each download failed!
> 
>     error: downloading 'https://github.com/mity/md4c/archive/refs/tags/release-0.5.2.tar.gz' failed
>           status_code: 1
>           status_string: "Unsupported protocol"
>           log:
>           --- LOG BEGIN ---
>           Protocol "https" not supported
> 
>   closing connection #-1
> 
> due to buildroot commit f87138339b17bc2b1d84c59ea176abb941413550 which
> disabled SSL support for host-cmake.
> 
> This patch uses _EXTRA_DOWNLOADS to provide these tarball to allow
> offline builds.
> 
> No autobuilder error was recorded, the build error can be reproduced
> with this defconfig:
> 
> BR2_x86_64=y
> BR2_x86_corei7=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
> BR2_FORCE_HOST_BUILD=y
> BR2_PACKAGE_STELLARIUM=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
> BR2_PACKAGE_MESA3D_OPENGL_GLX=y
> BR2_PACKAGE_QT5=y
> BR2_PACKAGE_XORG7=y
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
