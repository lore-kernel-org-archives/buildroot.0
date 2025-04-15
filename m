Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215E2C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 20:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3216611D6;
	Tue, 15 Apr 2025 20:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 141SRfu67zyK; Tue, 15 Apr 2025 20:25:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3DE961123
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3DE961123;
	Tue, 15 Apr 2025 20:25:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DDA88109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEA4E61123
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7buSNOeBnWl4 for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 20:25:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE35C610FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE35C610FF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE35C610FF
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:25:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 278E560129;
 Tue, 15 Apr 2025 22:25:16 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Apr 2025 22:25:16 +0200
MIME-Version: 1.0
Date: Tue, 15 Apr 2025 22:25:16 +0200
From: Julien Olivain <ju.o@free.fr>
To: Lance Fredrickson <lancethepants@gmail.com>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20250415201527.2035915-1-lancethepants@gmail.com>
References: <20250415201527.2035915-1-lancethepants@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <4ada39d61c17c2a55c5a544129ad7512@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744748718;
 bh=cOUJ44W+mTTHdORHzKNAb6KNHTingvlWZ7Qk2hR+JyQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OfmuTiXWRhli8yo2ACNv8WNi17mvK0v5hUjtxkJA/jQY0LmPD0VW4Wq46iIr0q+yY
 EuK7gvkeqAPCJGp7h8X9Wgk+pKiCeSpDY1mbB48z2C6sqWwxYGgO9FEIwBrDcQsNwz
 3JSVwNl89JT3RTMRejH80o3dMBsLgLCZcvxlvOb6x8NOxQRB7uJR/FBdr/w2agKLFS
 jD9aw5KiODE0i/Njd3Q8BJOge2zxVGPlIC3budcSCl+cArmwiOp3Xff4g5SNcaYVT8
 o/ub2cVtvtONkmfxg5Fpi3XtMoMJPQf+MIEYMuC/jEQJdu5OQfbgqSjg8VOIOedWIN
 Unupf0HBKPdxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OfmuTiXW
Subject: Re: [Buildroot] [PATCH] package/ipset: bump to version 7.23
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

On 15/04/2025 22:15, Lance Fredrickson wrote:
> From: Lance Fredrickson <lancethepants@gmail.com>
> 
> https://ipset.netfilter.org/changelog.html
> 
> Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
