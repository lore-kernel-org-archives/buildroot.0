Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCD2FF885A
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 18:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D440C83DA6;
	Tue, 28 Apr 2026 18:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h8JtH3Eva5o5; Tue, 28 Apr 2026 18:31:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A55783D9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777401093;
	bh=9U8oltCfTw6CJYilEPMKmpEzGooUyNMBDd99Wl9R4Do=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fqDRY8CddGfqoTe8dnOm8rlpOQQMFTE0MLBC/vJ4+AAqXarDaPUtBoLqr4GA8ZMTs
	 jMnjqwtDiVI7YQrHLXZOSNPWj78MMfCZgv05cWa+nQqsZr3mwD/cfC//vDmc8c3cln
	 hFSquFblPadlm7Iwgrlz7Nl5/oseiBZzeLhJH7ntDIUGfqkD14jjfY6wpILucHSsmN
	 2xDlmGM8kkpvhzGEZIFfL4uHVKrGiujXIIe2sZ2g3FlhIq0o1T8hGMksegQLmQkDB6
	 cc0VOuU9SAj2SvJbZe5dPuLu2EHukIGjw2qCXt3xkvwaLe8nWmhsc7F0JEqIEzxRmS
	 rLlSdvplJbISg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A55783D9F;
	Tue, 28 Apr 2026 18:31:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EEEA231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0060D83D9F
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9IylCEsXDBv for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 18:31:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B77E483D9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B77E483D9D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B77E483D9D
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:31:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id EFFC219F5AF;
 Tue, 28 Apr 2026 20:31:22 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Apr 2026 20:31:22 +0200
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 20:31:22 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260425080833.786167-1-bernd@kuhls.net>
References: <20260425080833.786167-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <4c34105fbed0778b76589a9962111181@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777401084;
 bh=LajDgbR2nKztc68M2E87EC0F/wdKkG6Wggc1Jz9hZmk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NSfZcAc79seY3L/5WSYVn4bA9zziq2/q3HArXyksXbZeNZYG7eLJhb3vZMwjefeQ6
 W9xIj1NVwst3NrSN2AjULhVJpDdQk0Wroev/cm0k0L7xhitMzFm0roV/dH6PVAWwKA
 OPx4xfk+yd9NGP34l1zIINP2ql2cYr9MEQEedtiFGRm6vPv6VGkbK70xQ7WxjArp9S
 nNDGZAGT3iLY5a1/2dfUIhAeB3VVm9LNsA0nyLLd48j5mEzd1faDe1KNJcZ8QnNH5M
 cQnTJIXFUxxSlrmwtUxiR8Ay9WgGHlLuk9F8r5W2vGOoHEZBMnS9kettLxdmaCT0va
 yKolueGzacUCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NSfZcAc7
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.24.1
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

On 25/04/2026 10:08, Bernd Kuhls wrote:
> https://www.samba.org/samba/history/samba-4.24.1.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
