Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6D4C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 20:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC05E82B1B;
	Fri, 24 Jan 2025 20:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OJNElcCUo0C; Fri, 24 Jan 2025 20:16:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18C8982B1E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18C8982B1E;
	Fri, 24 Jan 2025 20:16:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D77EF94A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C285640B9B
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:16:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yLlT0TmAL2LA for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 20:16:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65E1240A45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65E1240A45
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65E1240A45
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:16:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2EFEF19F5A7;
 Fri, 24 Jan 2025 21:15:59 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51920])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Jan 2025 21:15:59 +0100
MIME-Version: 1.0
Date: Fri, 24 Jan 2025 21:15:59 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Kadambini Nema <kadambini.nema@gmail.com>
In-Reply-To: <20250121074056.18087-1-nemaakhilesh@gmail.com>
References: <20250121074056.18087-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <1b305fe082f3307947e39a5f26ff92a9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737749762;
 bh=5lPJldiYwHEZG76kRqQVdbIEgtrYjje/kgurPMRk9II=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cNyOBC9G3p5nM/Im/zWi0JdBlx0dbBdVYHMMTHVpCYtX9rooLIRJ5b7DogSh9mZLd
 2QkDEVQyTLu2RdchW50XsrymlMqf1ZHBd4W0oG1fN+whbhCkZONm2+a0SdHg//k06R
 4cMG8ZsLSs+WXaEzSS/EZD3PD3Hyeg92Jt2/6eQzI58lIKKLb520z75kXTb0MHtpP+
 YyHIotCHqyvuaj5m4LdDjRrh0cx8bx8GO2S7xmtc1nZc5g9HKMGR6KdzIakaQS9RvS
 Ka0HhAPIJePeO3xbKbd3iMSYKgZOJHC53fJkVDMj/tdt/9+5kN7++jgS1g2NH6QvVq
 nlRHnpbKw56WA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cNyOBC9G
Subject: Re: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.27
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

On 21/01/2025 08:40, Akhilesh Nema wrote:
> Changelog - https://github.com/pikvm/ustreamer/compare/v6.22...v6.27
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
