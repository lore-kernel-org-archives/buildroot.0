Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA49CA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69C6380DF0;
	Sun,  4 Oct 2026 16:08:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N5lp3UqN_8KR; Sun,  4 Oct 2026 16:08:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A776C80E2E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130098;
	b=nCzHbpTGHP+PpnUjUQJaziPw7VL+EAzhMecAG8rkvQLjEqKu63DcAXrjt7vEbLLFIfm7
	 0Hv0hQRCE6ufvF+Xt3vjlsZjLMniGcyAIXgvB6BKWjZVdsmS/Yuxvwe4dIKipVElXq32y
	 rlDREigf6WoY6WMESNegxg6/kXcccxl71KcZKb2o8Edjkbd50zpnhcguj8ct7h7dDXT+K
	 y5KsM0jOTxu77keKpLY/+nuNSfTxa9QJDVFobOsQQA1/T4zEFKMDtqn6xs3o6g+kfVA6r
	 +3+t8ve9W+TZHO+bXw9tDBCCaGbrnaV3ehd46ZmFULipl8HKq5/N0SL2/6FfhSVQFUw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130098;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ovU1ydiTWExKUsEe3+5kQt5PkvMBsu5LfV17kw4Bej4=;
	b=GpnV71i8HSfQeJcHd8i6WKSSGm7Rl+/0wull6IuVLs4g2PDkGV03y94fjkt0oj3lCWDB
	 7J6ZoIMgYSbMxCMulFvRM1Ako+zdemBwca4JevKzCnt9X4pWf5yC3zf09LMxVugV2oI/a
	 EsBSE203Kch4RCNYMtFOSDIC12bWE9QhZS3d+MmfvRH/Gp0IYpsaXBIz2+vJO0SHt/N3n
	 ZP0EPeTEGkmm2QN19rxpCaOS+lrC7B64xGZCj9jbar2VRKMNlo7C9yRopXk1gVRalwOxS
	 pfgRBwofgnB8RRJTWDbpKUy+3zgdlu8Hh6ma97GOxApkm2PJBgpsWwyKEkmBsFoN4SQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130098;
	bh=ovU1ydiTWExKUsEe3+5kQt5PkvMBsu5LfV17kw4Bej4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Hs3lR/dvK7fvUpMn2Ya4H9WxU+/WLujNmjWW/7KT1zNGRcRFNwbwJz9h4qePSC3qk
	 gNBfm1HdHNrcWO5BCWqOmBkoZZr31T5w7xzU2dvbKMDzLoihGMd6ZKnvsyHRjmdnMU
	 2lv+Uw/0QM423uGNAq1xnYB9qnh/1Pg3vlg1+CpDhBf60oawjBkre2cuu9VIUepwCP
	 wLXJrYlumW57DqxxqksXW8fkR8jhNIgdYfJS+OUv4F+zhT+JlUmSQ9mOnGeS8F0qJN
	 ky2pRHMYL9QXJKxE7EDZOigl+LvQ63kV4Feb/vfYD/2uHq/kY7CplahltUcoYG1738
	 niMUlUu1jCaWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A776C80E2E;
	Sun,  4 Oct 2026 16:08:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 428C22E0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 349B8406A5
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Su6lwdypl-v for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:08:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CD4B7406A1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130096;
 b=AY42i5QGw6u2BWELBG5qp9GNmUZ+bRVRcjcOHehL3FF2z0wrip/5/nX64xlPkTtQI+Fp
 LaDLsAX42I2JKOwW0MJAYT4NBYZ2Py69LSvMCxZ+xVhC2Iq6t58AFcB1cNJiIXtbyrKzl
 0W2FbFESgzyVUjh41yv9e8KoMrXNuAQmNnynBmpjFl1MdBKRFctueHXPB5LiDQK6u6UVZ
 gGcesn+BqA2cGJUTq16RADB6umHNYIOrtooSVMm6uKYgtPpTl+eH2sVoS2MDZ3gbeOnEw
 lBCoYUu7d/Vs6cgjvkQZPU3hFTmBJUO3ipXwMTOXgUAG4kI1AT9UVGPYGmpuFUMMQYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130096;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=FmNUIvIXVm93Umg5xS5th2gCiIW9tEyvnee1KPcvDEQ=;
 b=mHb7ools1lEJ9kmZ4mOCqdCC0sFqhR9kql+/Uyq50ZrmACByQGz6tS51+pwbwOQlP5Eu
 9s9IoD8UoWMs3vs5ZJH0xvfp2sKh/UCZX0G2JgPtXCrbJ5H/vjcJJZlRAiAvA7Voix8U+
 sIG74iqGACqtcHePGqrh6ZPn1Sga9VvOuD9s3lvXO3zNM1kfAp+romv8ganws32SI70Wa
 CJl8Clp16wnab7kjQaVYy8U8Va3duKLlJB5ORY+1+Zybboo6BA9YsDDhPgBwjY/vggvdZ
 vcT1JZ8qitsoKz8wGVBDxe9gJmlr5ODZxCRTb7D+APiisD6LNi04su1uFoYwFQjYMMw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=kfvxRxKp; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD4B7406A1
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:08:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B45421A1120
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:08:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 89111604FE;
 Sun,  4 Oct 2026 16:08:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 00B8C103283ED; 
 Sun,  4 Oct 2026 18:08:11 +0200 (CEST)
Date: Sun, 4 Oct 2026 18:08:11 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asJ555-rPU2E80W6@windsurf>
References: <20261003210833.735937-14-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003210833.735937-14-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pysnmp: bump to version
 7.1.30
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

On Sat, Oct 03, 2026 at 03:08:04PM -0600, James Hilliard wrote:
> Update license hash due to copyright year update:
> https://github.com/lextudio/pysnmp/commit/fc678e541972a2f43c2a06f2d373cf6048653728
> 
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
