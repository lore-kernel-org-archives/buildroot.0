Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757ECCD37BE
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 17:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E09880CEC;
	Mon, 11 May 2026 17:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l4v0NW9Zgjll; Mon, 11 May 2026 17:07:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8792480CE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778519244;
	bh=jMFGgJ2MMOjGSRkf/Vg0Nt5tuAmxg2hv0/sBw+fxxAY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CO+UKQqTQQGwnX+NPaDeOr7z/kTuDJxDD1KDetZqKiCbH7QJAk+LV6Pm4z/p7rYvR
	 1gRkoDogSmfdeAZ5yyq0geXl4ngd+hXBgH/AkQPzKW7WS5bDVgkWm2uf4gdYqLlB2o
	 6yfx8yz8mibKfPsI6Kc75Cldr2EpdPZNSiU+QijJTTi/pMUY5dSi70PZOIgzK70r5G
	 CRhXoml3g1QmkOY/pywVU742jWEIDVBzoJNTqh8lFq5M1fcAvT/EKIiq5u3BfsS+m6
	 lp8cAmTFmlO7XKepXrgIJPxnoSyx6h68v6v1v5vocEVo5OFpAQgKXKru02ZJlh7/xH
	 suPWhMseO+LXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8792480CE8;
	Mon, 11 May 2026 17:07:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6DDE223
 for <buildroot@buildroot.org>; Mon, 11 May 2026 17:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3BA44005E
 for <buildroot@buildroot.org>; Mon, 11 May 2026 17:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUMfedifpARG for <buildroot@buildroot.org>;
 Mon, 11 May 2026 17:07:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7F79440042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F79440042
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F79440042
 for <buildroot@buildroot.org>; Mon, 11 May 2026 17:07:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8249619F59C;
 Mon, 11 May 2026 19:07:17 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 11 May 2026 19:07:17 +0200
MIME-Version: 1.0
Date: Mon, 11 May 2026 19:07:17 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260511161839.1256214-1-bernd@kuhls.net>
References: <20260511161839.1256214-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <5a87cef5bbf51653d44ab970064ae637@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778519238;
 bh=cGdcDejAKGwGk3dvzwFejDGrv37TeK5nVTaUNYRJcZg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GGIyH+H4+A41LjMnIzSpnXRONsTm0YWIZuFD23avtoj8ubKyM54wvi6sRL1xZQhka
 mhpUKcHlAKWlPirgRDm+gjneTPYWAEXZfbvLWzR1h3Pk+ChG/UixOb9aeDgotGSPSz
 BNyJ93V2q2k5MP4jjP6/KxWjPh1wkxmjuPGWpss56izZIVgoYVrdnftZCiOo6oOu9A
 emJw/4XNVLAwEvNYUaa/u22IuUciQ907XMZlLryYoTxUhWfS2aXVoxNwN0xYJOmA/a
 wWByjUy9yz3JsTOHXTCAibu6d4YbQQqskwIHytfd2nZLSr2ewXybBxO/n//UofUY1e
 WF4/K4rVHsQHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GGIyH+H4
Subject: Re: [Buildroot] [PATCH 1/1] {linux,
 linux-headers}: bump 6.18.x / 7.0.x series
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

On 11/05/2026 18:18, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
