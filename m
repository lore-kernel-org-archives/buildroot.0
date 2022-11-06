Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986FFC433FE
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 18:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C4A360B2A;
	Sun,  6 Nov 2022 18:20:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C4A360B2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9B2P3SCWc9-k; Sun,  6 Nov 2022 18:20:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B297360AE0;
	Sun,  6 Nov 2022 18:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B297360AE0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7CF4A1BF312
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 18:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C61EE40026
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 18:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C61EE40026
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cjWD9ERNAGa0 for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 18:19:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 435E640448
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 435E640448
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 18:19:54 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id u2so13197593ljl.3
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 10:19:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ge/VP3togs/7apD9SUG2xgHooKFggWtxYBn0mFKM3cI=;
 b=mx4RK5/0jDC2U4ht7MnV0gY7V/CfU9NYQLkeU78HHnjGVbeceSuNLBiOYglLb+bPl0
 1Hoqj9UW/hmD4Ozq9IU/8XwwYbD/o3Ik/Qza2N/EOqfIs+GdlBWmiIBcMO2GXEepLQXc
 ANIDS9uWC1QXhNWxXoIAM4xPG9/Z9gqKpIHN+ocPREfDQvpd1rvu3rXU9J8MoaoLyrPB
 3T6Ojze2GsZZDpY5X3sys40bW44bLovZKX3BixsZKOFvuc82D0O6LntIdq1e+dcPkdKv
 8Lre1/3RQfpaD2HfdWDVMnr1C3YLyIpIOFgPX7JWCLNHPZRsA8ft3DkCRfZT53oef6wv
 izGA==
X-Gm-Message-State: ACrzQf0xyA8MulipQMsoxCaCvoXOAZh5YAVmL43ztb7XDYb5AqquoH7c
 cdh5cYzTYnSy2TVQN95yarfIYndWcWg=
X-Google-Smtp-Source: AMsMyM4fLY7jNk+ltoixQVYa83oBmPkVL8vo25cqvPcwlmifBwfDTgcBTqJaVyCPmNPCuPA3uwTgVA==
X-Received: by 2002:a2e:3203:0:b0:277:9e5:6cc4 with SMTP id
 y3-20020a2e3203000000b0027709e56cc4mr4769734ljy.137.1667758791785; 
 Sun, 06 Nov 2022 10:19:51 -0800 (PST)
Received: from gimli.lan ([2001:9b0:21f:cc00::af3])
 by smtp.gmail.com with ESMTPSA id
 be12-20020a05651c170c00b0027711dbd000sm780325ljb.69.2022.11.06.10.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 10:19:51 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 19:19:46 +0100
Message-Id: <20221106181946.501548-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221105184455.GL3918838@scaer>
References: <20221105184455.GL3918838@scaer>
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Ge/VP3togs/7apD9SUG2xgHooKFggWtxYBn0mFKM3cI=;
 b=nLtLJuNZG9YwK2iVx3ogvAxxu3BVuCJZS7s3hOCxdGK60PhIW5r5Pmsh9URMh6y2Fi
 mHl4Ra0D5WdSAcgzdpj/Zq547H1gpUcFSW5mkXEf8l/8K3xZ5DgNV6E0Pdg5yWymk+ik
 nzi9BvtBv31LDQwOYI9ifWLvyMkjAUJUa1/CLlItEuFNmNi/u6eIXDxzKHipGnrT5g+n
 9d3wkS5EsME/s/dA8QaOzq7wEAi9I+HD1BIBf8lAaM92Iilt/eZMeU0Fjv2m+UfdUrLz
 QYZ7MPsktApuejxRtPgcKnf9dj1/fm45NxuHnVJARgEg9hFRlvcEmq0qtDsteYfnXR1l
 8xKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nLtLJuNZ
Subject: [Buildroot] [PATCH v2 1/1] package/ssdp-responder: fix warnings
 from check-package and shellcheck
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Summary of changes:

 - Fix use of $DAEMON, found by check-package
   - Expects DAEMON to be name of daemon controlled by script, this
     causes ripple efects in rest of script
   - Recommend `chmod a-x`, .mk file installs with `-m 0755`
 - Fix shellcheck warnings:
   - Use "$VAR" in case of spaces in filenames
   - recommend not using $? in if stmt, should use `if start-stop ...`
   - mismatch in indentation in case-esac

Changes since v1:

 - Revert introduction of cmd() wrapper for start-stop-daemon, instead
   call start-stop-daemon directly in start() and stop() functions

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/ssdp-responder/S50ssdpd | 47 +++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 20 deletions(-)
 mode change 100755 => 100644 package/ssdp-responder/S50ssdpd

diff --git a/package/ssdp-responder/S50ssdpd b/package/ssdp-responder/S50ssdpd
old mode 100755
new mode 100644
index e33992be91..8654de4f26
--- a/package/ssdp-responder/S50ssdpd
+++ b/package/ssdp-responder/S50ssdpd
@@ -1,25 +1,32 @@
 #!/bin/sh
 
-NAME=ssdpd
-PIDFILE=/var/run/$NAME.pid
-DAEMON=/usr/sbin/$NAME
-CFGFILE=/etc/default/$NAME
+DAEMON=ssdpd
+PIDFILE=/var/run/$DAEMON.pid
+CFGFILE=/etc/default/$DAEMON
 
 DAEMON_ARGS=""
 
 # Read configuration variable file if it is present
-[ -f $CFGFILE ] && . $CFGFILE
+# shellcheck source=/dev/null
+[ -r "$CFGFILE" ] && . "$CFGFILE"
 
+# shellcheck disable=SC2086
 start() {
-	printf 'Starting %s: ' "$NAME"
-	start-stop-daemon -S -q -p $PIDFILE -x $DAEMON -- $DAEMON_ARGS
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf 'Starting %s: ' "$DAEMON"
+	if start-stop-daemon -S -q -p "$PIDFILE" -x "$DAEMON" -- $DAEMON_ARGS; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
 }
 
 stop() {
-	printf 'Stopping %s: ' "$NAME"
-	start-stop-daemon -K -q -p $PIDFILE -x $DAEMON
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf 'Stopping %s: ' "$DAEMON"
+	if start-stop-daemon -K -q -p "$PIDFILE" -x "$DAEMON"; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
 }
 
 restart() {
@@ -28,15 +35,15 @@ restart() {
 }
 
 case "$1" in
-    start|stop|restart)
-	"$1"
-	;;
-    reload)
-	restart
-	;;
-    *)
-	echo "Usage: $0 {start|stop|restart|reload}"
-	exit 1
+	start|stop|restart)
+		"$1"
+		;;
+	reload)
+		restart
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
 
 exit $?
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
