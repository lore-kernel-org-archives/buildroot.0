Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C6FC433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 10:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF84A81C6E;
	Sun,  5 Dec 2021 10:29:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qJ30Il9pSZ0i; Sun,  5 Dec 2021 10:29:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 114C98300C;
	Sun,  5 Dec 2021 10:29:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 240C21BF283
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11EFA40259
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:29:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3bjd5xOopRF6 for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 10:29:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40F45401FE
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 10:29:24 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id l22so17972639lfg.7
 for <buildroot@buildroot.org>; Sun, 05 Dec 2021 02:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Maw45ypDfMqdMmuSGI4A2a38o6IUZpe+pEdYkNNkYXg=;
 b=lXOBUBbSxNcbsrqKl0SePFW1IvNIZ+NlXv2EYnTemL5ynRxyoiWGKFlYQVAnns/KGL
 h0HrJ0nhbcV0bultBKgJrSQ2iPFk+7lrisizkT+q9M6m3gBTs7kUHYK9bzH1asUkavt3
 V8ZenXOrQ+nJwk+rypPs5QMY6SRjpT6arcx1tYSGnAiIv3lFDZZgWiSCS28UONwv1V6a
 7N6qe5i7AIsZJArPo4sL475LBB77eoFhB2NwDksqjM0Gq0PwNU5eT+rYiIGGeoxguRyo
 HbSkDU224qIKU2/sMQJokI7kdo6ep1hC5XVIduT0EkRYg7fsjXxtMIvS3h6W0hCLoboq
 OwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Maw45ypDfMqdMmuSGI4A2a38o6IUZpe+pEdYkNNkYXg=;
 b=BJzSCcXtEE6gGXkx+2iyqkgFOCSOVka4fhGUOYCDaijvKh/VaC+7snqSiZmvaka+lw
 YMWXU+nYdFsti4hhjWdXceiNSn3zaf/DQDqSborl45+kbubx+JoHzyRHffH43SPHG81J
 TzNcN3iHjtsiJOXi4HW/ioOdVXXZ5rDZzMWIKL6SuUFERi2x7XQzp+y0OF5Bnk1pYxQB
 6eIb8QTSuKLTFBScbNpxL7Ksc68l7AkOIjJFvrB413bGFW/ialBXcrTpyqZrLcOz198n
 fnSajDu9n252JOJ+DaVqdDTWBgyS6qEGzfJawD0P1kf4r/f6Npi5jZS3pfxD0re3/ZYL
 5YFw==
X-Gm-Message-State: AOAM530JQTKDYaLTJr9I2taKziqShmhoLOFxEPDeE6vESYucK9hj52nQ
 QAyQmcISJn7NsrfMDkHFl1UMXu7Bs5M=
X-Google-Smtp-Source: ABdhPJx12mg0RqdaUG3X/q05oHlK5uOzRahJ8c740FNWFmuR1hwH2IW+eEuaS6E5TlmI13dUjdIcyw==
X-Received: by 2002:a05:6512:31d1:: with SMTP id
 j17mr27971361lfe.395.1638700161883; 
 Sun, 05 Dec 2021 02:29:21 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.198])
 by smtp.gmail.com with ESMTPSA id k22sm1047191lfu.95.2021.12.05.02.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 02:29:21 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Dec 2021 11:29:05 +0100
Message-Id: <20211205102907.2836980-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205102907.2836980-1-troglobit@gmail.com>
References: <20211205102907.2836980-1-troglobit@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH next 2/3] package/inadyn: refactor start script
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
Cc: Joachim Wiberg <troglobit@gmail.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch is a complete rewrite of the Inadyn start script, based on
the BusyBox S01syslogd template.  Additional features, compared to the
template, are limited to the ability to:

 - Check if enabled, using an ENABLED="yes" from /etc/default/inadyn,
   this for compatibility with the previous version of the script
 - Override INADYN_ARGS from /etc/default/inadyn
 - A reload command that sends SIGHUP, since that works and is both
   quicker and a less resource intensive operation

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/inadyn/S70inadyn | 100 +++++++++++++++++++++++++--------------
 1 file changed, 65 insertions(+), 35 deletions(-)
 mode change 100644 => 100755 package/inadyn/S70inadyn

diff --git a/package/inadyn/S70inadyn b/package/inadyn/S70inadyn
old mode 100644
new mode 100755
index ca7b414678..d44acacec3
--- a/package/inadyn/S70inadyn
+++ b/package/inadyn/S70inadyn
@@ -1,44 +1,74 @@
 #!/bin/sh
+# Customizations are sourced from /etc/default/inadyn.  For example,
+# override INADYN_ARGS to adjust log level, add a startup delay, etc.
 #
-# Start & stop the inadyn client
-#
+# NOTE: to start, add a line ENABLED="yes" to /etc/default/inadyn
+
+DAEMON="inadyn"
+PIDFILE="/var/run/$DAEMON.pid"
+
+INADYN_ARGS=""
 
-CONFIG=/etc/inadyn.conf
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
 
-# check if CONFIG exists, print message & exit if it doesn't
-[ ! -f $CONFIG ] && ( echo "The config file "$CONFIG" is missing...exiting now." && exit 2 )
+start()
+{
+	printf 'Starting %s: ' "$DAEMON"
+	if [ "$ENABLED" != "yes" ]; then
+		echo "SKIPPED"
+		exit 0
+	fi
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
+			  -- $INADYN_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
 
-# Allow a few customizations from a config file. Especially inadyn
-# must be explicitly enabled by adding ENABLED="yes" in this file.
-test -r /etc/default/inadyn && . /etc/default/inadyn
+stop()
+{
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart()
+{
+	stop
+	sleep 1
+	start
+}
+
+reload()
+{
+	printf 'Reloading %s: ' "$DAEMON"
+	start-stop-daemon -K -s HUP -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
 
 case "$1" in
-	start)
-		printf "Starting inadyn: "
-		if test "${ENABLED}" != "yes" ; then
-		    echo "SKIPPED"
-		    exit 0
-		fi
-		start-stop-daemon -b -q -S -p /var/run/inadyn.pid -x /usr/sbin/inadyn
-		[ $? = 0 ] && echo "OK" || echo "FAIL"
-		;;
-	stop)
-		printf "Stopping inadyn: "
-		if test "${ENABLED}" != "yes" ; then
-		    echo "SKIPPED"
-		    exit 0
-		fi
-		start-stop-daemon -q -K -p /var/run/inadyn.pid -x /usr/sbin/inadyn
-		[ $? = 0 ] && echo "OK" || echo "FAIL"
-		rm -f /var/run/inadyn.pid
-		;;
-	restart)
-		"$0" stop
-		"$0" start
-		;;
-		*)
-		echo "Usage: $0 {start|stop|restart}"
+	start|stop|restart|reload)
+		"$1";;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
 		exit 1
 esac
-
-exit $?
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
