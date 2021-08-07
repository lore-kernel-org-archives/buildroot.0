Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0103C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 10:26:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B6A9610FB
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 10:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B6A9610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0912D839D8;
	Sat,  7 Aug 2021 10:26:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7sDYjtm0M9eZ; Sat,  7 Aug 2021 10:26:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D5F78378A;
	Sat,  7 Aug 2021 10:26:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CFC1D1BF2F6
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 10:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD6878378A
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 10:26:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dhDpqvucEIeh for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 10:26:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8720783759
 for <buildroot@busybox.net>; Sat,  7 Aug 2021 10:26:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7F1FD200004;
 Sat,  7 Aug 2021 10:26:11 +0000 (UTC)
Date: Sat, 7 Aug 2021 12:26:09 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <20210807122609.2b3d3930@windsurf>
In-Reply-To: <68ad9a9b-54a1-1f6a-88c3-d6c171340b70@grenoble.cnrs.fr>
References: <20210807070519.BBD0882F39@smtp1.osuosl.org>
 <68ad9a9b-54a1-1f6a-88c3-d6c171340b70@grenoble.cnrs.fr>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: [Buildroot] Microchip Buildroot defconfig issues: fixes needed
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@busybox.net, Ludovic Desroches <ludovic.desroches@microchip.com>,
 Biagio Montaruli <biagio.hkr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

Thanks Edgar for your investigation!

On Sat, 7 Aug 2021 12:20:59 +0200
Edgar Bonet <bonet@grenoble.cnrs.fr> wrote:

> Hello!
> 
> On 2021-08-07, the autobuilder wrote:
> > Detail of defconfig failures for master
> > [list of 48 failing defconfigs]  
> 
> The 32 defconfigs that use AT91Bootstrap all failed. I just checked
> their failure reasons. The following three failed before the build
> started, because of check-dotconfig.py reporting missing entries in
> .config:
> 
>  - microchip_sam9x60ek_mmc_dev_defconfig
>  - microchip_sama5d2_icp_mmc_defconfig
>  - microchip_sama5d2_icp_mmc_dev_defconfig

I'll have a look into these.

>  - acmesystems_acqua_a5_256mb_defconfig
>  - acmesystems_acqua_a5_512mb_defconfig
>  - acmesystems_aria_g25_128mb_defconfig
>  - acmesystems_aria_g25_256mb_defconfig
>  - acmesystems_arietta_g25_128mb_defconfig
>  - acmesystems_arietta_g25_256mb_defconfig
>  - at91sam9260eknf_defconfig
>  - at91sam9g20dfc_defconfig
>  - at91sam9g45m10ek_defconfig
>  - at91sam9rlek_defconfig
>  - at91sam9x5ek_defconfig
>  - at91sam9x5ek_dev_defconfig
>  - at91sam9x5ek_mmc_defconfig
>  - at91sam9x5ek_mmc_dev_defconfig
>  - atmel_sama5d27_som1_ek_mmc_dev_defconfig
>  - atmel_sama5d2_xplained_mmc_defconfig
>  - atmel_sama5d2_xplained_mmc_dev_defconfig
>  - atmel_sama5d3_xplained_defconfig
>  - atmel_sama5d3_xplained_dev_defconfig
>  - atmel_sama5d3_xplained_mmc_defconfig
>  - atmel_sama5d3_xplained_mmc_dev_defconfig
>  - atmel_sama5d3xek_defconfig
>  - atmel_sama5d4_xplained_defconfig
>  - atmel_sama5d4_xplained_dev_defconfig
>  - atmel_sama5d4_xplained_mmc_defconfig
>  - atmel_sama5d4_xplained_mmc_dev_defconfig
>  - microchip_sam9x60ek_mmc_defconfig
>  - microchip_sama5d27_wlsom1_ek_mmc_defconfig
>  - microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
> 
> Failed because of AT91Bootstrap issue #127, as described here:
> http://lists.busybox.net/pipermail/buildroot/2021-August/620375.html

Biagio, Ludovic, could you fix those issues on the acmesystems and
atmel/microchip defconfigs ?

If they are not fixed by the release (end of August), we would have to
drop the failing defconfigs.

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
