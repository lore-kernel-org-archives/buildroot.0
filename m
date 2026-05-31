Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F9ECD6E51
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9089D6179B;
	Sun, 31 May 2026 06:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UO6P0evIpu03; Sun, 31 May 2026 06:14:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FEDF61AC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780208049;
	bh=Y3vMUWdhlUTKXlH5zyPmrArydPK4ZFzV6Vjyo+i5n2U=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RGzBbf6Id4FhdKz2ZVi2m1d4ZqjvPJ2J0Snssby+b3Fnh2FEnX7oEtQfUrVdWg6Ph
	 +AwRaKlG7KDo7WfCOEG7HYwkoMAQFAIwa71wxdzMzKaVA8LI7RY6arprheqEuKOE7J
	 RhucUcMlIHAYCP85pTYVeup8rH4rUnWZgRROBtKOrz/YeyoPe3W9XtW1Agmsd0yKcu
	 bWaCdnEtbK4Kgi3O3yi6McuME0NzKAoovN3vFkexNpKgMNrNBujDCpZU5YLpJTV9dU
	 v5ktYWQTrUXGUM53fDGRwu6e1481Y900wR4YkZtclIRPjahsTKPDLk0SDri3s/he+1
	 IbuaqLdDNclMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FEDF61AC4;
	Sun, 31 May 2026 06:14:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CB4D3257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCF25403DA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IeyDPHnIZDE3 for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:14:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AF539402BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF539402BC
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF539402BC
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:14:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6EE411A3764
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:14:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 44F54604EC;
 Sun, 31 May 2026 06:14:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2602F10888CC7; 
 Sun, 31 May 2026 08:14:02 +0200 (CEST)
Date: Sun, 31 May 2026 08:14:01 +0200
To: Jan Havran <havran.jan@email.cz>
Cc: buildroot@buildroot.org, Jagan Teki <jagan@amarulasolutions.com>
Message-ID: <ahvRnmCc6Eyb6Rh7@windsurf>
References: <20260530113540.26204-2-havran.jan@email.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260530113540.26204-2-havran.jan@email.cz>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780208043; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=UW4owrSKWaug0nsjZptu1jdqEV4WZZjYLya9FGMj67s=;
 b=nP48w9c2KXE3kVHC6MGwncnnlFg0ZVfJ1KAKHOPNgrJ5jZ0+cXK2OJXzkLPb5L5MtrHqaJ
 swnS7qRYTUsq9PsM5e7SGDkhJIT+An8sopI2akBPRJ9FTIVbyyQT5G3mLIykC0TCVvXBJH
 Wh1q8WtpxKPB2ffkWWkJHouSAfVKp2vYP4W2N0IyavbGFY3TXazhR3f40SBTkL5umQT8aV
 LfWPgGNPNZAHkzIOA5X4g6/6DjkZgw97JzhPqxYC84IvUbypUmQ5ZzdYJlZq3WVlqLzEPa
 zXtGbRJ3Xdkp5YHs5sKGMttpfT8/BEUtlBcvZAJczTTjvi6eCxz0cZeAN7d0qA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=nP48w9c2
Subject: Re: [Buildroot] [PATCH 1/3] configs/pine64_pinecube: bump to Linux
 6.18.33 and U-Boot 2026.04
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

On Sat, May 30, 2026 at 01:35:39PM +0200, Jan Havran wrote:
> -kernel dts moved to vendor sub-directory
> -U-Boot needs GnuTLS for the mkeficapsule tool
> 
> Signed-off-by: Jan Havran <havran.jan@email.cz>

Thanks a lot, series applied to next!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
