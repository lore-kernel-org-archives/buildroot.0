Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EF0C88E7F
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 18:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B97D880ADE;
	Wed, 16 Sep 2026 18:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LIiad4A5qKnl; Wed, 16 Sep 2026 18:48:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7C0D780A91
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789584484;
	b=XqmMHsmLDrpud3mJ7gk5jEhW48uNRYg3AZp+z3AJzPBoKiOMfEUvE/vxIz4lUWz7QDHa
	 yhe76qry18MGXW4ERe9/e5XClMCj/jaD2vchqVtC6sEMwyTWmTpV0JA+3yULnVxV2CW9O
	 lM4Z1gxHiXmn2xJXediEFTyr4gtuItBSL6TKwfV8VLakNX/wtBs+mEmOq11AQOSwicaPc
	 0Cnf1phcZyfaV2cHLPJ/p0KOiEeNxWnUWohyB3m/KXbjlFiDMfSyoM2Xoco2s+/vc39Sj
	 AGAvalMLj6ZC1nXvysVgGUw4CZyN347gY7ZVCh03Fy9LKv7FX+IVX5G019xdeNFBOrw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789584484;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aEiNwMJdkI3ty93QHSlr2A8IWPE993aLcdKnDr1qw+o=;
	b=ABZbEM4ibmGuOx/4Le66TWrKr8M5mcI42KEXyho0pT4WBKwAojn4iVXrCPd6EjAPLosi
	 R/km6n7xNpccBpdcnfaBgE8S2rrJt37Uxpc5jtHa+Z3ZNJ0XsLg393/ZAAN99xmeEuyph
	 beKoDQ1FUii5sk7m3jN+3SJNXvg0rHtDcDGCzD+9Jy4s/oeZkWW0UY7ggib0Q5hcf9OMJ
	 6wsMhvbW2M67SV7RL7GZYKnTyLF5kjrYFOusWxKCUAgk1XA9mHw5tpRhA8hXmPksrSk8P
	 Rc8+qeRQSqvZyv7D+MUI2Node5w1BpOVNUCx4Ia0qp5Lt071CPhG8VfRhtFk0GAXdww==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789584484;
	bh=aEiNwMJdkI3ty93QHSlr2A8IWPE993aLcdKnDr1qw+o=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OPaq9XHFWWlQ3tx41i/Gsshkqgbkl7IK2cmr0GEw0UxDH9lbuab/+MN9V+NNUfAFS
	 PxymO+4t9fmbvfiXX2uKGkjttkkWfSsXRBIbF9SIEEUghF28970BqhySyANdarIw2Z
	 dNliWj2zL4OBapwyxY/O+seAQobes5EVeV+gKoTyn8vaa9LxV6TaaOUrjVf7cFiWXU
	 fK4Se3Bgr2gCjyiRWjs5dTEQGJV+krFUOcI4Be8kK16ppj8X8NtE59JtQrrMxdQGz+
	 bSFo70YXFCOeQW8ktCR7JOey6VEypRvmrgnSKMFlSG1L0xBRIIIykq5WUueJA0wFiT
	 snRuLUOxC/rPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C0D780A91;
	Wed, 16 Sep 2026 18:48:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E63624D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 444FB6062C
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0XxVMiCSdIQ5 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 18:48:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 46150605E8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789584482;
 b=TWh4P393M8/XShzTo7NgdteVC5QDTc/6mYpPhtBHISnNOz6wYFu3s8kjMGC1yjrrPAji
 wxEviWSkBD+yZIh+/9B3cRH7JBhpxqdoqOPJtNL3SOEQ/NMk6LR0cD/EPUOI5VlOSDOOt
 7HzhXrF1+OyqqnRfGZYRVyXE173H/X4LjeTybGhEuuC14BUcTWJ/2gpQ3t2j44iMIUp4u
 zacmBaf3R5P9o5UMeRmaYGKXycVVA3axFX31g+Qqs6WhYrT0Y5BmcVPpnyF742MzW34g4
 Qucah3RKTjkVTaO5Gh0F8NRNDpE39oHa5VHAhAOiREYhP2y1LER+iX7S1SbrJam0pOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789584482;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=hD3ckfaaU8Wf/71Nk56ebWqcyHtVs569pQT/JyIeKz4=;
 b=ZMQ4VlgCPFh2USp8pQhlYrnp0JNsrXQ1VIKV7NfOEPjubgEzZu/5y3V3LGtFvPTV/rJZ
 xozDyQ23HkG41DIX9w9UQ2N87A/7QflDLm7zF2XBq9brcoOXlepWmS1csv7U28zjPhFhu
 JPQlJOLvZN84xkSSvAXKqEvNmnkWV7XggKw5wXPH1tjvtRMteRRNOQM6v8XnMv94qU11+
 AepLrk/wPLCmnhOzqP7IjMx04OL/Cm7ISSuuRjFr4MO+j6pmm43Op6EjTpdsY0rG77Epa
 9SpCSNOlFbGeHWloYr5ofZ0Th7RaLEMJRJvnNdiu8TbnJRPQVGFU6evwwXGXQr9OxOg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Cvd0amFc; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46150605E8
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:48:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DECE91A08DB
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:47:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AB31E60337;
 Wed, 16 Sep 2026 18:47:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D835C11C7B00D; 
 Wed, 16 Sep 2026 20:47:54 +0200 (CEST)
Date: Wed, 16 Sep 2026 20:47:53 +0200
To: Torben Voltmer <mail@t-voltmer.net>
Cc: buildroot@buildroot.org
Message-ID: <aqrkVV5YKhvdhduk@windsurf>
References: <20260914214313.3516-1-mail@t-voltmer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914214313.3516-1-mail@t-voltmer.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/espflash: bump to version 4.6.0
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

On Mon, Sep 14, 2026 at 11:42:57PM +0200, Torben Voltmer wrote:
> For release notes, see:
> https://github.com/esp-rs/espflash/releases/tag/v4.6.0
> 
> Update the Config.in help text to match the list of supported
> target devices, since espflash now also supports ESP32-H4 and
> ESP32-S31.
> 
> Signed-off-by: Torben Voltmer <mail@t-voltmer.net>

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
