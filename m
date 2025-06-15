Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C2BC61CE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 11:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCD51605FA;
	Sun, 15 Jun 2025 11:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ALQ8KVJZFz4D; Sun, 15 Jun 2025 11:24:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EFF760602
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EFF760602;
	Sun, 15 Jun 2025 11:24:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 214D81A4
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 11:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1351B40572
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 11:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JyJkWbgs8vEH for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 11:24:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5675F40509
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5675F40509
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5675F40509
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 11:24:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 64D1F19F57B;
 Sun, 15 Jun 2025 13:24:16 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 13:24:16 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 13:24:16 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250614134305.678900-1-bernd@kuhls.net>
References: <20250614134305.678900-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <94c9502a83bd2b7dbd49c96fd8c3e5af@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749986657;
 bh=0JXWt/1pwdJs1Ioe5YXylq1q143z08QLxW3y0CDru3E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lvQKS1lO+jCKbTXNYW4YIFlR63YcIN5Ss50iTH6qcJlAzywqm0xMqMY1vLKd6HUGf
 ilQshJ6lNnO+tHZq+gMbQZp/ajVTZ5uZ76K44hdQR2qWUfj9LOhjKcB85mEXviY36U
 SUrke773RhiLxVP+TOG9LUia2WqS6T8vwfJZGi5VP9G0imR7eeurANutGgR1vRTKr+
 MGvniegHLhHQh6KhFAFrPHH0TCllbyUkataCeobH8nPHohTWE+Bfj7k5wcEhoQyBRP
 15PnZhmh2ZogH2Ig5TGKEwkt8vRJKTorctkeQXqDH185QIkertWNKKyfnBiQuH2yg/
 wDpzkshWfHQqA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lvQKS1lO
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-waipu: bump version to
 21.11.2-Omega
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

On 14/06/2025 15:43, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
