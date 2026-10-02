Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9572CA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0070810DD;
	Fri,  2 Oct 2026 19:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G23LHrrOtyS1; Fri,  2 Oct 2026 19:36:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B65668133E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790969791;
	b=ZGDAkgAEnLL4EEjo57j1fgj6MgVX/I5Lw3+rkVdxRtQtXscXZ+Q2NG8Gr52M6QUC2Uxp
	 eEPoqZl8bH1eQkiYMhThgtG/l/7LfyaTvtqjwT/b47vkDEp6+/hvyDl3lFL/ENcT2JM/k
	 mjeyk9hFjR8VkPieW4kFmvGzaE7QQQsXikcJY/abYNBUfGvK8qpL7ncmY8YwPM+nwI31/
	 xjUG0OQ23sDnRfc4BTY0ChSPvA2cegKfLBF7mLUDBtuspT472DTz6urs2eGiPBfolz/WN
	 uNhFNFKgTG3oGQNBJVYYCHacwd53M0I8yov4WBTPa8upKjJS+mvqtIlf40S545QhDww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790969791;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=m6LeQ/dTCMqfAzRflaz569tBZB5+6R+MAz6A4ERt3yQ=;
	b=Buv9Z4Yf7ZQmGbR15gPH/X7YJbuIej9/EFCEZ317TQ374xz7IXVjntQHu3krwSDWUlJh
	 VVv6VSfgJj3qPG37Jj5Dy+W264Z1xixS8DFFYf3yKnAj6hpmz0GQrbdhoH4qRz7sxkE3L
	 AsFGyJb62QpirxMarcfMev/MMZPcvbfbWTH++9VEZFF+IAxQu93Te5Ik46R95d5SzE6Pu
	 rhxs3F7DEbnY6Juf9duBERYDD1m1FMEGj/gp0U2mlen5bdmaJysh4+2PQs1qO7xw/Hf/h
	 zSxz/jMOecC5LIPrWjGbqgpvPtMVk1hoIbQVezoW++htadgWpHv0ydkMQ8ZwtrxMZNQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790969791;
	bh=m6LeQ/dTCMqfAzRflaz569tBZB5+6R+MAz6A4ERt3yQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eDZaz+16/NqY+pKAD+fHE9V8Cz23+U4z8FGLQWZkgpgKvN/kWdqUkNIMYRXgK6Siw
	 Nwpnhcs41KGiiB/VJEEzsPv8Vj4nhGf/6Fc+QeTfKcitkD/JSCrhsZWDxWvzlw3sUw
	 xxlM7ok/fBm2IHcb9NN6hTS7nOPWxaLA/Ary5Q7rQg7QqJK5JqFoXZ32to1hRiZYSw
	 0kVWEfVul3olhTvGaItnA7m6a9lPHRKZT9F8j6b21LIsvWO2GEXY0YIBShLVVm3WI/
	 CFJ5Fua56Ta2nkoORhgfxYuKUlrPmiQrBELelnsIMJGj7HBzGtUx2/c1q7s3p18UYT
	 MzSxfMxGxI3Rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B65668133E;
	Fri,  2 Oct 2026 19:36:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CCDE282
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42ED5400C7
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1wdigdfDVEgb for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:36:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 75317400BC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790969789;
 b=mAhqxhH3oJsB5xfMOuDuCIpE+hcK0PtrjbvU4AxeW9xYiRcLPXlutBEbW/lsxRDf0HAC
 FTQZSdZwh+okXkwhhWodi50Xy9mAE9iBM4vvuBsQx874wpze92mcWJLkrrxUaFv94Gqek
 PqUudXNdCvJe70iIHxjPNxPKcqmS2zmnih70oa5yQOvu9PXVokEIIDzWv3ysEZFSFJaDV
 8ZgahnsKIGnMZjb9FnGSjq/s20HCRWb2+Z4rRQ6Ln1aEH1lf2+N7p2iHqana/ECDj01Oj
 kI+qChXKOfErNCfF3fiqfldy7oVchI1rclbvhOx6tuIyLg348VKa2EEMgmYaQ5CeYXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790969789;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=y1APNlU/taenN1RPEM06zRUw3qspjTa3UiyS1bXCjUs=;
 b=n+N3hzL/nrbpg131AsYeTnBmPMCPQ6LQ+X0wFKGHehNA1yUKS5YzQHcbJ8XEijs03Lbo
 3MQAXgXgFaLH0d83G3tAgH8aZwe6Mu46yoYlge0FG9jbeRJxbia1vPZMv5QoVGuAgRrzl
 OAgY28vOfiV6rjjZ/hrCKfjkYwq7FTvkgZMu88LJYM0Kuj71UzEW9YeBg7gmfUkOi62At
 FLYH0UyE7kRNAAcOwLhG7jLupFhBPSRsQdT04tXllRazd1SeIOnzM3jm+TXwVyfRy0MJH
 D9A5/bn+Y+6vZP+TPIzWvOYQ+4+KCEuZAv49CVqg9ijCEibi9LHgadLYnCAD0nlptoQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="c/IuC2UG"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75317400BC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:36:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7A7814E41113
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:36:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 38E02603DC;
 Fri,  2 Oct 2026 19:36:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6F1CD103281E6; 
 Fri,  2 Oct 2026 21:36:22 +0200 (CEST)
Date: Fri, 2 Oct 2026 21:36:21 +0200
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org
Message-ID: <asAHsYSLO2oqBUxy@windsurf>
References: <20261002140218.356782-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002140218.356782-1-ps.report@gmx.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v1] package/lzip: bump version to 1.26
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

On Fri, Oct 02, 2026 at 04:02:18PM +0200, Peter Seiderer via buildroot wrote:
> - bump version to 1.26 (for details see [1])
> 
> [1] https://lists.nongnu.org/archive/html/lzip-bug/2026-03/msg00005.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
