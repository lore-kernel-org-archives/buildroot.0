Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C315FC0219D
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 18:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CED98111C;
	Sat,  8 Feb 2025 18:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BpMYtmEee6K; Sat,  8 Feb 2025 18:25:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 687F3810E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 687F3810E4;
	Sat,  8 Feb 2025 18:25:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 313D01B5
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 18:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22583405D4
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 18:25:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qlqMACyTCy3 for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 18:25:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8AA6840578
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AA6840578
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AA6840578
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 18:25:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 02E20780503;
 Sat,  8 Feb 2025 19:25:43 +0100 (CET)
Received: from 94.105.106.182.dyn.edpnet.net ([94.105.106.182:44586])
 via 94.105.106.182.dyn.edpnet.net ([94.105.106.182])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Feb 2025 19:25:43 +0100
MIME-Version: 1.0
Date: Sat, 08 Feb 2025 19:25:43 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250207221814.842326-1-thomas@devoogdt.com>
References: <20250207221420.839802-1-thomas@devoogdt.com>
 <20250207221814.842326-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <3a6ec146c346933fc397989371d80c9f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739039145;
 bh=trsimDEBLSf3u/KbPQyPdgeBE/JyYfmqETfIJ66cM3Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=StFkAKLONhCS53Fw+ycK2Uwct6FujB5gIEB9zvWeAI1zX2qDs+tvuVrSz3XwV3kbI
 ORZnqNijD21x7RuqgkA4r+FxJAt6dlBf+UI972fYtYel86aFdOwHx0f402KXM5VBJO
 6CWEqDIOHGK+bikMuWM4nRyjgdxpuDr+icNmQxi7/irhCTPfBHIrEcJT13Q1dAuXP9
 NjshTqnLYTXRemKUWehi9soAR67MtjLJH5Y0lTv8rbJv/6erokB2epFgLdCqZTKmXh
 lzfNw1yCciBmh7N+GwO8vAGU64xTLa6WaLPc/u8fpquyMRbNm8HvLijxFegFlqRvUg
 O7kUfgJfdKj8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=StFkAKLO
Subject: Re: [Buildroot] [PATCH v2] package/x11r7/xlib_libxshmfence: bump
 version to 1.3.3
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

On 07/02/2025 23:18, Thomas Devoogdt wrote:
> Announcement:
> https://lists.x.org/archives/xorg-announce/2024-December/003572.html
> 
> Removed 
> 0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch,
> which is accepted upstream.
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
