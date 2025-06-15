Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41199C61CE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 10:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BACB60841;
	Sun, 15 Jun 2025 10:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dWO5KDBhYe9Z; Sun, 15 Jun 2025 10:19:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43C81607A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43C81607A1;
	Sun, 15 Jun 2025 10:19:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 61A5C198
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 483A360781
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cn1o-HepTx_R for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 10:19:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A088607A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A088607A1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A088607A1
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:19:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id CC46513F8BA;
 Sun, 15 Jun 2025 12:19:29 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 12:19:29 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 12:19:29 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250614094822.56877-1-bernd@kuhls.net>
References: <20250614094822.56877-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <501dbbc36ea5837dc6dfea1cd594277e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749982771;
 bh=iP7TUD33sNYdp+wrIM/J9Rcr1/7CtpBAK03hcJ3GuOw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Leyh2I4f5sI3Ig3wUMJkADzA6fUQR9cj/A2F+l8R8HyPnFXGE99fBARftPhagBthn
 2Oh6lZ9D14jqKAysChQkedn9lbA+rBkGJLE2UP5yWbx84YFOtYqafQ18JeO2peNdWL
 K3eTXUb2TOhqPgyaeXmJ0DvqzOHQwHBwPCp68BTUEoXwU844by3FqUqLfgV8nCbymt
 L9oTNjCV1/q328Zx4XAdmiAhwTak9uyehml3LLYSBkFBsTEGPdZ8UZtmL6lW88Idw1
 u5/azvztlyKW/8TXE+EitVlf1WmjcO59N+CIRLlAq52zQKnj57J1eITRa2Xooyf5fZ
 DtbcHu7XEBMDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Leyh2I4f
Subject: Re: [Buildroot] [PATCH 1/1] package/bcg729: bump version
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

On 14/06/2025 11:48, Bernd Kuhls wrote:
> This bump includes three patches which were added since version 1.1.1
> to the cmake files:
> https://github.com/BelledonneCommunications/bcg729/commits/master/
> 
> One of them fixes build errors with cmake 4.x:
> https://github.com/BelledonneCommunications/bcg729/commit/e29952e7ceff64de6fc6f8db43e3b326481280be#diff-1e7de1ae2d059d21e1dd75d5812d5a34b0222cef273b7c3a2af62eb747f9d20aL23-L81
> 
> Fixes:
> https://autobuild.buildroot.net/results/118/118349d20eae2dccdadab949065f6bc6471c825e/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

For info, I changed _VERSION to use the "git describe --abbrev=40"
format, for readability. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/7139ffaf06bde0398cf41fb702241b295ac9ff94

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
