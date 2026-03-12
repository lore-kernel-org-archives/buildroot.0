Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F052106ACD9
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 18:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B3A940233;
	Thu, 12 Mar 2026 18:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0jNB3s3c0ChT; Thu, 12 Mar 2026 18:37:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D242401F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773340641;
	bh=/ZeqnAzKBMYNvrvu0WvmtWM2A4kys+u8Zz5f6khRZ7g=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XE88CPLmsAQBqP6MJNJnZLWJCwrHwo+thRdI5Yz6TQkCQFKfGSeth4lpBS288OuY5
	 lANOqdtqWu4F5yWWivzCIRHBlFb2iMgwr/af3xXJh+It6PmGLDhQpHI/aRs4TRql6V
	 4d9UQUln2WgEt6KjoF0Ap3guxKZtOGkSWbYOR5R68BCiYvhfAn3HwVRG/iiN4bZmiq
	 RIqsk2kdrw4H1TJ0GtM8aRWKD1kWNsZB066F0wLacwBS4wDUyK3+Y09RXOYPId7FZu
	 NeCcAh6233Cu17yorq86ig4aT9JGkHn2h+45Z3gFdEjl9MUhVwB3mNA3Cbvec0X369
	 p+f+bIm3FcSkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D242401F3;
	Thu, 12 Mar 2026 18:37:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A589C201
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 18:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B1BF401F3
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 18:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lh-Y9WGeQfVn for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 18:37:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE827401EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE827401EF
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE827401EF
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 18:37:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 744827803A2;
 Thu, 12 Mar 2026 19:37:15 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 12 Mar 2026 19:37:15 +0100
MIME-Version: 1.0
Date: Thu, 12 Mar 2026 19:37:15 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260223214358.858432-1-ju.o@free.fr>
References: <20260223214358.858432-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.13
Message-ID: <ddcea76dffdc4dad8ae46731ecfe7d3a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773340636;
 bh=atIZJFqKtyqdO/uIiMK6YWJ3d0SViswmDSvvrv7t87U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=U3q3KlDBqz1n5K+tqUofOXe0PffCgFFxN8dSwxUrOVCB5YD/DtNvQyApe0g3vrQru
 ty/ns7tBSLMh1w6c4BVmvRFd6FUNlE8Lp6dCa7FUnZW+y8dncZmWwzPrJ/39cbJXum
 JqITbDLwqutODMQxYU4v7OJgysu6z31J+zHowrkJztfdmCU4wgLtUApkUYmdfdv1jO
 9Jyg8MhWZHZXqxEIXVKY6rtHX8I3kDGBFTXWEgwZWslEKdTtjRq59N1+EWYfT3P+/V
 +Og0D+CMH4NwaZiHHHmIHtQ4CKV5GGxDBdBusobAbARcAzay5knbkOUBYUGmSkiCPe
 1nLucBgSfGiJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=U3q3KlDB
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_connman: new
 runtime test
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

On 23/02/2026 22:43, Julien Olivain via buildroot wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
