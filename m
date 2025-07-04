Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C065C8303D
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 22:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE49F80DA6;
	Fri,  4 Jul 2025 22:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rr_AdgnvmqtI; Fri,  4 Jul 2025 22:23:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3850380DB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3850380DB9;
	Fri,  4 Jul 2025 22:23:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72B107AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 22:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 641F040FFB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 22:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sC6_zV81zm6u for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 22:22:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 974B540F9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 974B540F9D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 974B540F9D
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 22:22:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5222219F58A;
 Sat,  5 Jul 2025 00:22:55 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 05 Jul 2025 00:22:55 +0200
MIME-Version: 1.0
Date: Sat, 05 Jul 2025 00:22:55 +0200
To: James Knight <git@jdknight.me>
Cc: buildroot@buildroot.org
In-Reply-To: <20250701181946.2106-1-git@jdknight.me>
References: <20250701181946.2106-1-git@jdknight.me>
User-Agent: Webmail Free/1.6.11
Message-ID: <6ee41250ab4318b44d405ff2749fe3dc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751667776;
 bh=S1zkm7ahMvMgzm9KEF7lHojpPo2hN/ID06ZSvMjiLNE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cYWv8dVEubx9ApunWUiq6ZOeS4pKmyD9NOS6BWTQUPu7PmG8bTvJK8pem2Dc+Zxgs
 mfE1a6oxNSyrI29P4Lrp85qq2V2IznYBj6DWaXdoHPrCTQwAD2lk8abiYwtUPCN2gU
 6IKYAa0zxSDDIYBvXj/jHNYw0C10e2pO2iMYlhH/xW+3WGynGeou9BfBJn1gCljpM5
 eXJmaAfiNBrnBUE/vIyXn4jX8Mque2+P2VYrX8rHNJwBgb4W3dv5BzaZfLLJGVSRNk
 E6Nr006PP57jSSc1ehSYqchxMc/VDlUU9869qk7kOS8l2HSO8y3LpS4hYdME7JIOnj
 gAa1cC8ROxFtw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cYWv8dVE
Subject: Re: [Buildroot] [PATCH 1/1] package/libpqxx: bump to version 7.10.1
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

On 01/07/2025 20:19, James Knight wrote:
> Note the `COPYING` file has changed due to copyright year bumps.
> 
> See also: https://github.com/jtv/libpqxx/blob/master/NEWS
> 
> Signed-off-by: James Knight <git@jdknight.me>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
