Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF626CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 16:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD8564069F;
	Sat, 10 Oct 2026 16:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q4bJmaiey8RH; Sat, 10 Oct 2026 16:33:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DD0E04088E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791649984;
	b=KnaDXYqwAPLjc9tDOLHa5fAKFy8lCzhBmRiyj0uWq8Tsq5c0NyaaGTj3XneSdzYVjaeM
	 aR7e/xM/ex2Sm3bZBHXre/9RNMuGnjVR6BmJ9aIOEF5YXSV4UaQFy8tjz6uueAFQAbvdS
	 mrD8eOH8IktEnPoGWBOZra3iITVSyuO7cYkIonfHMPyzqhEmvfAk93P3SNXMYTbZMc8Fn
	 DU7dz+K0E0u7gNfAGAymStzMx7ZZTYAAqJRANKC+rCLUVRhiPMsVfMeOl/p3tjgbpI/7n
	 TALq1r/V4UfIKX31E5bXxZNGilfCMu0BbOXst5JezeXXVVM0oRS4h2JR/h1BNeikG4A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791649984;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=s89tSTkANGlbT9BM7dz+3UJSLCztNn6mzocsNLqq7FM=;
	b=gCrTyMQMkci1qGD7H+xSltFKz6G5ZnuhU3e0RZUHAeZUyq0N9NJwvtH9DaYrQEzZi2ur
	 26OTTtuCa+SwHD1+7iquxnVlRe5jXU56QtQNqRDoCMa5xIZ+lLZU+CxIrPJ6VOotuJvfN
	 A/aJgN3Ia00Z3hhaNCncy0quQBZzlq28RAfSe4n1fJyhCXT9ry/ci+o+J4pGXbpTS9LqO
	 kQJc6svXtHimzXTiQA5VUiRN6zeNbXnJzouBJhkaN6lRG61DBHZwKubFbgEvbDDIyISoj
	 e/VofLdiG6k+6bLKii7F3mnxAW5b5i+G8Z9bARgLie6LFXpkYssbcVORNzX3qHkP37Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791649983;
	bh=s89tSTkANGlbT9BM7dz+3UJSLCztNn6mzocsNLqq7FM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jp+3RuNcqtzwuah4vzeZYbe+9PV5lLubj0GdW1Co+Vxy4yhuQE6w6O2zdGVCR3W7R
	 TnDVlcFL0cYqgT0xxMN5vFHlBAmz/35zNPfjXu6MtYodXS/ehbXtSs5AbtsFWSmDPu
	 jQ9WDM6amy3aC1mFjVGmHFkYxchrMy8L0E1FnA77DWCU3DnQM531qSW7fs76r4+rwU
	 4wxZC8zhNNLgHyqnReVPxl4mjxpBMyHZwLGYGI9LM+/jFP7SVnsJk/a74Sy6hnwVFm
	 j1J5QPAHa2LLHUGlSC96pbC02XFEIsqx+pBNOfJXDp8YHMKHTGqEARfeuyR50gbd85
	 NTFZS8LY+gu6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD0E04088E;
	Sat, 10 Oct 2026 16:33:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EFD37105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E188060603
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUdg_i0rBpBV for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 16:33:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 90B0D605EB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791649981;
 b=PMTBdWKlzS/Q/enKfNY6q5tNkiVyEiMhx5pbBpD/+tNIHzblBFoUC30a3TxVoBwlMLrz
 vOrVucTb0pDWnUKe6Grp1iXACorOdZ5q+lnGCy5Q7hkDKnB2VxQHFQEcOsZ7j+wGadQoZ
 cC9oRUTAhadfilHO1A2a8D24NxACFUO9ZQi61joiv2imnToVy2xUU7xLFOk288VYBeNmY
 V4z9pAgzkDQInnAMIlEGLrn+XSjspzVmRw7mCnx6vU6MgJVk4bCTL8HOF+XSN5npvauds
 NnjprK4aF0zR8ndf8YfzTzs/Ng18vfiQXeIO6JcCP3VLEQw+4W/UscA9HsjVmQwKUbA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791649981;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=A3I6+UU+wntT88nYyfOF7JS2N9xy7OVjddCNkI2RRLg=;
 b=lnh8TDj3vxGOPJFphkuzWeho3ArYuDGbVRCMvexgvsYbXMkIU5KUR4r6DxGKixrRNv9S
 5dYxIvYAiGfxHEczI186OoRcQmDojk0ehDYB9p1HJDCQLufEoqltYtMR0Nj+10cLLQIgt
 5gSOjhwC+CQV0MxzoHgyC435Pv1UF36juVm1SRpXPgWKTMz5lMIsKSGl4jZI79dCmEYXn
 Ht4ImFKAZ2BiMeFb5aGu9kY0U9eVObhWjrgf1D1d0sdo7QcKJbTYgJeciurHZxrV55q3p
 UlZjBmgcqyxZyU/cHcSKuHVss+GwPtNZ8q0jLKU4zQtWct0Lff01AkyC0X6TFYkG3JQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=VzdxuoNJ; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90B0D605EB
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:33:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 394381A11C7;
 Sat, 10 Oct 2026 16:32:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E1A9A6075C;
 Sat, 10 Oct 2026 16:32:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 459B811D706B1; 
 Sat, 10 Oct 2026 18:32:56 +0200 (CEST)
Date: Sat, 10 Oct 2026 18:32:56 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, David GOUARIN <dgouarin@gmail.com>
Message-ID: <aspotYc18GDlQSmB@windsurf>
References: <20260917090041.2009425-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917090041.2009425-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/freeradius-server: add upstream
 patch to fix build error
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

On Thu, Sep 17, 2026 at 11:00:41AM +0200, Bernd Kuhls wrote:
> Buildroot commit 8af3e34fd4a085ea7c25291e50d81fa1a69d9eaf bumped the
> package from 3.2.8 to 3.2.10. This bump includes upstream commit
> https://github.com/FreeRADIUS/freeradius-server/commit/d8b95979c710d4e2e3f1115245062fbfc8e9ccba
> that breaks the build when OpenSSL was built with the option
> BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK disabled:
> https://github.com/FreeRADIUS/freeradius-server/pull/5874
> 
> To fix the problem we add an upstream commit.
> 
> Fixes:
> https://autobuild.buildroot.net/results/bfd/bfdf51b3c28753a50b9cd63d75388ee6000b0444/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

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
