Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3F9CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9413406FA;
	Tue, 13 Oct 2026 17:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iUEIMBtXECwM; Tue, 13 Oct 2026 17:56:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F384840715
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914161;
	b=gjiT4PaAw7Ke06Zvvyoe9gBOAW7WcqgqIe6boZN1ijV5HOc4GAUU18YIrQw82P4lbieu
	 SZk6yBq7RhVQq8pt7hY+BYxVQddSRYofcv/ce6ur+S8Dt3IXzY+mg5IRtNzsMdM2Sn6pJ
	 YYT/TCDnY+BuTycPyUgd1m/mAS95Lov3WOs0eMRbTzhGuSeGO1YEFsEhoQidpZ/gNaDIY
	 dHlKr3p+Ui9ZKk2Iq/c+RWKZU8r7+AIyJpKCdceeHChXyKI321C0TPWa4ytf/P798V0EY
	 bpUAWaZN7n6dvE/0prjHG2kx4kd7Af729ZifgCC/8jterNYhSir+7kcq/N/kZdRsgvQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914161;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=uR8XrzBQlu+dlhveQUFYPfsLCOJ3rKJ/7/ajuV1PqRo=;
	b=jHfR87abjXtpyz90jeCE3qnqGZ4reJBg+iQ0ldJJ5hAFRk38LQCufBc2hykwbBaW3VsH
	 2AzyE8ByVaiMy8qGKMT4HGwJj/pVbLOqOmtTWUui2Ccqp1O2sBzOnaHOKNUbr0RUvnf0u
	 zfx53Mrj6kTpgpUhuRwlOUj0u/0/Zvf61HElwZEIzJ8RtZ28DROFlmVN0KDKkMgwOt1Uc
	 M0+MBOOG3V8F8c3m9D148OFacylxeYlEobw7LfttaoDMY34R2GbWcLW2+cIp7BW2LT94/
	 c6MZpq0B4mqqrfGHDbGVNZwjGBm3twq+BfGFeBj+R4nB9egJqE3ub1EHanEeKnttCIA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914161;
	bh=uR8XrzBQlu+dlhveQUFYPfsLCOJ3rKJ/7/ajuV1PqRo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RyZGJjPRx666xDQyus8jqxbCDc1e+mreAbU1aSL50m7ytm69/lAdjzcek2MSU53S3
	 il9dmCyCgtRUXnpdUY5eEBNFeK9PzOJYFoZ6eLlmvKPn+K5eDnu2Akqc3YTz53h1/h
	 8ywtJjDd+AjFnk9QEVFtlhti2PMEqVZb65/PKZ3mWVk09FWwJN5NMfkKdO7j8jF5ZR
	 +LTTlmhIJbV5lsnF4+r78H0NlFHTgFch1W8GqxfphelIuiiTBWbK5SY8+fd6edZe7p
	 ev1MXrKFGmd97eFuZ+e9hUWkEbTTO5gEUkoEfBz8oMOEYa4//glh4vt4387D3szlV+
	 HAeGwtrOmARjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F384840715;
	Tue, 13 Oct 2026 17:56:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B999B362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABBE4402DF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lu6nOJV2G1jy for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:55:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BF4014002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914159;
 b=oWRLm3bBh9K9zD0ORAO8vsiwikBb1Vj3gIEGWs7HeZJ13hv3cOlSrDSlNNiyRKRO1ltZ
 Eizv6414u0NPMhFYL6UW7Be4QP9/h7+U06CXRvuA98qytTLcQWNXW3Kia7cvk9G5ttycn
 yEukTkK7WeeWJNykf21UkxdrTqFPr25t5VMJQnSe3s+q5fDdnr/JJZlcTw/TzZQRZHtRb
 OF5wYG2myamnMIo8RmP+QBReGkWONv0WZu74sBYECdAsYUKCgQPRzxhG5uoPYli/mka7H
 r8fclqUsLba3D0L5KZqksZbSuBhPm7whtHrlNwC97B2B2uV5QMveM8wG3RyEp+KsUmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914159;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=gRkGiqK6DdbuY89br9hOUGg3X5HbEDGcQZ0P9i/cb3s=;
 b=AZw+Odi/Hmdo6ZZzGHRyy0oMXoixMxX5/8ygDj4Twk2XGupTNGZd5s3SGCRACA/nxFDQ
 ir9Zj78gM0oooPy0nArGq/xkzqXx2oeuC2mvxlChVZbjvhCT91zyEpt+qO1EQhim1PH8X
 6RwxW8o0TPDNR+PE2fJAqI4KCViIeadQjb8iQDFasLxRvuuB8yDfh7nybuHQOcl5vUaPn
 qiU389eLYiVcMPb4+3Ntx0UCN0koHxMMdetKAoFH5/NyJBxf6Lu4ZL5gsh67TkiebrHo2
 NscQHdXWjcFaTlfwqCcuqghHRAT+4YfmzSoObRTdxpmRVY1cODCypjV7ZYOvMEhW2iw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ohTqSXwL; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF4014002B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1DA9CC653FA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7C3EF6075C
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:56 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 2B07F11D718C5; Tue, 13 Oct 2026 19:50:50 +0200 (CEST)
Date: Sun, 11 Oct 2026 15:41:47 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asuR9J9qvXO1zD0l@windsurf>
References: <20261002205517.4043570-1-james.hilliard1@gmail.com>
 <20261002205517.4043570-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002205517.4043570-2-james.hilliard1@gmail.com>
X-TUID: /f5aGNMkPHBF
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 2B07F11D718C5
X-Spamd-Result: default: False [-0.46 / 30.00]; BAYES_HAM(-1.86)[87.30%];
 DATE_IN_PAST(1.00)[52]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; MISSING_XM_UA(0.00)[];
 RCVD_COUNT_ZERO(0.00)[0]; ARC_NA(0.00)[]; TAGGED_RCPT(0.00)[];
 BCC(0.00)[]; FREEMAIL_TO(0.00)[gmail.com];
 NEURAL_HAM(-0.00)[-1.000]; RCPT_COUNT_TWO(0.00)[2];
 MIME_TRACE(0.00)[0:+]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 TO_MATCH_ENVRCPT_SOME(0.00)[];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 URIBL_BLOCKED(0.00)[bootlin.com:url,localhost:rdns,localhost:helo];
 TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] [PATCH 2/6] package/python-dunamai: new host package
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

On Fri, Oct 02, 2026 at 02:55:13PM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I've also applied patches 2 to 6. However, you didn't provide any
runtime tests. Could you submit runtime tests at least for the "top
most" package httpx2 ?

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
