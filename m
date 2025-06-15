Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED23C71135
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 20:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C12DD8098F;
	Sun, 15 Jun 2025 20:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2B504HgnXecL; Sun, 15 Jun 2025 20:31:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F3E680DF8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F3E680DF8;
	Sun, 15 Jun 2025 20:31:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A70871A4
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98CF180DF8
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:31:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uHKAZcXL4Mqa for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 20:31:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 07DBD8098F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07DBD8098F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07DBD8098F
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:31:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 64F6AB0053D;
 Sun, 15 Jun 2025 22:31:48 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 22:31:48 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 22:31:48 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250610092713.1739052-1-thomas.claveirole@green-communications.fr>
References: <20250610092713.1739052-1-thomas.claveirole@green-communications.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <3df1cf9cca69d0fab256d52a948cf332@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750019509;
 bh=tuPKPA45FQiqGx1Sb2+BhPxrgbs2KGbD7aiLK6KdLf8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lhtslizFvTWSBu9E7vKSY00iGhq0chBT5xKLJ4rNsifRvrbH3SR0D8+OONPFHm6cj
 pt/i70k6ppvxRJKp3zITiTVZK/uLnf4ulZMraImSS9blXz9wVfN7TsWQ3BVH8ls+F8
 ZwLEAGlhLkEVahL9vOzBRZ1wdhhIilToakYsXxyXOUbwKKKNABiLa1mxD2PrIH30sk
 kBHhy8C1qYA6mThZ8vHWUHbGNWmv93CMDEGFn05jjzD0LeToQ7HwEyrYKu+9dfxX4d
 RZ4iFi2c1TYwcAPQKHAm15aTwxewFRwFLnzefFmVZ++tY/pvPlPflXQXAf+U5Kd8RC
 Gy+JrD1XICHng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lhtslizF
Subject: Re: [Buildroot] [PATCH 1/1] package/openlayers: bump to version
 10.5.0
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

On 10/06/2025 11:27, Thomas Claveirole wrote:
> Signed-off-by: Thomas Claveirole 
> <thomas.claveirole@green-communications.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
