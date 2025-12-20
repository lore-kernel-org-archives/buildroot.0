Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7948FD637B2
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 11:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43CF883408;
	Sat, 20 Dec 2025 11:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1AgyBAffwM0; Sat, 20 Dec 2025 11:13:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70F0882803
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766229203;
	bh=iqLhkaz/JixuX0MJarvWRrHjvHctitCgrsgI44gs9yo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=C+X3vjJX+ofp+S+YLVUvBBgOQgNQwUAJn9mOBqi+laaX+Mw/DN7nyJh5Djhug3ZuI
	 cKk6tFfAQIblQGAkYLp8fZBDSC/HwQBgZ8u/UpbGCGHNH9SFrukDGD9X2fvEYlOaM9
	 vB3iUkmaY3sM1wBUf2qiqosXV6wnF6wsDh6/J4XIxhaonhjpLnNHCObGIks4cGqe3E
	 oU8QMy2arpMVVHBVqwZ9tMtLutyFW0+fe1Gtdw8SqoZNi9GnMxnf2KH5ngiWslirXI
	 mrZ/xsOaVnkyqy0sIy7ATonmlDNbpzoDGm0SWGLTrzyjS6ZHkCtjl37Sqc6EoREzda
	 NAYPtCOa2IizA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70F0882803;
	Sat, 20 Dec 2025 11:13:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D97F2119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 11:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFC5182751
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 11:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o3fyJVdQzTv6 for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 11:13:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B9D6382803
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9D6382803
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9D6382803
 for <buildroot@busybox.net>; Sat, 20 Dec 2025 11:13:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2F3755FFA3;
 Sat, 20 Dec 2025 12:13:15 +0100 (CET)
Received: from 2a0d:e487:416e:b4c0:bc35:8e33:c88c:ebb9
 via 2a0d:e487:416e:b4c0:bc35:8e33:c88c:ebb9 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Dec 2025 12:13:15 +0100
MIME-Version: 1.0
Date: Sat, 20 Dec 2025 12:13:15 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20251220083916.348329-1-francois.perrad@gadz.org>
References: <20251220083916.348329-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.12
Message-ID: <f330d1776c4026f73786b0e76dcdc333@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766229197;
 bh=SgIW/AsnSSRjIOvBnT4oRiOurft/eTQ6+IINYBlthXg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Xf7cAz4JOH0S1XikVxNC9LREXwmr3HePhDkI5329CnIJzHkGhTY4hQRK0tq8G9s2+
 VeG6AkpZtLqgxDSbCzKssOgyRTLBoi6sXgoHL7B0t6SptYUZtsTFWrJECGiOTFyv8o
 /9TF/oA7okIxNpfUL3qRCMAPlxGl/XBC991kp+AJp8QiloPlOg2tjaKoQUHtxRn+ip
 Il1Lm+yzuZTiW0GF0VUOhJ8eijpbJe6Esss/msIbqacSo0DRCwmK08zv5oVjK9MiPy
 3llvRpur5B6wKziRqoIH93NCn71fEGOATGxuMHFsTkdzMCswtCedRB1lrPHnM6wQaE
 iYj3pHRe1NT6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Xf7cAz4J
Subject: Re: [Buildroot] [PATCH] package/linenoise: security bump to version
 e26268de5e56bfaad773786471844578fe9f7f4b
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

On 20/12/2025 09:39, Francois Perrad via buildroot wrote:
> fix CVE-2025-9810: TOCTOU  in linenoiseHistorySave
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
