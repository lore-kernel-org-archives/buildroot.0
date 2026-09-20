Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F205AC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 13:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 828A74080D;
	Sun, 20 Sep 2026 13:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1BAFqHoUQZb; Sun, 20 Sep 2026 13:17:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 65153407C2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789910277;
	b=ckrzLtT1DXaUbL1V8SofHyI4KBGeXAr+mDsPHP8bsI+rASWVsFvKM+BexWweuqRUhKbV
	 tnbLWVZeEjU7+mWEsm4njIea7g5wOhcl5w4TbbyUqRigRhocTXbfgqYc//aaUtlyCEa6F
	 akJo0O3SiRhsCR8yGLftiUwJ/vU2egdRvvysF1RiFB2Om0pLLrGCwUItWD0sVrTnBswII
	 G1QRiQlZXg2jtyEUsiPzBmgeQRbRixFzcjnE51zQICGwVRveN9bliruYUmMYw6d23Igsw
	 EbNhKdafTmzoPBgMIFGY4ynboNbHDoHTCtDpO7liu7knqiVN4ABbdSVmdlooQQ1pLrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789910277;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EOCXXaL37xMaP9SpO5g1RUDeLnlE4WJdzwHy1cRh4HQ=;
	b=UD4I6K5BKu72jx4/ZuuK/0Y+8EPUvS1bb0vtVBPcsfn9uXFVoGT7x0e58oGrORJ/CN/1
	 p/HTi5iRF1aA+2KXIt06a1flwyliSAK6KYib55t45eKD1KSiseSBNSeeUB4wQRO14HKKy
	 94MN/D2jIdni+hUvabT4mopDIDomoM4f8FjiTf1I9pol3YpKz0VRmfw0PIIHJpWfEhFAb
	 xdv9I4lX7FHglIuyiNMVnL9WdJfsy1Ik2BkB2PnNDt9QjIz1tWZKw1tgajdbg6GUex3zw
	 F3zixj4OrWs1dlVQbOy+OrGnl+fxyTvZA6Ydwja6IC4oThrsAISh0bhaHOk4w6y5tqQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789910277;
	bh=EOCXXaL37xMaP9SpO5g1RUDeLnlE4WJdzwHy1cRh4HQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xz7J2kHlhWSnV2EUHIobYn7gtZkee5Za+WrlgVMCTvI1INPtCZJsOv8myhX8qxcdu
	 G4ykDFd+hQGS2M2MYXrr1JlGUHFSk3Hzq9zqghdIZVMCn5saMYViGMdGQjj4klmmXe
	 WQddRTZTL2eozogE9EwaBWTzQ0i5DWVMETmEIsUz+CMRlTbDEDPRrdZeLMH4RZKWZX
	 hk+XUeotInrHJx2S91yJqyX1jjIRoWdFNd3sN6+jf1TGXhvvU9UZXYQ0PZKd14s3Qy
	 4IpPSf4cgVuFJlEsNaQwmanyCnW3GCj9Eycw9F+HrEETBlBQEpJimU81Xv2KLmmQYi
	 kVXcJkkLcQBUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65153407C2;
	Sun, 20 Sep 2026 13:17:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2246E392
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 141D8400C7
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I84rs0VzLSdv for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 13:17:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 825284005A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789910274;
 b=jq9PCqfKtdAaSruuQAw7JHdg/LGdjNT9kuiJOl1JZcE8Txr2KraO8ZQbP/qua2gco+NO
 lmyA6xAoNWK6YMDYr5B1Ivagk3MsNgVjHW4DesV/mrEGCBvxXPKS3QdLpRygLRj0s3OOp
 X/FpUQyu/LEpYEaegtofQkYHQQtJnEUdIEa9/OCnEcD60xJDOaKxMQmPq+otAZBM3typ2
 DR4Fg1HGEZHCvt1XfUmzUyEqg+VwWdxs9erdLnsFSYZIOOfX5XzhKbczxmJxGz4NuKOyl
 xJZEUMo5lByF+BoZuNMraRNEVgB97hB0775bN67MekPocz1RIoX/sY8mQF8ryQ1Opgg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789910274;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=U8VhxUhfE4C0wNlnEgYCHLGxnyjW1vJBiWP8Asw7MiA=;
 b=Bt638WiSwa35foBjNCriewWk5/XzQsIOvn+Lfj6TLRsDJ2Pjar85nSBWVA8DnMyQwUvQ
 ojjrY+OTCc4cViRvnjSg2mbPPkMx59gBTBnp93qXC3jA6u/FyizYV/ves+8DjLz9MnpiV
 Wt2aSoesaDoizcLEsY49byvFtccoU0kylTKxpdhGJ/AZ3jomyioA46C1o1+grs1hlHWcU
 +qomYISlztyRECOJzYXmYfwnyPqHs6/GyHl/H+zRfQdNkU3EN37ID0DFw8RFJzjoks/rM
 r+ZFgkZthWPIzBcgqhxcSrNzp46sdBrtau4qXJebAJWfuGiwTlX4x/OqRpfJH/rY22w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=eOe6YtxC; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 825284005A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:17:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id F3FA9C5CD5C;
 Sun, 20 Sep 2026 13:18:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2F634604C9;
 Sun, 20 Sep 2026 13:17:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 65E8A103286A4; 
 Sun, 20 Sep 2026 15:17:47 +0200 (CEST)
Date: Sun, 20 Sep 2026 15:17:44 +0200
To: Franciszek Stachura <fbstachura@gmail.com>
Cc: buildroot@buildroot.org, Sen Hastings <sen@hastings.org>
Message-ID: <aq_c8F2eY0R17PO8@windsurf>
References: <20260920105553.859978-2-fbstachura@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260920105553.859978-2-fbstachura@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] support/scripts/pkg-stats: sort latest
 version by state
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

On Sun, Sep 20, 2026 at 12:55:54PM +0200, Franciszek Stachura wrote:
> pkg-stats columns are sorted either alphabetically or numerically. This
> does not make much sense for the "Latest version" column.
> This commit orders the column by whether the package is up-to-date or
> not.
> 
> Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>

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
