Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2E6FD0047
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 18:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96FDD8352B;
	Sun,  1 Mar 2026 18:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFTbXhzcW2cJ; Sun,  1 Mar 2026 18:53:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D876834DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772391206;
	bh=eKv21lkvGnYx3LfssZweF76drherbMim38vVsWm09vE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jaVD7KDtbeiZo5zGOqIVx6CjehjO7JXloSR2Fb5Otw1mq9/pcroif9L7UEfXDMtQ1
	 +PazmL/f/jSrUTLyZS16XXnowIq85rOSJuaOfvmB/Uz53ECAT5uWspKZ3mH4s85FM4
	 O0PESOfqOEDmurVj7Ss7LUN9sTkhMCr0h4LKrhgnVLIe0uDSdkvrGuf7pR+Tk9TED3
	 V2wEsPuY3Q6fQQPPs8zs/VZuRBgNMDpFiat+z6TNo7M8iZu779ExauaUSmD5ulFEsx
	 c7xt5sj24IfBoy3Jba6AspCf2PRD3S7F60EUp3Q25v2zBHt0/al+y4Bz6r/IzQSpEf
	 m9HM5ogXJqIjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D876834DB;
	Sun,  1 Mar 2026 18:53:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BE9724E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 18:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BBAC417EA
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 18:53:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xcqlkNhH3aBd for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 18:53:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4558F417E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4558F417E2
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4558F417E2
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 18:53:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 75FA9780389;
 Sun,  1 Mar 2026 19:53:19 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Mar 2026 19:53:19 +0100
MIME-Version: 1.0
Date: Sun, 01 Mar 2026 19:53:19 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <aaQ0OC8I4PAx0xZz@waldemar-brodkorb.de>
References: <aaQ0OC8I4PAx0xZz@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.13
Message-ID: <294c54a635aa57d40cda161b8af98f8f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772391200;
 bh=3JoPIeWSuZ2yX2leekUckQqi6ZmsAwrNqdNIV2rnams=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jos61EJVgguAsa0RdoVEcxo38DTCBhxrWAIRHtFNImy0nDYiGAwcI6BvwJQ8/dFSe
 zLQiJZiSgYfqu/TPXiYK+fEohHj1hUhrNlqNUkHMIBK/LC0iZlxR0TxxFQsLKPkunO
 UlRW7AwZ8sBbCyN3HV8iP6Ox8xEtSavSVkoHf1IrpIQVFHgzDHTGiHYb5Pv48XBfDb
 f5XJiwQKylZLwXevgWlk1NJRiPYs2Q6rj4a2oib7NVY/BJ8nFQX0lwb/Uy6D3TFnO5
 eyIvtlFnwHd1iO0Oy+v2Py0xRgvUqYk8RZyaJFODmIUUhnQBN5u1c02Z5YKYVZeSOK
 QTPOHbx6nPatQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jos61EJV
Subject: Re: [Buildroot] [PATCH] package/uclibc: bump to 1.0.57
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

Thanks for the patch.

On 01/03/2026 13:42, Waldemar Brodkorb wrote:
> Following changes made it into the release:
> 
> Joris van Rantwijk (1):
>       Fix adjtimex() with TIME64
> 
> Waldemar Brodkorb (8):
>       sys/stat.h: remove _STAT_VER/_MKNOD_VER
>       fix gettid() declaration
>       add statx syscall wrapper

This new uclibc version is introducing a test failure
with zfs. See:
https://gitlab.com/jolivain/buildroot/-/jobs/13308829775

Running with the previous uclibc 1.0.56 works fine:
https://gitlab.com/jolivain/buildroot/-/jobs/13308875027

It seems related to commit:
https://github.com/wbx-github/uclibc-ng/commit/d3a819aff25af436e22abd5ba01ff2cfc0631b32

Do you have any idea which component should be fixed?
(uclibc, zfs, or the rutime test_xzf?)

>       sparc: add optimize build support for leon3
>       sparc: sync with Linux kernel definition, fixes gdb compile
>       fix compile error on earlier Kernels predating statx
>       select: fix compilation failure with very old kernel
>       bump version for 1.0.57 release
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
