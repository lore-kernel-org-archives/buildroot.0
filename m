Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB48E668B8
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 19:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9D7660DF7;
	Sat, 20 Dec 2025 19:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ICdWPObZyj2R; Sat, 20 Dec 2025 19:22:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E1BB606A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766258525;
	bh=syo3rwKgwk35S8Qh26vDcb8EpJIYuHwIqy8rjjKFAUM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QEJde9ErEQjQBlVAbZiLigBSxgkwlfOu7DswwS9tgNToZhKPGdjSjtS6t1YqvW7X3
	 wdVjX3mmKNoO1NS8ilP5pAqposHZw15QA97rhqcbbqlrWYnT/S7djxMtgx0RuXaruL
	 Wgv012isj6L8zeTwDOtQU/fwQpYqDumkT0FlkDz73kfnHjQVOU858IDUSVe2W1Dn+A
	 En0iX8H7NRluvvUO8kBXURoFrNorHYd53rf4+nbm8kjQ7UyCMjSyM1pMBCgGGOHWoP
	 MPHxUCucjncfeh2CKZEKTh2pF18lmLI/rAnHVh5dXJHQRVlH4nvfjS+KFn8KOmiqpA
	 W4gc+386tcHGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E1BB606A6;
	Sat, 20 Dec 2025 19:22:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B5DE119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 19:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08BC04098D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 19:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lRN9NpSVMzqi for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 19:22:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D8DC2404AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8DC2404AD
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8DC2404AD
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 19:22:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E279413F879;
 Sat, 20 Dec 2025 20:21:58 +0100 (CET)
Received: from 2a0d:e487:416e:b4c0:bc35:8e33:c88c:ebb9
 via 2a0d:e487:416e:b4c0:bc35:8e33:c88c:ebb9 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Dec 2025 20:21:58 +0100
MIME-Version: 1.0
Date: Sat, 20 Dec 2025 20:21:58 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251205122832.601160-1-buildroot@bubu1.eu>
References: <20251205122832.601160-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.12
Message-ID: <a9ac5da1e59e195b925b2ac6eb5004e4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766258521;
 bh=3xntxZjeFBZmEai82DqFbkWcyi7FsTmvn+9cLiLcNvw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HF3nTTZtBaehXnzutoQkn0JYTFVpEDDru4nVTFq82czPelYSzzD15EhsHnZebGBra
 D3xrVPmgCXWSlR8DqeBFQ0Hib1NyNtjr5EFhsa+bmFyfC2kv/AID2C44HFkK8B3arK
 OM7Ey/7qoPQjAtpbIaeTMehYWmJJewBeCKVrfx+bXiGBUHTiyJxBBVnlSwP4J9m5VB
 JrRsKwZHqfP4bdPUKFwsHvXK/AjGJeqG7dERzD7iFse9y65gIHipIQsIIfIW3vbhHQ
 6IN6hNFUhELpAmBj5qM1DiIWDPX9qxVEFSpfKu2Kr0Wuo0UuYjs3yuTTbGR1bt5ilO
 uE5+Jg3kn2trg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HF3nTTZt
Subject: Re: [Buildroot] [PATCH] package/python-sqlparse: bump to 0.5.4
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

On 05/12/2025 13:28, Marcus Hoffmann via buildroot wrote:
> Changes: 
> https://sqlparse.readthedocs.io/en/latest/changes.html#release-0-5-4-nov-28-2025
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
