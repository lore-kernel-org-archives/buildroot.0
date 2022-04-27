Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6009CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 16:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB954419CC;
	Wed, 27 Apr 2022 16:50:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WDM0SE3KFPeh; Wed, 27 Apr 2022 16:50:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72F91419B2;
	Wed, 27 Apr 2022 16:50:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FC981BF86D
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 16:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E55F82A0B
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 16:50:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=embeddedts.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rR1VPJ9WXuNq for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 16:50:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out3.electric.net (smtp-out3.electric.net [208.70.128.183])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 356BA82983
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 16:50:46 +0000 (UTC)
Received: from 1njksF-000Bxc-Vd by out3d.electric.net with emc1-ok (Exim
 4.94.2) (envelope-from <kris@embeddedTS.com>)
 id 1njksG-000C1j-VT; Wed, 27 Apr 2022 09:50:44 -0700
Received: by emcmailer; Wed, 27 Apr 2022 09:50:44 -0700
Received: from [66.210.251.27] (helo=mail.embeddedts.com)
 by out3d.electric.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <kris@embeddedTS.com>)
 id 1njksF-000Bxc-Vd; Wed, 27 Apr 2022 09:50:43 -0700
Received: from tsdebian (unknown [75.164.70.254])
 by mail.embeddedts.com (Postfix) with ESMTPSA id 3750546BDA;
 Wed, 27 Apr 2022 09:50:43 -0700 (MST)
Message-ID: <1651078232.2364.2.camel@embeddedTS.com>
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Date: Wed, 27 Apr 2022 09:50:32 -0700
In-Reply-To: <20220427072541.4082648-1-james.hilliard1@gmail.com>
References: <20220427072541.4082648-1-james.hilliard1@gmail.com>
Organization: embeddedTS
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-Outbound-IP: 66.210.251.27
X-Env-From: kris@embeddedTS.com
X-Proto: esmtps
X-Revdns: wsip-66-210-251-27.ph.ph.cox.net
X-HELO: mail.embeddedts.com
X-TLS: TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256
X-Authenticated_ID: 
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (b)
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedTS.com; s=mailanyone20220121;
 h=Mime-Version:References:In-Reply-To:Date:To:From:Message-ID;
 bh=VR7Uzo0qopovhOGY1/frkSxHWsGL3i01x3HqViLEO6s=;
 b=KjCw/HcLlCopY9cGzmqXiNjJL92YxU+HBuYLoNhlUEsgpOazGNvRFwn+Gy6KkaoDWgCCjl6b5PxcuqxrrWtbLXHyVxYLttLQWDULmbD9wDLhNFM5qv5Xv9v7L3gVmmxJS0GvieefmQJI09VBQlllly78zJl0ieFfG79uL21QugV6CZ8cxM+CexqVt+I3fvRm6gN6yI+ALEJdhXpCnjT4PHx2vm4rLTPy5GIkexfC8Vu0MMUVsHLqQv0u2espb3RdVeWW9I+JKJnTkBqKmN0Ur5OA8aOoF2GlZqnhmogo3p74mnUYa62Z03xuTN1MnhRRqDXWaRvelnnDrRlY25CeXA==;
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
Subject: Re: [Buildroot] [PATCH v2 1/1] package/wilc-driver: add missing
 BR2_LINUX_KERNEL dependency
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: kris@embeddedTS.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 2022-04-27 at 01:25 -0600, James Hilliard wrote:
> Fixes:
>  - http://autobuild.buildroot.net/results/40b/40b8aa0c19917f64c3f272f5479068e7631ffcc3
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - add comment when !BR2_LINUX_KERNEL
> ---
>  package/wilc-driver/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/wilc-driver/Config.in b/package/wilc-driver/Config.in
> index caf46ae281..24a7b05b17 100644
> --- a/package/wilc-driver/Config.in
> +++ b/package/wilc-driver/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_WILC_DRIVER
>  	bool "wilc kernel module"
> +	depends on BR2_LINUX_KERNEL
>  	help
>  	  External kernel module for WILC1000/3000 devices.
>  
> @@ -16,6 +17,9 @@ config BR2_PACKAGE_WILC_DRIVER
>  
>  	  https://github.com/embeddedTS/wilc3000-external-module
>  
> +comment "wilc kernel module needs a Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> +
>  if BR2_PACKAGE_WILC_DRIVER
>  
>  config BR2_PACKAGE_WILC_DRIVER_SPI

I also just wanted to note that this driver in this form has only ever
been tested on AT91 and i.MX6UL ARM platforms. It may work on other
architectures, but we've not got any hardware setup for that. I'm not sure
if this fact would warrant a depends on ARM architecture for now to limit
scope or to leave it open for others to test.

As-is, the patch looks good to me though.

Reviewed-by: Kris Bahnsen <kris@embeddedTS.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
