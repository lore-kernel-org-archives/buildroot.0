Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1A3C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44609411C4;
	Fri, 26 Jun 2026 14:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oAnelJVbfZJg; Fri, 26 Jun 2026 14:56:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7862E411C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485761;
	bh=taZ/5Xl71cQqYtLtrOmhlPVeBmLESPxotH1yE1W+Ed4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mUJOL+zfwJV6dgdV5hWaL0iK3sC2RQ7qSVCvwS+ZZpvDSgW4koGVJRLEeWdNxayYT
	 1kKycuJNA6Y8+AVlCAPZL6mSvOc8UrWdY+clYT6vUd8QuaIeY9kKGBiqyPRGg5xJYA
	 niqy9HYdET6+tB2GFx60uMZr9J7+Jcly0viOwJb7A/XfR/SfOWIkFSiY2tDAqmzc/Z
	 Uy3RbsRSBhCX03ifmyKSFrAJdwtxkTLUP2rOyy8pbQuoeEORv5e6NsuWhiRSbIwrn4
	 uQ3paV76Nk4fI5hD1ClRo7cc9niflqQ3zVQsRA1C3rghCDN2vtmHzJ9Lz8iDc4r5Gz
	 IN/u73yPmUP1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7862E411C1;
	Fri, 26 Jun 2026 14:56:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 828783A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 742A96100B
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vgrDXwKBjyPf for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:55:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6DBB46107D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DBB46107D
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DBB46107D
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:59 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-46caaa805b2so681250f8f.0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485757; x=1783090557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lmR8Z7+EXKOX57zMPRXIxuWExFWi6RSSGgY3QkC0TiI=;
 b=BoYOQOXms+rFsA2hygToGqIb3L9njJ6nDu7QET3fBEq/cGFK/gTOgAvtMHbxpUEgmJ
 PFdq1UM63U80Tg9F/M5horWImN1ec+hAsM4P/mvUtPJbMCsV19RLVM7hBBE4heeuApoL
 FCr5ZqzrRtpHPBUs+Qu7Apoq472wiheIqnvOrOxP4EFiKyXYpCrynwsOiY3ukispQKoe
 C8Qcj8N+lT6DSfPfbVE+vWm04OJ8bTzdbOp8CSu3+orp6fGgvm00vti3OSvD4Mk5PDge
 nhgpwM7UtR45m4eRvXz/aZur7xZ6aP1PyfJRu0LH3JAjrdRdsY/er9BLoPBusNCXRICV
 BWNA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpQZv3zr84ZkfY3f+rnnp04C/kdrHjD/0TdQvMBfBVQS7cgrmnxJz+9yUaINzimiNEjuLGgYezsXKQ=@buildroot.org
X-Gm-Message-State: AOJu0YyeB27zVn63BIYPeBmgN7T9hk7kQ/+wNKMwJ08b7SaYa6/+XCk7
 xQuMHnTZHg1BW4KCi4/5/2uuhpWlP/Olu8eSIvFuAKGVl1zwAIif8j5ha/f1bZL2H9c=
X-Gm-Gg: AfdE7clqN2KLdi4Qt1e4rIHQhygZbafB3w/6HTvP+MfTcBW1PVOuZrVkKo3JE/WToaZ
 l7Xujr9IVd0lckF/hfCbexynzehf96QQ2twaC2et8YCukZr3hNW6K/lp7u/jtI2J6ioZBfnIP9K
 b/CKrLLLZKWyhOq/m80o2fMgLxJEd0r125NOime3ESMnRbCv+sUg3fUduBO5p87AHKoQnCWl2pi
 h5OJfd/eF8KVGWxmVJ2ldG7tbe172cVj/nkvjgGgQTNBAz1t+IOzvzmkBwnLN0+/aHn8ReOrbhO
 HCT6suh+eAAAsMWPQMEBfcSItCIilaLNN4Cit2ZCSI9Rf6pyGnTIVv0z/ECfzD8j/hrtwPL1oWu
 4KF5Cm0GhLmTJCysPhfk9LwxoKtwSn2OFJSJXftk6yZvDu8BohRkqwGYtrfZLsJjPU7oYdidZMV
 pXRym6EW2svPu1L9o=
X-Received: by 2002:a05:6000:470b:b0:46d:28a7:3ce7 with SMTP id
 ffacd0b85a97d-46dbed35effmr10942721f8f.7.1782485757254; 
 Fri, 26 Jun 2026 07:55:57 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46f9db29a94sm2639445f8f.22.2026.06.26.07.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:55:57 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:55:56 +0200
Message-ID: <20260626145556.343328-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606182032.3803327-4-fiona.klute@gmx.de>
References: <20260606182032.3803327-4-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485757; x=1783090557; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lmR8Z7+EXKOX57zMPRXIxuWExFWi6RSSGgY3QkC0TiI=;
 b=MgtwT35xfDx9sT8JyLuans/m5T/6XthP2t6f/bTnRPhPPWPabRSLjF24b6di8kZxtV
 S5zXM2i54NGbJuelkMBJG5oxVFPCr1ijryS/xBCfnFp3UD45uDvavfBIS2oKOx58dfct
 A+pjulMHOPa6eTrVdel+OpDGbNtuRy9a3c7Kpl0man0HWK4DRq5dXPI2kk/CkzQ0z2hC
 lZowUDLDLD0uREkKYPUEl3bsW+ElUK6tEspxrM+QfGcxT74MkGRdm8hV9K8hrEuO9B7Z
 m9yVzca/wdt7GolLgvqVlg1qfJIeNJvYr8v1Rhbq/9OK83p3PH7BBiiAat99eHXaBGpz
 ZYyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MgtwT35x
Subject: Re: [Buildroot] [PATCH 3/4] package/mdnsd/S50mdnsd: rewrite to
 match current guidelines
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> With the action function as the last command in the script its return
> code automatically becomes that of the script, and without explicit
> exit shellcheck does not complain about unused functions.
> 
> Also wait for the process to stop in "stop", and simplify restart.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/mdnsd/S50mdnsd | 55 ++++++++++++++++++++++++++++--------------
>  1 file changed, 37 insertions(+), 18 deletions(-)
> 
> diff --git a/package/mdnsd/S50mdnsd b/package/mdnsd/S50mdnsd
> index 803ac12a8e..a3d8835918 100644
> --- a/package/mdnsd/S50mdnsd
> +++ b/package/mdnsd/S50mdnsd
> @@ -1,5 +1,4 @@
>  #!/bin/sh
> -# shellcheck disable=SC2317  # Don't warn about unreachable commands in this file
>  
>  DAEMON=mdnsd
>  MDNSD=/usr/sbin/$DAEMON
> @@ -12,43 +11,63 @@ MDNSD_ARGS=""
>  # shellcheck source=/dev/null
>  [ -r "$CFGFILE" ] && . "$CFGFILE"
>  
> -# shellcheck disable=SC2086
>  start() {
> -	[ -n "$1" ] || printf 'Starting %s: ' "$DAEMON"
> -	start-stop-daemon -S -q -p "$PIDFILE" -x "$MDNSD" -- $MDNSD_ARGS
> +	printf 'Starting %s: ' "$DAEMON"
> +	# shellcheck disable=SC2086 # we need word splitting
> +	start-stop-daemon --start --pidfile "$PIDFILE" \
> +		--exec "$MDNSD" -- $MDNSD_ARGS
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	return "$status"
>  }
>  
>  stop() {
> -	[ -n "$1" ] || printf 'Stopping %s: ' "$DAEMON"
> -	start-stop-daemon -K -q -p "$PIDFILE" -x "$MDNSD"
> +	printf "Stopping %s: " "$DAEMON"
> +	start-stop-daemon --stop --pidfile "$PIDFILE" \
> +		--exec "$MDNSD"
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +		return "$status"
> +	fi
> +	# mdnsd deletes its PID file on exit, wait for it to be gone
> +	while [ -f "$PIDFILE" ]; do
> +		sleep 0.1
> +	done
> +	return "$status"
>  }
>  
>  restart() {
> -	printf 'Restarting %s: ' "$DAEMON"
> -	stop  silent
> -	start silent
> +	stop
> +	start
>  }
>  
>  # SIGHUP reloads /etc/mdns.d/*.service
>  reload() {
>  	printf 'Reloading %s: ' "$DAEMON"
> -	start-stop-daemon -K -s HUP -q -p "$PIDFILE" -x "$MDNSD"
> +	start-stop-daemon --stop --signal HUP -q --pidfile "$PIDFILE" \
> +		--exec "$MDNSD"
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	return "$status"
>  }
>  
>  case "$1" in
>  	start|stop|restart|reload)
>  		"$1"
> -		status=$?
> -		if [ "$status" -eq 0 ]; then
> -			echo "OK"
> -		else
> -			echo "FAIL"
> -		fi
>  		;;
>  	*)
>  		echo "Usage: $0 {start|stop|restart|reload}"
>  		exit 1
>  		;;
>  esac
> -
> -exit "$status"
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
