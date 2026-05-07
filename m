Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C2CCD343F
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 20:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E53D041251;
	Thu,  7 May 2026 20:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BCH0GoHBsY5P; Thu,  7 May 2026 20:50:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1313B41244
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778187041;
	bh=gyw1XEb1/hssY6QOQXK3dqtHv9OrPIenjoroArhtVbI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IDiNaDnoeYrHTTK3a9QepK1KKCEF7EgJaaVJ4ZisUd/eSqnRguxaEEu0O63lZoSwf
	 hZCLLMq15jSEstpEObvP+WTX9+pBvJBlGeOQU/ETAm6zTGCNGL5Am74btusIspmVs8
	 G3J+HoXVsK+AnPDvqptS/Tq/C60m2cxvAiOLYH7VaOBPyBa12DtWWo6/7ArvIid189
	 SqRfjycFUZjJut8uKNtDULYYbbmZnSHdsLOxkTRhLQcmTYdbwJFaHfK6ean8zlIsyB
	 4rmC+qqwqAN9Zs4sWncVldd235xAGs/EzoA8V7TN0FccTRtRvnATNI4671DGSEuhEl
	 AdK8EPhLILYMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1313B41244;
	Thu,  7 May 2026 20:50:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 53EEF2FA
 for <buildroot@buildroot.org>; Thu,  7 May 2026 20:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 458FC610F6
 for <buildroot@buildroot.org>; Thu,  7 May 2026 20:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Opeu4LIZF4Sg for <buildroot@buildroot.org>;
 Thu,  7 May 2026 20:50:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D9D50610F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9D50610F3
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9D50610F3
 for <buildroot@buildroot.org>; Thu,  7 May 2026 20:50:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 1ACE978035E;
 Thu,  7 May 2026 22:50:33 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 07 May 2026 22:50:33 +0200
MIME-Version: 1.0
Date: Thu, 07 May 2026 22:50:33 +0200
To: Manuel Diener <manuel.diener@oss.othermo.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20260507060445.440728-1-manuel.diener@oss.othermo.de>
References: <20260507060445.440728-1-manuel.diener@oss.othermo.de>
User-Agent: Webmail Free/1.6.14
Message-ID: <973ee7a118c6b0068628376629fc0a91@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778187035;
 bh=q/VeyzBmfWEhHVk0Ag2qEJDy10KUDbbeMYkEYhaKu98=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XT6BxzdbjoD3vIyKQzVMumvmAjNNth87eb26MX3dqV5TEt0IS/J8pM6zkW+DdEmUn
 9+J1Tq0QsmJwqqLf9iM3YP8IcchCYVaE2WFpV/xkeMRBbMONw2FELmDGWYPEOz/RwO
 4LJcbiDFjwWpUpDYKAyQPDmfY7MeaiwxnYWGamW+Bv2JaVNFSkAgc7F7Nr8oVXG49s
 Qab6tmcOgXmgK7FgBimrsIIHnQl+HDzQLVfJdknguRwDFCiffe7TMe5uTtL4gDyBy1
 lw1XdhIWEfLs5kDXd0xIWNpFyDcntWMsR4SHyVQLHixwr+w3oX2Mww6DHlPQt/TC0F
 Al3Ea8qcnFuzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XT6Bxzdb
Subject: Re: [Buildroot] [PATCH] package/uboot-tools: bump to version 2026.04
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

On 07/05/2026 08:04, Manuel Diener wrote:
> Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
