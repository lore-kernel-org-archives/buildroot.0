Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC830C88E7F
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 19:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C655605E5;
	Wed, 16 Sep 2026 19:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYgc_LYn6Dum; Wed, 16 Sep 2026 19:10:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4CE9360604
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789585840;
	b=MYB0HxG6CdPDqknrk91mNBxPCsDtEWCp8n4Qy9NZSfTvmWKP214IYUeLcyfb3/ZCYBfh
	 3aSmogPbpJWoM0bLR9mIROBAUn3+1jPX0C9VqXBjFpiB+XyXRvOTchOWn8nXZYGggKyDs
	 MvXfqRj5phE3kMp5+k4ZVuHUizheNOHsF/5/FS6x9LhemW6WVhBmMcAEAt+KXfpZNxC/r
	 uyPuar9Cx3gy9xFkznOvhlY6XP7b+Fb1x+ThpSXjGM+gsOYuB/sbmDYWa6a9l3nLu1VcT
	 AP7Y/RukomuhpLyrdp7jZgR1SCumKN3nmhq+ncfs2k/iYEr70rHIlDGi+Gv24Suw4Kw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789585840;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7d9V0GZ3W/aVhIibYnOkOksouLWMKCxoAX6jAO3yv1E=;
	b=HV8k6cyWp+TZJKSWMcAsUioEjgi+yTUN5ZLVYT/M1+MmaFx/Q0JNdQOp8E2vj/rcbK0Q
	 uXuoiTIwSr5KUhe+uOw5mBd9rqpUphsjreEwf62x1iFF2t3WdGC5ldnwVKrw60yW2TnX6
	 QIIJKEzc4saaq1OkZnh9aIWp2FIU7cJnU7I2ScJ4E6fM22BSEKbhvjzfjaEAMist/st8M
	 6UYtJk3CVEBAjLaYpcJRj58RiMD7NVGMX3dT8GRDhyRSKPcyYtfYII2Mav2t88SNpbqfL
	 Mk5D6y00b0swxIxyJCZ8J1O29z3MEtswXuDV86I9Ny0CC8x4ryce0BsF7ozCn0Ot2Ng==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789585840;
	bh=7d9V0GZ3W/aVhIibYnOkOksouLWMKCxoAX6jAO3yv1E=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LN5XhV31wFvUrLRbOnWltGulNyo9B3LMOzy98yZ/+6r2hUMreeHxLKvJMT+6L2Yj6
	 qrlqDVWgL+uyZ3HhWt8/uHrWspU5V8N7Ox03Tak2+Jjc4WSM5mZusj4ke6fHT8p1ix
	 IEHhkn5hz9qxEbDp/8Qts3U2RpkqyXp+lDdXICNne2MDWr2h49YtOucVWNVEQPCEXv
	 Q/yYgWIS1y5ty2HCf0R+azlKhYneTrHPDubVCMfqfctgUSf+oGfG/siFRtYva9ElX5
	 15zrppOuQGLpyZM/sw4Q2RkNmqKNMtNSaQBejdCRxnj3EMQTwaqWK0z2YEuN1J/AM6
	 jIcoYzwfyd6kQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CE9360604;
	Wed, 16 Sep 2026 19:10:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A3F76422
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 959DC400B8
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEGid1ULEOBK for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 19:10:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 402BE4006B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789585837;
 b=GfB0/qwMzp5FuTcs4oXnw5sgdLukJZWI17E883sxerTfqHdC+f3qJh2pWRzIUKyis3J1
 nUGx4JfXAdIfAUwocjxflmEUFdxrCUdg/DyHi0DR1ywD4ZpD6LFkfH1jww5I2gsVjH+l+
 rQzF3O35B7nBlcfTIBnLGwdg824WGF3rnxGBUbAjltKFNX7ZNL/dUZ7KcYaIF91mqL4No
 2f9/BWr4d3UM+rDNDFQBs/KWyRZbSr5tRVPaneDb124vXnj3nL3T1EJw0XmthRzIkGohB
 z13cMwdNRWT8/pDjv7XaE3ss8+abLwE74l0H6rADzPpHf48ZNUXuny3QbKAIlM9I6Zw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789585837;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=uHJLJO3JtSy/nfr6M29bSEstSz/It7BlkZe2SrvFoYI=;
 b=greDcuwHJ4f5rYsp4gykedUZ8KflVMAgCx/Kap8IsRHy5aRoIRU7xiboKbI+IAP/NqAh
 S7bg3eGn9dI0CNowzkOCbQVtdnSkxtmi9km7baWnoIDBkAVI0QmwEPrR9rNY6k89Hj7vc
 9S8r9Gue2Gm6C/iTChL2TaM9Wqga2tp7gAvLALkUAJOsZoz0CRk4VV1BnIl76PYTWxU2I
 zCnSxTPQ+e+uzsapU7ufuB0/NQq27Up2U34sCgcnQwV8hwp5DdNczPUfn6gIM9gucMMV1
 M2BVId+Ep2WpGgMPS1OTpWeiXDYvOWEJ+xIhOg7/3RCUNhv2trytCPqtyyyKtFWWaBg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=HCEYRzMB; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 402BE4006B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:10:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D8C914E40747
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:10:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 54A7860337;
 Wed, 16 Sep 2026 19:10:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6843711C7B05E; 
 Wed, 16 Sep 2026 21:10:27 +0200 (CEST)
Date: Wed, 16 Sep 2026 21:10:26 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Philippe Proulx <eeppeliteloop@gmail.com>
Message-ID: <aqrpm58n1tSbsa-J@windsurf>
References: <20260909081345.3114385-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260909081345.3114385-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/4] package/lttng-modules: bump version to
 2.16.0
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

On Wed, Sep 09, 2026 at 10:13:41AM +0200, Bernd Kuhls wrote:
> https://git.lttng.org/?p=lttng-modules.git;a=blob_plain;f=ChangeLog;hb=53eb8c30aa8a8afaf7bc46a9959a94bd0508d18e
> 
> Fixes build errors with newer kernels.
> 
> Please note that the previous 2.14 branch does not support kernel
> versions >= 7.2:
> https://git.lttng.org/?p=lttng-modules.git;a=commitdiff;h=7db42e0238d347eff969c1b1cf66fb5320da1bab
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks!

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
