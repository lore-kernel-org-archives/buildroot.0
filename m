Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBEDC982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 21:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3A6E4040C;
	Wed, 16 Sep 2026 21:23:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7MmWEkIXzDPh; Wed, 16 Sep 2026 21:23:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 23E7F40411
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789593781;
	b=bfr4m+SF+BUDUFHu+1xScRDR7zWfai3Q5gKcRD129vyygWzjTz4yDUaBa4vDcyIl1eN/
	 g1vt7T743MN9XBDvLIXSTzBlBibGRQjl1HAjCvqAVgklzqpQyFVDtm7PL2poGwoKJFM62
	 M2t/yP0nPSqmd5qD2S403MnOxeZIM2QrH+JhPvQaqpJHr/n/Rq/032qcBGYu9Z+BJZ7XG
	 zcvGvH3zQkHQGjLoG8FNQCvpa5KaHunJ1QIJtSf03AOPC0jxE0S2T+TUcMuLzKWnQLKAr
	 Uv9sIX4QdKqE7V1g/OeipXYbTf/zwtN0QSZjbMJ37WKIcXQfET1WRSY8hxev6oCLHyQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789593781;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=HgLeyQnfMagM9ZIEm6YxDDV1WRQ50Xy5pmY1304c0os=;
	b=f+NzZCm3E31AIkVxcnoAS85C/tQomVdvD3IHlwSlad5hFrfAP27bdbuIqKsdetbz2tTE
	 91LKyTACLOA7t3fHEcYjV8cwQbyxv2K38fTl7VRg7bV0/Er6QKAsflz8gFtdyEaAIMzkl
	 JdmHLME4kTgcFK9f0hwq1JPljCThNsGYuIYLBxLT5LS+O71oHKFaztuiFCwy4ISc1Q6VF
	 Bo3mdLOezZnZ1tlnSn0nbAi1aBjeuRvDMv6FC+9IRzPztSyrfTlajpiO+m+jpxFVIHZHp
	 CoA1alBHyOrujfxT4mn0PLmsXCZQZ3tjgDGsH+pTByp5UXsYo0tyhlEBZ8xXLwyVlbA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789593781;
	bh=HgLeyQnfMagM9ZIEm6YxDDV1WRQ50Xy5pmY1304c0os=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Vqq3/GDFaL4nw6pqjTUMmLjwo6Yt3j+Mcr8HoLjDTLRiUZnMjwh6z0ZATQcc1YYU1
	 CLbMhKvCz/+ttUkmNLqp16/FTfb4vCOF9PGh8XJYaPDYePD+IOiAfSkQ7eiUXdCDOS
	 ybYAYx4q8gWWPGFk3MH9Pwpa8MkWNSEaEkWOjBXSrZ3TvXRjwR33ZeXcA0tQ7FewfO
	 iighAkOsY4AkAD4vQqrNJKylvK7FzmloZlffHxh1vBrPtMgKVgjzhataNuj6mKqCu3
	 A21Vt2zE6k/3pCH8QZUx2IxKo/NNpuBNFZLBPR1goWlqT3x9Yd39X5fg0Ts+7UZ1pw
	 YReO4MD0KyD+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23E7F40411;
	Wed, 16 Sep 2026 21:23:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D01B2E3
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 137A740411
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RJQZjcN-3d4l for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 21:22:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2FA824040C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789593779;
 b=AvcvST3Lj6gdemGX9TlD2nUlVunJMvniJDEHldM8+c4p4B6vk6nDS5suhWa/gu2DcCpv
 m93SPrDi9+QfstebSiFeu0uY6nL1LxR5k02h4sMpSKb3xSxlISyofQmwRa5eyxgY7596m
 I9WRD8pCtlmoeGHipa/jgjwdEqyvf0yPqOsQIhxRLfVCbjhsZPwZO6FMhgtAdlj+j5xeN
 XOR6oLyKMJGOupTiVUeY9q/6bOECgRzL8g0QaH5ISOljdLaUhEuP4RHhKojQUxdfUL/ja
 PBev17zcTH8X+8b1kaND4ioH2UPwYL/tqmFKCsc1iWLswRREU7IGSuV1UoTat8vZWOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789593779;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=mhoJ8w0hFBAFkQ8qf3cl7ZFJ91wZN3IE4bpNqiStTH4=;
 b=lfNYjsjrkfdiumCnlcICsnm8cw7sSejpafR3yYWd0ptbTWh+0nyj63qVR5hjpKx+dI5d
 dzp7VfgLg5KFudf7kNtTKv6rbpr/I20q9ja5X9POb6s+zo68IKRLGaw39E8MH0+ojJV2k
 cJmlWKRpNiaOh0bIbRrd7M5xeQNo9uCrc41hevVrSO5PsToYNC8QIuqMpLtmZe9LPweCw
 BWua4mvdxJNaB6tL2QvSMMtB6I+XAzNNRRX83V9ns7yTLZPeo8TQWpcYDtTBy8XB+a3eG
 aseCL+QDfJDyrHiuOimRfCeaU9GQRhQQRaadzQlnqPdC4PiCaCb2CeGc8v/4Xpsw05g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=McOsEpM1; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FA824040C
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:22:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 013291A0903;
 Wed, 16 Sep 2026 21:22:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BAD6E60337;
 Wed, 16 Sep 2026 21:22:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 02BCD11C79AB4; 
 Wed, 16 Sep 2026 23:22:51 +0200 (CEST)
Date: Wed, 16 Sep 2026 23:22:51 +0200
To: agennart <antoine.gennart@quimesis.be>
Cc: buildroot@buildroot.org
Message-ID: <aqsIPwc1ZeVxBlb4@windsurf>
References: <20260916130840.881186-1-antoine.gennart@quimesis.be>
 <20260916130840.881186-2-antoine.gennart@quimesis.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260916130840.881186-2-antoine.gennart@quimesis.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] package/nxp-bt-wifi-firmware: add IW610
 USB support
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

Ah, here is your PATCH 2/2 :-)

On Wed, Sep 16, 2026 at 03:08:39PM +0200, agennart wrote:
> The IW610 module is also available with a USB host interface, while the
> current package only supports its SDIO firmware.
> 
> Bump the firmware release to lf-6.18.20_2.0.0, which
> provides the FwImage_IW610_USB firmware, and add a dedicated
> BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW610_USB option.
> 
> The new release also moves firmware files out of the nxp/ directory
> and no longer provides 8801 or 8997 firmware. Update the installation
> paths, make the existing IW610 option explicitly SDIO, and retain legacy
> configuration handling for removed or renamed options.

Need a Signed-off-by line, and a From: line properly formatted.

But I'm concerned about firmware files having disappeared
entirely. What do we propose to the people who do have 8801 or 8997
devices? I mean NXP might decide they don't care about those people,
but those people might still have HW in the field that uses those
devices. Should we still support the old NXP firmware release to
provide an option to those people? Or are those firmware files dropped
because 8801 and 8897 were never sold on the market?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
