Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D717CCCD184
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 17:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E4924048A;
	Tue, 21 Oct 2025 17:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dBmTNWUQePuA; Tue, 21 Oct 2025 17:18:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEE8040485
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEE8040485;
	Tue, 21 Oct 2025 17:18:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C5E6970A
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 17:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC64040088
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 17:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BW9vSqWVcHo3 for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 17:18:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C875D40086
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C875D40086
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C875D40086
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 17:18:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 01DD52003C8;
 Tue, 21 Oct 2025 19:18:20 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Oct 2025 19:18:20 +0200
MIME-Version: 1.0
Date: Tue, 21 Oct 2025 19:18:20 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, James Hilliard
 <james.hilliard1@gmail.com>
In-Reply-To: <20251021082124.723906-1-buildroot@bubu1.eu>
References: <20251021082124.723906-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <1054dc898dc95d83787e3108dc872757@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761067104;
 bh=E9BlrC9KN8fYluG32uq2EV/m3sSyNrBubbIaRajCYa0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b5OzQijtozTIzf8ve66Jb+FzNL6j/SS3cMnAmv5mIneyygcSaoiCLA/VcX2i+SKdy
 DeJMODD4a0F2k0Lc23QdeVoQig/GoWIzf6dtYgCma3DOSgkQRAAkdg32veixsYkVao
 RasllB7nQyTuTfm8mXFIpqx2NkehDaF0FgxcSX5ehROnMSkKBQmjHgUV6bFIjS4IE9
 PshiEflVnBYoNDgKvcxgSynmiO1K/qXWiG1fuuVVbdDTMyE2QD1lbXeV03E28j0RKo
 rm/MAtl1oGTEXREuVOKW5FDt4m6/FydeqI0RYghsFBNyGUqSTG1AjTKxa82B2xp+vj
 lxe6n6xQyURZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=b5OzQijt
Subject: Re: [Buildroot] [PATCH v2] package/python-uvloop: bump to v0.22.1
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

On 21/10/2025 10:21, Marcus Hoffmann via buildroot wrote:
> Version 0.22.1 is an identical re-release of 0.22.0
> 
> Changes since v0.21.0:
> https://github.com/MagicStack/uvloop/releases/tag/v0.22.0
> https://github.com/MagicStack/uvloop/releases/tag/v0.22.1
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
