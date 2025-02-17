Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E381C021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 20:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2E404071F;
	Mon, 17 Feb 2025 20:34:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3k2-6hlelWZC; Mon, 17 Feb 2025 20:34:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE4D3410BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE4D3410BD;
	Mon, 17 Feb 2025 20:34:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2481DE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADE6582070
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wmDKd0Bcodwa for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 20:34:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B2E3482073
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2E3482073
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2E3482073
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:34:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D07E1780316;
 Mon, 17 Feb 2025 21:34:07 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 17 Feb 2025 21:34:07 +0100
MIME-Version: 1.0
Date: Mon, 17 Feb 2025 21:34:07 +0100
From: Julien Olivain <ju.o@free.fr>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20250217070708.189713-1-fido_max@inbox.ru>
References: <20250217070708.189713-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.9
Message-ID: <5a5d92e8dbf9477a6654434aeae8e728@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739824449;
 bh=NWG2VFszjLxyVs/EAOr26esLd6SHYAiZ6hdF0XfMarI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sikZwfsGAg6Adj/AEfXWY1KE3oELLZP0PkdFv4B9Pv9J8lW1QIW19Zcw1q3dNTn1b
 yiimAn7ec806swYT6g1+Yw3SJzOuQne1Pm9njrRYKMXO5SCwsU8ujCEtMdfKksE+Ku
 BIupeuup9w7tsdCBpkKDLQNffrGvXXUHTdRluyWX1dHTyyoXLbtQzc7meufBHOH3Gb
 dw6yOWh8z+cYT9+fFm5qDhMDIFGxFGXYfzET+iKsbJpbXVToAAuoW80HkLzzKex7jl
 2Eks6bJNiFzoBy+QT/zPHCK59a6WFIpHCsxrQ3EEYldTW1o+vdt6uB/6KX9rNA+IDa
 7D9/DIAmvnmTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sikZwfsG
Subject: Re: [Buildroot] [PATCH 1/1] package/libosmium: bump version to
 2.21.0
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

On 17/02/2025 08:07, Maxim Kochetkov wrote:
> Release-notes: 
> https://github.com/osmcode/libosmium/releases/tag/v2.21.0
> 
> Bump minimal GCC version to 5. (Switched to C++14 as minimum 
> requirement)
> https://github.com/osmcode/libosmium/commit/a83fbf8852b00e57bf30fe3f69c37f575726c7d7
> 
> Remove support for projection using the Proj library
> https://github.com/osmcode/libosmium/commit/711721cb1f37dff18bcfb2e5fbd7667c7a22bbf0
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
