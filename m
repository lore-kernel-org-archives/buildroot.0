Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9FEC3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 20:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B26EA80D80;
	Sat,  3 Aug 2024 20:38:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01XFs0t8qGjO; Sat,  3 Aug 2024 20:37:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0F2E811F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0F2E811F1;
	Sat,  3 Aug 2024 20:37:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E14EA1BF947
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDCB480D80
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mH2a454NofFX for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 20:37:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B72F80893
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B72F80893
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B72F80893
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 20:37:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B30C760002;
 Sat,  3 Aug 2024 20:37:51 +0000 (UTC)
Date: Sat, 3 Aug 2024 22:37:50 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240803223750.269041f2@windsurf>
In-Reply-To: <20240803142540.3241396-1-ju.o@free.fr>
References: <20240803142540.3241396-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722717472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o9YoY/UsUd/08+ho/yTjXTXPB61Rran2eZzWFJ8POTE=;
 b=H01q8QT3TAjz4Z4lvui4Vv8gSFFgQCCWxk6LHq0LqAk8DanPTt8Z+1SaaMJWpxU56qkIeO
 VrvJJcdxo4tVqZVZxG6N+2vm627DM9jLES+rz1a5F/+QJ2ZNhB/Unuy6dgDMChIpB3sYM6
 IZakcxCynm3IgysZoRctB85ZIPvcEkb3C/CmIGyVFbNaip4RVM7QMJ0mxFGKrA7cSWkXf0
 tT8/sY2s5EhuvSE8SGHZKgJ35/ficaIkGcGgbLeyMjfVJb5fEHmLPj+kHbXnVJlEpsHSn/
 zgOn4Zjwl7DoD54iVZmtdD2mW+xWg+FE/cTNsgUXItgpGIf1oMbDtSWdlIROXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H01q8QT3
Subject: Re: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-gpu-viv: bump
 to version 6.4.11.p2.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  3 Aug 2024 16:25:40 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This version is aligned to the NXP BSP lf-6.6.23-2.0.0. See [1].
> 
> License hashes changed because the LA_OPT_NXP_Software_License changed
> from "v49 September 2023" to "v56 April 2024".
> 
> [1] https://github.com/nxp-imx/meta-imx/blob/rel_imx_6.6.23_2.0.0/meta-imx-bsp/recipes-graphics/imx-gpu-viv/imx-gpu-viv_6.4.11.p2.6-aarch64.bb
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 8 ++++----
>  package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
