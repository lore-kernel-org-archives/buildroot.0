Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36565C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 12:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6089E6131A;
	Fri, 12 Jul 2024 12:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xs6Vq2MbgKZc; Fri, 12 Jul 2024 12:50:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D1F160E9F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D1F160E9F;
	Fri, 12 Jul 2024 12:50:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 161EB1BF40F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 034EF402C7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mDVHjR7QPqxQ for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 12:50:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 85EE740240
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85EE740240
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85EE740240
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:50:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.126]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhD2O-1rpMCv3DUo-00nK2a; Fri, 12
 Jul 2024 14:50:11 +0200
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 14:49:55 +0200
Message-ID: <20240712124956.3925574-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712124956.3925574-1-fiona.klute@gmx.de>
References: <20240712124956.3925574-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:+uI2FeZfv4ovU11BGsC90WYBSKgLuKcLpBzHWP2xgBBLouP+7vE
 qOpXijtrKenQa06S2DxXyrac44vip2qhSj2tSbR+Bdqx/Z5S5twXbyMdIpyc3LL1IN4BJfZ
 7hm8urn+0t6gH38JAEe3oOr/cvAHJ4/XoBkHgw0qWp9tbD9Mm7UZy3igzejfAoJg9JmHSeh
 huINf8rd+MTseNdKnP69A==
UI-OutboundReport: notjunk:1;M01:P0:rH7jOFk/osw=;yRQF1Bg1wIXza2xLvTQztxGkZei
 SP5sSWgAtCDeyOoW2ByzXuHHVv85BdYa7AnPwKsrPydGUid5EB5aIVuF6V883LF+C7gNurF1a
 7zfwfUIcGNASbfy2L1q7nUY+qfjJAV1pg3LRH3UWQeTj0GGgezaBEpfZud5iFTvEoN9AO41tC
 YPup+yq0pXhJkmmZPq3BPAOtcd62wZ4m2TpYid8m3JmbUmvxtg2WpSkpGElCEbSB2FHAVt1Em
 DGjivfWQLr6FBDnQA25CVT6iUNDp+ePGz+nL+KGIBEuIM6tymLGF08xr52BQwwpfh1A5S4Gcj
 kARroWWppsr7CP6/WMyrgCm4XnjbicFVx6IF3HkeEV5nxpFnzGVYoaly0ts3AcDi888Eklam/
 d5YFN+tGHDxh9k1YKtZUABhf/G0s4DTXvEv98MmNIrj+LYy9flWZ1kaIcb+tHtfqZuhSKicib
 NfcHXdFVJoHworbi+wqKD6/EIfj7kd066n0GBUXQUUtZ++EuMq/IDubXgshQybTHz81k4R6iI
 SG1hFoDpuwQJFq5a6dR3rTGKWYab9lw/dqJVl1NfosyhnPTl+FQFeW0JDL+58o+iSE+615Cdn
 jtUCkVe12jCvjNDxsIIqaLYfOVzExykofxlXRuLIZjQpLeM068oixnhEOndL5OxM5M3EBwhYW
 0uPmkh+jp8FptSVztLiftGOJDHG/5S8FyUMg8zB2dYd0feFZTJ9i7gtj0B5lAlP3v+oUYV26/
 AELw6OKZmJEkuIWqv6IQYlPhATi5Svq+emjZuiXWgferLnHOsPwwmHzc9bnAT/Aqaon8zJOU+
 fOrichOn8PsQzAMYdmnHCS7w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720788612; x=1721393412; i=fiona.klute@gmx.de;
 bh=joKlSsVtqEiMD9DdWjBzzMSkRc1B2B7Fn0tmt5YScgM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=hDz/k2MmR2gX87RhKJeXGxuGw+HyOdPPBCCEKKnfy3wx72+ZYlDrv6OfV8t3TqbD
 YRiBeDWFbwbtY4PU4LZf/5i+bWOUfmBu7BDWWknVAZ5ftHLElSRuifsRWpMpAv7QT
 jKFxIaGKZE3XIurEsjX2AEOiGBAmP+WhrbW6o98ire4zMHEDleFWdX3BB/EsGbnQq
 qZq6GeTXgoA/GXY6cCOGLr35h87CT9E2ItNQwYgSPGdhLWx4HbYtgwB08et+fdUDp
 XAqMrf5k0FNTD1968QoTFPzKemu9ZQLjQDHFpGZ9R2aEgBj+XF8eXp5HCt/ogE1wp
 oUZ9pr11hUr3vT1Jiw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=hDz/k2Mm
Subject: [Buildroot] [PATCH v2 5/6] package/dnsmasq: tidy up init script
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Bernd Kuhls <bernd@kuhls.net>, "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

* Create start/stop/restart functions

* Use long start-stop-daemon options, avoid --quiet

* Return start-stop-daemon exit code from start/stop functions

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* Use start-stop-daemon --stop --test to check if the service is still
  running during stop, instead of poking at procfs

 package/dnsmasq/S80dnsmasq | 64 +++++++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 22 deletions(-)

diff --git a/package/dnsmasq/S80dnsmasq b/package/dnsmasq/S80dnsmasq
index f1e1a68585..07fa205b83 100644
--- a/package/dnsmasq/S80dnsmasq
+++ b/package/dnsmasq/S80dnsmasq
@@ -5,30 +5,50 @@ PIDFILE="/var/run/$DAEMON.pid"

 [ -f /etc/dnsmasq.conf ] || exit 0

+start() {
+	printf "Starting dnsmasq: "
+	start-stop-daemon --start --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON" \
+		-- --pid-file="$PIDFILE"
+	status=$?
+	[ "$status" -eq 0 ] && echo "OK" || echo "FAIL"
+	return "$status"
+}
+
+stop() {
+	printf "Stopping dnsmasq: "
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "$status"
+	fi
+	# Wait for process to be gone, using a loop and --stop --test
+	# because Busybox' start-stop-daemon does not support --retry
+	# (as of 1.36.1).
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
+	return "$status"
+}
+
+restart() {
+	stop
+	start
+}
+
 case "$1" in
-	start)
-		printf "Starting dnsmasq: "
-		start-stop-daemon -S -p "$PIDFILE" -x "/usr/sbin/$DAEMON" -- \
-			--pid-file="$PIDFILE"
-		# shellcheck disable=SC2181
-		[ $? = 0 ] && echo "OK" || echo "FAIL"
-		;;
-	stop)
-		printf "Stopping dnsmasq: "
-		start-stop-daemon -K -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON"
-		# shellcheck disable=SC2181
-		[ $? = 0 ] && echo "OK" || echo "FAIL"
-		# wait for dnsmasq process to be gone
-		while true; do
-			pid="$( cat "${PIDFILE}" 2>/dev/null || true )"
-			{ [ -n "${pid}" ] && [ -d "/proc/${pid}" ]; } || break
-			sleep 0.1
-		done
-		rm -f "$PIDFILE"
+	start|stop|restart)
+		"$1"
 		;;
-	restart|reload)
-		$0 stop
-		$0 start
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart
 		;;
 	*)
 		echo "Usage: $0 {start|stop|restart}"
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
