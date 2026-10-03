Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE5FCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC11141225;
	Sat,  3 Oct 2026 10:08:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FPeMbKhTvaF8; Sat,  3 Oct 2026 10:08:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 16033411FC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022137;
	b=TxVRvd46N0qbCx4bvuagM6KMnvH29TjO7UTEYPNmjQqksOuyN1RZHtpRm9DeuzL0KFrP
	 cupbMwlia37uiJkG8aL1jhSjr1NjHH9ablRf1LINg8tBRyvFSpXVOeOxDwN6Iy06hPeXL
	 3Wdp3Sfr0ndWSAVqptrkPOLgCJPn0bslWpBO6scA+axU4msY1V8Y8k/b4CtfO7+Ay7TBK
	 PEXsabGUC4p5JUz5lMh3+/STmG/bVIFHfs0XdcOZwHDMQbivQlvrTqm/8sR+9EkA7Qw2V
	 wF6ioVLv3L2A53fnYRkBOcF13Dc0fb+Gq0jS2HzfMQg74uRxMTJ05RE8PmPnGhXEo9g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022137;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2rsBxI+TXUYiZB7dy/838OaL2VqCRRiPHt1sPqpjTgM=;
	b=E7GutNgE1SsKWvTUbsD+aOW5jxl52CICsj4YgPwVOQUNG1RR6S311Dk6YB2KD5Jzy4E0
	 kdMUJHpqHtT5cHV71cQmGD4jQcfGDLIqHPdULH4svXr50FQtnEpk99Ym6qeYDr3ICT2Vu
	 trqsoJPEylS0wHDsSCR9v9kKHegkcJOMHZrkHUZLTJ1lz1Wb017Tp2EfDEjJkL3sn9RLp
	 47Niq0mxEGsi0by28J2lmKqtG5UF1G1BSkcmZgfTr6DKn2xeKPxzMUk8gYOYzEQKcNv1Z
	 A6SyisdU323ciLspPTyOiFvqh7BvIuAAvhI/fKRBEwXNqVQkY6oLEtX0AtKvBTVoznA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022137;
	bh=2rsBxI+TXUYiZB7dy/838OaL2VqCRRiPHt1sPqpjTgM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o+Z9ZfNgCtP4Qu8ZVDhaScPx9gNMFzhmK5EvuWvDW/ep79eOcDygtQn4tVs4nAjXE
	 nyYQu8z9e5hdpH1pm/peIsvJRvffyUMk0OaO+PiW8gXckXCR22UH1jsvjYHI7Sw2TG
	 1d3zIJFC+yVOqvjVYW3i8htAkwN/smNxodtvQ6Up/k5giF6Kg8HTteXLa83exwz85Q
	 Dmtux48UYNE2zp9HtTzGst4ikviLpTfvcfKeaQ6qMFwMhm5gkEgcOiy2UgZiVx+9/0
	 w98gjzJk1+u+S+g3KJzvD0kiNWSepFCv5SGYjplIXEhRNKfatvEsKWTWmFELd9ZsOv
	 Y7tSZQqIXdB0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16033411FC;
	Sat,  3 Oct 2026 10:08:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CBB5179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AD304120A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3SG3ek4BODt for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:08:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2D7A1411EF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022135;
 b=aPRCUpOpI2NDd8hKL/KPSLpnUn26tSh20IQ1eUJAn030Dhj+/Iy10Mq4Oq9sxmKiOpDf
 jCNp3DEZFQ9A15LGMrHUcZv3NfeEPxMzFn6av+OTIV0lNWsNDinPsYr3dEInzseDzFQmJ
 Se7EZdbQqJetlHTKQR1+UJr558FG2bCNWre1cHF705YsAXzcz3CJN/Jit5nG4BD75qWKA
 bxb5EV8Eal5EfeeCqhZAoWHEpIDfvgdUUOIXnbbEVdfaRT0lPDl2R78jfAVh/vn0MFmn9
 pEu/u5jwcJ2quv2yymJf8sYqeceixVFdf/W+BEmwD31x5A5JF9s5bwLFefq4XDV5jBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022135;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=qDED9L6enQxd12GNWbkzELEk0aM9aAnAxXRxn9FMtTI=;
 b=hvxjVLLW7pWQNua0zXM9TgQcuDo8nZcwrRERnT/jSWDpBTv6X4a/Pp7ZP0r6bXW2EtS2
 wxwElOo124NmXI+mVngL4w3JLIvNzYdcB0SyYPnI8xb4y86BwfAN3fI/2yvJHK1py9q+Z
 C0IJ/vRjwdMRSt4YSJqYF0pRIc+srgBowhRKczMoXYjFL8o7kX71Hsxv9uMmdJ6HiIgLe
 OIpbrR/r5cGmB+xtCU9HBIdTnFsckHkJK8Lo/sK/qEpiQ99CEIUr55cjxKC/Jb0g0WGjd
 8Ff4PmbBE2hdW/X+hroCNbXkanLLAyL7+YH5LIzEGiF8APiVU/qQVThjgnZpwd79ATw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=aHf+ZsWy; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D7A1411EF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:08:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 214581A1100;
 Sat,  3 Oct 2026 10:08:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EAA02604FF;
 Sat,  3 Oct 2026 10:08:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5A085103281F4; 
 Sat,  3 Oct 2026 12:08:52 +0200 (CEST)
Date: Sat, 3 Oct 2026 12:08:51 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asDUMIQcigiOoqT0@windsurf>
References: <20261003084453.545653-4-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-4-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cachetools: bump to
 version 7.2.0
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

On Sat, Oct 03, 2026 at 02:43:49AM -0600, James Hilliard wrote:
> Update license hash due to copyright year update:
> https://github.com/tkem/cachetools/commit/1b704d0bd4b1656109f20905d76f1564a185afd7
> 
> Add the host-python-setuptools-scm build dependency.
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
