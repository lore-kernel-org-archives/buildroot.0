Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC393CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF89280D50;
	Sun,  4 Oct 2026 16:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SHKF-yLVuBKZ; Sun,  4 Oct 2026 16:00:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EB31D80D1B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129632;
	b=D1kvb5953Wwoq3lHVQ2oM1AnqRQDstWzBmEsx/7asedGN/uCNAxfXvHIV6r0jWj6VFL7
	 mHJTTNEq7rFbJZAyW8Ej0YN/5fwHMS0bcxrEHCKXniQXo7GKN4UkwwpZGqcFBPg5uQF1g
	 GcpTw9dc5Tnjuy/8cQB+41ukTSFs76H+dmNCexbLTqMmSNWzRiPI+kqpB0v6HQLXK+43U
	 /+ntgRXY+GV0a1UPeQRx0ksUGgSRlv3M9Cr3Zv9B+ZMmei6Jrsk6OqTlFtyBWl6gc+zJj
	 EA1c01uRDpAD8ft4kM52Sj6/YjTKIN3u1HRPsgQ+eDIby5N0vVJx+41WC3DXNNgYVnQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129632;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FgnzFBhpJExn+qDVhfWNo8ZV6wDsGa60Z8Lc5IK7Olw=;
	b=NC0saIUfK/tBmJ2ICN8cnjUkloOCL6YECiPDiLb2ZFpkFbAZ/vVYopLzzvuuZjOntDwi
	 dPOMW3qfCdxfVodOkY0vjoPG4/XwgPlTqGonc4dN1Yt4t2+dl5rLSH38gJCFZO6dw5V4e
	 DIszoLz5NRsZgJfR0a5aX5klx/4UFTEC5M+cLBx9A06T+vy+b50GCQ/dg1OmdlRM6Mqvh
	 V+KB83lywkEarT+LGEErPPURkaXS0UAFRS4C3wZfZh0cIAr9NvGQClL4A9rO4QmzF0DtX
	 ctWG00gGJHWKBEFZbwAsHZuRTZyE5YXpGibXpu7O8I8ZdHRrY20Rj1MWSTcHb9/qCag==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129632;
	bh=FgnzFBhpJExn+qDVhfWNo8ZV6wDsGa60Z8Lc5IK7Olw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A/krVxz7a/YLW58Snp+rgbUl9G35eXQCyeINGOmn5rEEk0F3gCaAY3z0TyIBxJF0N
	 wHiWV7ubm0zXIui6I5dhQYFn68uIaEdR5F2Mc4WNlk3r3m/SePBn4UEf24fTh1HsgT
	 V3HZYjr1LYS7MW5tK7DlBr1mAdaFwB3tk5PyS27FG3Dd4UMwhEPJEdA/zbbtimlTbV
	 6JCiYELz7WscVW5ittyTJ24bwg8EA22ahswp16uOQgazu4+ZYIbFeaEF0TwcGnj77F
	 DmL4VatkFOV5Rv9A2ghzWyYjqlTOTE7VBo6qlb1/+ImqrGTVqFqpI086JdKNgVfkRr
	 /taFpTRvNPRrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB31D80D1B;
	Sun,  4 Oct 2026 16:00:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB4C232F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B16E180D1B
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1gjQQgC5AKq for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:00:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6460780AF5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129629;
 b=N+e0P6IyWZyJEloqjsauyP4OCmDogeB3XQzulC0aiRwOCfkT9ZD7gCwHJcDWuBpvjZu4
 opeLvkTrAo9xNKotuPrfTgv8DdYYu+83QrNR6uaEpgp/nlWrAtZxcSCt7E16WL4NmVXRE
 dVpx2xSF5CcLAii5zoOh1W+RLjwd/B+HzprZie0BkLOXc6X1nkQvST0S7ON+3sOO8b6c4
 Z75LC0FuZXJ2CjqJnVjuMXENJjtTOgija2d3fH86A5bCyBBIUTAw2xUvnY9xeF7I2At+/
 I7qKm5gWnuDHMCKswRjmoPorXHAu9vjmpIwv5tbc9WNjo/3gY2IgocAbQH7C+/VkyMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129629;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=qyGImKbofM5cYTV5GHG5HjWf1Wtt/dqiedOIOD1vNyE=;
 b=ETPf8syHtwEYk1V+PyYFFQAC/hKwtTPM57Ka66d0vKtfNnRBYKDuN9IfusO19lRCSVpt
 gOoHNF98nlU2ZYPhwvEILcaOwtBpgefmQqVwQIw2joY9RU5z9dHzhBHL9PbP8mc1PZXDw
 VMhPCpgTBCbs+TRsRaa4dtyUg+7lEElB+ZsvOrYSRDF0QKXL5RXU+xe52vDsLwqwRKcqJ
 oLHGdHLl4jqJYudVzIxS/ZWcBZLAAG+GKtJt7LTVkTuusSyRDrS5XwxkFjFPll5O1oU8B
 G0lvXKYd9jO5iNlumyxxO3rrCDD81z7XcpPtqbjuhvbwaRvrrC7PZ9GIAQ+dUCasH3Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=UCliRQmx; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6460780AF5
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:00:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 900B94E41163;
 Sun,  4 Oct 2026 16:00:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 64F0A604FE;
 Sun,  4 Oct 2026 16:00:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 84FE310328192; 
 Sun,  4 Oct 2026 18:00:25 +0200 (CEST)
Date: Sun, 4 Oct 2026 18:00:23 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asJ4Es-Igk9Q7nDf@windsurf>
References: <20261003210833.735937-3-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003210833.735937-3-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-filelock: bump to
 version 4.0.9
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

On Sat, Oct 03, 2026 at 03:07:53PM -0600, James Hilliard wrote:
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
