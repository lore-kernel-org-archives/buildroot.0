Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107E8FC9ED3
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 10:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF48881C0A;
	Sat,  7 Mar 2026 10:08:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CvFEBnQ49H4T; Sat,  7 Mar 2026 10:08:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3BFB81E43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772878099;
	bh=DWbfcblU3Vyco5DJngkvNHgIbcm341SeGToQa4dXuDQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Il/RIomVIWixvzTeQVig6y5Ab9zSA3s6Q/gyHg3SbMu2s5MF7R03ygeW/Ve6L0CL5
	 uWtqEpZbaaAgNRBdDOtay5lHvn+MtvmoJlIXaUgXTqsoj9SX6whHXsDlzlNcW3VviE
	 4pZkwaBzRi8AoJtx5Wmcasfh4hbD1IJY8xxdNOw7q5m4UNovdz67/MYAcRZTAYDxdN
	 24BZwNVZ/EJzqXib1cIjfUUMen0+qfyGsx6OF7xO+u8VrYF7UFmYWm1gI6OT9jyo0b
	 s/vB0v95on9efgO2c1Zar1/744DkGUvurn4FB/mlrazk1ncAd9yVqQyzGzBqcB2h3L
	 RNtDMYxFazu6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3BFB81E43;
	Sat,  7 Mar 2026 10:08:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E562A169
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB605418E4
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKy0EP_3ZH3p for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 10:08:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C8788418DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8788418DA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8788418DA
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:08:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id AD567B00548;
 Sat,  7 Mar 2026 11:08:12 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 11:08:11 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 11:08:11 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260304175602.3663816-1-james.hilliard1@gmail.com>
References: <20260304175602.3663816-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <2f53cf2ad1fcfef591995c201c8e946b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772878093;
 bh=yzmbsB9edzKDqXoSqc0lsn62wiCu7J1zBs69eEf8evQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QQB3IRCrgizpRd9Jo3zaCGEGBJ8FzQSMDJv+xl92+hb+kmDIR0wktNcaLZJfmkkKU
 s8XwGhDehI4GpQemoRHxaR8R8bhrHHTrkrrlvSOLQqpnLZfbwh+XNa/C+/x1Iprnsv
 enkyCZYFzBDPu6WNaLm09oyAiltBH2QngkgzXuKWLA6u8G1xuHR+cmAUNh2UIEUwSR
 5ed19mODqqkYMlxcAHOsVaTvWiY62I59SFV5AHbCSHwALSmuwIARAxjb+3VzocyA+H
 l1X5tVwIsgN+u0djxwQjAedTMUf/P6MmF3MKaYQd8t9OXOYCA/Lhr3t8YSo+g6x/Ep
 OyNHCa0Rg/8cQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QQB3IRCr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to
 version 82.0.0
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

On 04/03/2026 18:56, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
