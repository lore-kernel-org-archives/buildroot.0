Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B279D3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 14:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BB2C60B09;
	Mon, 29 Dec 2025 14:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cVX4qeI68tDP; Mon, 29 Dec 2025 14:55:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFE69606A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767020159;
	bh=IfvmVQvNf+/OkwHAK68bqIlhEclVPB0d49YdK1/TpFE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OK4pKVNgqveggNsfh1ULrbG6+ieT7Fvo2He+D5SrCS2afVtOQK5HkAQIrIwxxeCJ2
	 YAm8y5CFBO7hf2IrqZoFQzbXaNlTRpXX2ME734Giv2SpMGo6HyHBFu6pwBlyMLk70B
	 D6yYn1XJHFGdA0rmvAK3IRZnBJLn7QPIs7m3LW0r06xdtGRcHcHEoc4/DTckvp1Sw7
	 lOu6t/vjLi3ltAD8dcTTFkqiwx6kf5pPmnliN6G9O31mhzQaKmJQb+81/3kMAYF2es
	 j0MOKTgKb9KSm0spSjN++g+Ved2uNaDuADw3DbxZ5mT0pPXIgextJHpLF8HM3yBBz2
	 Gj59pXJ0pFQaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFE69606A8;
	Mon, 29 Dec 2025 14:55:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12770177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04B9140259
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DdHqWhSBH7sj for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 14:55:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 99BAD40102
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99BAD40102
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99BAD40102
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:55:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9BA2719F5C3;
 Mon, 29 Dec 2025 15:55:53 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 29 Dec 2025 15:55:53 +0100
MIME-Version: 1.0
Date: Mon, 29 Dec 2025 15:55:53 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251229075844.525115-1-bernd@kuhls.net>
References: <20251229075844.525115-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <1edd3011e5eb8895f0b26271e2608f26@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767020154;
 bh=Guh2re4BLKG9VfpH1pVwIVm5T1UWnwrWV1iZGj48cqI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X7RLE5ZN5P9jUhDZ7l3QLTI9A2w33inQ1edTD7Isz8arZlHm/jTsm2zWdBszyIgyM
 +3U+IP7sjJxUigdYzdcVbRzNBROJAlzZwVJ69CXTyuedCS66ES9AHsLktmfDC1ROBe
 rWKssDBBZndTzM+sbo5PVJMWUQin+PaYWvaqwrWY1WjYRtErlnSXqG5xM7XqjitHB2
 ZS36I10/qEJmSbYbEEXxQahuUwwq0xQ2RlpyQukhyceUGtlxluQc3ccIRLI2pDbbAW
 Q+ecOP3P7439u3ctMn4Y0WE0homjjGHRKW/rMuLnzS+cIt9JOE2RSUZ4JKJdAhkMA6
 lGF5P4EV6zkjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X7RLE5ZN
Subject: Re: [Buildroot] [PATCH 1/1] package/mpg123: bump version to 1.33.4
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

On 29/12/2025 08:58, Bernd Kuhls wrote:
> Release notes: https://www.mpg123.org/cgi-bin/news.cgi
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
