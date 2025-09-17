Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA22CAC59A
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 20:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4A88416DE;
	Wed, 17 Sep 2025 20:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id unvOTC0Fmu98; Wed, 17 Sep 2025 20:18:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05B3D416E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05B3D416E1;
	Wed, 17 Sep 2025 20:18:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EA378199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 20:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF64F406A1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 20:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IrDaK0kOQ8Vm for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 20:18:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B319140623
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B319140623
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B319140623
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 20:18:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 3967019F593;
 Wed, 17 Sep 2025 22:18:47 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 22:18:47 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 22:18:47 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Rodrigo Rebello <rprebello@gmail.com>
In-Reply-To: <20250909072653.942584-1-thomas.petazzoni@bootlin.com>
References: <20250909072653.942584-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <6ae638a5ccb3cad67bbff37a6acc5818@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758140329;
 bh=m5uWGiDp7DwwS35Hd0C9EJMEgg/E+Dn9HWgRNFl1K38=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LVl2Y5SY4Qsy6XAAxYYpUyRZrrhi1gTZ/tzPoc/xnkZSS8tp60PItDXRjJI0YQ5YY
 OpvswM0A2CoFB35CyKWEJv5wU+cNl25E0iWE5CUNzS6Ea54jpmdIvcaDtgvzTogtU9
 fwpKkg79B5XehwmUckHEmFC1VfTXh2bfVxYmmiaIYdGpRN3+KBzClQg9sHIBd+lj0S
 +Mvpg8Ig6t20yPIBEZBCvOjvIrb57I/FoNRkQSkhjR6n5X9fbsGOE0ySBzUKCNsjX9
 wXaIhkvJzfSU9pI5FIO5JzX65DusPicuxTi+9706rCFxxyXgSbkylm9oEvDcvT88zu
 bk2q2UOOOE/zA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LVl2Y5SY
Subject: Re: [Buildroot] [PATCH] package/chocolate-doom: bump to 3.1.1 to
 fix GCC 15.x issues
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 09/09/2025 09:26, Thomas Petazzoni via buildroot wrote:
> Changes in 3.1.0:
> 
>   
> https://github.com/chocolate-doom/chocolate-doom/releases/tag/chocolate-doom-3.1.0
> 
> Changes in 3.1.1:
> 
>   
> https://github.com/chocolate-doom/chocolate-doom/releases/tag/chocolate-doom-3.1.1
> 
> The SDL2_mixer and SDL2_net dependencies are now optional since 3.1.0,
> so adjust the packaging accordingly.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/90a01c5925e7f5f50b3ea06d6ea7b0da66814a15/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
For info, I fixed the license hash. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/be466c265ba09ed47ec1eb40f006dd17753e69d1

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
