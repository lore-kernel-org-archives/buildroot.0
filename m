Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80519C4452B
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 19:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C7F880C2A;
	Tue, 21 Jul 2026 19:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DO6e9nza9LC1; Tue, 21 Jul 2026 19:41:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B44880CA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784662888;
	bh=gG/H9z1mPSbXT3xt1nKUPEspCPLE+Fctqd3/Y5tYKtY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BCgtmkWPLAGUPG7/3OeMKzLSPD7nMhGx9X6agVcwNHXwthwTJZZqLWqP9ChEC5H4f
	 XE4ApfG8XO3m3iVVAfhbqD62Oy33OJSPnpyTvcG9s7efyXBUtQo2O+CecKCA7XXJ3h
	 ZXz1cGzHgUO5lHn8HDLfUDH7y5rVofEgVKoKigfS9tW2+2tSC7ADSz23hBC3jFgGOB
	 36kZcFxRvtqZxmlx/tg3lHyvnkUrEZyNhNCnA93kOYxq5xAy06Fk2blhV3pFkcDz7k
	 v36twSR5dzEPU5+ebqy5fCmf0RFc057arA/2R7QFGkaJAMVjnAXoLPESk0mi7MhVd6
	 7xoe3c7hhwxiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B44880CA9;
	Tue, 21 Jul 2026 19:41:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A3AB442A
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89C1E40434
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6eUYXy_bC_V for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 19:41:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E25564036A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E25564036A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E25564036A
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:41:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E34FCB00539;
 Tue, 21 Jul 2026 21:41:18 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Jul 2026 21:41:18 +0200
MIME-Version: 1.0
Date: Tue, 21 Jul 2026 21:41:18 +0200
To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org, Shubham Chakraborty
 <chakrabortyshubham66@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260720211748.66658-1-petr.vorel@gmail.com>
References: <20260720211748.66658-1-petr.vorel@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <560d5e210e7693013602360d727d95f3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784662882;
 bh=798K7bY0O/mczqQqiXL/pl5X/wYJWik0PFUqS7CxQKc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uOosVAfTnZu+SvNNNohaacOda0ydeQsUfJ7XckSKktyC0uOfZbVB6HI+TEHkE4A9k
 MAeGfQBDhnSS7xGWTV0e9b2LHLXY+ioQH8Yfq0+bNKS43Efm10aTPFzPONH8RZDUMc
 gui3K5hdaPDdzF4ficctf8H0Qh3xrTvhPpyGQ4hH3M4EK2EMUS4SAxpYPIMjcYNK94
 hl/ZlVbVOZNdiwEng+nnDH8vaByFxGufKSAPjcRLuU6HKOYgD/bGZuZ9ZoHtwVVlF8
 DYT825MBxiuXyBae3ZrJVdWHGlQaSCZJQdL3Vi3f8aekabQLbr8nmgi9aWAEhRrDqb
 uQ+j2ALP/Qefw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=uOosVAfT
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 7.1.0
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

On 20/07/2026 23:17, Petr Vorel wrote:
> For release announce, see:
> https://lore.kernel.org/netdev/20260615160636.412a064e@phoenix.local/
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
