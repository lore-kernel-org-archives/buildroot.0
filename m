Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C55D116F1
	for <buildroot@archiver.kernel.org>; Mon,  1 Dec 2025 20:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFC29611A5;
	Mon,  1 Dec 2025 20:17:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1pgFxcYMxNn; Mon,  1 Dec 2025 20:17:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39EDB61182
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39EDB61182;
	Mon,  1 Dec 2025 20:17:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CC73FFA
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 20:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B34018206D
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 20:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0bMiQLD0qw_N for <buildroot@buildroot.org>;
 Mon,  1 Dec 2025 20:17:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8279782023
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8279782023
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8279782023
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 20:17:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 5931C13F88E;
 Mon,  1 Dec 2025 21:17:21 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 01 Dec 2025 21:17:21 +0100
MIME-Version: 1.0
Date: Mon, 01 Dec 2025 21:17:21 +0100
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20251201144819.193967-2-maxime@leroys.fr>
References: <20251201144819.193967-1-maxime@leroys.fr>
 <20251201144819.193967-2-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <211e2758dfc36c4b23cd822316fcc154@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764620242;
 bh=TCP/JLjeEYf4taGMG/FeheRrjHXMPqWXIFWpxKD0x9Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=atRlQCZ8DDFPTKM22P78PyIP43vb4UBSpU6wVop1mGawvOdugZbqtccPnNhOxtUy7
 aUwV3D7F00jKq+k4RqvHt8M6/ldXlPLrSjHo69XVhC74jk2WYtPGpjmGd5oHZH9zze
 z0Ez/9363QW0ddk+xr9U5Ec9eSRgklTo+DKoVRDB1UqyE3ko1AA+cVNEbpVLwS/WgP
 V0mG+wrejMqAe2EOSbIKS6M3r1ENRzab/JRtd52DFtWgZIQ5XKa/IF5pISj+GkPUvO
 Cvubt5DhoSMmyMM0qB/HUhzGMDsLuFHIsj+gibdfc151B09MTpOVVsChLgGTLFuuC3
 ELtn3sigbVKrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=atRlQCZ8
Subject: Re: [Buildroot] [PATCH 1/2] package/frr: bump to version 10.5.0
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

On 01/12/2025 15:48, Maxime Leroy wrote:
> Update FRR to the latest stable version (10.5.0; see [1]).
> 
> The 'lib-make-getloadavg-optional-in-late-timer-warnings' patch can be
> dropped, as it has been merged upstream in FRR 10.5.
> 
> [1] https://github.com/FRRouting/frr/releases/tag/frr-10.5.0
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
