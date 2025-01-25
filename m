Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D98FC0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 15:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C802E42400;
	Sat, 25 Jan 2025 15:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hAOTKyv6xP2Y; Sat, 25 Jan 2025 15:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D520342435
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D520342435;
	Sat, 25 Jan 2025 15:51:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 285C2941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23BBE82B51
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KCycnmLPlive for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 15:51:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67BE782ACD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67BE782ACD
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67BE782ACD
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:51:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id B37B3B0053E;
 Sat, 25 Jan 2025 16:51:26 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:33784])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 16:51:26 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 16:51:26 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250124211848.3876263-1-james.hilliard1@gmail.com>
References: <20250124211848.3876263-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <ff12f77ad72aa1766b0e9faa721c85a1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737820287;
 bh=l5gS3Uze/izPg7qvtigQCNzTXQmKKIaw6R7+pMuFJUI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EbvLzgftL1IeAQ9LIepePmQSb6NDLc5oUYgkaXMrp6o360Yz/qt+6SZg/7KC0Jt67
 xPXsao+8M9O1FMg8O7ySYYpCzBKl9nRlWgjRy0cK71WWhAUHdrufFldCl/OSbp03XU
 mGANZP+hJAM9bX+OHM8z48slb/kAHfvqLOaRRB8/6mFJS5XHrhv+C909bCGdjv9yzf
 yiJACgHHmAfldq7+qb+4n8m9IRopkQZZonry92N7Qi/qBbvTBGcq8IZ+fWbneobSXt
 o/20DAwLuXNT7dsYbjQ+BtWYSkKs8OhdSeP3eXXL0leqmMxQBABP3fqYy20miVShKI
 GcQGMOISLUmow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EbvLzgft
Subject: Re: [Buildroot] [PATCH 1/1] package/python-wrapt: bump to version
 1.17.2
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

On 24/01/2025 22:18, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
