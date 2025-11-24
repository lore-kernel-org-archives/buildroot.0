Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70003CFD35A
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 20:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1123483CDB;
	Mon, 24 Nov 2025 20:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhYoJGiGboV1; Mon, 24 Nov 2025 20:56:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42EE081AD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42EE081AD7;
	Mon, 24 Nov 2025 20:56:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B31C5359
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 20:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4C7860FF4
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 20:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7khJID8vvlpi for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 20:56:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B1A2D60789
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1A2D60789
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1A2D60789
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 20:56:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 78A88780333;
 Mon, 24 Nov 2025 21:56:39 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Nov 2025 21:56:38 +0100
MIME-Version: 1.0
Date: Mon, 24 Nov 2025 21:56:38 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251124190015.2058689-1-bernd@kuhls.net>
References: <20251124190015.2058689-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <b113c788984cffe78cf4617558ac0301@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764017800;
 bh=D0urWk7B+yQ70ggIsaZXRzYgQ6G1JppkTxBQF2Sel5Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DErOXFk3I5MZmMfiGT9JU5dlNBpas3aptXALMHEKBdv/K/i08LXkBLzOmOmpJsDiZ
 gmtE9qLrAlmT8zxq8Yr0D/+zLpG7VCmeTh0QKKV6vEPgZE5OXkzF672+vxWaua6eMm
 8v7FTFW3084IgA4Gq/oT50jzhXFpzLhdTrz4R46TNB3djVwzpLi7fsJobNPrw7r4f3
 IwsLBWtKwns7V/D89CognvNan/9ZD3+Bm7c/aZPmEIn93pQynYYWTHBFq3ewkGUvuj
 M33vXC/rBWCNJNkOb2A9HhF2Nn5ZjvzKbNYz07Li+9cOPu3w8OpZ1vusEBXDQbqmYv
 Lx4aqwailx99A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DErOXFk3
Subject: Re: [Buildroot] [PATCH 1/1] boot/syslinux: add -std=gnu17 only for
 gcc >= 8
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

On 24/11/2025 20:00, Bernd Kuhls wrote:
> Buildroot commit f5101638b9f917dc4c569828ff3fee0c486ba8f8 
> unconditionally
> added -std=gnu17 breaking the build with older gcc versions:
> https://lists.buildroot.org/pipermail/buildroot/2025-August/784453.html
> 
> Reported-by: "Thomas Petazzoni <thomas.petazzoni@bootlin.com>"
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
