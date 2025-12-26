Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F37E8FDA7
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 10:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B81B98169A;
	Fri, 26 Dec 2025 10:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AlhIWNnats6i; Fri, 26 Dec 2025 10:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEA8F814D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766745838;
	bh=yyWEu7iQG0jHBkIujXGLL8SZinE1IozmE6qji/Wm9Vw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Qno0eAY8wqUAcQx8CcFPYlkriPA62QJ9Lop6vm47P64fg9rXbklAiQwKeSVmZCobk
	 4jkgsRxwJungPc+SA9wDOt6OGKv8Jc0J8FpdZnoggaZdsbudcraXmULMywQhQf8ZAx
	 PnZND23zrZUhmlozqfzm8jFLAew4dkGTlAUqi4zQjwjnCYu+jRFHyXoe6VUmEMXFkL
	 C/fz9llMpPr6+UqyJOr57dHZvkqnuonTPKEJQ7YZyWgoppJNhiUTr0E+OuMhLZt3j5
	 5CQsQd9/T5hbJG8nqH23xdBc9h6rPaFsgBEkjHE6ekJLoO17ytSrFKYfLcdNn4byMN
	 FAT0cA1+SrCBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEA8F814D3;
	Fri, 26 Dec 2025 10:43:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F9F0B9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 10:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9171740920
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 10:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JBUNmnbKRi4r for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 10:43:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D812B4091A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D812B4091A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D812B4091A
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 10:43:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 39E9DB00548;
 Fri, 26 Dec 2025 11:43:52 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Dec 2025 11:43:52 +0100
MIME-Version: 1.0
Date: Fri, 26 Dec 2025 11:43:52 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251224195935.4089179-2-giulio.benetti@benettiengineering.com>
References: <20251224195935.4089179-1-giulio.benetti@benettiengineering.com>
 <20251224195935.4089179-2-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <7dded3f913d313f0a9a846a671e4c773@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766745833;
 bh=xDro8qEqQ3ub3QKU5TTh3ZH1KoIV68/mNsCDRBu1aJQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sX8O71qHYJFcBoRdtiJHuMouAE7MXMSp7DJ4KTTY1ZJi1StlhgS7Zazt1Hoj0FOff
 IlZcuj8TudiVejYDRDMe9ReAoTIp8Whc8zGovxFq53EQe4zXXQDKUqB0eCapL3VJ9W
 utgBhL6fAyGxQWWj3aHJrLuTTL6cLf2AVkQQ1dbDLrv/9cY9rIkIQMreb4Frr/atVQ
 K2n87Zby5dCYOTpr7YSwBGFVXGKcB+lykj6lgS5EBl8oPmor8z9fEuHi9yVf6eyjP1
 35wf071d5T7sQWyFOLRzerlZsq0TdJtd4YpbAfL6DzNyWNBEvqZq/RhXozxfZxxPfz
 5KRuKdUzwyYNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=sX8O71qH
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to package
 util-linux
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

On 24/12/2025 20:59, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
