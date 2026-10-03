Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3C3CA5FC1
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0713F81218;
	Sat,  3 Oct 2026 12:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vDfJVNPZMDLg; Sat,  3 Oct 2026 12:35:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4680780F77
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791030909;
	b=kfdDoFez0lbcPkoepwnvWvTrIX9U6NEQyv/L7vYoCDuXWPGwQCgronRnWOgggk5CAsJk
	 JQpxu8yJ6EHSqyG2JJzKXOZeK6NDwM04EH6KArHnpiBbyWwAFByYPjzbspmKsI5NtzBuC
	 jahnC21pHic7VfDFcqQdyq2SGHrAExCuCFpRtvEnZqSNVVfby46f81x6Qf3In9pUsqwde
	 ZqSK6KmA/N7cas2sXO/3WTNrf/R2pwiwzjidBYbUBA07k/ZO3OHngjt7B8CBfyzFEj66i
	 4Xz6N4q+loRSARQiepQPO+SjP4GVQK4zEBlTfPRYKT+akE2Q1QbSeFZZw4HvUmknHwg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791030909;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sZ35k7bLA0QqDayYabwPGOK6K8Sn9BKEcBzHZffQivs=;
	b=bO52lZBRNABiGH6oiet45zjdG6Gs37n8Vc4VvS+aBO//CGpKr2B/15dXR8fYLG6G4VE2
	 r8+M+0fGy1DqfPbkgJTkaY96MHc0pjq2K8xeKmdkkCEoMTQzofc8x7OYOwDg/Sd6TnXI4
	 CMVvVvYiEhduP/PH+wnFUkbP2He0+X/44IImvos7CXUOB5s4lgPTKY+8ce4TcwDEcucN8
	 FcYc/O09GeKUP/MZCsP2uj/KKaTGbVfyAIhCjPg1eDFza0E+R7YAcYLZSBcJVTQzRJDy2
	 UKm0WkKP+/CoaldDPNFWCIex0LBh6DVUy9YIQOyjoVoYHsyeVmGO5tqUzo+4rh1mjBQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791030909;
	bh=sZ35k7bLA0QqDayYabwPGOK6K8Sn9BKEcBzHZffQivs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Js+Q5khkD6am7qzfYLYae/BvJgFFXtAyPZCzr8pUBNzzF9EcdSyKwwNYpqj0dgqkA
	 FAHDd42lmvgE14OODLrnbcvjX6WAP51d2eCI2SyO2nZtUdrKFbVyhh0mQsd8ZCPjrF
	 cWnSeXfKdgE8jzp5ZcNmecHdmVuK3vOqFJIvAf6b7Oj77CqaacgmqMY/UmalnHv1zW
	 MkZ3QIzmN2KUp3V8ghH3u2dGCVLpqbdqSBbLfmsqMYM3Rr1tv1qTx3EkcX7bVpj2+H
	 ZodNGsRWBlvxGfLWTRw+H/NL1ivr5BlDe/y8JSBVZhbIRDmXZJYQlkK1M78y1tg8eu
	 vRwxe5aeBPOQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4680780F77;
	Sat,  3 Oct 2026 12:35:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CCBC02E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA669412B9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bcCig3peF_wS for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:35:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B979E412B2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791030906;
 b=FHhVvgoC+Oyh7QWw+ZcAalQOmR5CylGmVoWg1lIRpm8IhF5vqoqJb5NOGQoYhXNiBsxW
 NVn61tamcEh/0nrCR7fdNIenOwH6EVgkUjWsBH68wsuYGHASljTlvpRjtrn8mb21dICiE
 5HQR9+nkgbRetVUSwzUh1P1BFL/YxrY57wgfU6fq7kPRJkojpRxtxXNc4Ndp8mieZfFYF
 76Q753y0WvgWbJmHcSV0WfDtrZgfJsAo6hKnhkyjLagMW+lN4XOC8KVVxbmqowhS+Plf5
 UXZtTpj9TNFhMxg3yvitti0+ACyvzS3FgEmYmc98AWImkDnGINw8TwLRkn3w3ULyvYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791030906;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=2z0x0VNhG1+lov+vA9rKMfDU6fc4Fo1iG3pyYWFCcF0=;
 b=spne2HiD8+H5+W0DjYiVwyFnMGHrSAbwAyXtzpg77ylLBfL9QxzHHqEDvhpRShT5OYgW
 Psw9svXyd82rY8S2xjYBziYAt2jhh3/3FIzo7tvPyVtsDfkFomekrYQQlPsx3WW1E/t7E
 I0FjzXfAxom1m439jvmqvFatb4VsuOuYCYrahM8QyXf7f83bDkHAb8xrXAikZkVOlRNpd
 zmzrJhE3M54v3NJcroK+KbjFflRzsmpT6J80CeBixz5fhR6GxgnOub1NnFqgu6YPGvIcw
 6JteqislDRcNUDVI/SI0KgEJUEPK4pF3bW4ElX84AlPh6Gj0MCLU+aL1JZP9Ro1+fiA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=CK0c5ddD; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B979E412B2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:35:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A60D94E41128;
 Sat,  3 Oct 2026 12:35:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6CCC3604FF;
 Sat,  3 Oct 2026 12:35:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7F0E610328366; 
 Sat,  3 Oct 2026 14:34:59 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:34:58 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asD2bhSqD3TyESjj@windsurf>
References: <20261003084453.545653-7-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-7-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ecdsa: bump to version
 0.19.2
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

On Sat, Oct 03, 2026 at 02:43:52AM -0600, James Hilliard wrote:
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
