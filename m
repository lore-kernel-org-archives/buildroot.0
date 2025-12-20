Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D907D637B2
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 11:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B541383D32;
	Sat, 20 Dec 2025 11:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FTWYE-yCREeQ; Sat, 20 Dec 2025 11:23:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86A5C829A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766229804;
	bh=qNrUNPUlkkmXc+1oX85F+BMKrrrUjUfMlqguWF4QuwM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=C1ME5ufeBNGYhy1w6Z3Q0p6mTYqU4JqGVn44GVJ1RDPULRNquKDEuIFOvwY6Imw4o
	 93ToPqoeKxMzLp5uhsV7XxWODKSOucScKFKfAb2wKSRMkaQu0MLnuXLqG7baUdTp9M
	 41FyoIH6Y5kKyZ4tl9UgKw7+aT1j5hWuRIFzqFPhm8FGNj/66cRxVOUqUktFSpXzb6
	 7f6sV9LnmBEWPTThgwfT09NdArR4Jcm/70MEfxZ5+QbQ3qkYWzVCkKLDTOS8vfP6vw
	 SmK1qbNxuqoOSpNaGUpo43ashxKBIZR+agp0TnhQZi64cYRleXgt+XVXiLPjgASe/I
	 MlCN3W059mcEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86A5C829A9;
	Sat, 20 Dec 2025 11:23:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 99E28119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 11:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C4B560D84
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 11:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLlbpZudMlcM for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 11:23:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8795B60C17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8795B60C17
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8795B60C17
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 11:23:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 9A1FBB00571;
 Sat, 20 Dec 2025 12:23:19 +0100 (CET)
Received: from 2a0d:e487:416e:b4c0:bc35:8e33:c88c:ebb9
 via 2a0d:e487:416e:b4c0:bc35:8e33:c88c:ebb9 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Dec 2025 12:23:19 +0100
MIME-Version: 1.0
Date: Sat, 20 Dec 2025 12:23:19 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251220100938.517246-1-giulio.benetti@benettiengineering.com>
References: <20251220100938.517246-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <4a03ca41222afe6ffe6eba5c05b17eb5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766229800;
 bh=bAsx9+tf5KVTPr9igsyPzXkMOFqzLVFT+CqqG24OTPY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W5AwV/DTfcO+rqvYQazCu5YnCgynLuneCtE1MJsc+IXWm0U5Ot9tgTKgimsmcVC8r
 wMVQStNGFOdvBZX6gIr2iyWspc6DxPhBesFAfAAu2mRJn9iAifnuB+RblR++aEIm2i
 9BQVY46zexaQRDn3RVkQVal4xPJ79fJpdBWLzAwQBJMSahYvgmvXIrOB7qYiCcqAq5
 tUp6/OaDiyOm/W3phN23KXjsrX6yqICq0UWGE2sw3K4aZIB3pu3b9mybvDunkSkPPp
 xC7be3S5eHTjlqNOhvVCFf9oxGC18t04OaGbVoRUzhFPTzUf0zHt0s+5usqV4BWbtZ
 ttZNK5afIxIjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=W5AwV/DT
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.8.3
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

On 20/12/2025 11:09, Giulio Benetti wrote:
> For release note, see:
> https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.3/docs/v2.8.3-ReleaseNotes
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
