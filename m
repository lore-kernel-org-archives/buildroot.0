Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014F4C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD27781407;
	Fri, 25 Sep 2026 14:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BnFwwYUoJO0e; Fri, 25 Sep 2026 14:47:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9A49981426
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347626;
	b=jVF5GGS00NiN7UDHfFvfzIzuc0E8b+CvxvMHzxjYUla06uXo1gyECti1/o/5zrjuT/QZ
	 /RRHWRA+TsShVertPgxg9Devl/7/JGrLm4aPtBuzI8JeWO91xYocPejUKvPatEViHVvxO
	 GqK11SgebQ5PwgbG5O4cwFoUq9/fLz+VtfS4UizEkpPDMrzm8HWI2AEcuTa1AW2If4ypn
	 0E52SMx7PwzKLqDiG2rw77lT1m66jDrJXh2E+zmwZWysgHhd6tlmCvAXqRuNrEO11VS31
	 z2H2abrDmbgctckH7Hi9wf3T/rq5eo/RMTlb8a2WkCGFmYTELFC1/ZDrVgJ107WDOyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347626;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8Qwe3LZyXthojhKug/95o4NcOCyD4p/ALe5YN/2G9FA=;
	b=cG9VExoK/1V80Aorw8wz8MYWqBDOUSMHjp57FssO+63LBodVoAZnH6g9yteU7ypBDTCa
	 B1bIQSg33mIpkjIGcnonD73k2p+ymEPNmO/3xDxSaMHiNOXHF33nGXfFV1z1ZPRHyRjlp
	 2Jr1tlE7wdGbgt5SS+bU3/hiL/ZTCNrElBsi/xnTvk1IGBlW1P+f2vJ5K8nI74ck7ypPk
	 vTFY9xZuMs1yT3JPFt/K45m11mNuR92a069Sg5AsBIlXhMwu4umPTofSI6+NBWRe009ux
	 TEOhX803B7JE9uTM3xGwCF5JWGRYbCGjHnJgpJKHOPpV8ujZQQ9mryeyWvE9F+aKF/Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347626;
	bh=8Qwe3LZyXthojhKug/95o4NcOCyD4p/ALe5YN/2G9FA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PCQVgPzqrusb76E8rAldx2Ok+w1eSFMTCbg7iW1n758z043awfP3HAIIEdcrvUIlb
	 qYM3bsYlBAu2ru8qFOCnk9qS4GMdhMPvozIUPeO4smVQQnbH0Wr8DoVLDwfjONYLXF
	 3QO09Ym4h52C9ICznDbmZUceE0qlmkEq8UtbJzv8SV+rMEHDA9UhsblPB6o9lQnFFj
	 ssmOhyPipuBeXHnrRFOtlhRDFuM8nfdMxIeJgyGbsbpQUmgwdV8PMgVftBBIcCQ6N2
	 xDsIWnsd3fm6K4VfQUhwyKVqyEh4+eDnzoZbpdPHhH0CUKRZ8CWHAq1Qvwjqnq7mKp
	 UDUHP8gugR4Ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A49981426;
	Fri, 25 Sep 2026 14:47:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DD9C0332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF8DE60DE7
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a25lI0-XbRQ0 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:47:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C071260DE1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347624;
 b=WSu86SJUTMJPWfkgvBzu13kkXDaRZWyb8zYFVmweuHpWhTM8qp/2JRUsZeFiXhM55K2r
 U0tx3X3XxSWNlB5BnkCS/9QVoHivE61O+10QyWtGxlvulCVfBijNiZ1CH9QPO8U/6YchW
 pRiX3d5zdzg1dnarfvmm7+9LQIC6R3EEedo3hOJ3Lta9c3Tx+WTTEFFsZzqYzpcMfJQoG
 jEk1+e68T+63R3R+2CL4uy0KVRFLkKaaLiH1+i8WMV3hil0XlcBL2y5Dgzqs40Je+Rmgv
 Sn1d2Rv49WwFXKDRzVmLYGHF5WdbFkMwcjtVv70Mj1rfVnAWomfjHQtFTnQZvDCIGKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347624;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=H9IH7gGhKxuytx3X0ksLKGs8B4RnLHEJccmKdMhB8pA=;
 b=B2xx2fXAfZgHwd+1u4sS7GKaFzkykc/nhcgfLhNUp5r47Q/GizgNPOTkWvWCfmmIdHIl
 VislFZ1G0yB/CeMDwEGdLbqJL/6n0ExTVnKqgK/Lh4+v0GUAUjDR5MtgLGrDk6NoH10qK
 nAuH0Bw3kVk1ap0D7jK/+A1f2GO5l/ZfyuM8HFPs/uA/WqUPsH/v9dCxAKiMTZ71Va5eT
 Aijis6/4vmdzcm+1eb1r0j8Cu0wKcDWspgRlHmLw8ifoUB47z2CUITszoYleWhZPh2m4G
 hvERaz6bBdrKbyP3RbWbhd/Z+XPkH7P3qRruCLpAo1tDwXUnaSvWmxc3dA49yu4EFTw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="e+Aa2P/V"; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C071260DE1
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:03 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e6c0fce17so5415145e9.1
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347622; x=1790952422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=H9IH7gGhKxuytx3X0ksLKGs8B4RnLHEJccmKdMhB8pA=;
 b=b6EofYAsbBg0Sz4gF7DIVjcs7FqHC6Pv4AEdfmE41muCdYJIVfSo/UKfqkmY8+yf9g
 LKCzXmbkpYB6Hreef8EeYbIrChslQ2jubXQMO34DjXoTL6TK/Ukk6ZmS0ChhzGrmqJ7p
 g+iY3hWsp9tNVMaHjV8GtZjSQ9AuTH5K016odQEsZIQPCNa5pqWVAfpk3QaQbZitm216
 jnFd8do/DiOAXEuDWzPKUaQjSzd2pn9FUio+WC61FVsBIhJFfU/MZ8qbaFBoNhCkmdrC
 TgkXtk9kHkYZ5+yes7UYKBGdOO39FNo3feArAUAB8QBLU+vLGt6WZrQp5qDjtx9zH+by
 h55w==
X-Gm-Message-State: AFuF++k4KF8EomTmpyv5PVc/bMVrImV7TeJjd0yHbpYrT9RM7cXrTprk
 TKvcuhExwr6BQhJE7XEyLYjd1f3CDaQlkoA5cnQudn8e0Ob2BjsyNgAJnxM5x4km7J+t3mbrlyZ
 dJ2OFgFpl/g==
X-Gm-Gg: AYBFou2qKclUIJxm5Ob+8AYEWE+uvJmWZH0fjZcuGB4SE3U3wnXZX9NX7LmX/qVTKun
 5qHpGYi4/Tjj8+Eo7sY7Tn8MpfiqjZ83EDH6+gG+nmjJ5CIU559ruqnnu9+HB6eAhZdZuhrCAan
 ICxBqCk1ExxjgcmqTH/6lPdQj9BlKwoJM3hd4zPjBRFkKnuRFmyxJ5jMW5RKUBXM91V45EZh8GP
 r8NQc3PZddKqt+qgrGJl4lg/J2Y769G1yjVheL43HQWSX0NLjagMgq9OalkKaLhmW3iE7Fe4Q1e
 OJkFrc86wtamM+mNI+FxBfvyW4gAKz/OlMBCloy59T+2dOJVkmNDMZusttVvvGNkyNVgGgyZY69
 BsGa/E7mSdbCA6bsbPhOtI4R0p12XpAT4NYPgLrplX6rXNebq1q+UGwBjNT+OkgWLTffmelXoRY
 McfdAbGREtH3YWaEibLg90EFa+/59Ve2L087wUiKxfPMajxiZjuPo2ubiMpYA7r3JebOYCfCTNv
 RAS9ZaWx85/DfidimaT43lAxmH5uWxNe4oFtAgoCA==
X-Received: by 2002:a05:600c:4ec8:b0:49f:dd10:3c71 with SMTP id
 5b1f17b1804b1-49fe66c61c4mr108600845e9.11.1790347621739; 
 Fri, 25 Sep 2026 07:47:01 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ff069ceebsm75359785e9.3.2026.09.25.07.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:47:01 -0700 (PDT)
To: buildroot@buildroot.org,
	Joachim Wiberg <troglobit@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:46:58 +0200
Message-ID: <20260925144700.4100495-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260917160543.243218-3-troglobit@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/2] package/lldpd: rework start script
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> check-package reports six warnings on S60lldpd: indentation with
> spaces, no DAEMON variable, and shellcheck complaints.
> 
> The script also masks failures, the exit status of
> "[ $? = 0 ] && echo OK || echo FAIL" is the one of echo, so start and
> stop always return success.  Stopping does not wait for the daemon to
> exit either, so a restart can race the instance on its way out.
> 
> Rewrite it after package/busybox/S01syslogd, as the manual asks.  lldpd
> daemonizes and writes the PID file itself, but does not remove it on
> exit, so pass the PID file to both start-stop-daemon and the daemon and
> drop the stale file once the process is gone.  Also pick up arguments
> from /etc/default/lldpd and add the customary reload alias.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> [Julien: remove .checkpackageignore entry to fix check-package error]
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  .checkpackageignore    |  1 -
>  package/lldpd/S60lldpd | 80 ++++++++++++++++++++++++++++++------------
>  2 files changed, 58 insertions(+), 23 deletions(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 2fc8349f1e..32be4c93aa 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -550,7 +550,6 @@ package/lirc-tools/0001-plugins-devinput.c-fix-build-with-musl-1.2.0.patch lib_p
>  package/lirc-tools/0002-configure-add-disable-doc-option.patch lib_patch.Upstream
>  package/lirc-tools/S25lircd lib_sysv.Indent lib_sysv.Variables
>  package/live555/0001-Add-a-pkg-config-file-for-the-shared-libraries.patch lib_patch.Upstream
> -package/lldpd/S60lldpd Shellcheck lib_sysv.Indent lib_sysv.Variables
>  package/lm-sensors/0001-no-host-ldconfig.patch lib_patch.Upstream
>  package/lmbench/0001-scripts-build-use-bin-bash-as-shell.patch lib_patch.Upstream
>  package/lmbench/0002-src-Makefile-add-lmbench-to-list-of-executables.patch lib_patch.Upstream
> diff --git a/package/lldpd/S60lldpd b/package/lldpd/S60lldpd
> index 3dfa6c1aa1..79605c2f02 100644
> --- a/package/lldpd/S60lldpd
> +++ b/package/lldpd/S60lldpd
> @@ -1,25 +1,61 @@
>  #!/bin/sh
> -#
> -# Controls lldpd.
> -#
>  
> -case $1 in
> -    start)
> -	printf "Starting lldpd: "
> -	start-stop-daemon -S -q -p /var/run/lldpd.pid --exec /usr/sbin/lldpd
> -	[ $? = 0 ] && echo "OK" || echo "FAIL"
> -	;;
> -    stop)
> -	printf "Stopping lldpd: "
> -	start-stop-daemon -K -q -p /var/run/lldpd.pid
> -	[ $? = 0 ] && echo "OK" || echo "FAIL"
> -	;;
> -    restart)
> -	$0 stop
> -	$0 start
> -	;;
> -    *)
> -	echo "Usage: $0 {start|stop|restart}"
> -	exit 1
> -	;;
> +DAEMON="lldpd"
> +PIDFILE="/var/run/$DAEMON.pid"
> +
> +LLDPD_ARGS=""
> +
> +# shellcheck source=/dev/null
> +[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
> +
> +# lldpd daemonizes and creates the PID file itself, so tell it where to
> +# put it, but it does not remove it on exit.
> +start() {
> +	printf 'Starting %s: ' "$DAEMON"
> +	# shellcheck disable=SC2086 # we need the word splitting
> +	start-stop-daemon --start --pidfile "$PIDFILE" \
> +		--exec "/usr/sbin/$DAEMON" \
> +		-- -p "$PIDFILE" $LLDPD_ARGS
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
> +	start-stop-daemon --stop --pidfile "$PIDFILE" \
> +		--exec "/usr/sbin/$DAEMON"
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +		return "$status"
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
>  esac
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
