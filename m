Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F694E83837
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 21:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A88B60E1E;
	Mon, 16 Feb 2026 21:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lx0dlY0cOpIq; Mon, 16 Feb 2026 21:41:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1099560E24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771278102;
	bh=FHYqvrmeAqNQAA5r7u+/jdpulA384dECkxdgRRP9nh8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=odCA+uZzaa/tyq/Q3JiA2spnjPe7rq8zMlUVt0u4ij0QOa7rKVEQEj6+j8cG5TvRM
	 1sqvvGISyHBGB0YSVCiZfjDAAkdqFZUcxTmFnojDaoRD2uN4miWO3h9PFTW/jDsF3e
	 wgab5979iV0eW3xS1wySSZzgp/zisF7Si/ynogWjBWFb/NxOzXKJV/an+3hE2qw5rx
	 oeLPtWWIqOi/23p3Rz/i9KGNgAEZwIMqLSQ+Z4R1lHy8DGtbhEVSQSxR9KUq9CG1UM
	 1H610p6pRnNFJFapit03mcLvgIhgcdxw/5JNLBctk6fiqJwTpmSVw0D5FrsdTcgGl0
	 51Bef81zD7Xqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1099560E24;
	Mon, 16 Feb 2026 21:41:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CB2F270
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 21:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DB2682FA2
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 21:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IoLf6oWaOq0L for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 21:41:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 64B8F82F6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64B8F82F6F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64B8F82F6F
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 21:41:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 66E1E13F89A;
 Mon, 16 Feb 2026 22:41:28 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Feb 2026 22:41:28 +0100
MIME-Version: 1.0
Date: Mon, 16 Feb 2026 22:41:28 +0100
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20260216125427.2476384-1-neal.frager@amd.com>
References: <20260216125427.2476384-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <c77442cbcb8e4163efaff1c9c0c11707@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771278098;
 bh=qwd7CrgWAefOt8SXVhpxqJ27efQ94hmf43bBoGpedZ8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vSB97PNQVSowQLJeb2UuKRX0UoH/jH4adK818qogblX7xN+xeF5nUpMLtb+aR3N3P
 IoCtXfCz+UDlDKSZ4JoudJn74u6zK9BZ+JZJu7FhfTaLbq/rtimerql3wlnAa+z10M
 Ww0MlE1n5X8QoNhVgDhN/h8FIfa+aSOuJrUGqt5CY35PGgte1wAFOBsVQRg3mxsRl2
 UGsEmDmmCHHAI3jo9CHQkugssAdyUMaqDtmgqKHqH2m5PuHCpsbUsRiSWQKfbd2nmb
 8IaW9z6ZF4ja0fDnS0C0Ns0jRahKD+0dRUCsKZTbDHjstm27gLxr5LiiuaEq+1zXS9
 knF+lR7HicTrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vSB97PNQ
Subject: Re: [Buildroot] [PATCH v1 1/1] package/binutils-bare-metal: bump to
 binutils 2.46.0
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

On 16/02/2026 13:54, Neal Frager via buildroot wrote:
> Bump the binutils-bare-metal package to version 2.46.0.
> 
> Release notes can be found here:
> https://sourceware.org/pipermail/binutils/2026-February/148149.html
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
