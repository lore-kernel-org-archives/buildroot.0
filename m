Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF63C83029
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 19:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF9C341C8A;
	Mon, 30 Jun 2025 19:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OfdEporxq-u; Mon, 30 Jun 2025 19:43:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 138B441C8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 138B441C8D;
	Mon, 30 Jun 2025 19:43:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 28E98DF
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 19:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26C8740965
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 19:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tIO7zrnG2VMO for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 19:43:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84D2C417A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84D2C417A1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84D2C417A1
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 19:43:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 5DB5913F8A7;
 Mon, 30 Jun 2025 21:43:21 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 30 Jun 2025 21:43:21 +0200
MIME-Version: 1.0
Date: Mon, 30 Jun 2025 21:43:21 +0200
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com, Thomas Bonnefille
 <thomas.bonnefille@bootlin.com>, "Yann E . MORIN" <yann.morin@orange.com>
In-Reply-To: <20250630151412.341903-2-maxime.chevallier@bootlin.com>
References: <20250630151412.341903-1-maxime.chevallier@bootlin.com>
 <20250630151412.341903-2-maxime.chevallier@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ed62c927411f13f0db6c4c2553d893a0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751312605;
 bh=nc/encLngiP/2axQrbURJX9ysSOGCYBTPkRiM+dK9BY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=esJ5zupffXVjQXSjiOVlach7NzacvZHZfK8p5tM9kxSMW7dHl7fiFFF9suzzz6Gnt
 fT/l5BqWpGyGEEUq4RNznrcw/JR7UyqlH/3I8hhOhDdXbPJJb/FckJH45+r5/CW8wP
 hMR5VirwKJ3GXQVwoaYbvHV0vvGXh7Qr+hPPx/bTVHiEjWHlNKgmUbtKGlWIrqDsv3
 U0takuTJrCBobtUgr+MpXJJLrpBrqa4j894fcpnlx+s9SpB7tGW2Rnu01wdnmnYS/D
 +UXjcWaplhcXPmJYvBAKLqSiXd2BfJHIAD0WM4v5mqGJ2DEJIPQ74FjPCNgvuZU5Iq
 qfTwsEWfZJbZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=esJ5zupf
Subject: Re: [Buildroot] [PATCH v2 1/2] package/elfutils: Show a comment
 explaining that elfutils progs need glibc
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

On 30/06/2025 17:14, Maxime Chevallier via buildroot wrote:
> The elfutils programs require Glibc to be used as the C library. Show a
> comment when this libc isn't used in the toolchain.
> 
> Suggested-by: Yann E. MORIN <yann.morin@orange.com>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
