Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F18C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 17:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E393640D71;
	Mon, 19 May 2025 17:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id veszI1xQI2O2; Mon, 19 May 2025 17:07:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E12040D7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E12040D7B;
	Mon, 19 May 2025 17:07:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 61A6C193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 17:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 537C54107D
 for <buildroot@buildroot.org>; Mon, 19 May 2025 17:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kLQyE4Bcf-ao for <buildroot@buildroot.org>;
 Mon, 19 May 2025 17:07:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6F69D41006
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F69D41006
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F69D41006
 for <buildroot@buildroot.org>; Mon, 19 May 2025 17:07:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E6CDD13F854;
 Mon, 19 May 2025 19:07:16 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 19 May 2025 19:07:16 +0200
MIME-Version: 1.0
Date: Mon, 19 May 2025 19:07:16 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org, John Stile <johns@msli.com>
In-Reply-To: <20250519000909.226437-1-kadambini.nema@gmail.com>
References: <20250519000909.226437-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <d63150137e5eb1d6df914e1543d43cf2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747674439;
 bh=h2yYckyT93AnI5T8Nzta1GwplGd7VlUZMyhyafwdvSY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LLErLPE8r8TY1e9SxPB7A0pIslJ95CALe+LZuk0k2nQVmOdlUnpxJU19/vxLwVPb/
 5c36zln+i0vmWl8AtzWHQsG1IZw5p+1MArBTL5YMqYcafmwZ0beiV/y3DoBCM764S0
 C5LpNgqh1QCZ+JiucH43Gh4BqQhzDCbDbDy2hv7hD4dnjGqa6wqkoeBkVrJZ8a77GO
 IxwIXIRDBPVsKU4LtL6Dvmd4tlpfrdUOeJDGgvjRLjyCSh6atA/6+c2MFnM27WugOL
 x35GOmso1pqbSpHaABrvSE/dpWSzFc5b2swptvW2W7vLWUb9hA066R1Y5Zid2hQzMs
 EgDrRlq7X3kig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LLErLPE8
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcpcd: bump version to 10.2.3
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

On 19/05/2025 02:09, Kadambini Nema wrote:
> License hash changed due to year update.
> https://github.com/NetworkConfiguration/dhcpcd/commit/e143ee18f4e2312e0254002dd27bf1da8bd95f27
> 
> Release notes:
> https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.2.3
> https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.2.2
> https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.2.1
> https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.2.0
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
