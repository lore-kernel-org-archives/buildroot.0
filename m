Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB39D3C90D
	for <buildroot@archiver.kernel.org>; Wed, 10 Dec 2025 14:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E69361783;
	Wed, 10 Dec 2025 14:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hn4LElpyX01x; Wed, 10 Dec 2025 14:14:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EBA56176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765376080;
	bh=mG/Xf1Hm8TTfCNpneIBPhf88HLA+jymvXivWpNUPf0w=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=TeMo3v7lKxB8eUDARGDOSY/39RxLlCQkMvzWaIsPRRnAIfz2B29wF/1FG+Ss1w7PP
	 p9M5YL36x0YWke5ECWlmogOcSxtO4fPxanqtLCoKMmew/BMhfC0UiigsGli/BYWtaz
	 qY0IRPbUrZGP/vaQAJ72+GlJIz9o2cveRGyd6rml3X2bY/0V/bWGT4lMoY9gbnnamf
	 yagNR+Jc1HDW4ZwIFmauDhMF0O4nblHcPZ9JA5eD5BwR6JKyxRmQiMbK44qdA5mR16
	 y8Mxh1ebxXH0JC8G1/UB6/abTpZaqSC4R4vj7Tro/LB/wU6z6xl7VQKflZVKPURdFD
	 3RmcUhTg2iu3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EBA56176B;
	Wed, 10 Dec 2025 14:14:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A7E42C0
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 016CD407A5
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVMGwgVytm2h for <buildroot@buildroot.org>;
 Wed, 10 Dec 2025 14:14:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 134EA40774
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 134EA40774
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 134EA40774
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:14:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C02AF1A209A;
 Wed, 10 Dec 2025 14:14:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8E1F460714;
 Wed, 10 Dec 2025 14:14:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BE61511931837; Wed, 10 Dec 2025 15:14:34 +0100 (CET)
Mime-Version: 1.0
Date: Wed, 10 Dec 2025 15:14:33 +0100
Message-Id: <DEULL82DY8UR.2615NBA4INMLR@bootlin.com>
To: "Giulio Benetti" <giulio.benetti@benettiengineering.com>,
 <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1
References: <20251210104709.2144823-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20251210104709.2144823-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765376075; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Iqkar2bOs8HFY0Ycl/2AIDgiGXQ9vW7Ix21/Iyxh6f0=;
 b=jJS5D9rnVR0yL8rdMm49ZPXby8d+h4zEc+ICCZJVn9wFrYLEkDFTPZi74Wl97N75SlgMyS
 Y1+w0/g9eVJ/eOIa7k/4W1iCUW1FZktOd/YyJy3a6SV+QIFeDVGx7xw4RLYI8HHZrQ6QZL
 76FvhFIKstICman1NPLmeW7IBYwlGMovPR4MtZNyyfTtShcBQ9zfkiwMru7LEw3ByotUiH
 XW+Nq9EuhUb7vy1600HLR7QCDIz+gtvHf4u7Rme+tY1gXE5M6B9D37FPxXI3TrqyQShTgT
 Jsx2V+3qvB9LhxQ7UvLxR7xhnYlmhe8BuyR9b06caQP0HvD9FVUvhRxmH/tUng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jJS5D9rn
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: fix build failure due to
 sha256_init() conflict
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed Dec 10, 2025 at 11:47 AM CET, Giulio Benetti wrote:
> Bump to version 2025-12-10 on branch v5.2.2.4 to fix build failure due
> to sha256_init() conflict.
>
> Fixes:
> https://autobuild.buildroot.org/results/12d0a01d3d3ea17bc99ee9aca5b50d20be83a5f4/
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
