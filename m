Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E65CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C1B980D89;
	Sun,  4 Oct 2026 16:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYZf0UUKFZxe; Sun,  4 Oct 2026 16:09:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 944B180D93
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130146;
	b=ViG0EiZUDAtUNrSpd8f/ijq62wj38za7dJd21tGDK52QNM/Su79huFtvNe7YEsYnZMM9
	 UMdssQO8qy7mJyK6VF01umAuAKRs809/yo6DlTn2/BvhyvtNOVdJNvprkxPNnopN6s1Hq
	 ayZoyRQCIh93MnEI8mvAtX0p2IFtNLx4wx0R7rM58dcEIwk/nFHtM7kMgUxhOlgN9ddzW
	 F1P5orNCm2H6376OGRQ7BNO+AGvHdCvIfluEBjckpUXsGIxjWi2scvUyDtaSontbcizZt
	 vNDzwL6YPPxECelmH2UanGrX2A8FnKWcVHsT9F3YGnW0afAfIQCQxNBnlT82yNmf5SA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130146;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ie2H6Ehphj22c4FXKmAv5zl5+W+dqpCOJ/+lFA19Ygs=;
	b=ZnOzr0tBHWMAvEEb8af0CI5ofdH0fCNvcKEHaEA5QZ2aKkm6QX/ziJPvj+PAuWkEAHt0
	 6zaCLBSeAw+2c1Q8kab/v+gyukdm98Gtu76wwNTz8Buw8KIO6MqIlTkQruilSg5u6QxQR
	 3eQs2cDDQuxD+RtyVql3jdzM193StvxipfZ4XTwuEAQa7qYlLXqZ8XyUy8GytZmDdE5wN
	 4G1aOj+1D4cOnys+d/AI+zZSKW0nUWdxlPHdP/NePEkux1kdAEUYT3EouMuC+fEz9OaXX
	 XfOJTpNGy6rVD0+J2+NR8IDlotlX380w/Pzyoqw6dVjCjkmjs1PcHc1J1A8fVoIjlRQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130146;
	bh=ie2H6Ehphj22c4FXKmAv5zl5+W+dqpCOJ/+lFA19Ygs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Vtqf6+ITBtYu2UjOuLtVBTJTX1eJkcEzSTVfHesMVCzRDikk319w2QIB9dJlMC/2O
	 P1uCeK4GWf7ohovkiyJEnj9lHqhYOXv2D0Gd/A09QQbIRKK5khdz52DV1MC2BfmFoG
	 k5AvoOH4AdUMwks7UodF2PDqKkGXBcYE9ZUoXhJvX7gr59uEVUA5yeytqtMMkVY1Pt
	 Lm0yBwGOkDwURmqYYf9VVzJk72A3nmdcWwi2oLNS5medrFfQqog4ymLroY2AFcmjUH
	 tRDku0ncuvw3lmyV5tHOY0cDjLtggpFAI/vGsQ5/uhl13SZf09jaBoZSa4BO0BftjZ
	 otYByhq1zIuLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 944B180D93;
	Sun,  4 Oct 2026 16:09:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1069E2E0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 024E840049
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IxtTzvpHxWVf for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:09:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 30AE940068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130144;
 b=CQr7/mFTRzToxG4qZgS9KACJTzAHZia3PdvNfT4vBCWP8TsketOGmcG4281ntmrUdJaF
 PMupqAOTUxCF6a8Q6Ld6k9Tg8Co9guSu4eHbhFNLO/G8PeVXtwDvJ2qkFdi9XGyN9acXX
 PnCZBaTO02nImV2n8LuGJvlfibsg+PPPGTAI5EjceKhV2KLItzb8kM8n41+rLTwogpDXb
 1HDUHLoi8qI29/0CJ2ICpAKbJQoaLXc6bZemK6eapjago2XwZJ4oXiixUQVgyiTbe2kjp
 Oi0M7GtoyA5zYtgk2S8p4OGCNZPMRgC/cHLTxtm1nEeo5+5j3rsud+/MDRVndn92azA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130144;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=+ErIhCDop2PuUBHRvMGt4YwYoAt9RqFYUQnmj0T0zPg=;
 b=V1mdlZ9eJVHhBvndvDN2OA+rYW4rO+X+QfN+OX1CFNdquGSlNXiMPC81e7D0Iwfp5Yyc
 6A+JgoibCOi9VWXAOmY0FKBwepCSUbOdpMPWNFAWifIxP+/LLUkFPCYZnfNSAp1eWTPvD
 cZMqB0R4yQSobfj5YxQFfYi1ucsJqRqxtttKphOJ6RhSEPXyhKga1yGFhJRiOJYv6UQDw
 ValTXOuySfQfO5dlWT9rU8X15z1ow+1LWOC4HJbQAZU6KdX0W2Knu73wKlH8zF8/OzVXZ
 YHHGQ11ghZWv55UscGPeNdP1wlCFZlkkKHu3cPGKVaqV1fEEW0JXpxqFDOohlqoVzYg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=IvcTMvEy; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30AE940068
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:09:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 71FDE1A1133
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:09:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 469F7604FE;
 Sun,  4 Oct 2026 16:09:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E98E3103281F4; 
 Sun,  4 Oct 2026 18:09:00 +0200 (CEST)
Date: Sun, 4 Oct 2026 18:09:00 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, 
 Ludovic Desroches <ludovic.desroches@microchip.com>
Message-ID: <asJ6F9EnfTd6iMJt@windsurf>
References: <20261003210833.735937-19-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003210833.735937-19-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-simplejson: bump to
 version 4.2.0
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

On Sat, Oct 03, 2026 at 03:08:09PM -0600, James Hilliard wrote:
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
