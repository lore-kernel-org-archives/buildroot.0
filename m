Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFA8CD8C8E
	for <buildroot@archiver.kernel.org>; Sat,  6 Jun 2026 18:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C4F460629;
	Sat,  6 Jun 2026 18:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iTp8gWa1yNxr; Sat,  6 Jun 2026 18:21:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 277E460EC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780770071;
	bh=B7qn4/x6u33n5sbk8GomqVA8MGnO5GOeH73yrhn5P88=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eMnLp6QnKBSWjJFbwLyxncCnPOsk3MILAvdbBZUg63wyKXyqYMaaR8xGh26ZdmGPE
	 8d9Dg6gDohR1LEWea8rYzWkQNXixI870usrDipxb8D/2rmgcUv0KNNkfB4Xb02YJiV
	 D2mQCWrNCh2/lYhXg2s+uBlVqNUZDSOHe/xvcnbnYcvKVJfzH7QjeWBxdoQUo+xEd+
	 ElBYz8Jompb/XR+5igDsBdwCTdKrLzd3j0Vu+uLqP/DwgVxUu9hzmemA2HBOyPeQFA
	 P5QwwYNu6QeifRdwbjtYV0/SrKTLY4yaf2Qbz69xkRmWoVW3xVZXbuEp6m/mR2drA1
	 sgySwF2/wRxxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 277E460EC5;
	Sat,  6 Jun 2026 18:21:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EB4B4E0
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 18:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AD9C405D1
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 18:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5KcYyh4k5wh for <buildroot@buildroot.org>;
 Sat,  6 Jun 2026 18:21:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0CD040597
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0CD040597
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0CD040597
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 18:21:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2DxE-1xFcLS25nC-014EMx; Sat, 06
 Jun 2026 20:21:00 +0200
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>, Fiona Klute <fiona.klute@gmx.de>,
 Joachim Wiberg <troglobit@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Sat,  6 Jun 2026 20:20:31 +0200
Message-ID: <20260606182032.3803327-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606182032.3803327-1-fiona.klute@gmx.de>
References: <20260606182032.3803327-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:BcP+DS9VeDuKVlI9NVUqjTY1dm0VYsDjDjlvoshajq1vGz/TEVY
 0iwhsKKawS8OTf7oi1uvUcU9E677DTL7cdTQSoOceenSSAgImNDNUkta3pWH841lDDKALZY
 0VG+60RwmZkH8AVV6yGSE9jaWqZpyKPDVAwLxoFCH9zfg7tF10tULjVU+d3DdRXadhHS1tg
 fDDH8FUUPVep1M+5wKTvw==
UI-OutboundReport: notjunk:1;M01:P0:J8zkvcbA0i8=;2mPRFUHoMaBx9BTk7xuC2c9dkU4
 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
 xMw6Bcefom7yqa5SRBXWXE6IdtXPcGSUQOLsytK
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1780770060; x=1781374860; i=fiona.klute@gmx.de;
 bh=77rbYMG2mtWcqEi2re97JALqAN8cY+vJfRXNULRyA6g=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=BRJRCYf7Msl9Q4rEr7zB1/9FQaWRjcmv9L5IenvJfC+CNPD8ALKHYhyeG3Pm523I
 AeaX2QZJGtOlqHm7a7HtwSc8sSGYjKxvN6A+PyFnAHEOIqbn97Q/iPVZVSsuz0rlu
 Zo12nyqFV6yuzZcbuBOTW6LESACIoUyxGkSUC/i2mcDgnr5M9e/vL95WoX5s78OK4
 Ugk8NNBpFvSLH2FqtUQL0neOjroIAt3Urzfu4jrnx9wLbWNwJAOR6+q4q0S0cMUSM
 T7vumziq7nJT8WgxVHshuqOwXfXQ8M0iqQFCxJ247srZzhDBAbtjmM0dqiYxAeF69
 TM7ucu01AyeL7EJt7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=BRJRCYf7
Subject: [Buildroot] [PATCH 3/4] package/mdnsd/S50mdnsd: rewrite to match
 current guidelines
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With the action function as the last command in the script its return
code automatically becomes that of the script, and without explicit
exit shellcheck does not complain about unused functions.

Also wait for the process to stop in "stop", and simplify restart.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/mdnsd/S50mdnsd | 55 ++++++++++++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 18 deletions(-)

diff --git a/package/mdnsd/S50mdnsd b/package/mdnsd/S50mdnsd
index 803ac12a8e..a3d8835918 100644
--- a/package/mdnsd/S50mdnsd
+++ b/package/mdnsd/S50mdnsd
@@ -1,5 +1,4 @@
 #!/bin/sh
-# shellcheck disable=SC2317  # Don't warn about unreachable commands in this file
 
 DAEMON=mdnsd
 MDNSD=/usr/sbin/$DAEMON
@@ -12,43 +11,63 @@ MDNSD_ARGS=""
 # shellcheck source=/dev/null
 [ -r "$CFGFILE" ] && . "$CFGFILE"
 
-# shellcheck disable=SC2086
 start() {
-	[ -n "$1" ] || printf 'Starting %s: ' "$DAEMON"
-	start-stop-daemon -S -q -p "$PIDFILE" -x "$MDNSD" -- $MDNSD_ARGS
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need word splitting
+	start-stop-daemon --start --pidfile "$PIDFILE" \
+		--exec "$MDNSD" -- $MDNSD_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
 }
 
 stop() {
-	[ -n "$1" ] || printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon -K -q -p "$PIDFILE" -x "$MDNSD"
+	printf "Stopping %s: " "$DAEMON"
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "$MDNSD"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "$status"
+	fi
+	# mdnsd deletes its PID file on exit, wait for it to be gone
+	while [ -f "$PIDFILE" ]; do
+		sleep 0.1
+	done
+	return "$status"
 }
 
 restart() {
-	printf 'Restarting %s: ' "$DAEMON"
-	stop  silent
-	start silent
+	stop
+	start
 }
 
 # SIGHUP reloads /etc/mdns.d/*.service
 reload() {
 	printf 'Reloading %s: ' "$DAEMON"
-	start-stop-daemon -K -s HUP -q -p "$PIDFILE" -x "$MDNSD"
+	start-stop-daemon --stop --signal HUP -q --pidfile "$PIDFILE" \
+		--exec "$MDNSD"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
 }
 
 case "$1" in
 	start|stop|restart|reload)
 		"$1"
-		status=$?
-		if [ "$status" -eq 0 ]; then
-			echo "OK"
-		else
-			echo "FAIL"
-		fi
 		;;
 	*)
 		echo "Usage: $0 {start|stop|restart|reload}"
 		exit 1
 		;;
 esac
-
-exit "$status"
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
