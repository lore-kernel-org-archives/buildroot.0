Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B283C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 15:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57444403F3;
	Sat, 25 Jan 2025 15:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S089us2OzTXg; Sat, 25 Jan 2025 15:50:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A79C41350
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A79C41350;
	Sat, 25 Jan 2025 15:50:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38AD9941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24D4440F31
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbi7WAGDrJPE for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 15:50:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 56FCA40BB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56FCA40BB0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56FCA40BB0
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:50:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 48E4DB00583;
 Sat, 25 Jan 2025 16:50:36 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:33784])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 16:50:36 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 16:50:36 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250124210143.3863843-1-james.hilliard1@gmail.com>
References: <20250124210143.3863843-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <62fc17ca8812ae1e10fbae5b57c233d1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737820237;
 bh=oquGHsW609R7QXv9i9H4K3EE1BqzrgSHRou0xvTl9TM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h5bztunZaSn8xeQQiLFx/qvzWVnSN6RfRAyqGz/Q8LKzOifHPt9k8t8Spf/5raWUW
 nxp9bzexc1o+UandLuDl9JCGGAC7gOchW9fz9vwQb7lgp2GrEYCgtygaerKc6Fp+or
 RsXQLOZwiz12RVRnm3mEw3jfoDUNfezp4NE1Int6mLILEYunGgtpWLr+HsIMKxsNZv
 caacayF30YOXoz1W9SRjawVHKDB8uUJfv1JJRIx8cUGN71DKVpT3EYv/JWM/UmS7cE
 sxPOTl6pMR0TlazEHYxhEzuoHpI74fm579fJz/rvTIRGbX8LQisyiaXhY7bGb4nMx4
 p0sJkhjQGqxeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=h5bztunZ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tortoise-orm: bump to
 version 0.24.0
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

On 24/01/2025 22:01, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
