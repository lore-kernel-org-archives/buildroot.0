Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DF6C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 21:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D4CE812FF;
	Thu, 13 Jan 2022 21:41:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3dgdddAWth0i; Thu, 13 Jan 2022 21:41:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CE21812EC;
	Thu, 13 Jan 2022 21:41:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93EAD1BF487
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8246E6FC73
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:41:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ct-snriQac7B for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 21:41:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D8EF6FC71
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 21:41:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 919BBFF804;
 Thu, 13 Jan 2022 21:41:27 +0000 (UTC)
Date: Thu, 13 Jan 2022 22:41:26 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <20220113224126.6b0801dd@windsurf>
In-Reply-To: <20211222174905.71902-3-flaniel@linux.microsoft.com>
References: <20211222174905.71902-1-flaniel@linux.microsoft.com>
 <20211222174905.71902-3-flaniel@linux.microsoft.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/2] linux: add
 BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 22 Dec 2021 18:49:05 +0100
Francis Laniel <flaniel@linux.microsoft.com> wrote:

> CONFIG_DEBUG_BTF_INFO relies on pahole, so kernel DWARF are converted to BTF.
> If CONFIG_DEBUG_BTF_INFO is set and BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE not,
> an error message is shown and .config is not written.
> 
> Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>

Thanks, applied, with one change.

> diff --git a/package/pahole/Config.in.host b/package/pahole/Config.in.host
> index e427629632..521874961b 100644
> --- a/package/pahole/Config.in.host
> +++ b/package/pahole/Config.in.host
> @@ -3,4 +3,6 @@ config BR2_PACKAGE_HOST_PAHOLE
>  	help
>  	  Pahole and other DWARF utils.
>  
> +	  Select this if you want to build a kernel with CONFIG_DEBUG_INFO_BTF set.
> +

I've dropped this, because it's not really this option that should be
enabled if the kernel is configured with CONFIG_DEBUG_INFO_BTF, but the
BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE option.

Thanks for your contribution!

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
