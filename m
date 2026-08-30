Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DEAC61DB9
	for <buildroot@archiver.kernel.org>; Sun, 30 Aug 2026 03:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 535984065C;
	Sun, 30 Aug 2026 03:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7-MfJtD7Dt9; Sun, 30 Aug 2026 03:53:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788061980;
	bh=o4Jb+RufNCGn0MbUiTdtI9Xni8UJYbZHcVO+wbR6rOk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YSR1Is8hRVSY9tV7xak1zI1ugNzHEHsFjVBelyDUukXDRQp2THO0K4yUsa4XNJjFU
	 6W9+LDB8NDd2781PmTLMGYMttY6Y5zjboF4B+D5nLirmvB3PWGlm9Ok1HwxAVPMmE9
	 hqguWSgZFl4PgungBXjh81DJ5wYiyz8HnWdKcso+BJlQF0+/nJ/j7unMO7CoIemqUx
	 0qLMxr5FOha5L0qIQ+R7zQ/xv9vFuh4X1SyEQnfMY2bDU5ODKn10TZc9RqS6NpPdRV
	 nIzsr1ZHhZMQ1epjieiYJ1HdvDVXUDwn6dcw0tcg36237CUQHylSMQm8WV7YQ95t9u
	 oRE1jYeby6qKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2484E4061E;
	Sun, 30 Aug 2026 03:53:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C77A2FD
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 03:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EA9F40098
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 03:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EX-l62BS4712 for <buildroot@buildroot.org>;
 Sun, 30 Aug 2026 03:52:58 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=meIiedzc
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 133F440050
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 03:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1788061972; bh=42j4zkuj6N+MbTRQjeQoPrKVuphKd2Olr9PreAZsQJc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=meIiedzcP5BS3QBg0p6Q36euX6Itu/SoJvYXJ5b60b/Itf1txnwemen0t1eM12IoQ
 NqdwZV/DX0Q3bSGRu9bUokayjrdv+G0T+Qha6NUUHrU56r+wsATAlhMe1hpRnGjeiA
 7h+A98/vpIQ8DRny/x61LGBhO2Mlch9IcxLjHT3k=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id CF250BDE162D;
 Sun, 30 Aug 2026 05:52:52 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 30 Aug 2026 03:52:52 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot List <buildroot@buildroot.org>
In-Reply-To: <20260828194058.2405217-3-thomas.petazzoni@bootlin.com>
References: <20260828194058.2405217-1-thomas.petazzoni@bootlin.com>
 <20260828194058.2405217-3-thomas.petazzoni@bootlin.com>
Message-ID: <5c1cc121914f27cb08f135667fdae1e9@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH v3 2/2] package/libnfs: bump version to 7.0.1
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


On 2026-08-28 19:40, Thomas Petazzoni wrote:
> From: Andreas Ziegler <br025@umbiko.net>
> 
> Change log:
> https://github.com/sahlberg/libnfs/compare/libnfs-6.0.2...libnfs-7.0.1
> 
> All patches are dropped as they are all included in 7.0.1.
> 
> Signed-off-by: Andreas Ziegler <br025@umbiko.net>
> [Thomas: bump to 7.0.1]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Andreas Ziegler <br025@umbiko.net>
---
Tested on aarch64 (build, run)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
