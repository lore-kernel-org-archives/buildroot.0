Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69167CCF9E5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 22:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4038583CB8;
	Sun, 26 Oct 2025 22:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMmdyX41hPUo; Sun, 26 Oct 2025 22:38:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B96083CC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B96083CC5;
	Sun, 26 Oct 2025 22:38:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EF8325B
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 22:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 508FB610DC
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 22:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKtTQptEFlOp for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 22:38:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 62678610DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62678610DA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62678610DA
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 22:38:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2CDDF5FFB1;
 Sun, 26 Oct 2025 23:38:38 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Oct 2025 23:38:38 +0100
MIME-Version: 1.0
Date: Sun, 26 Oct 2025 23:38:38 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>
In-Reply-To: <20251026180620.1253575-1-dario.binacchi@amarulasolutions.com>
References: <20251026180620.1253575-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ee31a3678a4eb93e7af5cc0a207b11c5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761518320;
 bh=qQ9OXtPHznjdZeDctyRUo+DbOedNa8gBZzpZ8Qqvb2Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=siqn0DYP80anwj6N8HPhlpcp7oAS5I1J0uIOANQNIt3/llhX/4lr63rUZCdSmL1fX
 G76MAq5dBdxqzAD+P6HC4Qtcv7aCeeut1ZcW+wcuwlSvRzEvWmxZ4nBg4QXEaxODON
 Mj/S6eElqxGM1MkqWQdsrfCdw0LpIjJdsaiCXphIkvMV/P0725glp4SnPCLhHS5Rym
 ZATYdeiGl5DXd3qAKoWthr3MDASnBfR7jA0RlAS4sH+sIlpjtVnfZ9Rdf3zxar13gS
 ed3xJvG5KBxWrMjus0NXAQKF06kY1RPGK/K+D+P4fgQ9S7aCpVGUuEpWj3TAVedCyD
 Ho6GZpoEkdcaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=siqn0DYP
Subject: Re: [Buildroot] [PATCH] package/atop: bump to version 2.12.1
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

On 26/10/2025 19:06, Dario Binacchi wrote:
> Release notes:
> https://www.atoptool.nl/downloadatop.php
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
