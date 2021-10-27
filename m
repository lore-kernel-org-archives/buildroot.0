Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8E9C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:13:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ECD66103C
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5ECD66103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C5CF40586;
	Wed, 27 Oct 2021 20:13:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OU2JGmNSjFlU; Wed, 27 Oct 2021 20:13:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 665324058A;
	Wed, 27 Oct 2021 20:13:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB0BA1BF3D4
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D763F60B20
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:13:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yDv5ISqf3ycS for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 20:13:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9ED98607AF
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 20:13:45 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id s1so15324909edd.3
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 13:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=d6ot2Nr17u/I7Dz/o48RFdFK4eP5NYEdJLa2RxUA/uc=;
 b=Nv8RPIRubBiJoIdqgqztJMnzRyNga6CSpKyFcuKw+SxirZZvVhtdPHhd9nk3meTxpe
 99mAdIITVvfwV9for6BNf6w5y+wWJCLQOQGADV+0FVLeEFsVCoxA7C0KaIVYMDx6ee5c
 naYahHFosaeF1+MZ0ifZnG5sXI62S2IPe2Q+8Mv/1Rp7HWInlZsByJi/ND4rA+axBoHP
 d7/Yn1D4wgZsv7SS7GjI2+tdi8WtS0JIo5hfZSQYCi7cKACiitNnCOBFx51Mmr6S5NQr
 TcWpclmWgLWbtpWHvKyTG2Kj7vMhdzdBhWAwePvoeoqFF1KK+je+p4aKeZepx9MNPFQA
 zDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=d6ot2Nr17u/I7Dz/o48RFdFK4eP5NYEdJLa2RxUA/uc=;
 b=kNw3/dqu1btMRXwdDe7GzoeJTbZ1m94g+AxI6djuJexcvHYAPZCkalqDj3KhzXnS+4
 ksV4geZWiD0lPWjocFTVhW3MEUgr7lPmx9Y9hPDHVFLJG/48Cj5mQFXuzitOth8oWfvW
 J+4iqfO8YD9pkTNX8TvBj4fKmmS0i86Wafut4hKTYiGkAlsBj7We4RQa169/jEepL1MU
 sjQcf6RtWWLFkIVz1a59FwsoKhL9jj3icmHD+AnW0yBBIG0wiHZNEQdviFVbTvO8rsi0
 fKODRGXCfMVYudG6IZ+WT0euxtPjm9MzaJb0mK3FWtBgo3B+XJ8N4hZRQ9hRR6OvYGte
 5rzA==
X-Gm-Message-State: AOAM530Y/Oh15XL2n6RJSdQkke19g7wq2rCLBZJ3FnqtCNSYu0FzDjXn
 j98prFiJnwJkA+sToJob+rmDXw==
X-Google-Smtp-Source: ABdhPJwiccXqFbAvO/ioU87XGo8CbQH0YhyUA7MlphOJGyh8pDAwkwWBUEDwdvcD9jFKPCww87hKpQ==
X-Received: by 2002:a50:d885:: with SMTP id p5mr48268890edj.255.1635365623834; 
 Wed, 27 Oct 2021 13:13:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id a20sm410646ejd.112.2021.10.27.13.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 13:13:43 -0700 (PDT)
Message-ID: <9079d075-d4a0-b67e-d617-97f32e26e28a@mind.be>
Date: Wed, 27 Oct 2021 22:13:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
References: <20211010154941.1093769-1-troglobit@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211010154941.1093769-1-troglobit@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/watchdogd: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Alejandro_Gonz=c3=a1lez?= <alejandro.gonzalez.correo@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/10/2021 17:49, Joachim Wiberg wrote:
> This patch adds support for watchdogd, a watchdog daemon with built-in
> process supervisor[1] as well as support for monitoring memory & file
> descriptor leaks, and CPU load average.  When a monitored resource
> reaches a high watermark, a warning message is logged and when critical
> level is reached, the cause is saved and the system is rebooted.  On
> reboot the reset cause can be retrieved to help locate the culprit.
> 
> Support for SysV init script in this patch, and systemd unit file is
> installed from the one bundled with the package.  Both files supoort
> additional command line options in /etc/default/watchdogd.
> 
> The Config.in is slightly big, but allows for disabling or adjusting
> the poll interval for each resource monitor.
> 
> For more information, see https://github.com/troglobit/watchdogd
> 
> [1]: processes must have their main loop instrumented for supervision.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

  Applied to master, thanks, with changes specified below.

> ---
>   DEVELOPERS                       |  1 +
>   package/Config.in                |  1 +
>   package/watchdogd/Config.in      | 69 ++++++++++++++++++++++++++++++++
>   package/watchdogd/S01watchdogd   | 47 ++++++++++++++++++++++
>   package/watchdogd/watchdogd.hash |  5 +++
>   package/watchdogd/watchdogd.mk   | 55 +++++++++++++++++++++++++
>   6 files changed, 178 insertions(+)
>   create mode 100644 package/watchdogd/Config.in
>   create mode 100755 package/watchdogd/S01watchdogd
>   create mode 100644 package/watchdogd/watchdogd.hash
>   create mode 100644 package/watchdogd/watchdogd.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 7ebfc9234b..cf68b94685 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1335,6 +1335,7 @@ F:	package/mg/
>   F:	package/netcalc/
>   F:	package/ssdp-responder/
>   F:	package/sysklogd/
> +F:	package/watchdogd/
>   
>   N:	Joao Pinto <jpinto@synopsys.com>
>   F:	board/synopsys/vdk/
> diff --git a/package/Config.in b/package/Config.in
> index 9fed0ab4cb..167a6339c1 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2540,6 +2540,7 @@ menu "System tools"
>   	source "package/unscd/Config.in"
>   	source "package/util-linux/Config.in"
>   	source "package/watchdog/Config.in"
> +	source "package/watchdogd/Config.in"
>   	source "package/xdg-dbus-proxy/Config.in"
>   	source "package/xen/Config.in"
>   	source "package/xvisor/Config.in"
> diff --git a/package/watchdogd/Config.in b/package/watchdogd/Config.in
> new file mode 100644
> index 0000000000..48abbac8fa
> --- /dev/null
> +++ b/package/watchdogd/Config.in
> @@ -0,0 +1,69 @@
> +config BR2_PACKAGE_WATCHDOGD
> +	bool "watchdogd"
> +	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_LIBCONFUSE
> +	select BR2_PACKAGE_LIBITE
> +	select BR2_PACKAGE_LIBUEV
> +	help
> +	  Extended version of uClinux-dist watchdogd.  Monitors loadavg,
> +	  file descriptors and memory leaks, and capable of supervising
> +	  your processes main loop using an instrumentation API.
> +
> +	  A reset reason is saved for power loss, CPU overload, or any
> +	  of the monitored conditions (above).	The full capabilities
> +	  are limited by the kernel watchdog driver, but even the basic
> +	  "softdog" driver is supported.  See /etc/watchdogd.conf for
> +	  details, and try watchdogctl for system status and available
> +	  commands.
> +
> +	  https://github.com/troglobit/watchdogd/
> +
> +if BR2_PACKAGE_WATCHDOGD
> +
> +config BR2_PACKAGE_WATCHDOGD_TEST_SUITE
> +	bool "Enable watchdogctl test cases"
> +	default y
> +	help
> +	  The watchdogctl program comes with a suite of tests built-in.
> +	  They can be used to verify correct operation of watchdogd and
> +	  the kernel watchdog driver.

  This doesn't sound like something you'd want enabled by default, so I removed 
the "default y".

> +
> +	  Default: enabled
> +
> +config BR2_PACKAGE_WATCHDOGD_GENERIC_POLL
> +	int "Generic script monitor poll interval (sec)"
> +	default "300"
> +	help
> +	  Poll interval for generic script monitor, in seconds.  A value
> +	  of zero (0) disables the monitor.
> +
> +	  Default: 300 seconds

  We normally don't have such Default: entries in the help text. It's kind of 
pointless IMHO.

[snip]
> +define WATCHDOGD_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 0755 package/watchdogd/S01watchdogd \
> +		$(TARGET_DIR)/etc/init.d/S01watchdogd
> +endef
> +
> +define WATCHDOGD_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 644 $(WATCHDOGD_PKGDIR)/watchdogd.service \

  WATCHDOGD_PKGDIR is package/watchdog. You want WATCHDOGD_SRCDIR here.

  Regards,
  Arnout

> +		$(TARGET_DIR)/usr/lib/systemd/system/watchdogd.service
> +endef
> +
> +$(eval $(autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
