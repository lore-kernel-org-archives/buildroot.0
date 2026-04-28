Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5716FF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 18:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 998F6410A7;
	Tue, 28 Apr 2026 18:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFIKeQlViRI7; Tue, 28 Apr 2026 18:47:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5C57410BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777402056;
	bh=bvS8SuI46XklWBHdRyYoeAp79cJfS4Sp3WO7+iNpMJI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FhS/NUQ8ZCrfwEQiOOOwKukR2XYO4GRCdertRqsyD43uZO6CuBiGeatA587CcNk3m
	 R8HepgwXGZ6jqEK8CY/WBX47IOmPy7vsCGP0+G/876l5fV6FB+aVKJBZwPNhSdeIDz
	 sOHdKcmB+FPOakqkXUlEAHwAYtCgmHSEYG+VT1VU534GXixzDF6oCxFczo9UQcCFSk
	 NoW9YH0rvADzzFSfFXfPS4XIv+cKsKZVexNv2GtBoEnfhIlwfmmq/8/HPgYajkM/42
	 Wg6Gqfw3OWCIsIL+CtFpxMWJMZ5eriHoRi/R2Nem9svq4P69PK8RwvCSE9w9HlhDL1
	 Z8r+i4M1U8+sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5C57410BD;
	Tue, 28 Apr 2026 18:47:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 557391B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B68282228
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:47:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dqKv65TJTJTE for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 18:47:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3570F8221E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3570F8221E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3570F8221E
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:47:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 1E238B0056A;
 Tue, 28 Apr 2026 20:47:30 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Apr 2026 20:47:30 +0200
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 20:47:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Chris Packham <judge.packham@gmail.com>
In-Reply-To: <20260426140430.1467435-1-bernd@kuhls.net>
References: <20260426140430.1467435-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <9acc5672b57f8ce65e276ce4e2e41a61@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777402052;
 bh=Xawkts+ZIyC4g0QuTWP/tq8/FNLu3IoOZiHIHGgkFOI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sNcePsJcLPSdGYm1r5vptkvbGx6zj+S0YN+NbRh5HfNgP+v6FcTxMK9vs6WJ6UMTr
 0Q5jlyKHcGWX96OSfmehsdyxh5WVQYGYUaxmoQ2gtOlXgPuXHl9Gb7Lcuio7x8Btll
 jx5Ksg21gnDC2La2SD5r+XGV81PMiC/g2D83PiNn3J760Kzt8zHtTMH97tI8hfkUpQ
 JLw0fc31A174tIe+EDtfHqTdExKVjPlOLHg3VFaH6IuQpjI22KqdSM4K9SaAPb6ArS
 zmr6dcv3qcnS8oSSZsKG1nEoJilWlWjSzVuu0mw95XMCt2lGKwOw0h6xi+OjkuYhHj
 aZsANlE876HNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sNcePsJc
Subject: Re: [Buildroot] [PATCH 1/1] package/syslog-ng: bump version to
 4.11.0
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

On 26/04/2026 16:04, Bernd Kuhls wrote:
> https://github.com/syslog-ng/syslog-ng/blob/syslog-ng-4.11.0/NEWS.md
> 
> Added sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
