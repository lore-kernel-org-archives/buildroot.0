Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7C5C71135
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 21:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BA6880C98;
	Sun, 15 Jun 2025 21:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CC7fa9ywXf8S; Sun, 15 Jun 2025 21:53:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B041180C5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B041180C5F;
	Sun, 15 Jun 2025 21:53:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CBD81A4
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 21:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A8E94020F
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 21:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JxSzqAPZdd4Z for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 21:53:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 56E004018A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56E004018A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56E004018A
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 21:53:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 08BE8780316;
 Sun, 15 Jun 2025 23:53:08 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 23:53:08 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 23:53:08 +0200
From: Julien Olivain <ju.o@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250602172908.515944-1-petr.vorel@gmail.com>
References: <20250602172908.515944-1-petr.vorel@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <c2fa2ae7f0435986f8232b47eb389c15@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750024390;
 bh=e5vbeL6vXfGX3tBZGUxe0V2rFcWVTbOQ+6s45yOX4bk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DTle+NFjbllMJW9YSy6zSDDouGowawuXKWNDRn2uUcz+bn5sL/gngLqMTmiFlO5QU
 ii3Pz4q6bZdT2O3vVeoAeZXvX/AwaUavqCzWRYl8YHCsVdZcqO4oaDmIM7dRRpuHSC
 tyfSmvkHT5fT03psRXkAOW6ru4F+f2DWN2HUik7l3rZIR2FKGFG1ZoIKeS9SdrqDll
 ALxETedoibkqOttUAapXIcpJ/xgspYB5+5/tdELz16ajxgb8hwhYfgiY1y0I6ASr0m
 pegaP42QmLDPM4YZ6EbastWc6D/l5NRIA9jN4C6I0x6oOiV/9jMwh6m9lzwdOFD/5M
 94VSXHJX5ONjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DTle+NFj
Subject: Re: [Buildroot] [PATCH 1/2] package/ltp-testsuite: keep
 rt_tgsigqueueinfo01.c for musl
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

On 02/06/2025 19:29, Petr Vorel wrote:
> rt_tgsigqueueinfo01.c compilation has been fixed in 20250130, don't
> needed to be removed any more.
> 
> Fixes: 2bbcda7c0e ("package/ltp-testsuite: bump version to 20250130")
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
