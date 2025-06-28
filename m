Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566B8C7EE39
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 21:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E2138127D;
	Sat, 28 Jun 2025 21:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YdjrsvuRLE6o; Sat, 28 Jun 2025 21:08:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5082C80EDD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5082C80EDD;
	Sat, 28 Jun 2025 21:08:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2736AF7
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 21:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFD7540986
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 21:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGk2iA3cd9aZ for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 21:08:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A0A640899
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A0A640899
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A0A640899
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 21:08:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id DEE712003CC;
 Sat, 28 Jun 2025 23:08:46 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Jun 2025 23:08:46 +0200
MIME-Version: 1.0
Date: Sat, 28 Jun 2025 23:08:46 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250626083005.537882-1-titouan.christophe@mind.be>
References: <20250626083005.537882-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <59b2a505b41f4fb780bc25ac1365ee10@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751144928;
 bh=IlSbW4YAxQAuCHmKTQk29Y426CC0WlB7HxIa0IQz8mA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dADRYTAFueG1ebkvm6jLf31MRoj4w732VwPvu7VlnuH7+zNC7dVLm2uorY+ZDDou/
 VEO6GxCOpLqPK4xjp/Dbz8nqh/cOOUIXLXKR+9OtrJW1KtKjhdtw7/UMUedO3h3RoW
 BVwY+jLSthe7DPkXPMM5r+n7bD/vJabbVXtvU3IEoIkooG6x1b9JKJf4Ut5MvQ5azl
 2bCDEXFxBwt7V+RvEwWrAq3rsL19BpmVF7krn+u3LF+UoTHKW4Jd2kOtICfUiksnBr
 jCydn+pJbbQ28FEgJY7aeBG3zevsTU/lqPdatGFlYfFFc8Ms/giFgW27s43MlOPnDW
 WWgcAV9UzYMyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dADRYTAF
Subject: Re: [Buildroot] [PATCH 1/2] package/libmpeg2: switch to videolan
 Gitlab repository
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

On 26/06/2025 10:30, Titouan Christophe via buildroot wrote:
> The source code archives don't seem to be available anymore from the 
> libmpeg2
> website (Sourceforge) [1], and their SVN repository [2] doesn't seem
> reachable either.
> 
> This fixes recent autobuilder failures, such as
> https://autobuild.buildroot.net/results/ede/edeef6a480350880b12eebd94654644e43c2670e/
> 
> [1] https://libmpeg2.sourceforge.io/
> [2] svn://svn.videolan.org/libmpeg2/trunk
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
