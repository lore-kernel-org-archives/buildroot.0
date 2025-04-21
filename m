Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C72FC369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 13:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BC4980BB2;
	Mon, 21 Apr 2025 13:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WMW3D1YgObKZ; Mon, 21 Apr 2025 13:36:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73FCF8101B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73FCF8101B;
	Mon, 21 Apr 2025 13:36:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D75768
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 13:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03BDA81000
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 13:36:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v5NtgLiVzost for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 13:36:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 677C480BB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 677C480BB2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 677C480BB2
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 13:36:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7C8CA19F73C;
 Mon, 21 Apr 2025 15:35:57 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Apr 2025 15:35:57 +0200
MIME-Version: 1.0
Date: Mon, 21 Apr 2025 15:35:57 +0200
From: Julien Olivain <ju.o@free.fr>
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Alexey Brodkin <alexey.brodkin@synopsys.com>
In-Reply-To: <20250421110935.6973-1-fancp2007@gmail.com>
References: <20250421110935.6973-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <2aa13596201df720e97139900ec45c67@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745242559;
 bh=F5jHaLoUQM1Kc+W5AwPr7INe19aBQMJSDnQXlxSj0qY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CbPCsOXVMExzQ9dNNjFiu8SEz0njoe4Mp/JNKitHU8Zt35dR6WA4J2Wp4V8aWL+5T
 qZQeeCdKQpijMyyp5sL1mR2F7Xu/CStqTt4wb+65ooRQQG5Jre78iGXGJKgnQrBPxy
 aUP+I0rCpLcoMX9rbHBupFYWtTWXqDd5yVdUZ+zp6VQR5DEmLaYHxtiJzaBhWdKco1
 8u4OcbtYEeYTfixssCpqStQK4ZvbI03l8kKSdzoxxf/lguqAz5g4oxBnIbhht/A0de
 OhCpqd9Q+XtbE9xAVd7sFVcNFhlre0kvBkbE4D9NetZJ3Fkgdce+jC3ZEl3r7Lxuzz
 doIBOPqYTbA/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CbPCsOXV
Subject: Re: [Buildroot] [PATCH] configs/cubieboard2: bump Linux to 6.12.24
 and U-Boot to 2025.04
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

On 21/04/2025 13:09, Scott Fan wrote:
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
