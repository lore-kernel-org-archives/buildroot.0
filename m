Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E4CC982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 21:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C6408085A;
	Wed, 16 Sep 2026 21:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OrlTwzPRhMAh; Wed, 16 Sep 2026 21:28:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 672C080A75
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789594091;
	b=Ad/xLmjbw1ssXF0sFQcBwXy7NUSbjV24PntKOKI4Akux49LHysOU/gmURWelrprey3kL
	 aj1IoOSvbYdetdg1C04Tg0hT/rn0Ay8bCSxA5d88puHxWMHCTszCLKeIGnYqU6qW99Tpm
	 2CCO0eJbiJQ6FJRJB0+nl0K3tjxGedXerNTf98maMeP+aBIwSp3PNTqZskPWkFbRwUhX0
	 PdQvyQm+8FLy/7OoBjMdlQG4kmPZvcdNtTDvsFzI6WUpa5+/EOZ957ENc1LS7+aQBicpf
	 65BSN1NvDEdp1XcU0JejHxu1E5Vn8Ffw05Yo9YmrH/tzHDrpF8TAHMiwn22/hCJTO5Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789594091;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6f0QKWNWEwLveie+hAo4oPm7n+C4njBQzbtywAfP14I=;
	b=fWyl3Vd8ZFVxqgngLrKbDSstUPbj+DpjZ37D4TIPKa8jFJjbqcSEqMiQj7Lix2DqdIoX
	 gfEcJVQUFWIJxAnP8uPqqEW9nklsS/m9+MtQDSZNekOwLHrVGYvA9GqMcVtApFOsDidT2
	 dHHC8GtpRbZCIRJ6ls1VrHC9mLcULRW3KBGT0L3TIko5Kl5SrRDXGTIoJkXq26YM5lmOt
	 XkJNMjG7D5C269k9xR9a+2z4/lM1oXBVoOsgQkdpb11GXztWpsSMMybIdUm4O0iHY1sEi
	 DFhMQNif8sx4veYa0vBwND+INImigZ3pSb02dYQ2Hcg0Ox7qdGm39BFKV+9Ax5ECjlg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789594091;
	bh=6f0QKWNWEwLveie+hAo4oPm7n+C4njBQzbtywAfP14I=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KQEzN4lPaxfnc2rwLuPrI7e+m8Rqaq1LRmBmPD4fUmPPH6YZjZjvQWIcpBHqys/GV
	 3a/SP6I75f/EmtGtxolxM8+74i2oaf6ygab9VUw4LHdjZh0eON//BDBiQBUrVBIjnj
	 iGG998qv0DN/4T7YMFFHzlHooKHaERxZ8GhkzvrX4Yn59wqaf6z1XyThUW2RDGkX8c
	 UlKg8QDd1mM7yZ4aQVJddwEV8S+iScO43acqgjj8GDWnulufJAbuNWgd+ybQd80GWB
	 j1dxuLlJlFPOZSfYY7tF5C47FOJrLDCrponNmOqn/067sA/syx28J0Igw/8ME54QOO
	 XxecESkUsMSjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 672C080A75;
	Wed, 16 Sep 2026 21:28:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 929482E3
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FF67406A0
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mgGXg4yB3dDQ for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 21:28:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A72A1404EE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789594088;
 b=c23oOpOJYtuK3ClLa0CrbjOtgEdjPm+6J1VDvjTsUl2daoq9nRiNK8RkIkCe/XarI3yL
 vud/h74GBD8j+xpLbGbqfh2RlNz3UzMgXNIFYsJdLQsUB0vemX/92TRTeA5xwNixvptdA
 /ixGvd3EWimZvTbANWDefpj2ZDxcETT+SDbO5YCOXAzxz26MPgrdbEZ+M9Wt1RklLXKzQ
 1ovsx1cC3vhpKOHml8hr9Zj0ZToG/66CPSQV+L3KINRy18Li6jmpvKWPM6lYOnldw6xLs
 YuUc6RFm+bPItF2guN1cszSsyQ+GPytbR8hKu9xu7qXHEbQN7cjgePTR+uAnECmYaXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789594088;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ZEC/5Q5vn4EdbIvacwhPmVyyh9sUUJ5q3Q/pPKHltDQ=;
 b=njCpkAMjV/eqx2qYD2CA062Cn6EvFjYc7KXut7q+ZxbZpn/c1W4tnVmDjd1e1/xViaR/
 DYDImiToiMVpU8R0q4BPxJhybzjFeR79nmDPVVCL0kNhSChGHtCYNlX+htqk3L/tC6raj
 ziv+mLPuLMLWYridLDLzb8FL1lY/k2ok5AgMSpEE8eQERKbkwHYAmkf4byNSYr8TP1aTz
 fbrxRSmLh2k9txKahYFfBOeP+lwFvHrQYklS6D5GeZKjpgs0TrFXiq/3LqJNZtGFasuWL
 hS6b3nB02KTSY9DDR6YuyrnXDrGIJoId/P3VGgIqoNQwg72nKWjCmaFw5bxImQamREA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=XMgiVtSA; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A72A1404EE
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:28:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6B82E4E40754
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:28:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3FC1760337;
 Wed, 16 Sep 2026 21:28:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9740E11C79EA0; 
 Wed, 16 Sep 2026 23:28:01 +0200 (CEST)
Date: Wed, 16 Sep 2026 23:28:01 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <aqsJ2tDgLO_xgUrJ@windsurf>
References: <20260905144548.61238-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260905144548.61238-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_erlang: new
 runtime test
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

On Sat, Sep 05, 2026 at 04:45:48PM +0200, Julien Olivain via buildroot wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

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
