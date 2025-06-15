Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A74C71150
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 11:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B34440651;
	Sun, 15 Jun 2025 11:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eRxv_odQ_avk; Sun, 15 Jun 2025 11:16:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B5CE40663
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B5CE40663;
	Sun, 15 Jun 2025 11:16:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87BA91A4
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 11:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7990D80C06
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 11:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2s-dUgrjmD0V for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 11:16:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B390A80BFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B390A80BFA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B390A80BFA
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 11:16:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 0E2D0B0055A;
 Sun, 15 Jun 2025 13:16:54 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 13:16:54 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 13:16:54 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250614134521.683897-1-bernd@kuhls.net>
References: <20250614134521.683897-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <8f25c1c115a6c3114234c66bdb7d338a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749986216;
 bh=Y3zg1RXuXH9Bnrjm0jyWi9ooS87v18gNEqjb0r+DXmo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JekO+BoNoaoFfwbFF/+A3Kh1ioXGKbWMZ83EtHRQRkm9V+GnS08GmyDc3egubvpbE
 rR38eDYhBybZBohRaqBKfSrE2e06qq1IeIRzrGM70SJE8A1y1sjqN5jkptZ5rHYAX9
 QOYI+pFJubjwyjZ0x3HsVm/CEbxppySbLHehVObK+3q6biDMOWULr2QbXuTrJ75Cds
 OHUn7DLGv/FKcqgqfIP8gbdtQB5MDPOqvyaPPeTN+IbfSMkEEO2mBEF/nO9Nkg/Hf4
 GdxMVAaWs163Nd2beQSrokLIa4/DlEzbgWHS/iWmpJCH5a6piShwz7e32NTU9CcO/R
 rXUcfI+f29/fw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JekO+BoN
Subject: Re: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.22.3
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

On 14/06/2025 15:45, Bernd Kuhls wrote:
> Changelog: https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
