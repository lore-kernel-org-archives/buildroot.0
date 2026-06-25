Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EFACDB479
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 15:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 925CE82E29;
	Thu, 25 Jun 2026 15:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QIfkN5Xhbtpv; Thu, 25 Jun 2026 15:24:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C090682E14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782401050;
	bh=xoH1hg53NJbAnK6956rTx/Vte2WkZS/mTTBQtQXFVg8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p/r5tSdap/Lr7k8UC7doDgKofkpazN9+S1G5Lc4VvzwZDfvq1CDR5LbAaS2+plaDe
	 VedZoYwXX4248HGiubdEFJDuPLtPlkcWm/GKyQdAPE8VkDT5csYvJNCRaJf60wbRaX
	 xc1OZMMHkU8jgZcgvxJXWUer6hR5+LLAyOHC1uScbqVTaWsxsiC3GfvPgKFB7Daqoo
	 uzgMjktSli7eND250d0X2d/3Ja63aV6T8lZe4qJqXDtiqvajzRZ57nD50bhnTARGjN
	 CtOWerH/sYXWMJdZnZ4d60GPHgTY8McH2llamWVnHtS6i2XycWqLR9DC8+n2hperWl
	 js5ZIGnwwS7Qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C090682E14;
	Thu, 25 Jun 2026 15:24:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 09A01254
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0617C41114
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJOZXy6JX2VA for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 15:24:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D850441110
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D850441110
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D850441110
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:24:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 8B5075FFA3;
 Thu, 25 Jun 2026 17:24:04 +0200 (CEST)
Received: from 2a0d:e487:119f:5231:6cab:f084:5c2d:94e1
 via 2a0d:e487:119f:5231:6cab:f084:5c2d:94e1 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 25 Jun 2026 17:24:04 +0200
MIME-Version: 1.0
Date: Thu, 25 Jun 2026 17:24:04 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260619172810.3337739-1-bernd@kuhls.net>
References: <20260619172810.3337739-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <77155b12a92976fd90ee9646f3d3ed32@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1782401045;
 bh=VvQjssOY3qGPjQ+4lTWaZ8x54Xvtj6nYKXb3f45hdI8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Elza48ibtnor9HG1luxRFpa1CBaAXMbIVrV3Q6jVnxx4m7T44uhG06wKoRXy9n08v
 L7HwpELzVN7TonU5LhZnNwDsuvrFaY8/s5/QS1bxNFDXZLsq37rgxs7ITY7DRlhcCH
 BS2s3uAJ3Jc78tPM4Ij3MRF5mbHjBm7sZamPLGJJDhsSe/q9EE8eaykU3TfDkRM9X1
 nLb1ytMMt1OVqFVcZorjgNQuW7qfi1sSnlfvSulDXChZGjhBmOTw5z7dnzOFGjZOVg
 Rabv/GPZUlPcDdbxRcdQlf3qOnpVaW91fL6NyCbMSUmxqkLWz1FnvAFP4X90iQkLKq
 btrViP4KAvKAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Elza48ib
Subject: Re: [Buildroot] [PATCH 1/1] package/ghostscript: security bump to
 version 10.07.1
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

On 19/06/2026 19:28, Bernd Kuhls wrote:
> https://ghostscript.readthedocs.io/en/gs10.07.1/News.html
> "This release addresses a number of potential security issues."
> 
> Renumbered patch which was forgotten during the last version bump.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
