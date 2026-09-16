Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7D2C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 18:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1B62606A3;
	Wed, 16 Sep 2026 18:46:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SzSwLOcqs7UR; Wed, 16 Sep 2026 18:46:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 322B660633
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789584367;
	b=GfXAY54YTvNKg2Wb2p8Aw2GrLcCC/kxeq2QZffmOy3Tys1Mrvw4eslRL7fQmaGL5eQZP
	 0LWSPIo4ODYA9Iaz6ySOVkvvmri4UbdlFNghUB2u7MIlnZvmdzeK9iBXS5XwK8IuPRE5+
	 raSjiFKmaXWy/6XlZvmmOVcV1b1sfYJX9x2lsaO8t18L1pUwBmeblibgJnCL+Yf5JFLvp
	 PFMEmdNMpSbygNBVFkreLzjnSilFuEVW6mt9X3m76kx0+SPnFH6p8vRF1SYgmrTzXfrh8
	 +2vBe+oW0vhvTshT5Pp83QGVX4gl4cInqW8o0uYK1zTSCROHt1sYEpkdg450oLMjpxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789584367;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=okqXnnsceJzMQ1y8Ae+0JN1RRsb1WpR7OLDeRYzWK80=;
	b=pfRzVa8WMAIIbao2sfBCZg9UagKtoUDoSN4co2xJ+KBu1QFdEqlWNP3q9sZItXSakvBX
	 +tI7S2xTove6zlyPTNJUGPoi0jwhDxiIuadwyVCbcR5hWfsejpuWGZizvAjwvTVlU4vdM
	 btY9BfSGrqiv25XvPxDUK3smhehlfZSwKd1zFzMgLPJgUYQlmF6IxsAalXJBGBF+sppGT
	 jkVfKLmdYYmPdTAfqmSCsTorqdbGFQJ7Q1irRp94mqdc8KPwlrLHdpG9o/ZEGsEEqOatA
	 2PMRPF+rzwUW9sPu9crVupt9nmcXlQMbqcEBMB1uKwqKRwQFdO1J/WYC8UtLW35Hseg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789584367;
	bh=okqXnnsceJzMQ1y8Ae+0JN1RRsb1WpR7OLDeRYzWK80=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ki4frGFEko0k9TL6t0GASrTt2H32xicjvW1PThwKz2ToH11EMVl4wRQMcMuj5PG/z
	 hAouE+QvVKve3liqnpzB5PO/mwZOnyEFuDy5Pjp9qHj7/WGdQMnNjgH9ETnYpPzJk1
	 W3vzhAcX/XHKk6KOp+YpZ5sMCl3Tha02qGAYj742O6ZLXdFM5YaJPl6dIE3u6z4W4/
	 3trVpy8tlTD29m0cRb6v3xAT/DkSxf+65ETQosz0AQPuoSGw7Au1pvHktIpKyryECg
	 6mV7siZJhDoYPnrD8YOxciO2zCjN/O4tHZyzAXS9QtQckQlG6NnCIPQhhzpuZbLmX3
	 D9cXGYuSVZ14w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 322B660633;
	Wed, 16 Sep 2026 18:46:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E9D4B7AD
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F1C240640
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:46:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OtEa4hdXZcOS for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 18:46:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DFC46404E9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789584364;
 b=PZ/ThNoKLaeaTgCK7hVfijZNyZaHmARr05753i/F2+obI3VKnScpH0zx/s0jDEtomyHD
 IEm89sJjhZwktFHy+mEbiDVayJ7EcMILfG1KwqqkAcdVZibrWNdPOL/idnaGCyKfH51Iu
 Ymcelpfk/atMF31ufFUwQcZRp2Rbi3+9xZZb/j/oLruTrS6ujQlXr60TBX2EP6/VOrZ5K
 xjnEkmLqTHbKRARR+ONiBWJSwZOpLqCjvE0LIRu+Cmq2SvroJDDKIJ4/jEJAF4dFQh+aT
 qID0UMXDLaoi9ZVRD39JjNBk1KViOFySy4nyklG8IS3RGs8pTV/nPo9X30yuveTR4yw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789584364;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=+2mtvRICGLswO/ylNOndj6x/5ZhPFWVpPnu+wCoxhnk=;
 b=lY8oPFDH4Kk43OIMu1xrGiF0BdAkaHzZU9x9qnXC7bxHhfU2Lx8RUF4Wpig+1rLmnDwF
 9tkTtcWEp2JLu2gE+uGISEfuoqhv3knHEb2TS090dNmYZoWuCY8jVjZprq9omsVzyGAuZ
 l/b9Ehf1hcx3HUzXWQkrOpP174ciG/c3G/T7iDBenEweU0i4KVUfXzJtlAjX8un05Xn7y
 tcyPnpfwuQ7IzaKUQrGbObPlta75YRkTh4HwYdu8atVIH2TSj4x0OgTYFHHZZi472VXNG
 WHmPC3ynThq/C0jpLhlT467IrczhQyc3+BrhPbtmNAc2r4W8tFedL5EvxQR6tiPInRQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jg+LD6Bd; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFC46404E9
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:46:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CAE7D1A08DB
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:46:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 922F960337;
 Wed, 16 Sep 2026 18:46:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EF4A611C7B048; 
 Wed, 16 Sep 2026 20:45:56 +0200 (CEST)
Date: Wed, 16 Sep 2026 20:45:56 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aqrjb9-8kH4qT1hq@windsurf>
References: <20260914221543.844189-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914221543.844189-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/libdeflate: bump version to 1.26
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

Hello,

On Tue, Sep 15, 2026 at 12:15:43AM +0200, Bernd Kuhls wrote:
> https://github.com/ebiggers/libdeflate/blob/v1.26/NEWS.md

In this, I see "libdeflate now requires a C11 compiler." Doesn't this
mean there is a minimal compiler version needed now? Like gcc 4.7 or
4.8 (not sure)?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
