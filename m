Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC550C43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 19:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91C2B60ED0;
	Wed,  1 Jun 2022 19:26:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JUlTdGdeVQr4; Wed,  1 Jun 2022 19:26:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8FAB60D6F;
	Wed,  1 Jun 2022 19:26:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D5DD61BF333
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 19:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D26E760D6F
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 19:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dpb_489W_7Vk for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 19:26:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF8FF60D65
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 19:26:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 84F39E0003;
 Wed,  1 Jun 2022 19:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654111587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CV9V5CfvMxpoFopd3+1ZFDfw+Ytz+gEsXSTIFUqNQiA=;
 b=eGOGVrs9v9Xj1+4pYJeV3fcMiuuoeJznuwUV+FNnxwJH2aCTCn7k3JAJDLhkvtYK8YID8C
 wVM6R0pKiuzG2JFCBCXbnrLC6g1qyDUfioJGqyAMeDo5bm9pL1OUvnkB8AIisAY+EfbyZk
 4Z+Hr6ranjNhTGv39Ev1zCJitUfNunvQt8xlLvjLWFp+RNDVwRY+D68BpF9kE7u0JiWCG9
 DLjIJfXOYvTl0PvwPh3EG8k3BLoYQ9wMyJI14+4jJV5Gmv7toBDlqD708F22zkDUrrDO9M
 HYk9i4ebrt9Sb7PdDaxbaNKNK5ZNuBDpTEWvyWAA3DQ/oFSR7g2kKibd3XND1w==
Date: Wed, 1 Jun 2022 21:26:26 +0200
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20220601212626.6d218cc9@windsurf>
In-Reply-To: <20220527103335.1968203-4-angelo@amarulasolutions.com>
References: <20220527103335.1968203-1-angelo@amarulasolutions.com>
 <20220527103335.1968203-4-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/4] package/busybox: make udhcp discover
 faster
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
Cc: jagan@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 27 May 2022 12:33:34 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Instead of waiting almost 10 seconds foreground (3 discovery packets for
> 3 seconds retry delay) at each boot, make only one request then fork to
> background. This way, the behavior is the same for working interfaces,
> but it's way faster for interfaces where the address cannot be obtained
> straight away.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/busybox/busybox.config | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
> index 52cb8ffcd8..2409cbcce1 100644
> --- a/package/busybox/busybox.config
> +++ b/package/busybox/busybox.config
> @@ -1022,7 +1022,7 @@ CONFIG_UDHCP_DEBUG=0
>  CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
>  CONFIG_FEATURE_UDHCP_RFC3397=y
>  CONFIG_FEATURE_UDHCP_8021Q=y
> -CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-b -R -O search"
> +CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-t1 -b -R -O search"
>  
>  #
>  # Print Utilities

I will not commit this myself as I want another Buildroot maintainer to
have a look, but it seems reasonable to me:

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
