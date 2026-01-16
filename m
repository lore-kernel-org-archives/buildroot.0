Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC41C982FE
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 21:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92B7B84AD0;
	Fri, 16 Jan 2026 21:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fc6yFmD4ZMCu; Fri, 16 Jan 2026 21:00:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B35B584AD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768597254;
	bh=MW/RSzqZsVBrnA0f7feKrrmQn7Hnrx/odsWpm1aqZUY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MDiGgHEmJ5lMaLJ1fcGFgrLMBrzmppRNGntdUIgurQC+nu5lOyHKAgpboyeVnWhEf
	 f4K97pDDm/If3X0c30axVsxQ5F47a+NLoP4v3VG3h2V4Qrpz2aTPVJE3ee0Hh4g5O6
	 62QflefvB61hrfIZUFyXNPUiaMfKgFsBQMw5aUk4mShwNaT5BXSWugek4ZCXB/BBQR
	 j6rExha/d1rmzDpNXuwG25lrsyF46P1NKD+QvMh2QaPH66B8MtKqW2M9vAIhAPuuRv
	 EwhgrCS+Qq3gwVu/9PQDyKzq8/PTuodVV8YV3UcD5iHr2Da/OILCob4iod8DO0HM4l
	 iDZWF2BusTjqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B35B584AD1;
	Fri, 16 Jan 2026 21:00:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A94DD223
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 984B741A50
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZeC_Da0IGyB for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 21:00:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8CA4441A42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CA4441A42
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CA4441A42
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:00:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 937B3C1E48C
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:00:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 67C20606F9;
 Fri, 16 Jan 2026 21:00:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DF64E10B68E49; Fri, 16 Jan 2026 22:00:49 +0100 (CET)
Date: Fri, 16 Jan 2026 22:00:49 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aWqm4TXEfyz3Bgjr@windsurf>
References: <20260106200115.1985522-1-bernd@kuhls.net>
 <20260106200115.1985522-10-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260106200115.1985522-10-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1768597250; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=3XkE16dKYLaWMnPI+3dZxoo90iYTonAoG3DCmw5piMA=;
 b=fHHNC/AVKoW/2vtqhE3XYOFJAYxxW3tkHn7awRcziK4n8XHLxJtU4msvFHDJXf00lDZncX
 RhXt1omnHAIA/4DbikBR2d+oWxSZQ8NvsHi3y/edSz8G8CgdIEI+mGtTSc3FsnLYmcgrQP
 v1Gnr9lgTkRn3nNM2VyUc8xm7IWKYP52+/xMDXOz/OZ8V6i5zXzXnQIEh93G/pLIpMVTjU
 GANXNwVFtWqsNMEZTviGhSc2YedGiCA+HB4r4D6Bv09Ht9xGmaXeTsEi5r6W4INnYHrdqU
 ibNinTJgVscpYynxwflliuQRfs6B5XpPoLnI77R/MKeQqS4p/AvpBxmMrqvmow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=fHHNC/AV
Subject: Re: [Buildroot] [PATCH v2 9/9] package/lockdev: remove package
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

On Tue, Jan 06, 2026 at 09:01:14PM +0100, Bernd Kuhls wrote:

>  Config.in.legacy                              |  7 +++
>  package/Config.in                             |  1 -
>  ...-static-library-and-headers-separate.patch | 44 --------------
>  package/lockdev/Config.in                     |  6 --
>  package/lockdev/lockdev.hash                  |  5 --
>  package/lockdev/lockdev.mk                    | 58 -------------------
>  6 files changed, 7 insertions(+), 114 deletions(-)

Following this removal, there was a leftover entry in
.checkpackageignore, which I have dropped as part of this
commit. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
