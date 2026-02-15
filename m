Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB24E63F06
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 18:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E099812F4;
	Sun, 15 Feb 2026 18:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tD1U1qpyIwjt; Sun, 15 Feb 2026 18:46:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BCC3812DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771181208;
	bh=qleiM7h08ovPwSehwjVwH5FgcwM3OKjy2M2QsCQ24CY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SdUcr+8cD5oGWKDV3ajHsML+Ftb2d36pHgBLx5jQlnQjE7Hxp1X/b9v3nWHJDVT2A
	 RCIzr3aLA+HxI+3iS47iex/fxXKQBpjsarFbwMIDbo+BN9IGYEoM+bPA0jGdiDqI11
	 jPscF86HXkCMfl+Y6yf5tH8H/VZZxj1gchtvq091EzXal2PabyixPTXF+MlBwdmysC
	 EGnZUhZ/G6sK5UkYScOx/sANykXqS7Z80N5lZAnEyNlNn/+ceLk96lrFnbIRiNdtA8
	 0lUCI2UzwONRM3W3vF+9P5+q+fPKBKDD0Sk9/1/Hn8vym2NbM8l3Zbw/v5AZUPyTgF
	 yIJrIvrCX+TVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BCC3812DE;
	Sun, 15 Feb 2026 18:46:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 16032270
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 18:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 039ED40464
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 18:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xseGTN3elDnI for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 18:46:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EBDEF4008D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBDEF4008D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBDEF4008D
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 18:46:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 375142003D6;
 Sun, 15 Feb 2026 19:46:41 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Feb 2026 19:46:41 +0100
MIME-Version: 1.0
Date: Sun, 15 Feb 2026 19:46:41 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260209174646.2034961-1-dario.binacchi@amarulasolutions.com>
References: <20260209174646.2034961-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <4c6ca524e793b31610660624539af171@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771181202;
 bh=0v+dG5rCf3hom5PJnyqEI3jtVUoXcB22L/7lRXRxgwI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cmJZSLASPUEFyZXBVBh0A50LqzUKzGyrISWMMspb0cWSCwTP2hX3iBjLvZAopd0SK
 /+Rwy4qNO7WjrobrcRo8qXniCczu1vyfQvRxf/02TUpH1llfr5p6e8s044ErnFCjS0
 bearKPvVbRunnLpLNF/IWKCkuWW1PpDIDgNGrgXJ8/HSYxriP1CDNSfKZ25L4+mq1a
 MtJjaKuTjoVfKpIHWsqz1qi+F7z0jzpQdTYN3ts0+X3wELt828TiEOD+N8v8CwNkqQ
 NPJd/cnNr2UuNeI+/VK5xsj7ET7g+oEL3xlatNzpWYXPuSys/NuWfQhbafuHo5xDUy
 Rpr60NBJ+87Zg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cmJZSLAS
Subject: Re: [Buildroot] [PATCH 1/1] package/less: bump to version 692
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

On 09/02/2026 18:46, Dario Binacchi wrote:
> For change log, see:
> https://www.greenwoodsoftware.com/less/news.692.html
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
