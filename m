Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D995CF99C60
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 19:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3A9E81EB8;
	Fri, 17 Apr 2026 19:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j66bsOeF_cgs; Fri, 17 Apr 2026 19:58:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3D1681EAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776455907;
	bh=PUN3/6azUAQBRxl5ip1AYsFy4clMMlw+fA3+I+75BCw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SahX9JFDTUOnnNScfvx9jobPyBgWasoemAOS6RU35BOsU/e5b8Z52e/UU2TCLFwHM
	 keSj2RJjhdBGWtbgwQMZ69sPw7Qz7BqqDxok/ucmIyyGuHFEZigg5uJEK9XNA90Yj6
	 +/xL7a1zYqPOoIbiAGDqBIw/eSeAYQG0swsUUNsobdZzGz2wo3Tze+y2wR7qeSDssF
	 ofeSPfO0svDup2YMXfte4+0h9Ku390WXih5rBKK5UahMphVvw7o1hrxvcDvCVTjb9P
	 PMbQKW+FTsnIjKNhlhGCUm2rzyxr5P1upnHvTaWJ1Fm9Rygb67PDArtj2myzsX+lTL
	 rnpvNhwKet02Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3D1681EAA;
	Fri, 17 Apr 2026 19:58:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13413396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 19:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04CFF40F77
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 19:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dqcR-GM6q3K8 for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 19:58:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E239240F82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E239240F82
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E239240F82
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 19:58:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F23695FFAA;
 Fri, 17 Apr 2026 21:58:19 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 17 Apr 2026 21:58:19 +0200
MIME-Version: 1.0
Date: Fri, 17 Apr 2026 21:58:19 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260417105529.4147375-1-bernd@kuhls.net>
References: <20260417105529.4147375-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <7bd86507b8cc05a2582d1c0a7dd5e9b4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776455901;
 bh=aUZgzxWCj/LCctU4JVWGUBjszCfcIiMRyQolp+e6Geo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d2jSeKAxivgq4qPlCZFG9I2Pj5sYQFkIvTldwXSmQgpdBl+zXAlqKVSgNT0mxMQYQ
 f5Bx4GDQ/C0yGn2kzG4kH69kFySbPzRsK1aXOIsc3DA8u/R/KUUWmWuWsTFk/T7tKs
 Xerhq6A8tclidepJFQRp6GZn6QKBJiGTPUgycC2sBs/kqq1TSk+Bf0PW8WgLhrSzDW
 or0KPvleD2KP+/mXGIWaPZhJTTr+qxMt9q5X8OVSfdpTEfG+GjHi8T8MqBEuNl9q40
 cfscjbYZCw8F34FXR3CpxXMN8cV0Eo4x2/7GVstHGPeengEYxjSkKb/swLKfRBqD7U
 Lv6QZrybqvzuA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=d2jSeKAx
Subject: Re: [Buildroot] [PATCH 1/2] package/ghostscript: Fix brotli build
 failure on ARMv7
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

On 17/04/2026 12:55, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/9e3/9e3435752d50ed3db55b0ff03e412bf42728f73a/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
