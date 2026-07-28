Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247A1C54F54
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 19:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B856460A35;
	Tue, 28 Jul 2026 19:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfIr3MZKugtw; Tue, 28 Jul 2026 19:17:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7229D60901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785266227;
	bh=QFisElpZ/wjwPmerxW37+OFRqnv8dXlR9eQUHhBaLVg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S24KbU/WDZbYrq7ihHnYJ89rOA8MAAeLO6He1c/EUZZXoVCqPL1iBUR/zMBcYSH4W
	 +nigjhZ5mjYyA070Xolg04Ej/FUNR4F3Q7g8HFlNyFRwiXjGq6DfmeXzszReazFPGG
	 t1ZKrq3xwZIZkyHR5yZFQ1jTuYXTnwCjHc5xe355TroX99PB6Nl1Noe2f/J2W5Fed8
	 ZeErSQk3j6HIy85F5dYpM0bC9yOrPcGab5PVnRFE7RhU+kG5HjZbj0gkO3qnWJu1Un
	 SdMPUUvOcdsAtKvRyRx6H8RL/m5E7y2TMo7hKZ+KtwIwQHPfA6lCSj8SS3c+ChI/Q7
	 UwFgj34pIsbDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7229D60901;
	Tue, 28 Jul 2026 19:17:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AFACE4BF
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 19:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1B05409CF
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 19:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JgpbbUPTNqPe for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 19:17:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 56925406FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56925406FC
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56925406FC
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 19:17:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1340019F57E;
 Tue, 28 Jul 2026 21:17:00 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Jul 2026 21:17:00 +0200
MIME-Version: 1.0
Date: Tue, 28 Jul 2026 21:17:00 +0200
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20260727073943.77167-1-fido_max@inbox.ru>
References: <20260727073943.77167-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.17
Message-ID: <5bd48798207210eca4d4bef13127a7eb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785266222;
 bh=HtvqP30rhMR5lPzUYuWQMKf/ShT2SmpHd/uPEI2I8n4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Xs5odOP5aIEbeN29v1uA89hpHjqa2y2kWxqm6O90eCTs7WFwfTuUhZi1infNP56xZ
 24aKxdNEzhCZxZFIpzwohyILOZ/pMqhcsu2HNCQJgyzQch/DvG42+ElTbHZ86frCSa
 reH9ER1ybG0Eg3wfkvJY6d8HYBKrO7zqa5Ux68G1sFIDQoD3jTByxNRLh0sQG9mt9a
 KTOKi8TQ0psD5cJ22wPfnQ2okohgguHUPyJb0v9s7wjM+oXWywn+CFcauqarUOmfDb
 zc5viu1ouOsHmQXgk9PycVdmTaDvoQ91+ZM6iqloCUFeN3XJR0mc9ZQvwCLOlFjmr0
 lsmtk+nu0dPQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Xs5odOP5
Subject: Re: [Buildroot] [PATCH 1/1] package/osm2pgsql: bump version to 2.3.1
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

On 27/07/2026 09:39, Maxim Kochetkov via buildroot wrote:
> Release-notes, since 2.2.0:
> https://github.com/osm2pgsql-dev/osm2pgsql/releases/tag/2.3.0
> https://github.com/osm2pgsql-dev/osm2pgsql/releases/tag/2.3.1
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
