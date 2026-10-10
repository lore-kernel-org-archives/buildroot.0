Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9E3CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 17:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3609810ED;
	Sat, 10 Oct 2026 17:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2fj1AZjzlRZ; Sat, 10 Oct 2026 17:28:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 62AC780F80
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791653303;
	b=APJTWjweTZTGewu4kzjtDBsUL/qndTjuFTYjC8ihQd8Tbb0de9POAyOX7B4nWmvS1T8P
	 SIYqVKyXpVcFkvGo4xjZ72LdL5UzfRviwd6KTnRWzc4NBdhAYp8BR7GazDFCtuB5qnb34
	 cTXNeXZILJb3Z1FEVgOJo6ljSiFzxcuonJvaILhF1SMk4aBGR+xBdu3mcD2eD62yXIM6h
	 1Ev6As0BoYrukYtKxRnR380W+boDQmA1enhSiJ3mtQB5nMhCOKuG4aN6FpSqB93im/ZOS
	 DlA3Q/xhBE5NhzX6CogjN9AYNRzMLnMDEhrEDIUki8rNyo3Pf1TKqE4/jzf6BrHCn9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791653303;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=VZAtTP8uPv7ZTreuChTvl/SyHK1nokPUWtI1BpTNjJg=;
	b=m5BR2Ry1zUfEELELOQsBq8QfRz2Ws2QO07ivDuU9HCGe4eICW43tP3cjgTGfK+38qs8s
	 LxNyXTa67ch2Sl+8fvy13CkM6v4EZ9p6ZHJXEi57kKqQ/1z6S3fVuRoZ7jQhgwSrSVx5c
	 6S0X2L/aYUtKZR9sUAKflshtXrAb1zHyPuYQAeHoE+tX0ZUfgjO6Cj8j8KVJtQmyozAeH
	 QOjwso24A7AV6xBp87I0pajAwT8ZGQ/I80wwlhH2cjwma8irUXpXy/Hlauzki/QwvDAGF
	 dwjmbecnl8XBF6sxvgXWEZsW7w7g69JLqRszOH4UNKCPB+X+mlQzzX+Eh3/o4oYvEWw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791653303;
	bh=VZAtTP8uPv7ZTreuChTvl/SyHK1nokPUWtI1BpTNjJg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J3SJkE2LkAEGQz9Pr9QjpvZz/C5v0zw4fnZV0b3OSx0YAaZ9xwjbdsVU3YZN7Irat
	 WtoQ2QiA9KHDv0H9T89xscWhPET9kQuxN/VF+gzKGFs74t5n4YsUM1dnRyQnL363wQ
	 0PsE47itF0uIpGZyX3ph5XSXXt5ff+GErdDliCoZUX7PfjDB+NJmEF5rsSMc8H/Bof
	 IWg44XKU5xOOBTqhi00P6yTGCy1tP3AR07JGM1pjWqpF95CJ4mLkxPuWM17w4ta1rE
	 vG5WgrnN17jiKsYf9mPodtELYqDxx5R53Zf/3BIW1vc8Z18/CqlJLNX8VE083lG1pm
	 ggtKDAXTngBWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62AC780F80;
	Sat, 10 Oct 2026 17:28:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B3F71A6
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98D9140079
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:28:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6F_Xmu-x4-82 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 17:28:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 86BCE4005E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791653301;
 b=J1Q7QauOtXI6xB/fbljnFXfUN94HNsE/ujy+TC0dK4GCSsLO7lNXGZ6HnZ+nAydSnW7e
 nN/FvY23vNtD4evFFS76xWoxyT/I500mdJmxGuUWkpYLkOAiiIB3EPQ7iQ3HhipCUq0IG
 vm5d+1sG3QU5ZvVRUBmXzfx65EYJ+UdVJgaUEYDx4KbHC+rYG9s/n7laRqaF8oIoxXXm7
 d3sE0hsfDnwCZnK3h8xrhhY0imooNgxXlNzWCr90MwbXkw6ff6EyuQwPqz5Dl1HNaMIaW
 Ab5ee73m3m7uHRJKFTZcCqgTc77VHraEeuTXR5/KHvx/IfeFZPcsnxaAeGiZhYUFy9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791653301;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=i9wcKs14p/UdnBOEFO6PMuuFrtUu8TK3wF3eqW+5QU4=;
 b=jbA+daGjTzCpT9uwv9YmrZ8uOidUXe4pK//bNj0XClPjkyvuARxHlocvEvVQn1LG4gZQ
 Uz5ozQ3cj0lSIvQkGAbKN+YjIb+2lEqcXrHvdigUiznhWZJaULdDJD/quPiMiDOXslBa5
 s3cD8UhKPPiynpSMHYK4jrHBN42guQL5wIB4dFH4y8LYtUFFwJs+pcGimBn0jX6d44XpD
 vBONgzvJwnr/7DY33X1mumlhhbvloMMFohBuqABw4AxlFQO7RqS6Iujil3Ol9AQAUqTvO
 g3CIjv6xceVMnR6QVfJPYWbG04r4PjcWK9vXZzQyH/s+s8yXkoSP4PInmgU565M4CZw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=U1QcuEaO; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86BCE4005E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:28:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 477204E4117A;
 Sat, 10 Oct 2026 17:28:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 04D9B6075C;
 Sat, 10 Oct 2026 17:28:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5DFFD11D706A3; 
 Sat, 10 Oct 2026 19:28:17 +0200 (CEST)
Date: Sat, 10 Oct 2026 19:28:16 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
Message-ID: <asp1qyoqouPDkb8v@windsurf>
References: <apdBeSPwf13pL2Cy@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <apdBeSPwf13pL2Cy@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/runc: enable uClibc support
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

On Tue, Sep 01, 2026 at 11:19:53PM +0200, Waldemar Brodkorb wrote:
> fexecve was added to uClibc in 2019 in commit
> 858ffad217076227089cc17eb832db0bd1497792.
> 
> Also containerd and docker can be used with uClibc.
> 
> Runtime tested on a Raspberry PI4 (64 Bit).
> System compiled with Bootlin Toolchain.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

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
