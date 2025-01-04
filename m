Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12630E77188
	for <buildroot@archiver.kernel.org>; Sat,  4 Jan 2025 21:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB19F606DF;
	Sat,  4 Jan 2025 21:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W6D7jwU_EFo6; Sat,  4 Jan 2025 21:43:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F282D60824
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F282D60824;
	Sat,  4 Jan 2025 21:43:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9302F27
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 21:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95DDF402B3
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 21:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wyYgOjfkrskf for <buildroot@buildroot.org>;
 Sat,  4 Jan 2025 21:43:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0ED9E40227
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ED9E40227
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0ED9E40227
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 21:43:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8AEE713F8A2;
 Sat,  4 Jan 2025 22:43:25 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:59970])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 04 Jan 2025 22:43:25 +0100
MIME-Version: 1.0
Date: Sat, 04 Jan 2025 22:43:25 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250104175945.916723-1-romain.naour@smile.fr>
References: <20250104175945.916723-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <0f2b55afcb279a6fb5bb5311563fa110@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736027006;
 bh=omJJG6Rigt3tgTZhxYKWLnVfEAF0VjP20ncpFDHZA3E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R1YcJrs8UzX+mDy0yK24auB7V4+lXLXk+sGR1UGGC+YFC8u2okFLk2kG/Gm792apa
 uCwEFAGa3J5aQ0WJeTLIFCQFmdZP6Aonpycde6NDKiIQdtywl9Vw+ZA5UQk+ZBrWoX
 ZcB3WdCqJ2pxFHWoW+1tWSukc65qJ96/7QGGk/BzgdbjoqYT0zetndHMhpT8zNfa7a
 Vpe35C4jBC1h+rjb3/nPcxj2TufMRLmdK53Z/4ARZq6iZhN453YA4ait/DUyFQEpXO
 ci80ymcpZv40rq9dAiIqehvJm3hKzQzfizlbUCszi3k3e/p4AAjZftP28drYJWgp7h
 OUSSVWu8n5XnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=R1YcJrs8
Subject: Re: [Buildroot] [PATCH 1/5] support/testing: test_fwts: bump ATF to
 2.12
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

On 04/01/2025 18:59, Romain Naour via buildroot wrote:
> Since edk2-202408, ATF >= 2.12 is required for qemu aarch64 sbsa target
> to support CPU topology information provided by edk2 firmware [1].
> 
> If ATF <= 2.11 is used, the boot will hand with the following error:
> 
>       sbsa_sip_smc_handler: unhandled SMC (0xc20000ca) (function id: 
> 202)
> 
> In order to update edk2 package to a newer version, update ATF version
> used by TestFwts to 2.12.
> 
> [1] 
> https://github.com/ARM-software/arm-trusted-firmware/commit/c891b4d83578db25d24d2a8e3e7e419e65773ac8
> 
> Cc: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
