Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284CDCD6E56
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 17:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D99E860F99;
	Sun, 31 May 2026 17:41:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TonQzc36TfiE; Sun, 31 May 2026 17:41:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 598FA60ED6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780249304;
	bh=JMej/ULy1EbEuAAg+5Z9fCJac+k41Nq/wgmR+NApgsI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fG6Qcs0akIFlkX+Fw/wbp9L2tSFaGfbKh/E2PIziv3oCQynchgEJF/0n4EcxFmb5r
	 WQ819LqomtFBku0ZgSKzo2o3bcTUH+U/PNkmVN1/Bc/AtM/O4avj/Pju3Ra4K0M6+N
	 TyILxLDZk0rjY5DYqvZHi6iFOy1IeBlqrqdznTjD2r+qRivbMtbDRTWu+9+a6gtxq8
	 BuMi+f19SQtnA8OmvvzhP0lQhqQDE+9Mhs/1qxGoEk+WaB+iIH3Tyh4AT9jOOi3U7C
	 dGyujchaxsBbOSaczJ7bws9gltCIFBMoKX9dM80sRI27XtJkSNPyL7ZWU5/p/+4qYo
	 KuDWNVQl/qgsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 598FA60ED6;
	Sun, 31 May 2026 17:41:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 759E9F4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66C3E423E4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uwtibpleca6d for <buildroot@buildroot.org>;
 Sun, 31 May 2026 17:41:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9BBC8423B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BBC8423B6
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9BBC8423B6
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:41:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 06FD5C62471;
 Sun, 31 May 2026 17:41:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 43A4760230;
 Sun, 31 May 2026 17:41:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5D7D810888CC7; 
 Sun, 31 May 2026 19:41:38 +0200 (CEST)
Date: Sun, 31 May 2026 19:41:36 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <ahxyhOJocWOikqEu@windsurf>
References: <20260315064004.10220-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260315064004.10220-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780249298; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=Ok+2HVvqcWHwDk/g5q8r0+lJw8J190LnIun+WLl1ELs=;
 b=2ZNJZYbKZNtiP1jkhzfoBU5Spl4dbk6PvvJP8/SesBxHrUJct/zTGSg6wnUTwcaJoc5LsT
 OGAZwko2lHcKN5aWryU1kBgoZVMkq7vI7kNHQi2+rBz53tcFLE6Xr2jawvF/GhUoK78s8/
 CM6sFVrhjG+atEDR54BT9IYTGxs4G48aPqFEdwUFzyScBh9jp0g74Ou932hu6h90aZ5JAC
 5di5z/q1MBvYqBSjWWfJV6lXgGqkijySe4/CCqKazNHaOZFkNqz9Xs9OhulIgVv2LZ3Qf9
 VyhoKgsBkw7ReDA1dFYSt8NV/zAK+iKPHenbElNo1+BC9Ag0tdxCcJ/R/mYqIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=2ZNJZYbK
Subject: Re: [Buildroot] [PATCH] package/automake: bump version to 1.18.1
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

On Sun, Mar 15, 2026 at 12:10:03PM +0530, Shubham Chakraborty wrote:
> This release fixes the mdate-sh script to ignore SOURCE_DATE_EPOCH,
> which was causing spurious makeinfo rebuilds.

I'm pretty sure this is not the only change between 1.16.5 and 1.18.1.

Also, automake updates tend to break packages, so this needs a bit
more validation. Can you do a Buildroot build with all packages that
have AUTORECONF = YES enabled (or at least a very significant fraction
of them), with your patch applied, to make sure it doesn't cause any
regression?

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
