Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7F6E67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 13:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B97C40860;
	Sun, 21 Dec 2025 13:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPhzYcvEigN8; Sun, 21 Dec 2025 13:33:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6682740861
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766324039;
	bh=I+k3G/Zt6FlWuUc/O70gJdoI5gAWPymiBKRRCW0CRmM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E++Evhtt3OiYTqzKllYoPtQUGf6YoLmSFsPmsHc/GLLbpUhzxLqlYRoPvbxs5qXjm
	 Ok1KpQCKZsWnuatR4/XUTvR3w+eZ5pEQG+3W8o3Fi6/d9Xvngoi8xq24/9vziRpC8F
	 W2yxPHL4FcVSsNY/N+ASbD+o60V+wwWAYMbyIz7cE+8JTx9e6cOWBo7cgbD1RPkdSz
	 OTupO+gxFQiSUywqLwSyAKnQs+oQjuS50CsFR9TIGyMEdpOwdjfuvqKvgZqKbw8Lzi
	 uyV4YFP+A0Gve3foLKSt6n8xBSMdvzawkLXc9te29/tvL23KGeLc5T2nTVUQ9Ni97q
	 adAie9oqH6umg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6682740861;
	Sun, 21 Dec 2025 13:33:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 403001A6
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 320C8606E7
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHSCWf3KbHuz for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 13:33:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2CEF26067B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CEF26067B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CEF26067B
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:33:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 257D2B00539;
 Sun, 21 Dec 2025 14:33:54 +0100 (CET)
Received: from 2a0d:e487:412e:ace1:8cb:5573:7181:a54f
 via 2a0d:e487:412e:ace1:8cb:5573:7181:a54f by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 21 Dec 2025 14:33:54 +0100
MIME-Version: 1.0
Date: Sun, 21 Dec 2025 14:33:54 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251129075610.1319512-1-bernd@kuhls.net>
References: <20251129075610.1319512-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <7dd10ceb9cc0df77d4af5ee47efa0165@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766324035;
 bh=tI5XRwk67Vy8ivmh7lcZ8Rud6t43wCT8tTOM3L2bRcA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iW5h774hdWr6d6kcA2iT8WtiQDJyffbj744uo2chd5VXNyDNCh/ET+gIguBme4/xW
 qGtajVMwk6+RuWQJaA+E639Rm+4rPk26g0SC8qHrF/m6bwk/EQ6ZuMbr0txQE3PNbF
 gN+nKc//kbVkpuKS4zXCtn/GevTYFdDxwDcXHQH2HgfLlNoEiMQShiKkit2UfMAx6b
 yjoklqe3YioY6sxejLyspc7tvu7Mre48zLGCut9pldqVeuQdZXs+tvJ+4kmqxWFfWG
 OYSiX8AX8z3aGotN9m7CDEIR5vACLAqLRycg7KB0ZLtQ+XVEZ0uV7hpvv0x1LlbTcK
 4Cy9KevCJCu4g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iW5h774h
Subject: Re: [Buildroot] [PATCH 1/1] package/nushell: bump version to 0.108.0
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

On 29/11/2025 08:56, Bernd Kuhls wrote:
> Release notes: https://www.nushell.sh/blog/
> 
> Updated license hash due to copyright year bump:
> https://github.com/nushell/nushell/commit/192ee59c754ec5c9b66e28cca94a75d643501be7
> 
> Fixes:
> https://autobuild.buildroot.net/results/d27/d27004dd62cd0c87fbfbe0eca8057b17d84c799d/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
