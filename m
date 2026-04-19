Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A575EA719C
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 14:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECCDD60F88;
	Sun, 19 Apr 2026 14:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Oxivd1Jj9cs; Sun, 19 Apr 2026 14:39:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CD0C60BB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776609555;
	bh=J1/tOXb7ChrOXbTE+tfP/OqGHIPwsPjCC2aIJ2uM+S4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=slWokBFPd0PDCvRO8TiTFT0/jQcK5mfkuFLkTtBwB72B/T+wZdb7rDbMxQX10+rGk
	 7w7tDMJOieHKBvwdiarxYc8b1sF9UG7S598I2XPVimW+yMdyJmh7x5LGMbCrzKQkVE
	 upB+zWRbTuvh08ZecuDPR46HRzj59SPa6pkNAA5sntvZyYHYYaUAMuQwDhqwB+eu0+
	 pM03LtKGayjNKYfLaidpT3lNhbCf1JfdtiXROgwyq5etihIUz0Bl1Z8Za1cqmgkraz
	 zrF9IV4cqhh/VqwkEGbN/Ss8zsW3lP91o7rMzr6WE5yOEljwninSI+nYK8BTT2QPOi
	 Y1MoZleIGv4Jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CD0C60BB3;
	Sun, 19 Apr 2026 14:39:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1BFE24D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 14:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3FB581345
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 14:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WBFgG9VUEL_m for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 14:39:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD4D68108E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD4D68108E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD4D68108E
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 14:39:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 54BFB6012D;
 Sun, 19 Apr 2026 16:39:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Apr 2026 16:39:10 +0200
MIME-Version: 1.0
Date: Sun, 19 Apr 2026 16:39:10 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260417192302.1061333-1-bernd@kuhls.net>
References: <20260417192302.1061333-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <5d3d70e9795d5632541404d3f0d554cf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776609551;
 bh=6B6A5fzSDpX6aQ5Be+FIpNrjIHEll/FzS7F9QzXnq1M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Xfi6YQMPWnkGoplZLN54ZQrxTIApHGX0tWytKYLoxEtB+uTbyhEy3AdgdM9qFnMc5
 tkTgV2meLkWfNRxImUoG8/Nf2ytJOlCEaAK9t03YZMOylDFL+QMMWJvJV0TBLbm5A2
 ugA6YQKtzt4Z54jTV7IyOTW7w8YUmbsrD1ZOD3JIK76PzUG5oLD1Y2Ku4HyPpe6IeF
 bqoYDdiHKbEkDhND4rOID7lS4pTzkusZGEpv6QaTLpLq+f0uhOBcjvELfk/Z6qw1eY
 QB/2sZeaGiBnEizAnRxwa9kRYGpG0oy+xe19z7Ktl3D3frP6yzedmPb1ljgmheDbXU
 rMInTPFavCUcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Xfi6YQMP
Subject: Re: [Buildroot] [PATCH 1/1] package/iperf3: bump version to 3.21
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

On 17/04/2026 21:23, Bernd Kuhls wrote:
> https://github.com/esnet/iperf/blob/3.21/RELNOTES.md
> 
> Updated license hash due to copyright year bump:
> https://github.com/esnet/iperf/commit/010381c4b8fa19e236db571e787a246c31a414ee
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
