Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414D4D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15624842D5;
	Tue, 13 Jan 2026 19:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jFW1FVuHMpc; Tue, 13 Jan 2026 19:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CB1F842CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333617;
	bh=AmgPvgfDeec3rM8inPkbKjMD1LqtUimH/UI7yVW3/4U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=a+j6FA2BsuQEmhKrUYTS0KpiqlYBTe+VOs3zMB73YZl3IG4uPyAxbvPEoevIgUIdP
	 V+lFFUfxprmZ7F2lQgGsKp/3htsznXTDrzyQLsuP50Q2SBobhoXrxEaL6sQff+RUXO
	 KszfqLucivw31wh4E8xaOpSZxxPKz+zjzuA5Iuw8PznnGLoU6G9svGaihX2AH6zB/B
	 BC2NUaH2c35ewwoSHa5XhUFKWXinoAaiYaoKhDURVkhi9JDB6heOiURdETWYkZfVhJ
	 wTRt1F6Li7HPUFxrcB+rG0gRFBdtbTtsLhwXS9QK04zxrZxkfvmevALyEfjRXf2QA9
	 VSPNUrKZUePyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CB1F842CA;
	Tue, 13 Jan 2026 19:46:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC0091C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCF0040376
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxW1g7Y1N0jw for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:46:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 903A540373
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 903A540373
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 903A540373
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 969E2B97A863; Tue, 13 Jan 2026 20:46:51 +0100 (CET)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:46:50 +0100
Message-ID: <20260113194650.99101-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230175738.267463-2-fiona.klute@gmx.de>
References: <20251230175738.267463-2-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333611; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=qCA3Mk6R1Qw/lrUOOnMe97Ps6m3a5FqL1tTCYKMokYU=;
 b=D27WcdMV2UnQuIKLKqDw/6cA0b6ztSz6sHl9SFq0Jx/UGhM0kbsXtBrvHUqNTasYYdovDI
 ktXx3uP0hKCO3X/nLNAKA6hSi8cnkXCXXL7oW7729Y8t7J62yJryv+Lh4NTIBd7epAGiE+
 o0L2lPqFm76Ilt0Gfq+jI8bcnenpq/tslVSqcjBEf/ZiS9dfyJkLZxj/dr23L+kxG/9Hl8
 bCmeCXJswWL/QF7weNA7hGHhXE1lW2Q2v+CuFXHz9B4J4aJZJANKdxLveNTD2UXcmMYovl
 yAfv0uHN+ifAvSRq0blGzaFvCfnljDDN7UeGmX6ygX8khDDwb3GPyPOTKt5bog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=D27WcdMV
Subject: Re: [Buildroot] [PATCH 2/3] package/dbus: rewrite & rename SysV
 init script
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This brings the script in line with current standards, except the
> expected PIDFILE value because changing the PID file path would
> require changing build options.
> 
> The stop action now uses the PID file instead of "killall", and reload
> is supported using SIGHUP (with limitations described in D-Bus
> documentation). "--syslog" is added to the dbus-daemon arguments to
> ensure log messages will be available, otherwise log messages after
> fork may be lost.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  .checkpackageignore         |  1 -
>  package/dbus/S30dbus        | 58 ------------------------------
>  package/dbus/S30dbus-daemon | 71 +++++++++++++++++++++++++++++++++++++
>  package/dbus/dbus.mk        |  4 +--
>  4 files changed, 73 insertions(+), 61 deletions(-)
>  delete mode 100644 package/dbus/S30dbus
>  create mode 100644 package/dbus/S30dbus-daemon
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 3099dbc576..b6838c7c0d 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -302,7 +302,6 @@ package/davfs2/0001-src-Makefile.am-do-not-hardcode-fstack-protector-str.patch l
>  package/dbus-cpp/0001-gcc4.7.patch lib_patch.Upstream
>  package/dbus-cpp/0002-cross-compile-tools.patch lib_patch.Upstream
>  package/dbus-cpp/0003-src-pipe.c-fix-build-error-with-gcc-7.x.patch lib_patch.Upstream
> -package/dbus/S30dbus Shellcheck lib_sysv.Indent lib_sysv.TrailingSpace lib_sysv.Variables
>  package/dc3dd/0001-no_man.patch lib_patch.Upstream
>  package/dc3dd/0002-fix-autoreconf.patch lib_patch.Upstream
>  package/dc3dd/0003-fix-for-glibc-2.28.patch lib_patch.Upstream
> diff --git a/package/dbus/S30dbus b/package/dbus/S30dbus
> deleted file mode 100644
> index da02609f2d..0000000000
> --- a/package/dbus/S30dbus
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -#!/bin/sh
> -#
> -# messagebus:   The D-BUS systemwide message bus
> -#
> -# chkconfig: 345 97 03
> -# description:  This is a daemon which broadcasts notifications of system events \
> -#               and other messages. See http://www.freedesktop.org/software/dbus/
> -#
> -# processname: dbus-daemon
> -# pidfile: /run/messagebus.pid
> -#
> -
> -# Create needed directories.
> -[ -d /run/dbus ] || mkdir -p /run/dbus
> -[ -d /tmp/dbus ] || mkdir -p /tmp/dbus
> -
> -RETVAL=0
> -
> -start() {
> -    printf "Starting system message bus: "
> -
> -    dbus-uuidgen --ensure
> -    dbus-daemon --system
> -    RETVAL=$?
> -    echo "done"
> -}
> -
> -stop() {
> -    printf "Stopping system message bus: "
> -    killall dbus-daemon
> -    RETVAL=$?
> -    echo "done"
> -    if [ $RETVAL -eq 0 ]; then
> -        rm -f /run/messagebus.pid
> -    fi
> -}
> -
> -# See how we were called.
> -case "$1" in
> -    start)
> -        start
> -        ;;
> -    stop)
> -        stop
> -        ;;
> -    restart)
> -        stop
> -        start
> -        ;;
> -    reload)
> -        echo "Message bus can't reload its configuration, you have to restart it"
> -        RETVAL=$?
> -        ;;
> -    *)
> -        echo "Usage: $0 {start|stop|restart|reload}"
> -        ;;
> -esac
> -exit $RETVAL
> diff --git a/package/dbus/S30dbus-daemon b/package/dbus/S30dbus-daemon
> new file mode 100644
> index 0000000000..3331b11ced
> --- /dev/null
> +++ b/package/dbus/S30dbus-daemon
> @@ -0,0 +1,71 @@
> +#!/bin/sh
> +
> +DAEMON="dbus-daemon"
> +# check-package lib_sysv.Variables
> +PIDFILE="/run/messagebus.pid"
> +
> +start() {
> +	printf 'Starting system %s: ' "$DAEMON"
> +	# Create needed directories
> +	mkdir -p /run/dbus
> +	mkdir -p /tmp/dbus
> +	# Generate /var/lib/dbus/machine-id if needed
> +	dbus-uuidgen --ensure
> +
> +	start-stop-daemon --start --pidfile "$PIDFILE" \
> +		--exec "/usr/bin/$DAEMON" \
> +		-- --system --syslog
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
> +	start-stop-daemon --stop --pidfile "$PIDFILE" --exec "/usr/bin/$DAEMON"
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +		return "$status"
> +	fi
> +	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
> +		--exec "/usr/bin/$DAEMON"; do
> +		sleep 0.1
> +	done
> +	rm -f "$PIDFILE"
> +	return "$status"
> +}
> +
> +reload() {
> +	printf "Reloading %s config: " "$DAEMON"
> +	start-stop-daemon --stop --signal HUP -q --pidfile "$PIDFILE" \
> +		--exec "/usr/bin/$DAEMON"
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	return "$status"
> +}
> +
> +restart() {
> +	stop
> +	start
> +}
> +
> +case "$1" in
> +	start|stop|reload|restart)
> +		"$1"
> +		;;
> +	*)
> +		echo "Usage: $0 {start|stop|restart|reload}"
> +		exit 1
> +		;;
> +esac
> diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
> index 2002e707f0..061a341363 100644
> --- a/package/dbus/dbus.mk
> +++ b/package/dbus/dbus.mk
> @@ -93,8 +93,8 @@ endef
>  DBUS_POST_INSTALL_TARGET_HOOKS += DBUS_REMOVE_DEVFILES
>  
>  define DBUS_INSTALL_INIT_SYSV
> -	$(INSTALL) -m 0755 -D package/dbus/S30dbus \
> -		$(TARGET_DIR)/etc/init.d/S30dbus
> +	$(INSTALL) -m 0755 -D package/dbus/S30dbus-daemon \
> +		$(TARGET_DIR)/etc/init.d/S30dbus-daemon
>  
>  	mkdir -p $(TARGET_DIR)/var/lib
>  	rm -rf $(TARGET_DIR)/var/lib/dbus
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
