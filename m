Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E920FCA0FF7
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A10766155A;
	Fri, 29 Aug 2025 10:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gPr7iqXPkGBS; Fri, 29 Aug 2025 10:22:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9E376158B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9E376158B;
	Fri, 29 Aug 2025 10:22:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E169DD2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7E7E6155A
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1IysZ_QNpSL for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:22:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8CBF56158B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CBF56158B
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CBF56158B
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:22:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 97CE8B978440; Fri, 29 Aug 2025 12:22:20 +0200 (CEST)
Message-ID: <ebfe182a-ffff-4f20-b6d8-3e244ac86508@rnout.be>
Date: Fri, 29 Aug 2025 12:22:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
References: <20250823194953.3458533-1-romain.naour@smile.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250823194953.3458533-1-romain.naour@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756462942; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Jm2hQ3FlDcVxU1JE0AsAka1OOWC3dh8yStIRpdrQGS4=;
 b=CqT0HAJqOKC5QbPmEeO1wtLESmwlMsnsT91my68ELwFzKx04pdsVnYyCrNPUwMJ+hEv6XR
 iO+bwQExjsY3ZLIbDRzNKyQ+AcrVDcq0qTm8wAby4N7FR8ZVKJ1fsLYtl95c/4uE04XrhU
 wUB8KLS7EfVnWjJmN+So56LVQGKI3n8f2JCLiCudARLRSJBuCSO9KiCa+UdJ4rj2VfQ60d
 8E6Z7OqRAzYuzd6BmbuIoWdba5VyDfi95AvPC/s8SRBhEgu28gYWGehqAROkTP1FgUXzkU
 GBpVaNqlFoe9bH3Xcow3hMGEZ5T3EqJ9GOwDRubmmjYjVe4ratjWK3t2k4Ok1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=CqT0HAJq
Subject: Re: [Buildroot] [PATCH v2 1/4] package/busybox: add httpd server
 startup script
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/08/2025 21:49, Romain Naour via buildroot wrote:
> In order to remove thttpd package from Buildroot, we have to replace it
> from our testsuite (TestWget and TestLibCurl).
> 
> Busybox provide an httpd server applet but it's not enabled in our
> default busybox configuration.
> 
> For the sake of those tests, add a new busybox option to build and
> install the Busybox's httpd server and its init script.
> 
> Import S90thttpd from thttpd package to S90httpd but with some changes
> following S01syslogd init script as a reference [1].
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/3dc80614442cc3942a372a8c31abd22c1bc96241
> 
> Cc: Julien Olivain <ju.o@free.fr>
> Cc: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

  Applied series to master, thanks. And thank you Fiona for the review!

  Regards,
  Arnout

> ---
> V2: update S90httpd following S01syslogd init script as a reference (Fiona Klute)
>      See: https://gitlab.com/buildroot.org/buildroot/-/commit/3dc80614442cc3942a372a8c31abd22c1bc96241
> ---
>   package/busybox/Config.in  |  6 ++++
>   package/busybox/S90httpd   | 59 ++++++++++++++++++++++++++++++++++++++
>   package/busybox/busybox.mk | 16 +++++++++++
>   3 files changed, 81 insertions(+)
>   create mode 100644 package/busybox/S90httpd
> 
> diff --git a/package/busybox/Config.in b/package/busybox/Config.in
> index 3c2aa515f8..659c6aebfc 100644
> --- a/package/busybox/Config.in
> +++ b/package/busybox/Config.in
> @@ -69,6 +69,12 @@ config BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
>   comment "Busybox individual binaries need a toolchain w/ dynamic library"
>   	depends on BR2_STATIC_LIBS
>   
> +config BR2_PACKAGE_BUSYBOX_HTTPD
> +	bool "Install the httpd server startup script"
> +	help
> +	  Install the httpd server startup script,
> +	  that just start at the boot the busybox httpd server
> +
>   config BR2_PACKAGE_BUSYBOX_WATCHDOG
>   	bool "Install the watchdog daemon startup script"
>   	help
> diff --git a/package/busybox/S90httpd b/package/busybox/S90httpd
> new file mode 100644
> index 0000000000..0d43ea3e74
> --- /dev/null
> +++ b/package/busybox/S90httpd
> @@ -0,0 +1,59 @@
> +#!/bin/sh
> +
> +DAEMON="httpd"
> +PIDFILE="/var/run/$DAEMON.pid"
> +
> +HTTPD_ARGS="-h /var/www/data"
> +
> +# shellcheck source=/dev/null
> +[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
> +
> +# BusyBox' httpd does not create a pidfile, so pass "-f" in the command line
> +# and use "--make-pidfile" to instruct start-stop-daemon to create one.
> +start() {
> +	printf 'Starting %s: ' "$DAEMON"
> +	# shellcheck disable=SC2086 # we need the word splitting
> +	start-stop-daemon --start --background --quiet --make-pidfile \
> +		--pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON" \
> +		-- -f $HTTPD_ARGS
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	return "$status"
> +}
> +
> +stop() {
> +	printf 'Stopping %s: ' "$DAEMON"
> +	start-stop-daemon --stop --quiet --pidfile "$PIDFILE"
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
> +		--exec "/usr/sbin/$DAEMON"; do
> +		sleep 0.1
> +	done
> +	rm -f "$PIDFILE"
> +	return "$status"
> +}
> +
> +restart() {
> +	stop
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
> index 532932ec8f..d7eda71db6 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -258,6 +258,19 @@ define BUSYBOX_SET_SELINUX
>   endef
>   endif
>   
> +ifeq ($(BR2_PACKAGE_BUSYBOX_HTTPD),y)
> +define BUSYBOX_SET_HTTPD
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HTTPD)
> +endef
> +define BUSYBOX_INSTALL_HTTPD_SCRIPT
> +	if grep -q CONFIG_HTTPD=y $(@D)/.config; then \
> +		mkdir -p $(TARGET_DIR)/var/www/data ;\
> +		$(INSTALL) -m 0755 -D package/busybox/S90httpd \
> +			$(TARGET_DIR)/etc/init.d/S90httpd ; \
> +	fi
> +endef
> +endif
> +
>   # enable relevant options to allow the Busybox less applet to be used
>   # as a systemd pager
>   ifeq ($(BR2_PACKAGE_SYSTEMD):$(BR2_PACKAGE_LESS),y:)
> @@ -418,6 +431,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
>   	$(BUSYBOX_SET_WATCHDOG)
>   	$(BUSYBOX_SET_SELINUX)
>   	$(BUSYBOX_SET_LESS_FLAGS)
> +	$(BUSYBOX_SET_HTTPD)
>   	$(BUSYBOX_SET_INDIVIDUAL_BINARIES)
>   	$(BUSYBOX_DISABLE_IP_LINK_CAN)
>   	$(PACKAGES_BUSYBOX_CONFIG_FIXUPS)
> @@ -447,6 +461,7 @@ define BUSYBOX_INSTALL_INIT_OPENRC
>   	$(BUSYBOX_INSTALL_IFPLUGD_SCRIPT)
>   	$(BUSYBOX_INSTALL_CROND_SCRIPT)
>   	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
> +	$(BUSYBOX_INSTALL_HTTPD_SCRIPT)
>   endef
>   
>   define BUSYBOX_INSTALL_INIT_SYSTEMD
> @@ -461,6 +476,7 @@ define BUSYBOX_INSTALL_INIT_SYSV
>   	$(BUSYBOX_INSTALL_IFPLUGD_SCRIPT)
>   	$(BUSYBOX_INSTALL_CROND_SCRIPT)
>   	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
> +	$(BUSYBOX_INSTALL_HTTPD_SCRIPT)
>   endef
>   
>   # Checks to give errors that the user can understand

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
