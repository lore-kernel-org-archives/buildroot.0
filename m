Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C3AE63F07
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 17:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9C3C81757;
	Sun, 15 Feb 2026 17:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJBSBORQPwIo; Sun, 15 Feb 2026 17:06:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8D1181205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771175187;
	bh=SkTyaF5lWjkW1tlNd3i+AXyLvlKlFE9kVHmknbzX2Yg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hIx/U5VgkWhxVHsQVf7efibMlBtZ/TxRQPnoiGZWM7NRV2nBEADqVKlruL19v7Bfc
	 JbLL9rls55mw6Ye1v6+fq5rvD5ckmwzyl58595ZlDzvxDIfi2D7pjSEJwY4cCb3Sdv
	 Ccw5eBtifWRJSSztcWmcttKsXonzw/vh5n3Ggy0DLuPAso89kz5mXiYw4FdCnolqS5
	 helbA6GoULkHyMTcyIZCginagV5nxnRCjGlxYbMeYCX0DZ3Xf9RwA/M/voA6T6txku
	 MHbhqJu8ScJm4bSKL32qrIcbmocdneKrFbuu7Q1LaQpUmsbx9wyh+aOGTfKvySWCed
	 slRjcpwMp94gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8D1181205;
	Sun, 15 Feb 2026 17:06:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C0EC135B
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 17:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADEC281116
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 17:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8npdlEAr6AG for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 17:06:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4174380EA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4174380EA9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4174380EA9
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 17:06:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 3F5996012D;
 Sun, 15 Feb 2026 18:06:20 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Feb 2026 18:06:20 +0100
MIME-Version: 1.0
Date: Sun, 15 Feb 2026 18:06:20 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260215141716.34571-1-thomas.perale@mind.be>
References: <20260215141716.34571-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.13
Message-ID: <e1330a79f0e0a88c66011f31be9f5bb8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771175181;
 bh=1EJIfp989IFISZHP1ulltVCYIVCdawqFj0pa7Lqh3hM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SrkxBC7EPoliOZozuJHR9IP1jPQBD0rNz7SsD4y/aw7J6bbgRnC8LHbEvM/aNUYL9
 e7noWLovtEUiq3OL7QoIWTthykItqgdwlluSiWUR9Iw/+lmwWRyP2deztzuZE6CUWl
 Q0hqod9JQNu6GgVCExSiE2VBiHnrjmN1NzMU/I38Noz0+LnjaEaoQCColuQEHkq37D
 RbObsmJ6wGiCoAZMl4s55bbmu2yyTabNvMnkJkOmKaaBkZ51LKr06rRfps7mq1wWDI
 sT8+lCeHvYmPFrHc89gW41gwqvK1jEP7O6vqdfvFilJBB2h+gHJP0sJeQOJQKRT7GK
 VGRBqWLBQodlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SrkxBC7E
Subject: Re: [Buildroot] [PATCH 1/1] package/busybox: patch CVE-2025-60876
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

On 15/02/2026 15:17, Thomas Perale via buildroot wrote:
> This commit fixes the following vulenerability:
> 
> - CVE-2025-60876:
>     BusyBox wget thru 1.3.7 accepted raw CR (0x0D)/LF (0x0A) and other 
> C0
>     control bytes in the HTTP request-target (path/query), allowing the
>     request line to be split and attacker-controlled headers to be
>     injected. To preserve the HTTP/1.1 request-line shape METHOD SP
>     request-target SP HTTP/1.1, a raw space (0x20) in the 
> request-target
>     must also be rejected (clients should use %20).
> 
> For more information, see:
>     - https://www.cve.org/CVERecord?id=CVE-2025-60876
>     - 
> https://lists.busybox.net/pipermail/busybox/2025-November/091840.html
>     - 
> https://sources.debian.org/data/main/b/busybox/1%3A1.37.0-10/debian/patches/wget-disallow-control-chars-in-URLs-CVE-2025-60876.patch
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
