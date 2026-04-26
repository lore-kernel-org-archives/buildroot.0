Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC1AFF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 18:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A2A784DF8;
	Sun, 26 Apr 2026 18:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3GtrBzAI4m7o; Sun, 26 Apr 2026 18:56:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0706C84B5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777229813;
	bh=PRNVytTX48y06VZRKgulwDSivkEXMYjvJ0JGAePHu+k=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n+7LV+YnKRxf0/rPCNZ9x3sNJuSPLLQjP2jOjaFtaCB1sadXtbUfJY4PSS9Fj6MDT
	 gEXa1P7mKzyVpL26B8le7uJ7TJTBJreQjEhvKybvZBbGaHoXr7X8a2fU48oix2PWXr
	 wMVOEXclDcA3/EQ4KqkD4izArB0jpCLXNi58/mt3xG9aqmA10my1/5lCdR1k2m5QBM
	 KpyrIrULwma7ur0Rcnzdi9CRv2xWBHPZ5Xsc8lwsIDYZ7MISZtaaYaIYN0PhYMdlqv
	 mv2Lpad19BYAuRI6JYmmnyrQ+giVrs+Ae5HWvlZO35AniI0y0PvTUFN8CxNBd+GrIZ
	 GRlcN1N9Tqtgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0706C84B5D;
	Sun, 26 Apr 2026 18:56:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47E8C231
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 18:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D36184B5D
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 18:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wMZm0tb7CKEX for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 18:56:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5BF1B84AEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BF1B84AEA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BF1B84AEA
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 18:56:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8185B19F593;
 Sun, 26 Apr 2026 20:56:46 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Apr 2026 20:56:46 +0200
MIME-Version: 1.0
Date: Sun, 26 Apr 2026 20:56:46 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260426144339.1530435-1-bernd@kuhls.net>
References: <20260426144339.1530435-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <609d5e6ef50dc5aa4e695d0740577131@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777229807;
 bh=ZgcVCe+QF38XPPqvhTArCV7WzmIblUXCTM0wpFxSSg8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WA5Lr138nTSZKS9vWNnmxDzZQ43P4g36uzULLReIVBc8xNkqYt0+2FVqmjX9YubXu
 MQRLo0VwQdwjDlIZaHNtnfFcDYlC9I9Gdun1mLp0ToASXiYaVEbwDR2fSBh6H7k2j8
 kkPhlJsi1ZFmVvvSYT6MKkCrtIebQ7vlRzcFjRBgn939mCNaboXmyBnK/jNRVNxXAt
 GBxkKHQGEd0IiR9tkLS0MOZ2EfIChuaTfsO6zm7gnabW4YgYQsli9x4qu7l1MfpIBN
 fZxi8ek01D1EytQdbDGUnUJZk0ByNSfb9kwUYntRB6cey6iirjYXEXi5dAjz59dHwS
 kCeNyc6OCR4gQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WA5Lr138
Subject: Re: [Buildroot] [PATCH 1/1] package/sudo: bump version to 1.9.17p2
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

On 26/04/2026 16:43, Bernd Kuhls wrote:
> https://github.com/sudo-project/sudo/blob/v1.9.17p2/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
