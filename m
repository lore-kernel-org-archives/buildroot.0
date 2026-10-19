Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D220BCCF2DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 08:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9438440708;
	Mon, 19 Oct 2026 08:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkne7dXAx2IB; Mon, 19 Oct 2026 08:46:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7D7D04070B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792399592;
	b=KtNEN+m8ZrHDMAWrlr6YKSlXReJKz84/zkQ3BJ5T3w/WlGd8T0WHWYgOe/Z7393cVA+h
	 nMdPeuiJvoOK54nU6b2ludekt+uQ8ZtTAtmLVvcpH0wwOMazofeuA+02smtgndF0WOT8c
	 PTSUotaASqzS98RTbfv9oeQ0bEbcvzrx2osZWNzHnxG5d0bDfEeIN5XfBZHlI1tqzg/x8
	 JDvngY2cjrog9Tk+QvHrKRX4Nb7k9/eFzMTib7/BxR4CPDjoZyJHriSPiedkyV8JwDvHB
	 fY94OZmmM+ckkUR97F6rJ42QTZk4vEu/GqbpzFttYWDGva7u4VVknjPT8FLljHR7yTQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792399592;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FVhQO2yxl36t0F4Xj+HLp5mh5NMymk3iYBtqxZRkcqE=;
	b=Myey2Dv2OaIa6rzIclQriNwF2Fz98WseBrnzPLXbzoNBZ0rbvso+C5t2Wk3L95xHDt2Q
	 /eM6OU0W2+cxhKCKDND5+Yne6mKZdTMAxP9sxRZjeRlX9zGK8H5iSBhl1kwMBcVRB2TqM
	 bXkdqflnTJyFxoTnszfgtQot4VZ/+Hvw1mnC9VIj34e4SonPPYsPZSl3/LLZlCbkZtfFy
	 dSwWPak3D+fNc+ZIj1up6SKDMGAGeb6G+6oCQD7UUsJt+wc9IAPmrDNqYUXL2YcSWrYuJ
	 OUgCU5E4cEVSn91mJ3fBijT2ntYmKiy/b4nQbmgB/iCUoRy33RQu4zIehNWS2AkFgAA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792399592;
	bh=FVhQO2yxl36t0F4Xj+HLp5mh5NMymk3iYBtqxZRkcqE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rc42Dpgnda2+Wi1k0cX0iF+cJqEIjWKz/Raa5EegA4lRh5z9yqnsDGGsKPYzrmxJB
	 agUmV9hO+8vX3tPyxscosY+TCXs552ruNCFq222riU622vfMWuQzUG+iPhkdh9bp9a
	 +og3VspGqdsc6NI98xllHnTgQp690JjMKn/8eZYCwNcy7lZTTkGPembdaOsdj5BCir
	 kv7sW2WsA5TViAf/JeA5uTxVSLlJGf958I5e87gPoJj4XFJnqkzJet4xUyc8bvUrEi
	 KsnY2ETdIM5SebvHL1M3a5gfz3/o1KiGBs+fNFXMa3Bmeck0+PHT1vDs/xSImGs5J/
	 +nWz86ixYv2CQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D7D04070B;
	Mon, 19 Oct 2026 08:46:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01D25465
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBEBD4018B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wmbwy-BJRdBz for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 08:46:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4285C40062
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792399589;
 b=BNhn6RgaNncKawQU9/5t5ZDTEfCHMBga/x9uKAAUGGPId4y8OxvQaprqBnegIuYCBJSG
 9nfEWcvPvtiugy+ILK2Uo8/bN/ziH/uCwp6vi10qdHy52Rh4hNxKNJb2hGdvwypgnEU+a
 dNNpSmn1Rp/nJA4zPY66wKxiuAMogJUhIffXihC4JGbDohH5fIXYnozJZKycy0tLBmpRh
 2WX8+dHi+apbJnqAzNGYLtUnrH8fftzrWMwCUsoDii9p0hidw7P/RnNiXakv7FMeRGdyo
 fxUcIcmuBywuS8fzlxkkNrnBbbSAgKGvALGrbvRWk7wUqc+K+DCr3ERz98jUDK3JESA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792399589;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=EQxEZy6yId+Nnpj7OsV1Div6M7M967M9ih/TYb/QXqM=;
 b=O+m5D7LzsN9NB2gvx73lzbFEqb5aLqlkfXBozm2fxmFO0glLWymgFadIlKeJD0MI5skT
 Pp6Ou6qFoiI0Oj60AUK9xjnmzUBga+/UgItbBEbEtI81E7+OBIblxLKrb5sS5Z6yB5neS
 9KGgCjq55zU7Iw5+LEdc0LzI6ezbKnMSgglLoYVbZ5yeHHw96mUwUpPBd4TYe+T64iaIF
 0+RkwHmZDk67CN3Hqpn2HVxmgGQ+TMDTOiz/ebzP3nhhOGKJNJhln8zN7cXy8onLVixhH
 SsuJ7mZ6lPQkbSk6sGLviTbP7HwA1ZBYYSRcNj2TVOOiJRTg8vvDH7VZjqbhOyKWrIA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=V2+btidV; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4285C40062
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:46:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6981C4E41281;
 Mon, 19 Oct 2026 08:46:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3CC7F60582;
 Mon, 19 Oct 2026 08:46:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0647C10328429; 
 Mon, 19 Oct 2026 10:46:24 +0200 (CEST)
Date: Mon, 19 Oct 2026 10:46:23 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <atXYuTAlanEP-WSk@windsurf>
References: <atSRYnTOayKlrbjq@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <atSRYnTOayKlrbjq@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/erlang: enable uClibc support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Oct 18, 2026 at 11:29:06AM +0200, Waldemar Brodkorb wrote:
> uClibc support was disabled in commit:
> fb72418160417e9e872f626c356f898bff49cf48.
> This problem is solved in 1.0.59. So in internal
> Buildroot toolchains and external Bootlin toolchains.
> 
> The change can be backported to stable branches.

This change is a new feature, i.e it allows things that were not
possible before. As such, there is no point in backporting it to
stable branches.

> Tested with aarch64 and external uClibc Bootlin toolchain.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied after tweaking the commit log, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
