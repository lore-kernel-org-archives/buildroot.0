Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8304ACFD2F6
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 16:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31BF483FB7;
	Sat, 29 Nov 2025 16:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kyzcTbsvZngy; Sat, 29 Nov 2025 16:12:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5374E83F82
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5374E83F82;
	Sat, 29 Nov 2025 16:12:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 94723273
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 16:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7273D83F82
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 16:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DgnDBBQAH93 for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 16:12:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 469C983F79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 469C983F79
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 469C983F79
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 16:12:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 9B8E42003CC;
 Sat, 29 Nov 2025 17:12:30 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 29 Nov 2025 17:12:30 +0100
MIME-Version: 1.0
Date: Sat, 29 Nov 2025 17:12:30 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Charlie Jenkins <charlie@rivosinc.com>
In-Reply-To: <20251125212855.589892-1-bernd@kuhls.net>
References: <20251125212855.589892-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <ae4f67ee04e3af42fae6095c47c4ae8d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764432752;
 bh=rzfuOuLVUHScoGQqxnpyvjiF+oBslvSRrFlK6aAH0i8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k91DxuDAckCCgKdSTEJhmR1f9v9fNnqqMwdHRhpc+fEkG8oNJUvjIwFdw7yAkDAEC
 dYxlSxDge2VQssnXmWYvHRqUAd5EMK4I+zirn8WljqHWTzu0LRa6s+W5BeaP+uc4NK
 aDZYQJPnms+redziqymT/PAZTpNO0PWbILSXWZR5QcU4ykNg25/axqNDPY6f2s/GHp
 vGDQxIvuMjkfzQZvcZPdcdYbpgYr0NXeky9IbyMdCLZSMnZFskMUp32352qIEZilRl
 EgC2YXSWE584kXkd7gie6eGDoXx34YeYtf2apnChEWawwglu7PU4TSfXmhf8hCqHso
 bPx+hVhOWOBYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=k91DxuDA
Subject: Re: [Buildroot] [PATCH/next 1/1] package/pixman: bump version to
 0.46.4
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

On 25/11/2025 22:28, Bernd Kuhls wrote:
> From: Charlie Jenkins <charlie@rivosinc.com>
> 
> Version 0.46.0 includes the patch to fix building on riscv without
> vector support so drop the patch from the tree.
> 
> Release notes:
> https://lists.cairographics.org/archives/cairo/2025-April/029612.html
> https://lists.cairographics.org/archives/cairo/2025-June/029617.html
> https://lists.cairographics.org/archives/cairo/2025-July/029629.html
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> [Bernd: bumped to version 0.46.4, added release notes]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.

For info, I replaced the mailing list links to use
lists.freedesktop.org, to avoid the certificate warnings.
This mailing list is the one published on https://pixman.org/
See:
https://gitlab.com/buildroot.org/buildroot/-/commit/d06976eeb02c2fa4f28141ef3b6e92f9f499f69d

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
