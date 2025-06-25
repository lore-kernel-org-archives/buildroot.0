Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B80C77B7C
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 17:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 750B684253;
	Wed, 25 Jun 2025 17:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5RrClV6faoF; Wed, 25 Jun 2025 17:20:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B40BC84250
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B40BC84250;
	Wed, 25 Jun 2025 17:20:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 019DB154
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC6E6613F1
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zm2fgPrXWiMG for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 17:20:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 14BD3614A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14BD3614A1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14BD3614A1
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:20:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id EA0BD19F733;
 Wed, 25 Jun 2025 19:20:12 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 25 Jun 2025 19:20:12 +0200
MIME-Version: 1.0
Date: Wed, 25 Jun 2025 19:20:12 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250624114059.1931308-1-buildroot@bubu1.eu>
References: <20250624114059.1931308-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <1c63605d00601a2708c0c85f525d26a3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750872015;
 bh=gBFYRvk88MAZvDbFGzNfG6MvVAhfjF3wRhI1YCoSLCY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MELJGsTwxe8pz9fpDRLwRu9GjzOJUPlqzsmYlO0IelqePturSjAZUn4zw4etBs+3k
 +2tBNU62EueE34Uj0+hPTmrnDqC7rnnb061QxrdhVXd3IYwQVjXYq6q6vPQdaMwq5q
 3nFm6UPtYNIixsewsAolnIzqepTKizrl0ym/ddGS28LaNjqNyymfToMP9ubaAFxVrS
 1l2/KEWc9V1hCkr72WW9+yTpIaH+2qRJYHKktKaQjHo9xx3YAtUES2IypvPx23rYjn
 xtztByJL018jEiX2PvibTOlJamxaEOQb6Nt7RxMeEYsqR+UWUzCUgD9kv0oJpcZDQZ
 y00gaEnkPbdJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MELJGsTw
Subject: Re: [Buildroot] [PATCH] package/python-dotenv: bump to 1.1.1
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

On 24/06/2025 13:40, Marcus Hoffmann via buildroot wrote:
> Release notes:
> https://github.com/theskumar/python-dotenv/releases/tag/v1.1.1
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
