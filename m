Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615BDCC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 20:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2082B811FE;
	Thu, 15 Oct 2026 20:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PvY3O2F5x-NR; Thu, 15 Oct 2026 20:02:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E5632811EC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792094539;
	b=sEhcAEv4aseiXSUu5SeuciE6GOztoOKANF6XQXu+Sxa016eExNJVGE/Erq/OSfIQqgJ1
	 W7i5PFJZdfvQlc32dbfheYO0DZ8AZhinO4hNnXZ/yrpke2DnVpa3Mz9CX9w5JVdlvW97A
	 neIFPjVV+CLJI6O7hxhz1QgqvmoB/c6qHRSccg7mkXlDSJULbP2Wm03T1elo2j8gGZB7A
	 IL9J2UC+Z9H1eS4Dp8ECqOslJx4ZWxwOZL3DNgV5mn4v5i+6YIZRurpELpgGEcLq2gVB/
	 xsZFqDMbFzsZ038z//H4DLsfVp4kjzYiJwDdfHL0Jql1YqNS3tHQHbtoeuGv0mAyEHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792094539;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0D6hNFl//A/MaQBz7ebWuxIPEZEfRScjtOia8Z7geMA=;
	b=LP4jZbSmfKtvDOqzgr2u6nMvvBZraPd/SHNl44Zq7FWil/Etn6dSgo+v8RzGWeJkvMF2
	 2uqE/tiBaVHRQy9O8XBszN2VxJy+loY8etUCBARrPQ8DqP0gBlQjluHecXMHlMcdejkn/
	 KgNrOekcnDjtOvxm1XX6gdn8gS2qlOHL+ht4TMVRWRYSy4zcVBfuQqOTUFA5OaNylGdBr
	 LKb6jvize9ceIkAatKQfHInQ5NQdAgo2ULQmpUNICtQAt/AiMt6O6iwv6NYOG7ATQrhm8
	 aLNs7IOV25wOZj/gaLMsRCNGgypHl8+XzMaTcPb5yLqPk2uFIa36r9wsLGTzAFxAgmg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792094539;
	bh=0D6hNFl//A/MaQBz7ebWuxIPEZEfRScjtOia8Z7geMA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hBLzwSUq2zUVfsRArjufwjik5exP7B82QPuO1MfJw5qP8KUjQT9Raxum4CAxQF7NJ
	 DyqA5HyBA4IIgNqeC0BQ/x9J4dLg+EV369SlOGQTdfmd/04+mh9woLGLrOAcxk3r05
	 rckUAIzWCbhegKMQJhVrsg9a1Uh+2jLYkgvt12AnSFNHkcvVmYBB9HWTTtGgBz52ul
	 qY96ucIpQBzVzQzZVXSWGWnUYtFHPa8lKTY3eidFGhk171NCrPRPLNCp7kPby3c7lz
	 qP76XOwdMozyRER8O/616mBDnFH3WJONByt1YJJo8VjmuTmhZu9hhUb0FSnnDf1qyG
	 1DwBJCGZhOI2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5632811EC;
	Thu, 15 Oct 2026 20:02:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 60AAB1AB
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46A91811EC
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3PV0llaakEP7 for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 20:02:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BA4BB811E7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792094536;
 b=lxctxfV7ExZ/1Y3NL3Tx7/4HO+5D5Att1qCskG7Bpccb4HMvzI/g0+WRsgCy3QrkCszw
 jzo9Y2Lh1v1lykLU8pIBdGnwJJIIPHptZjotfpzL50OTAYPUeehseMmjGsrTaLg4u62b6
 MrPJeN1mxdN6z9y3mlqz43NmxXZcmgH0pU6S4J3z665nmF5IibFDBm7U1b4v2BcjpnVaO
 J+SGSpbaPFynwSip+X109yN8P58AkYOMHr+Axeq+E/RxpIocZFyR3MmOKhyMCCS91RJhY
 NC/bGeaBo+DAHV2NxHNDXXggxzWjJ7D7i7F6ph/rXPrjKG2m/5qzthBGXc/xPYmCQiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792094536;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=n5+c6AEuQnPxGM4SJIxQ00hWCx0JFG48HMNMx7sRO9M=;
 b=ifb7E2zHRc7ZK4BG/pVDh/5ztStdgafPvSZlWBkTel45r305vohRSqLILjw2cJCDkayU
 62Oq3M2o6xBv2/Y09mT7AHVhxtvF3VjLJOeYO3dYKoA8R9Xb3BhB3KlO16iJkRqw0X4gr
 GimYz727m1qVT97WXZUKYkMsU9Q+00zyQ8gPvOfj8MOaMQtJqg5tFpI19UHUptjNOe6Xh
 pAm3NfiuawQEAIr0nlQ0VZGSxvd0Y6ZG7OtUTfhVKEAb0wRhFDEO2Wwm8ZLP2t6EPcT9V
 wbCWo5YDwB2vOt3IQUsYEW8kpam+I+bA0b4VgZmbgsLaaXKFpWYbBh+//yuSzEYJIGQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=dt3w2nG3; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA4BB811E7
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:02:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C7160C63449
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:03:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4CCE46075C;
 Thu, 15 Oct 2026 20:02:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6808110328BDA; 
 Thu, 15 Oct 2026 22:02:08 +0200 (CEST)
Date: Thu, 15 Oct 2026 22:02:07 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <atExPO5Qe8qu5Jy4@windsurf>
References: <20261013215216.2460255-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261013215216.2460255-2-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/python-pudb: bump to version 2026.1
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

On Tue, Oct 13, 2026 at 03:52:10PM -0600, James Hilliard wrote:
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
