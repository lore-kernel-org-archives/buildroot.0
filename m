Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F38BCA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04528606F3;
	Sun,  4 Oct 2026 16:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zBJNX0gYm5p; Sun,  4 Oct 2026 16:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1B1A460668
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130110;
	b=R3NQfxA1M70dx3NQCZJZLT6I6WFfewWvD0dO88Cz4xqWSRcEl+UKCYYAbCILf1BoTFZe
	 mpn5SZ1MXzoZe4v0RQUkdwu44eOsSTA4Ck6e3keg3Z/XFUI6Xa5btfwHi8xc/iz/Jk/Lk
	 AWLayNevZYk1G1gkNacrO4i2UIrwsBJmYLacqtuE+kDjIzT+I7oGu4UHqad2B2blVbEtw
	 UUy//v6knHQ12AWDvPLLPSKqhVxRMWHL8Ou/9m3NBzoFicAaxzDddLYIBeY9Md9MnxpZ+
	 YO8DhcG3lrFLkr+dCFCdAG7nPiBpL3Jcdd2HBR3mspceAeRHgn7PJOU8H8FyvAiv7nw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130110;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QNDKLfQkGg5+Xr5y/ApMKYBEVnTTmVbcGIRALbfqT0U=;
	b=l8sopi2kzNCKc7CGqY8Lcn2aWE0RS8Cl49v5GD7ki0P+ku7XKwO5LrCOJ7CnVKAUKMpN
	 eRYkzlOWGS5zv/T0ZB/OBG/8J63aDBce33jb0WpcMMtm5ZHv2t4dtn4+Ga2YhnAcvi6JR
	 uyRRiRPWGk6tCxKS82TB/BMp1C2DOpqtnnmjtk0zhrx1IBCErTUDR1bysB3UEy5MoR0fm
	 U6doXAHzAeRlyH11weuHZD+xFP3Lm/WiIOYbWj9SAhdoBVrmhvH+0d6GtbAhuYpMfyvP7
	 BEI/qijtHKW0tyfTFUSo7bT6czmWYibpTRQm/BDd20FfGGTfe54wKT4V+yuLCDi90yg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130110;
	bh=QNDKLfQkGg5+Xr5y/ApMKYBEVnTTmVbcGIRALbfqT0U=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jyscIXmI4/1zR8RZJn4u6YMmEr+S4RcpwFtqhuJFRkrQVjj3CvFCcYLAdnjv9ucdk
	 3rQdVutz2h2hB5dC8frkEbi/SodxB1YDk4iBXUoXiBzgX6v13nCkVnLVk6tMz5J6KT
	 tv1gEwWYoHiWghMkcTWwIKwIr1FY7wgt/qDpThj9/jqlAE1oyjHKJCClvHAva4Uswh
	 UUZ3WIcdWHdEQ05JU6ZJbyAn+gdFRl0WQ9ZvCnscaZSQd+xucNBbz2xS7QdWsMr9Km
	 eERwe/SHaNAS3KG9iS5APUEBxDGC2RsXAy9eyLKvhwbgIktkj2dck396qUaWIfMaPW
	 UD+K/Qf7RCxeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B1A460668;
	Sun,  4 Oct 2026 16:08:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2600134E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBD5B40049
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id liv0Mv9CQ73G for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:08:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 03A4C40068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130107;
 b=KXgQlcVVfI/khck7BYbjxyu8KSup83kSKBgSYIU0NT2G0cEhyUJZTRoWGyS+VzV6zS0z
 Xc4Mne3OeTSJL81Bmh6yHAQuIl1pOaNp39Toh7G8wWBAa+GH69Y+siV8FE7oT+023fSN4
 K+V4fmKDNPlFsHQgsGRRvq2sAEVxXwpgtDt/dIPzPxXg/kEfdT+EkDkr031vJBBu9Brhy
 9KJZIBjnfLL4n8yYCjDT9Nm2kUAxWlNTy70bTVJPI4XVk+YvdAH9Jg+H8YfVHq+JPODBz
 mpSjPewZOYvrHBrFockp1kVMGzMaVRdANE1vLC3FBopHgZf96DbYHOoIg8pDMJfK6VA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130107;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Ie704y/S24M59CRLSlfHqfkHxdbKRD6FVcZVH0QKO0s=;
 b=McLe/h2qxnVbbDxxnTAp6rKRMh9DdXTZ3Eh+812SWTMxnq/Sf0ZA77RWkfh/iIcPEqR8
 IyThXyMrQ6yp4Mnl9Ydkt8dtO6TKkphhRULgjFscnZ+oeAsdNDsd/Ab4AG0eMmww2u7pb
 yI7sDlm7kfyZLEkH93oeKbkS3y9KwUWghXn7A9dhbFn2MLJp4JXFrKsyrRzzRTgjd+JwN
 SdJLWsD8LkQi1JxH6E48ol8dYHmAY6Ycz6BuWe2jlFIps2jPzYMVZnjW68Ty30FaFAKZM
 Pz6VzSxaiViIC8BI8oSFh+URfMcohlcCC4rtaq6WhzMNvnEyE8V5dU9o4hMKCOs6bVA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=OuFQC2A8; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03A4C40068
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:08:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BCA084E4115C;
 Sun,  4 Oct 2026 16:08:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8BFFD604FE;
 Sun,  4 Oct 2026 16:08:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B5C14103281F4; 
 Sun,  4 Oct 2026 18:08:23 +0200 (CEST)
Date: Sun, 4 Oct 2026 18:08:22 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asJ58Whnp1B-O4WE@windsurf>
References: <20261003210833.735937-15-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003210833.735937-15-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyspnego: bump to
 version 0.12.3
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

On Sat, Oct 03, 2026 at 03:08:05PM -0600, James Hilliard wrote:
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
