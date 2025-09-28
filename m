Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9060BCAC5BB
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 10:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65461406C4;
	Sun, 28 Sep 2025 10:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHPQCBTyfR-m; Sun, 28 Sep 2025 10:22:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 888DE4067A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 888DE4067A;
	Sun, 28 Sep 2025 10:22:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0CD9111
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92AD960745
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lw5xbT9luT40 for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 10:22:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C6F896071A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6F896071A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6F896071A
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:22:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 3D6226013D;
 Sun, 28 Sep 2025 12:22:31 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 28 Sep 2025 12:22:30 +0200
MIME-Version: 1.0
Date: Sun, 28 Sep 2025 12:22:30 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250918184748.407199-1-ju.o@free.fr>
References: <20250918184748.407199-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <cba8d791b6404fce6e504ca813470aa0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759054952;
 bh=YreomBjurVN1HdIBnVCcr0XoFaEzNa3iGZwMWV9e4TY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BcNvdWr7jj4pzJP+d9IH9QcGook2yucPxE05tsQY2eXYLol1Ckji/s1ptatvGVx1B
 gCzWyfFlC7p0WsBHkPiL60l8LPqe9xuQK54YKWjsuwaNZBV+wY81l8Rl7zJ5Ao4pBX
 VJJbO/WxVApGZ4F7zaGTuyuQxa1oFNXYSoHQ3GHNl8IiieOWtDj/z8l0Il9U6YCpqH
 GpzccYkE4n2P5Qw0IkR+KYb/nBIIz9iKpGRnuYKP/H4Uc8EEfQ/AuJQlqcktPBchq+
 NNDnUB5byPQZq70GgRNZB9OJZKz6gxA4YodM2BQcNk5vcI4gc7OUGERkluy1g/zBhC
 gvp/fTDTl/coA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BcNvdWr7
Subject: Re: [Buildroot] [PATCH 1/1] package/tig: bump to version 2.6.0
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

On 18/09/2025 20:47, Julien Olivain via buildroot wrote:
> For change log since 2.5.12, see:
> https://github.com/jonas/tig/releases/tag/tig-2.6.0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
