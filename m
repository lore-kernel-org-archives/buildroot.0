Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8C2C71135
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 13:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B3104066B;
	Sun, 15 Jun 2025 13:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRTzb2zypPgT; Sun, 15 Jun 2025 13:27:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4343040644
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4343040644;
	Sun, 15 Jun 2025 13:27:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D47821A4
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 13:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C60B08027D
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 13:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utIwfcTlWYBz for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 13:27:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DC2BE803B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC2BE803B2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC2BE803B2
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 13:27:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 62BF619F734;
 Sun, 15 Jun 2025 15:27:45 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 15:27:45 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 15:27:45 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20250613094047.15343-1-buildroot@bubu1.eu>
References: <20250613094047.15343-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <35eb76a0e2a2ef4b029574458a090195@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749994068;
 bh=htLE8zXP8Z7dAMW9cjTBgq95eH/sVwB69Ny78x9YdzU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=scvtkV+fnAog0U8VEAsYtRSMTYy09UTCSmNGNiiLMF1GdgyBNG/F5hLATI3whj7lU
 8+4l/jMwylRlt6bxpLwrQtvb4+lyqjZcldyMk7Fl32BnBypLYBWbcjWQwLDWGYKd48
 8E9fBH357cCEGOFNFApcMujdlkWZZdls6xmsqx4G0L/kbtjEelT01eZqiyqtw7G2Mb
 VzbcdzuMA3BFbK7dzyEJ+0FMuCOXklBb0iq7q//G1NreQiILX+NBa7i3GBhKCAF5Tf
 5BvPcHRM4BpVCZdGRfr0bW6ateOoN63Zf1setEWnMA+BcUmCYz94ckijjrJx87A1iL
 onaQHR5Kw9eJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=scvtkV+f
Subject: Re: [Buildroot] [PATCH] package/python-pydantic: bump to 2.11.6
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

On 13/06/2025 11:40, Marcus Hoffmann via buildroot wrote:
> Changelog: https://docs.pydantic.dev/latest/changelog/#v2116-2025-06-13
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
