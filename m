Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3293EC43334
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 07:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DCB9831F1;
	Tue, 21 Jun 2022 07:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DCB9831F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9KAtkrdd4Cie; Tue, 21 Jun 2022 07:50:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D0868319F;
	Tue, 21 Jun 2022 07:50:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D0868319F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42D9D1BF3D6
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 07:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A45B60C22
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 07:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A45B60C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7sB7DyGGVooG for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 07:49:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90EAD60BC0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90EAD60BC0
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 07:49:55 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id cw10so1926404ejb.3
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 00:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=q33AVj5XHIYB3KWUppZboVr3VH+D6iemG2YS6vEkgwo=;
 b=xyz7PDRHowyHM5PnZq2Gu3Pl65T2iIjSOjw5kmIX98iaR7D2Kr4cDeGF4Xc9PtJRTq
 p/FxN9iGT/9r0GwqYWgdLlagE57TViHuBKkXwkeb7MSDPgl2IjdLFRDMyjPJ2XUEUCS7
 bu+jGAZUzRwfJ0VR+B4AGcRKnPhzcQdT7N1L2I5K8nqUaz8vdqV9yhbpk5SeamEqbyXq
 tcYGKOMDOxQkDuJiV550hv267/8tN7bbQNPEPSa8d0oT8SieG3QgG/NS/rm/NpK8SFc/
 3oJXR6frrumUPIqLxYCzecpvF5ClV8w8Ot3kWONuKqEakHANJQSc2eUQf7pFbkJdyVuI
 g9kA==
X-Gm-Message-State: AJIora+DView6RiBoh3hh51+PsPBmLegG/eFEOLGB6/2O/YbFN96/DVG
 K8j5l0Lfjpg0epNoOg/1zem37iTNigDEag==
X-Google-Smtp-Source: AGRyM1sC6cNCdEJqmbeKGtrUH8i7eDFHdMrF/X6glAG8N5btBUlDuJg/gV3zQdC2biAdVn14wlTmoA==
X-Received: by 2002:a17:907:6e01:b0:704:8c0e:872f with SMTP id
 sd1-20020a1709076e0100b007048c0e872fmr24182696ejc.387.1655797793375; 
 Tue, 21 Jun 2022 00:49:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906211100b007109b15c109sm7084382ejt.66.2022.06.21.00.49.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 00:49:53 -0700 (PDT)
Message-ID: <8dd28bb6-c97f-d152-d2e9-816c2628a86d@mind.be>
Date: Tue, 21 Jun 2022 09:49:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20220620214058.1435436-1-angelo@amarulasolutions.com>
 <20220620214058.1435436-5-angelo@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220620214058.1435436-5-angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=q33AVj5XHIYB3KWUppZboVr3VH+D6iemG2YS6vEkgwo=;
 b=Ho6PkLRPa1m4RDb0wXpSU31mIS0gtLkIMYBiZJntJ/DIuV9dyE6LaFd1zI6EIxBQjk
 UvtAhj7WH7PFS6wpQgh+kUNOQQcQb5Uq//HsZlsXc6D01TVrhg0lqlqo84XtWU/nlTuJ
 eJZB/PsWEcWDiJ+J4Di5Vcs48vHs5fDUwMctUQkh89XefroiovyHM0N1WHnAZXn99SDx
 RGCoj4ciHYfxFH5tH94acXxN49BE6HtbgppCr0/S82E2w5iEZtiIDN4fx4OTOnd7SUrm
 apzJfwzhipd6ZgV/w5s3KxMm3GpMcyuYEopZUBuvy84PTVADOL1ZGyGpTkImOvzEEIw6
 1QlA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ho6PkLRP
Subject: Re: [Buildroot] [PATCH 4/4] package/busybox: add service to load
 kernel modules at boot
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/06/2022 23:40, Angelo Compagnucci wrote:
> In cases where no hotplug is available (by choice or by the lack of a
> proper hotplug method for a device), this service can be used to load
> kernel module drivers by reading the /etc/modules file.

  Do you have a concrete example of something that needs this? It's kind of a 
hack for e.g. a device connected to a serial port that isn't described in DT 
(e.g. on an x86 platform), right?

  I'm not altogether sure if it is worth making an init script for that.

  Also, this would belong to the initscripts package because it would also be 
needed if busybox isn't used at all (it would of course require kmod).


> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>   package/busybox/S02modules | 56 ++++++++++++++++++++++++++++++++++++++
>   package/busybox/busybox.mk |  2 ++
>   2 files changed, 58 insertions(+)
>   create mode 100644 package/busybox/S02modules
> 
> diff --git a/package/busybox/S02modules b/package/busybox/S02modules
> new file mode 100644
> index 0000000000..f25712e1ca
> --- /dev/null
> +++ b/package/busybox/S02modules
> @@ -0,0 +1,56 @@
> +#!/bin/sh
> +
> +MODULES="modules"
> +
> +load_unload() {
> +	[ ! -f /etc/${MODULES} ] && echo ' OK' && exit 0
> +
> +	while read module args; do
> +
> +		case "$module" in
> +			""|"#"*) continue ;;
> +		esac
> +
> +		if [ "$1" = "load" ]; then
> +			modprobe -q ${module} ${args} >/dev/null && \
> +				printf ' %s success,' "$module" ||
> +				printf ' %s failed,' "$module"
> +		else
> +			rmmod ${module} >/dev/null
> +		fi
> +
> +	done < /etc/${MODULES}
> +}
> +
> +start() {
> +	printf 'Starting %s:' "$MODULES"
> +
> +	load_unload load
> +
> +	echo ' OK'
> +}
> +
> +stop() {
> +	printf 'Stopping %s: ' "$MODULES"
> +
> +	load_unload unload
> +
> +	echo 'OK'
> +}
> +
> +restart() {
> +	stop
> +	sleep 1
> +	start
> +}
> +
> +case "$1" in
> +	start|stop|restart)
> +		"$1";;
> +	reload)
> +		# Restart, since there is no true "reload" feature.
> +		restart;;
> +	*)
> +		echo "Usage: $0 {start|stop|restart|reload}"
> +		exit 1
> +esac
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 3e49de0a84..40490e866a 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -382,6 +382,8 @@ define BUSYBOX_INSTALL_TARGET_CMDS
>   	$(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
>   	$(BUSYBOX_INSTALL_ZCIP_SCRIPT)
>   	$(BUSYBOX_INSTALL_MDEV_CONF)
> +	$(INSTALL) -m 0755 -D package/busybox/S02modules \
> +			$(TARGET_DIR)/etc/init.d/S02modules;

  This is a sysvinit script, so it should be installed in BUSYBOX_INSTALL_INIT_SYSV.



  Regards,
  Arnout

>   endef
>   
>   # Install the sysvinit scripts, for the moment, but not those that already
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
