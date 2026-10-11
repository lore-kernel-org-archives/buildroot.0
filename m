Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB58CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F1FE40654;
	Sun, 11 Oct 2026 13:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36gQ7Ys_PXNl; Sun, 11 Oct 2026 13:34:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 58AB640566
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791725687;
	b=KxCDOuKFxI2ni8vc9vlu28sN4uEuKKrAW2Wg4/OtsbtZF5E8oOqNO6bmXdwkgnw38911
	 Is5mxCarVlwE5NF8vfxHvmxp0JOFBnssqU5Xmnqu6w/TAGZPdcdTISEtQ+YeVV/YazOcQ
	 D0nX47B1cewOU+UzqbjS2gvbvyKPECAXdUM5Ml9nhJlXDYExD3m9tMkAMzRXWHb/Wo328
	 WeJyRxD0u1yV5x9xrSlSQkwyH0HAU87L1WIIZTjOCIpiyqBWrXtZ5nwvW9w4eoQ9VLu5l
	 6LVnKlKzpXbYG8+1VU0C78y+VoeT2k4tVqMhs78vRS2eGbgmOQJyRbaKEcXqOpJzqaw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791725687;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uOooiK0VK56DUTDCF76E8Du/hrD+n1QYOrTNXPVfq5g=;
	b=RQRzqjv9eUeFaonM5Q0oyI4si5ZZN7Lg2zFDzSV4cGYrFyjVcOUiuq9dKj7BeRK//HXh
	 VmXxXBC8CjZIb+e0Nnj98KyE5LNk8y5LTZd+tsyl/IZSdhNANsfD8zqAWMEOUKaIGfvua
	 BodrUAiSDe2T53Hiu8mL0Ogldg9L6fl0LlZOHzFHZSRQafGi2kV1mtiwE/f5N+QZSrINO
	 sPATh7OMiJ6YTmRppxHtZ7KZbZt+dp7kysBcZXbwZRZAHLMSpFB6B90wWE0SEOINBqPaN
	 bQ0p5cfymVMEpjBbpcZrgMiS2kKWw3RTWHHlkvMXEnIMbLYo0PIXvZy5gbMMl4TqGgg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791725687;
	bh=uOooiK0VK56DUTDCF76E8Du/hrD+n1QYOrTNXPVfq5g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g2l7j81Mp6p90fRPXDbBffu1RO3PPfSkcjdT0enebhzdvrGFR3Ztgk2wczGuQ8nAz
	 0p4/ms+w4zQGW8t74p/E/ykZxdZzFFpe56HVkWZbAiTnjRaSd4iwsnrEMLmRZ7I0Pc
	 3mvzhLaihnGWCbHwLmcNIugxnpTqhdGjs8WNU+gCPU1l5OCHAT0thM/Zdu0LJtSKci
	 WRyidTJD++Ccs6zMspUNGIpYSvK97BIWXVhH6HpMWXzfjSoAdQqXGnhXEwoNxnrucG
	 Q1fkGbvrFaPq+VGO0HMbrSv8dW1uIFFR0yMX5Q819MNrKstZRrf7erKhLZ3Wk9DOQl
	 /98Yw8L7SYjZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58AB640566;
	Sun, 11 Oct 2026 13:34:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D6B31A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F49240566
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DWMPrfnDcwIy for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:34:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B787340539
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791725685;
 b=CQLikWsxdVYs/avn4cS4LKF5Sa9C/5bQ/4EGI0g1kzPhHdv8r7lo/LgLat/SzjBDaZ3P
 A+cXb1jNtTp+Y1rTs0PEo84UFPcSozyBcYzaYRNXkyeJXNS+8K9noWjrg544i8zlfQuat
 h9fiFautaK0FGbhvX0CUdzIvhpalCOFjwCdob5SPuGoY0kEN9YwisD2OIy/yuaUbU2aad
 7ZBysMzOm3fvKRGYQGCZHZc8W2kaix8zF7196D5kKNlMBja3jUHqV6s08dX8Ce5oizHEF
 Lmqmzi9vG5d7GM9zWodFbzRfGTxVPw3mEq5bsQ3O4gGdzaeEFqkC3DdtYUQez5ivpvA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791725685;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=iLtiCgM6BzSP3mNKYkqL4/ztw+BYq+WoAN8pBjYG35Y=;
 b=ITG6jHcLU6NYfBP3WmhPsi+mFkFkTYW1sQaIb7L4zl/WIaJ470csgSQ/PEyCcbaaJva2
 DlUpwe2Zp5MFqjivLy2n0FrcmZPp+F4lB16AdXpsmkX0EQGgoP+qQrfhC9Aujo01kKRf6
 0uUXc0rLXbzYh8Saf9ZK3999TzUItwKemFGdnqxO7MMA8dU/yoQvTvnML+tR825C2JLB8
 E5W3vtu9m5BbSDcAalAo/FERnhyDe6Tg1WfnXQsWF2clCu54CWMnKX/i3W3cYFyzAVndB
 wZ9gvkUSfpG9of53dhRFi4P64PYWJreezj+qwLqH6p5mQC6N1q7Ru5Ca2wGXUUKk0DQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="q+HS/3D/"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B787340539
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:34:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3C7051A11E0;
 Sun, 11 Oct 2026 13:34:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F3320605CC;
 Sun, 11 Oct 2026 13:34:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EE30511D706EF; 
 Sun, 11 Oct 2026 15:34:39 +0200 (CEST)
Date: Sun, 11 Oct 2026 15:34:38 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asuQaw8YqmenAxhi@windsurf>
References: <20261002205517.4043570-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002205517.4043570-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/6] package/python-idna: bump to version
 3.20
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

On Fri, Oct 02, 2026 at 02:55:12PM -0600, James Hilliard wrote:
> Update license hash due to copyright year update:
> https://github.com/kjd/idna/commit/21cd5ddac6a1cc5e2bd4ae9e477ebe5f103f8225
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
