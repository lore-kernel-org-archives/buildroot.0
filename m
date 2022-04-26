Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBE6C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 17:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CC3D405E5;
	Tue, 26 Apr 2022 17:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5GGxK-mOtvTS; Tue, 26 Apr 2022 17:48:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE74940499;
	Tue, 26 Apr 2022 17:48:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FF201BF5AD
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 17:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C3A260EC2
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 17:48:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=embeddedts.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4j8W8wsaUXao for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 17:48:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out3.electric.net (smtp-out3.electric.net [208.70.128.188])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4093760E38
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 17:48:09 +0000 (UTC)
Received: from 1njPIF-0009I0-Uu by out3d.electric.net with emc1-ok (Exim
 4.94.2) (envelope-from <kris@embeddedTS.com>)
 id 1njPIG-0009Lj-U0; Tue, 26 Apr 2022 10:48:08 -0700
Received: by emcmailer; Tue, 26 Apr 2022 10:48:08 -0700
Received: from [66.210.251.27] (helo=mail.embeddedts.com)
 by out3d.electric.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <kris@embeddedTS.com>)
 id 1njPIF-0009I0-Uu; Tue, 26 Apr 2022 10:48:07 -0700
Received: from tsdebian (unknown [75.164.70.254])
 by mail.embeddedts.com (Postfix) with ESMTPSA id 0395844E3C;
 Tue, 26 Apr 2022 10:48:06 -0700 (MST)
Message-ID: <1650995276.4452.1.camel@embeddedTS.com>
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Date: Tue, 26 Apr 2022 10:47:56 -0700
In-Reply-To: <20220426174137.3014322-1-james.hilliard1@gmail.com>
References: <20220426174137.3014322-1-james.hilliard1@gmail.com>
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
 bh=5+0OS8XxlS7Cpv/bSBy38KwIk+rquHOYqg43nJ3FHAA=;
 b=emSaqox9k/fVLtYcfInYVPHHCgTs1KhaN7BWIkzmNm27I67ImuhrX022l0JapvSWJnrNIXrrktQuPUmtj676PSrNxaUY6NdhGv7/sWrl263JJdryufCfDCoVd6MFJzPAAsxF3FzkGH2YyV23F9AsCBbGimOSNzcVUYoAdGkEcUNxdE6hSaTsmdE8jktN0Q5Q13NObzXpTyMchHuGza6pJ7gBdvIni2JfbT+/+rynXSNc64254cSwbQ4tqoQD2JI9iflSASvLQp53eFzvrrY4GNzXjB4CCy6jrqvnHoYUNFeHz1incdQQZimOScWLbRFT4I4Hv8NW8YWlNtTzgS0gGQ==;
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
Subject: Re: [Buildroot] [PATCH 1/1] package/wilc-driver: add missing
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

On Tue, 2022-04-26 at 11:41 -0600, James Hilliard wrote:
> Fixes:
>  - http://autobuild.buildroot.net/results/40b/40b8aa0c19917f64c3f272f5479068e7631ffcc3
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/wilc-driver/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/wilc-driver/Config.in b/package/wilc-driver/Config.in
> index caf46ae281..6b93a23a47 100644
> --- a/package/wilc-driver/Config.in
> +++ b/package/wilc-driver/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_WILC_DRIVER
>  	bool "wilc kernel module"
> +	depends on BR2_LINUX_KERNEL
>  	help
>  	  External kernel module for WILC1000/3000 devices.
>  

Reviewed-by: Kris Bahnsen <kris@embeddedTS.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
