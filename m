Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864E7C5CFDB
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 19:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41F4E40C1B;
	Thu, 13 Aug 2026 19:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5bp41WszcgK; Thu, 13 Aug 2026 19:37:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 747F640C8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786649821;
	bh=2O/aaW0qdMLzw+jOJTQeqkXEQEkn/y9PhoJP5So+AWA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eRHZfQQLtp2lcGypi7GhvD/3FePW6p/u5o3e3QHskDEPesejSCdJ7cCDfKot9ZQl4
	 I8C0V1fg6Qvjhw4YeB/lTFyApkZgKJ43hvLbjm/0oodgZb8pIbgRwxg12/HpI29pir
	 KtlfOzKkhP8F9qo5AIMLVy90G4Okh8IDms/o8+X/jQ7WZO8faidLQ/WWxxwsDHovd2
	 rRUvwJ0Uwr+J4RZIVfoKSrpl4T/O+oddk3kFOsWynerTs1e0/4BxXNXNnuGRnzfPww
	 JFlewxnwBpm0NsXTI1VSiePiIyKEHNUKkff5iJfXbXALniB5ydG1h+wo2GRMR9O8RH
	 2bOU9kCF2wRUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 747F640C8A;
	Thu, 13 Aug 2026 19:37:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5339833B
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39A3E40C8A
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:37:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9_qWmwak2hc for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 19:36:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 68DF740C1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68DF740C1B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68DF740C1B
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:36:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 75BAA2003B4;
 Thu, 13 Aug 2026 21:36:54 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 13 Aug 2026 21:36:54 +0200
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 21:36:54 +0200
To: Mattia Narducci <mattianarducci1@gmail.com>
Cc: buildroot@buildroot.org, Francisco Gonzalez <gzmorell@gmail.com>
In-Reply-To: <20260812113306.353838-1-mattianarducci1@gmail.com>
References: <20260812113306.353838-1-mattianarducci1@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <6f7421baacfc6778a22dbea4b9239d90@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/ser2net: backport security patch
 for GHSA-cgh5-39mg-vhfr
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

On 12/08/2026 13:33, Mattia Narducci wrote:
> - GHSA-cgh5-39mg-vhfr: Path traversal in authentication via unsanitized
>   username allows auth bypass
>   
> https://github.com/cminyard/ser2net/security/advisories/GHSA-cgh5-39mg-vhfr
>   No CVE ID yet.
> 
> Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
