Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19790CA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2E4C40DD3;
	Fri,  2 Oct 2026 19:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HlAIx2oM_mu4; Fri,  2 Oct 2026 19:25:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D2FBF40DDD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790969135;
	b=RlnQCMacB8/d04vbv/ND/gtgEMcCX+xtLYCawiR0KrGE7mNZaKgs8dRRJAT9jeCYmiPA
	 WI8nmUm3dKPE9ur/pLeWEkifm3jiHPBea+t6WDIrMeon27Rav7gsoCUpShUEvlU/EdufO
	 LXQyvMmlRpmFT9W9FsdMR/EhiiYBhNPq+qsOxgXVwJfPhV/ynl0doqe0G6sq+u5YX8dzG
	 tAtKkFUQWsmZBN7YEFw1LPcrB4NgByeLuQS5FriDJTZ4trfMEaba9dsLPIVXteq730zll
	 38Rgl3gPQTKG1YOYVsIhvpnpiXYcVBZMzpj5p9XQ5WZpRYRb1A63YboQVqEQFK6QOBA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790969135;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6vpQG///kE0Rz3FECDWCeLfp5zEfWY0uHtTBoaqF2MQ=;
	b=jBXWf0lfyXYagqAJCjCdRBg5831pd90uTU2BFfSOj+wzZfgcJla8BBG8r2eAQE4V2GA0
	 XvhlrCmyUkfXPF1yh09rblKZRQIjlz+Igj290RtXjh7yTtz5X4InijmiQnZeD1zBnjgqb
	 sfRIf+iQ++VKqHCr70fwBc3hI8lugxTW7KizpB8PksMZaKWDIU0JzpD6kVgWCvcqZb/qo
	 tsmYw1bmoSipNWPXuS/ViqaQLCQvuoZBBijA4kAVeD3VeVMtFW5Iu4tXceB4FMqPlQ+gf
	 eNkwkyBKry/youn7nLJfA6Pqj/dE4fFpyr/RKjJ0sr5LFljJDdGRppSjlS4xsE1KFXA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790969134;
	bh=6vpQG///kE0Rz3FECDWCeLfp5zEfWY0uHtTBoaqF2MQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zl/dJE6BgBf37CyHyN1f75DP4wwu+WXjVtu3eF3yQBpgm7TUCEjUNts3FIJCk1xZZ
	 8bT6fvqjKQxrjbXdomEV1cFMODpKwOWP7zHH52CB/cn0Xih6rw+HqyfCgkGXykgAe+
	 1s6C/vgrUfco4tfxOw5qsVG2cEVFH3//g45xkyf3IefhpP1zWkX8k3xfjGBiJBwwTI
	 Y7gz6hxilwZeq4RdcmFuFpsf/aSLPcaR5f2Q4bN+rvVAGCGehbOKhzjsLR8lRMOVb1
	 nDDpSMWoqki7LMISom/JDtCNL2B2CdsUH5uU3327nQSfPiAXxfSIzXAYm78GDqfQFo
	 eLXrslm8V/tdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2FBF40DDD;
	Fri,  2 Oct 2026 19:25:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E132B282
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5ADA8121D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lXycIzApK-Vb for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:25:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8C4B680F2F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790969132;
 b=gsGV/y7RzZ3hFDY+uru0nYVvbULnSb5MBBb5AIebhvq3yVA7wkVZikHdYpQWr+HQqzix
 TfBSqrT9Kr6jX7M09uwtCAR19ASFjQewLXnVUc0VXhkEYZ8hrOx69ODoO7KIPUNwq7g8f
 3yJTCOs1qmlSfAU2mF/p6edRE2lir0a2GNzhCQWYORyq3G8K5KmtXGfwdhRXmUALyeEdE
 UyfQJ39PfVH8iVkzJZcyix4MR45diofUr/lBmseHLmECQmLII3a1FBjSBGR6tKlwcFxGV
 dPwTxba8aLP7Cgtp9tzmxO9JO22LL4CoY2tEkfiRdNAnkp9+PM8rQO4FMsP0P4pWvJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790969132;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=bxT+l3BCJ3lMaT9ssp4OzmkkFGqB97SdsjXlrbKU22I=;
 b=Z5JCOGjnrx8pPgBOreyzkKLQiF5FFsXI7T8c3wI2WBcnik2Gno488IRVaqkgWpwjTqQb
 B809BMcfsz1A7YioqiMfNpW8obJO4JQ4ixA5PU6PfpsGku1NfjPEjxpp8/PS/pwrASSNY
 d44iE7XrE+wZgn4LIyFYmrfw7ZwMIbHTKsoK5pQzgGerM8B4pmkSA/YszDnpwJatevHJP
 NXaAmhk7tFRkKlDHucsha/Kq/MocwKbdZrofTSq/1nnYVHwP2EWtTWZsCGix0Do2CsbJX
 9aL5fA4saum2y6nE6+cudfvTI/KV6vtQG0qeOb4nlT0NBwH5jjnfT5mm1wBRDaYagfw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=adzqpL4T; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C4B680F2F
 for <buildroot@busybox.net>; Fri,  2 Oct 2026 19:25:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D734D4E41111;
 Fri,  2 Oct 2026 19:25:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A543B603DC;
 Fri,  2 Oct 2026 19:25:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E2091103281E6; 
 Fri,  2 Oct 2026 21:25:24 +0200 (CEST)
Date: Fri, 2 Oct 2026 21:25:24 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
Message-ID: <asAFH11aydwjZ--B@windsurf>
References: <20261002054253.51517-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002054253.51517-1-francois.perrad.86@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/janet: bump to version 1.42.1
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

On Fri, Oct 02, 2026 at 07:42:53AM +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

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
