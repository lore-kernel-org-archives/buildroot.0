Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697E1C87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 16:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3776760BC4;
	Sat,  9 Aug 2025 16:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NqDMSyTpx9vD; Sat,  9 Aug 2025 16:58:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86A6160BD6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86A6160BD6;
	Sat,  9 Aug 2025 16:58:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A5EA1D3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F2F5819BE
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lybh7fK4bnlf for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 16:57:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7F62B8195D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F62B8195D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F62B8195D
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:57:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 990C4B0055E;
 Sat,  9 Aug 2025 18:57:56 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 09 Aug 2025 18:57:56 +0200
MIME-Version: 1.0
Date: Sat, 09 Aug 2025 18:57:56 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <2384243185c70ed34e5c80dd44cc45dff2f11b43.1753982959.git.yann.morin.1998@free.fr>
References: <cover.1753982959.git.yann.morin.1998@free.fr>
 <2384243185c70ed34e5c80dd44cc45dff2f11b43.1753982959.git.yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <f1c81862ee8bb42fb6f5bdbcd32c9c97@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754758677;
 bh=sgFIUtrplfXzSM+4r5JWI2Qfk32eGmYVDk7ukl0kGqs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DF+715IuBAxuMmnE7TbWsOeUwadzzYmmGGkFzq5uEEXrA4mI35GvERxklvD354F1U
 OGA1QetnEXihT2TPgGNVcf8E3G5YtkHkLYVCTaHCpkvPXJUqhtuslCW33PQ+KPYToE
 X089x2yGBk44ZfGO7QuUlfHq3RxfaO3XylN4fGeY4nHEKAJJwWfEmQ87lfH4/L7Um8
 oRzF+V3ebSKZoHj8vvEjZ57cPaXyIdZJhlscfBDoYPcfrzX5MacSlLBTuSoZkjhZY6
 20yemmaiUP9QrsxPwRUOSeyDJHHoFFz8eQFjXmkVz9Yg9bmSg73Tr19wbJYVXQ+jnD
 FED2GuIU5hnSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DF+715Iu
Subject: Re: [Buildroot] [PATCH 1/2] Makefile: fix list-defconfigs for
 br2-external with weird descriptions
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

On 31/07/2025 19:29, Yann E. MORIN via buildroot wrote:
> When a br20-external tree description contains an odd number of single
> quotes, list-defconfigs will fail with a shell error message:
> 
>     /bin/sh: -c: line 1: unexpected EOF while looking for matching `"'
>     make[1]: *** [Makefile:1243: list-defconfigs] Error 2
> 
> Whoever wrote that code will have to write this sentence 100 times
> on the blackboard:
> 
>      Never, ever pass user-provided data in a printf format.
> 
> (see commit 49117c102803 (core: support description for br2-external
> trees); dang, I knew it... And I should have known better when I wrote
> that code, damit...)
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Series applied to master, thanks.
(and have fun with your blackboard)

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
