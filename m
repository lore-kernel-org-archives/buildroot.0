Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6B3C54E90
	for <buildroot@archiver.kernel.org>; Thu, 22 May 2025 19:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93C2741B7D;
	Thu, 22 May 2025 19:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5h6652LN0fRS; Thu, 22 May 2025 19:18:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6338B41790
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6338B41790;
	Thu, 22 May 2025 19:18:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24675237
 for <buildroot@buildroot.org>; Thu, 22 May 2025 19:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AB1A613B8
 for <buildroot@buildroot.org>; Thu, 22 May 2025 19:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yHRMvuff1kfE for <buildroot@buildroot.org>;
 Thu, 22 May 2025 19:18:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CC8BB60B15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC8BB60B15
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC8BB60B15
 for <buildroot@buildroot.org>; Thu, 22 May 2025 19:18:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 734F45FFA3;
 Thu, 22 May 2025 21:18:30 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 22 May 2025 21:18:30 +0200
MIME-Version: 1.0
Date: Thu, 22 May 2025 21:18:30 +0200
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250522083236.322440-1-peter@korsgaard.com>
References: <20250522083236.322440-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <4649a2d8f228b27b0701952964df18ef@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747941511;
 bh=kpCx34jyjyAHWy4TIj7uISqhFXbcFmHObXeVXbF2O+4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Gn9Y0aMIBZV7JKXqt4HGSPHgpErdbr89ijw5do5vMxRoY+C73Tn54T9g1LUvAm4Tt
 BadDL4KDSywz2MFso7lulA9P/L109hKwPcmWjns+yfFx09vdOmflXCsg2EwJBwhYhW
 pTdSvnoiPmkvfJid6bHSRINUryKKsX2Dh9myGeHxDGVqnNFwkKWjvOGcVA/LxdUtIH
 b4YWbDjFASqNdE2PW/kAhmM4OShh76HfzYjZQmZgxVn/XhluN0zYFKns1ynDv5phQ9
 kmb6Wbxm/+pwihBjrGiKKunDyk2Q+VgIPUzKdfFLy8ZbIq0YewrSyQsM3XhKSaCAjA
 v+7PYOdIMNJ7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Gn9Y0aMI
Subject: Re: [Buildroot] [PATCH-NEXT] package/wireguard-tools: bump version
 to 1.0.20250521
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

On 22/05/2025 10:32, Peter Korsgaard wrote:
> For details, see the announcement:
> https://lists.zx2c4.com/pipermail/wireguard/2025-May/008789.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
