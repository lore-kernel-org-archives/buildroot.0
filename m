Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64874C43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 14:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3D9860810;
	Mon, 13 Jul 2026 14:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ziiqzWlU5LUY; Mon, 13 Jul 2026 14:13:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C838A60781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783952018;
	bh=TKkmsq76D0jnu7auOfNGNlSk4LQ8LvArYwJUDEvgNPU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FXCqe9SMqn5VljOIA7WLqv6TX6q4PtkcyuIY92XayNW0BcGB8ISdNsfg+M+4bLl9W
	 8qdTrsL1YgucVXZqZpL5szbLL9gsKkAtavX07JQrpyuOsUzqhZ/hTO4t8M3+L3hOB2
	 2zsjGurYruENlZiSUt0Yu/sytsNzss9+wQeGOj3JQDG28T3kMzvIOuz9LPikdfTGMD
	 trnx9V26y+6dwL3bfy+rSqRGQudo/2ZYe7jkR0QxRE6HT03nUC/pRnJ8zosQbqdZRy
	 Sc08H8xWdI3nU33f5OH8K9q+w8jUqR87ehe3d4TGDPniUFjJA1EIdLPj/YzNt8GdBL
	 /gbV7Zr35ZYtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C838A60781;
	Mon, 13 Jul 2026 14:13:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CA652EE
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 14:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2226640801
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 14:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jqaPDeiTN3wZ for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 14:13:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 251A2407FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 251A2407FC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 251A2407FC
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 14:13:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E297AB00571;
 Mon, 13 Jul 2026 16:13:30 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 13 Jul 2026 16:13:30 +0200
MIME-Version: 1.0
Date: Mon, 13 Jul 2026 16:13:30 +0200
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Will Newton
 <will.newton@gmail.com>
In-Reply-To: <20260711112039.2805693-1-yegorslists@googlemail.com>
References: <20260711112039.2805693-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <5a786355bc36dce6a5948174423e386a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783952014;
 bh=9/T7QZVl2OEzv40EtiQqaDsho8Kq1aw3wgOaw2QxILU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ugt4cY58TkJiim0WYvn0VsnzGMRyO8EKxAHqA/mP9ldBKpZrCHk/3ejEclSY1NVH8
 NduBzVX/ljs9RNaVNggKuU2YfouRfVyI+V22uGapXEImGz5b1PLWTWzP0sSJK6BaRd
 4vD5mODuUDM4SP1W0uWcgVnt/AXiLkzn/UE4XNLefbyWlwew68DGBn5tLUVkzRKKJv
 +9N7CbqIZrgZeaYaY4/PStHdlNbryFMu9X49w3EkNwwSUQQ8BIUeoTVOySEtFScLsT
 7R+JKuUcIzT9qmAchesQcWuY2e0FT9S1V/oYO7dINXR/isJr59FW6fQepzNKZjZm7H
 UhO1ID8kfED8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ugt4cY58
Subject: Re: [Buildroot] [PATCH] package/libmicrohttpd: bump to version 1.0.6
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

On 11/07/2026 13:20, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Changelog since 1.0.5:
> 
> Fix various minor issues, like theoretical
> integer overflows for extreme inputs or NULL
> dereferences if the application passes NULL
> where it should not.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
