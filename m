Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11659E7719C
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DFF46084F;
	Sat, 11 Jan 2025 16:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QEddL6jmTrgl; Sat, 11 Jan 2025 16:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAC8A608B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAC8A608B7;
	Sat, 11 Jan 2025 16:45:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 686D1942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5442A400F9
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hhWHFi8Q7MQ8 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:45:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 569E240017
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 569E240017
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 569E240017
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:45:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6D01260136;
 Sat, 11 Jan 2025 17:45:52 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43616])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 17:45:52 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 17:45:52 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Grzegorz Blach <grzegorz@blach.pl>
In-Reply-To: <20250109211844.2401761-1-james.hilliard1@gmail.com>
References: <20250109211844.2401761-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <70b632a2e09b8638d84cb09fa067a3e2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736613954;
 bh=NrH0qmR3fmkVqlm9nW1BcybPeIgzwuf8oD3lkn69l10=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=brqbWHUUjr7pO3SopvYB2JFvjuiWaKR0OvvYE16V/2flxFFk0WQbFcohtmJ7bxmnf
 qDBbzmGSDx1OZujzuZVHDTMu7BckepcpYpAg7LC4NAFL82qIoJ5hQ8swb8ZYuPPdtW
 eBFb6h+WSjyT2sWPlURx/3kPeHsbr+qePFRw1DW1K/vgzNh6BPQWShg9ik9qP78VVW
 P0Ntrx9nahgf1jZ6a59cXu2EjCV3zM9uODDuB/rIia/MD39vpO2Ri/OjHEvSt3c8/D
 ivhpY0bmB5n/e3Xp5emZbn/kp7CAGIsSJ7P+sTZ64xlk7PqW5sCfUZMq5Nsd1qqX/r
 Jh/CVGlZ6ZBXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=brqbWHUU
Subject: Re: [Buildroot] [PATCH 1/1] package/python-hiredis: bump to version
 3.1.0
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

On 09/01/2025 22:18, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
