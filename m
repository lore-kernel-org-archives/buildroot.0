Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89904CA5FC1
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 532FF41423;
	Sat,  3 Oct 2026 12:54:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXed_tIBWjXC; Sat,  3 Oct 2026 12:54:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 73F1E41421
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791032086;
	b=ex3BOVaTZaQJHNHPmk0Aip1Y0W6/aSrEh9Oc1Z1YZHvLQ6Rli9KbKVIF+vCZqiiUJ26p
	 eT2AKAtlTqC3Pif2q+632wS6Z9DPjkRq/aejZAY7eSGt6/3Sfv908fGtHBv0BgXZZkrdz
	 EigsgtGesjHwMbsg4ZmsfctleGSOetx5TCukk1pfgp4+7f6sZjnb7Zm2TZpRK19RAgAgj
	 CzMi2d0F+5+/FaWugQcBBy00ar8t+09tQgvXJDFGUDlRC7uuKenwHQDeofBlSLOvRUJsy
	 LRjVRIyXtZsBP+Maq7kRSOlZzKnfIvrf15N7KgW3UJU9AEp57Iz8ujzH1+/xrZGQ/vg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791032086;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ucRdIowl/iohzrAUecNFW0xFeSIeFZY3HNpZ+PDC9pA=;
	b=jvSgiOjukHr53qqDG8EEG10opnx5NmzT1NjOuGwMB6w15Dx1SgPvrsJET33lEOEAxpBk
	 rnpCbSiWlKVbKMJV6nR6CXWFyaYrOCQHTbj/DgK+gMcVv9VuxCidZBapoTMLYjY27eO00
	 gT/LKNMejQV9hTTvzl06F8cPGvWPxHS1P5eFMT8v6hopyiJKBR5LuMq+uhPWfEMc+nBNl
	 kvYPmNVha0u6QNnQd+kMKylE9hhITZReeaKtoOYOV0Dq/Zl+5e2k/fy4BK/qRLOTslcsm
	 1XF3W/O2/a0Jy2SSRgJueC/nLnd5n1Jyvnl/8qfF2kPcQpzpq+13EZioKD+efFfaGyg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791032086;
	bh=ucRdIowl/iohzrAUecNFW0xFeSIeFZY3HNpZ+PDC9pA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZYcut6LSwCN3qNdZ5ZdCl3iiGCC0a2KbWXGL+7d/oDZetZGindvll4SMhNXKseENj
	 1/AKSMddfmue/kKxH93bpbopqLD+hsTPKtrSRacUiwuxEw4oel9W/0bg+N3tGPCUjn
	 L/ao3tFQRW8LL76FstQGc0/z9e8Oj+4M2RIzqFyMYPbktvViFcxlPhdTa1oQc66Tod
	 O6z3LmXVDYvcjJOirNtuucIhY4VErnqBf8Yd3VJ5XG8mYRJTTGhf7k+JIcdmMr9+Fd
	 8/Cis586cZokXBsOO2sLEq4OZPeP8QxQVmydI4I8L2H1nGOSMBiaeTx9zovZfUDCc4
	 Peus4EatlSYEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73F1E41421;
	Sat,  3 Oct 2026 12:54:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B8E91A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21FCA40063
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kal2Z5lnlOAY for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:54:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 410EF4008E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791032083;
 b=sVhwlQqaIwUemqnbeKz7z5GkTLYthz9IBF6IaDJjZAruLTRiMAi351xvG0pm6wqnwCnq
 lp+hEBTfUTyHr3gPRTr1/1apuEQ9Tf9knhYg5juSdDVPPx+U4wT+Vz++I/VWGySyirlww
 bX3j0M1wGOE4RcHSBgTYdwd0Lq046qs6k78WWcUVeP+hfrP1dpWF5NUtYKKFzDyhaGqyK
 3osl1UTqXLm8UO6t2JrIrwhC9prS65cMUoUIFkbMirfm+WFpIN1FJKAuKduetWx5oZa9T
 viGMdz8SCpFk5pz4+vaxctNbI6PFQXxQrrI8Z/ba8k7lCLdi0B06vOHfOjbmmm1q7yA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791032083;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=gWmdNegZBJkKNS4vPZCS9I5KXtXRocm+NoguUUKd3NA=;
 b=EJcHIYAaDNk2DNh2xBrpa0+ShZq2NWN0pBkJsP9l9qU4ZP/cj+uYXekLmErk04Kkr9A8
 vEXM+J/d2gjyUlqT95nEAyDPqADACK/91CSTGBuVaqY10P6dM6lhEQlV+wQOSH+LRuIwx
 3jRpRwwPIUd56JP/Q8e/gaQx4HXCcTfxECzOJHF9qYCuXjib7XndLWFQCnb4NA7+a+AQa
 BiNMv9peOi5BUpHQpkm4Mfp53wP6P3z1YHKIqYlqfVtuzQDagsdnoqwU0/+kVzTc5r+rG
 m4uiAt37dc5b8pIsCNyikyrAu5Au2iZ4yxWOEfE0ci8b+W4jEUiNiH6riktOZnYF7Jg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="m/QJMrAv"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 410EF4008E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:54:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9CF3A4E41129;
 Sat,  3 Oct 2026 12:54:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 72730604FF;
 Sat,  3 Oct 2026 12:54:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B9ABD10328318; 
 Sat,  3 Oct 2026 14:54:40 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:54:40 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asD7DOW3ncYfq7SY@windsurf>
References: <20261003084453.545653-33-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-33-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-werkzeug: bump to
 version 3.1.9
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

On Sat, Oct 03, 2026 at 02:44:18AM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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
