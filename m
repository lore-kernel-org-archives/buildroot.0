Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FA4CAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55E9C4120A;
	Tue, 16 Sep 2025 20:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0zJLLknzaFGu; Tue, 16 Sep 2025 20:18:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 861A241206
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 861A241206;
	Tue, 16 Sep 2025 20:18:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10FCC199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01EF241206
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cj161w1gOOMU for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:18:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33C364059E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33C364059E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33C364059E
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:18:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 57A0020039E;
 Tue, 16 Sep 2025 22:18:22 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 16 Sep 2025 22:18:22 +0200
MIME-Version: 1.0
Date: Tue, 16 Sep 2025 22:18:22 +0200
To: Saeed Kazemi <kazemi.ms@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250915140623.3308484-1-kazemi.ms@gmail.com>
References: <20250915140623.3308484-1-kazemi.ms@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ce5bfeea8f58707520672451e990308a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758053903;
 bh=OzmDw3bBEemfSgtnD3KPbf72GBhqTwa3I6gpxj7uzys=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rHSlI1KytuPehKZfxRFLuPR0CgnZICzM9Tg7DowxFEcyIbeoe93U52cQNabvKG4VA
 hNKkOgPJJsTkRQ97jrv52jg7vX5BWUqZuAtaFDavlDnJW6mI3BgtYji9MejmVxCxzx
 u2+PWosdf21zR26WSyiyUMT38tH1fUdHfiIa7RKrDbW9IgHkmmhq3/cV9lgkoDoh4O
 iEWM/iB1QF/dp3OvYxTdkbpgILDMwRIZ3uPitouN/TU9y8lM8j6C00knOhwjoESYjk
 Bx+Xbc5CebMHBLME1IYRtsTO/2jpiA7uy5dGREPnRYIFx5ECpXxT8S0hAdoVLgeZrL
 KI52DXcQCWsPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=rHSlI1Ky
Subject: Re: [Buildroot] [PATCH 1/1] package/eza: bump to version 0.23.3
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

On 15/09/2025 16:06, Saeed Kazemi wrote:
> Release notes:
> https://github.com/eza-community/eza/releases/tag/v0.23.3
> 
> Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
