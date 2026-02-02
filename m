Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DDEE7DF08
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 16:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AD5B60B60;
	Mon,  2 Feb 2026 16:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYyydpwcHa8i; Mon,  2 Feb 2026 16:47:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CECE60BCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770050874;
	bh=/+gbSvLW7FBnvo0abi9F6SvTA0T7SkqVM3vgw4K/5bg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eDXfhrNMK22tfz7KaOu8oeTNEZVHNB1OCN6wihDxZu5ovdM8GT0Yw8xJdJuOFLE7w
	 xyNKnr/MajaNdOURhm4MrX5N76foWkee9R2JKYvbpu4irwEQPH/jcaQsB2nYh2A44T
	 UyglRNh+6F3LzESdG9Nwh5SGhcrXNBPw7NDaUftyvDIn5ZAMQ5Tl0yqz+VW/cizlRj
	 VgV0H4AGsNTtjPU7YTgMVAqQKhPcG4BbGYOH+sBUJWAAE6kdRgflobskz6rg9pYZ/E
	 d2R17BJT8ArJ2jyHi7kGdtZ8RFmrfUZYE1hOlGzdWYG1OsVYgcAHL7P+GoYLlnqXuc
	 vtzHniW3P3GnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CECE60BCF;
	Mon,  2 Feb 2026 16:47:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 278321E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01A8640BAA
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUK4Tp-iLT5f for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 16:47:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ED2FC40BA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED2FC40BA5
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED2FC40BA5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:47:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 152B1C237F3
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:47:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 11D9E60767;
 Mon,  2 Feb 2026 16:47:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 135FC119A8888; Mon,  2 Feb 2026 17:47:47 +0100 (CET)
Date: Mon, 2 Feb 2026 17:47:47 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <aYDVFgM4JG_N5Iyy@windsurf>
References: <20251025123035.1136084-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251025123035.1136084-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770050868; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=L8/JLAdDzgq9SmF9YR135lXdtWMAh/ehKIWqfg3DRK8=;
 b=vpJDwllbD2NgpojcTPjHAYRZPw1aG6MAGqX/NjJuDoUslQWLi+ivRb6BAyIHD07JSqiNoy
 5yIlg1R0pUPCRbuAV+kQL4m0FP2XWRuj7HfuqnFjZqGsg/5MFvPhfvDDCDu5TvV45/qGR2
 V+K8ZJQvVoeFr969fiEX1k2MM+VtC4wq0WZQNMoFiqB7n7f/hdjDCWEbpmDQOprbJH7Cn6
 tpQwYKKQhaFQrhGnB9cvrLF4kFIo7xUsF3m2651yw8gSdezoH32RJyItTWJLM2N6idr/dE
 ERlfWiYyt0BtVrlBr+5yVH/M7uwYMee/nHceQT5N+xKK9wArlPTAHVK2X+NVsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=vpJDwllb
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libjaylink: new package
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

On Sat, Oct 25, 2025 at 02:30:34PM +0200, Dario Binacchi wrote:
> It is a shared library written in C to access SEGGER J-Link and
> compatible devices.
> 
> https://gitlab.zapb.de/libjaylink/libjaylink
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Since this series got some feedback on PATCH 2/2, which were not
addressed, I've marked it as Changes Requested.

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
