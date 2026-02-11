Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F20ECD6EE
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 20:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D7B861167;
	Wed, 11 Feb 2026 20:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6B50_zeJIzv; Wed, 11 Feb 2026 20:49:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 397D06107D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770842990;
	bh=xQYFJHtRjXOQBbuy3KKNqx1AA3C10M+jIANR4Neo5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=grPVI7jIGroOSxL9pxRw5F3QmIL6l6Y3fOfot9SXj8EMb1wNlnuZz3XptwzmmXiBd
	 nlJu71C6QtBx1Gc+fZZmILHjbXW8LmNRGSnPnhEuy3hFOlIxjV+dtRI6iZFe46R8WN
	 NFZKON8Ucawz5Az/NHlwEAO9lgfDiD4fQ4w7bJ5rE7thSruGmlAKc3rUggiRu1cqMi
	 gKE/iNhbvzrVhUQd1flTJf5KwZqfuXdu0KVG523+yiXwoPhz18oRh7wYziub7P6bPU
	 +QDoJpdJ2K6/cosL+OaDdCwNmRmfsroeTLQkFwAZ6+PC2bjaWSPRMlBZUnjHW5uBFf
	 bCO95ZXd6zz8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 397D06107D;
	Wed, 11 Feb 2026 20:49:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E8081F6
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 20:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 406AE40068
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 20:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bxhz3J7JtWE8 for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 20:49:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3CD6B40057
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CD6B40057
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CD6B40057
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 20:49:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 43F58780368;
 Wed, 11 Feb 2026 21:49:45 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 11 Feb 2026 21:49:45 +0100
MIME-Version: 1.0
Date: Wed, 11 Feb 2026 21:49:45 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260210164851.189380-1-giulio.benetti@benettiengineering.com>
References: <20260210164851.189380-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <f68ec256302ee428feea19ed8e6899ae@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770842986;
 bh=yYsEXMDPtahVhA1va0fqLC+jZsnLDHkeOIQnp0GzKog=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ng7fZh/gEYhwtLL8nZfE3ZP0N0dEmXt6Ody0DldFduVRkK6KRIibLWudyQQWZ2jwu
 qdIegjugnoWLOOe4VBoZScZ+lwGeqOuolVoUDR5y18bwIltao7hRJ5HGCakOgy/CzT
 Mq87mtBJIgKpJ6iTJ3utc2v6eO9QqjYkR182GbIZbRZEm8bknaFt8PUeF2DMaFPj98
 q1JyFBpMzX5eMZ3Q2c5asNnkO/ClSFtojuMKcnbu+zWcGGG5njNULAw7/gWIlIvsY1
 XcXWOr2R8n2ZeXqd7tVedE/bTffpneHlhuIHRm722pmB/qxV1LPy2EkjJbvKbpXlCF
 F7DKbasMlss1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ng7fZh/g
Subject: Re: [Buildroot] [PATCH] package/mali-driver: bump to version
 2026-02-10
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

On 10/02/2026 17:48, Giulio Benetti wrote:
> This version builds up to Linux version 6.19.
> 
> Fixes:
> still not happened
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
