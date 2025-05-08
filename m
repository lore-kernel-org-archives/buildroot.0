Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE692C3ABC6
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 19:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DB8381EEF;
	Thu,  8 May 2025 19:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTsJyiBltjtg; Thu,  8 May 2025 19:32:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C90D181F64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C90D181F64;
	Thu,  8 May 2025 19:32:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7072715A
 for <buildroot@buildroot.org>; Thu,  8 May 2025 19:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56A5460AB9
 for <buildroot@buildroot.org>; Thu,  8 May 2025 19:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2E72QgA_YQj5 for <buildroot@buildroot.org>;
 Thu,  8 May 2025 19:32:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 949F660EEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 949F660EEF
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 949F660EEF
 for <buildroot@buildroot.org>; Thu,  8 May 2025 19:32:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 5701B780395;
 Thu,  8 May 2025 21:32:22 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 08 May 2025 21:32:22 +0200
MIME-Version: 1.0
Date: Thu, 08 May 2025 21:32:22 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250508175530.90432-1-thomas.petazzoni@bootlin.com>
References: <20250508175530.90432-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <d760a89f66bebdfc500797efd0c78df3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746732743;
 bh=fQPPmpwiA9er9WUcopD7JayI3UGmwmBsXQZ7Nrn2Ziw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FCO/tdtKvJ8TIjX+raCg8VcQoLQd2dj7XEZktUnXdyLmblRN4X9vzKuezJCYu33oV
 dLY6cVYHKqssX3PdXW+sO6stEnMWeXIncrYprYQbTNA02AOSMlzGMwmwjC3RTwNMgb
 Sq1yxM9MDx7a6i1fWsUB9ZsgELQzHCDWXkTWbpwjsLMb1sRohVtIFLYZUZjP0RIfUj
 VumCJFP4t2A3tst0H9UmCEgLpOA7tbLyEtqEDhw536gagp7QiYQJF1VhgKxAj3+z31
 K9fV4QwQQqlnEBWMkZ9nirInQZ6YBdwmfZjZUK2qWQ53DcCT91fj7G1Sz77HcrZae2
 d5mvksPB5SAgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FCO/tdtK
Subject: Re: [Buildroot] [PATCH] package/gdb: add patch to fix GCC 15.x
 build issue with ARC-specific gdb
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

On 08/05/2025 19:55, Thomas Petazzoni via buildroot wrote:
> This commit adds the same patch that was already added to GDB 14.x,
> 15.x and 16.x to fix a GCC 15.x build issue.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
