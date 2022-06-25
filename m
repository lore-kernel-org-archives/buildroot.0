Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D092C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Jun 2022 05:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81710847FD;
	Sat, 25 Jun 2022 05:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81710847FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t0KN3aFayjdz; Sat, 25 Jun 2022 05:32:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EA17847FB;
	Sat, 25 Jun 2022 05:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EA17847FB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4CD71BF3F9
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 05:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FE82847D4
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 05:32:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FE82847D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bx-A03ytgYwc for <buildroot@lists.busybox.net>;
 Sat, 25 Jun 2022 05:32:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A93F84778
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A93F84778
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 05:32:37 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 6AF03BDE002A;
 Sat, 25 Jun 2022 07:32:34 +0200 (CEST)
MIME-Version: 1.0
Date: Sat, 25 Jun 2022 05:32:34 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
In-Reply-To: <mailman.2285.1655818273.17960.buildroot@buildroot.org>
References: <mailman.2285.1655818273.17960.buildroot@buildroot.org>
Message-ID: <2093f3aaa52cabf675b461f1cf93c5f5@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.6 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH 1/4] system: adding options for configuring
 wifi
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
Cc: Buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Angelo,

On 2022-06-21 13:31, Angelo Compagnucci <angelo@amarulasolutions.com> 
wrote:
> 
> These options can be used by packages to configure a wifi card
> to connect at boot.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  system/Config.in | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 888c24ce81..9a5bdb2932 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -418,6 +418,21 @@ comment "automatic network configuration via DHCP
> needs ifupdown or busybox or n
>  	depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN || \
>  		BR2_PACKAGE_SYSTEMD_NETWORKD || BR2_PACKAGE_NETIFRC)
> 
> +config BR2_SYSTEM_CONNECT_WIFI
> +	bool "Connect to a default wifi access point"
> +	default n
> +	depends on BR2_PACKAGE_WPA_SUPPLICANT
> +
> +config BR2_SYSTEM_CONNECT_WIFI_SSID
> +	string "Access point SSID"
> +	default ""
> +	depends on BR2_SYSTEM_CONNECT_WIFI
> +
> +config BR2_SYSTEM_CONNECT_WIFI_PASSWORD
> +	string "Access point password"
> +	default ""
> +	depends on BR2_SYSTEM_CONNECT_WIFI
> +

Just nagging, but this is how security breaches get born. If I want to 
do something like this, I use a private overlay outside the region under 
backup or version control ...

Kind regards,
Andreas

>  endif # BR2_ROOTFS_SKELETON_DEFAULT
> 
>  config BR2_SYSTEM_DEFAULT_PATH
> --
> 2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
