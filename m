Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D3AC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 21:44:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BADB1610FC
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 21:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BADB1610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8977260783;
	Thu,  5 Aug 2021 21:44:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id utAjJdzPMHFp; Thu,  5 Aug 2021 21:44:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAC1C60678;
	Thu,  5 Aug 2021 21:44:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AEB251BF2BB
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 21:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97D0283B64
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 21:44:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KBs7ytvXqFvr for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 21:44:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FBEC83B2A
 for <buildroot@busybox.net>; Thu,  5 Aug 2021 21:44:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id CC1E6240003;
 Thu,  5 Aug 2021 21:43:58 +0000 (UTC)
Date: Thu, 5 Aug 2021 23:43:57 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20210805234357.6a9e8bd0@windsurf>
In-Reply-To: <20200306092504.30340-1-hm@hmbedded.co.uk>
References: <20200306092504.30340-1-hm@hmbedded.co.uk>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/mesa3d: select vc4 and kmsro
 driver for gallium v3d
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
Cc: buildroot@busybox.net, Howard Mitchell <hm@hmbedded.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Peter,

On Fri,  6 Mar 2020 09:25:03 +0000
Howard Mitchell <hm@hmbedded.co.uk> wrote:

> Currently, when building for rpi2/3 it is only necessary to to select
> vc4 to get acceleration working. However, when building for rpi4 v3d,
> vc4 and kmsro have to be selected. Therefore this commit forces the
> selection of vc4 and kmsro when v3d is selected.
> 
> Signed-off-by: Howard Mitchell <hm@hmbedded.co.uk>

Do you have some feedback on this patch? Could you do some testing
perhaps on RPi4 ?

Note that the patch as-is no longer applies, the
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO option no longer exists.

However, the question of whether V3D support needs VC4 support still
stands.

Thanks!

Thomas

> ---
>  package/mesa3d/Config.in | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 13e516e452..3950170533 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -257,12 +257,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
>  	bool "Gallium v3d driver"
>  	depends on BR2_arm || BR2_aarch64
> -	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> -	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
> -	select BR2_PACKAGE_LIBDRM_VC4
> -	select BR2_PACKAGE_MESA3D_OPENGL_EGL
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
>  	help
> -	  Driver for Broadcom VC6 (rpi4) GPUs (needs kmsro and vc4).
> +	  Driver for Broadcom VC6 (rpi4) GPUs.
>  
>  	  It requires a kernel 4.18+ with DRM V3D support enabled:
>  



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
