Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9644C7115C
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 16:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A68DC60AAE;
	Fri, 20 Jun 2025 16:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9H9W4k5gqAZD; Fri, 20 Jun 2025 16:45:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED7B76080E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED7B76080E;
	Fri, 20 Jun 2025 16:45:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E31CC8
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74A87403D4
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lDlxU-YifebD for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 16:45:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E585E40393
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E585E40393
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E585E40393
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:45:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C559B19F73C;
 Fri, 20 Jun 2025 18:45:17 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 20 Jun 2025 18:45:17 +0200
MIME-Version: 1.0
Date: Fri, 20 Jun 2025 18:45:17 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250620062618.20796-1-bernd@kuhls.net>
References: <20250620062618.20796-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <c719fdc12d691907a9bcf7ee8efa224c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750437918;
 bh=2TxNrTn4UkOzE0fzdSa7iQluUXHT50EImJFiihSHOU0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jYWkkOW9c5ZCi87FmKnZJiT6L67oJP21zyVTMBcD6ty8eL9UiVxihf0R1XUEtoLhZ
 04OEIS19bfq1tuHV6kyOxe1unLyAk1dG23d3Qw4gpy8DiTzcX5RMfz9gL4nToEs28c
 ShwX+hIUbjV7N2IL+KugOvvJg0wtq583IeTH3Qi/i7eNJ477uASx3NNJQxQZMFmLJ7
 5w+2f8pjZlisImfTro7qIoHwf45KVGu4GZuV2voJ225kDUbfg9fNibDv4DlhFuC5mM
 iwGL0w0lgrXE/4KZuYQgesKDmss4ulNrsVhCFUvb6Dmr0FfDSYGY/iAs7CjIhc9vQo
 /ciBuiZSXtxkQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jYWkkOW9
Subject: Re: [Buildroot] [PATCH 1/2] package/kodi-inputstream-ffmpegdirect:
 bump version to 21.3.8-Omega
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

On 20/06/2025 08:26, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
