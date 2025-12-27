Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D510E9270E
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 22:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB99840681;
	Sat, 27 Dec 2025 22:38:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SyPoEkOwYUsj; Sat, 27 Dec 2025 22:38:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 044A340683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766875100;
	bh=zoNpjyeySUWZZY5AbJcojekdrS0OMnpHAc8VWASiGLQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=PP3U5AadRV9DeOyU32eYa1nZ63MTqrdazg7kMYApb0aoqLRreGB6Q3L6HwAVh86v5
	 ltJFcxMqHARgvA49vhxtDXXQ1uZOMQKkBBPCxmJXuwhOyt+jhBIbSYZVSdOl4TaCT2
	 6oY14BEayHTDwqnxGzXMJUeuk7+UR05pRRUUddJB6UlQlG8qRNh2nRd4RUfH4uCljq
	 DudlFBWRzTV6CPWOnCXAvp8itWR+I0G1+X7tDI6/EY5k4YQGT6J9s6tBki6RseRAPs
	 ccBiT2U4xqReF6Z8axb850VVfnFweS4nuBSA7lHGiGXxGly3+KqHIeFvFK4HL2S4UW
	 +E0E8M1DrWjBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 044A340683;
	Sat, 27 Dec 2025 22:38:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ECBF7B9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE032607AF
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QN2jDx7sWevL for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 22:38:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 69D4F60724
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69D4F60724
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69D4F60724
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:38:16 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.107.132]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ma20k-1vNTIO3df2-00RPwQ; Sat, 27
 Dec 2025 23:38:12 +0100
To: buildroot@buildroot.org
Cc: Paul Cercueil <paul@crapouillou.net>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Sat, 27 Dec 2025 23:37:32 +0100
Message-ID: <20251227223733.2240054-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:MPooWF2QTZJyqpJGmF1PLZPa1mi/gn88ttuWk/3h5d1DH6zAUgs
 m/wqPg4a3y1O8/yw29okBS7BE10NFsqr7WMXCycRxuKniNU9g1mpVzDsQAKcbwabX2utcDH
 56CiFIj5JGTCBlQXywkh+qEerqEoXgQmpfxnBoHP3eZkYVw7loZPIyWN3zgh6ZatToxKWqX
 KQ/G6ItFuCGTdLT8ZVuyQ==
UI-OutboundReport: notjunk:1;M01:P0:U5+hQr4b56s=;q+c853qZKES5IuB6IWlZkPcQjYc
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1766875093; x=1767479893; i=fiona.klute@gmx.de;
 bh=1LzRJ+DUFNsPqwHc1woyisUkooa3Pi7Dmy47vs9jEuE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=aCiXsYfkdnCfye8rImU/YqTTyFadERKPqExpbbH3gbI5FL/TrWGAg94i/G/f0iX/
 354JQYOm7oM7pW1HgLWJLIuXgzdxX3OyAr5fWZIjiSn+sxFmwSStw1Sp6tF2CS5FJ
 6PgW8JY9FO3jHIQSXNQLhZl/g337mNXUdyWddYPc3qw74+GLAtGoDXmu/0w9iiD0v
 TWwV+Wv8sSyav0C8tzWHel2zLsuOW/pwKX6bX1EcpZ5phIXQyytBGt/fOgJH0HKE0
 gQZCNYJpXzRUKzTTukUh3J/dmMl+pa9StbbMv8VLRrvxUHBUgXL7MAinycb+a1Zm8
 K6Bv/0s1k0KnV/vdnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=aCiXsYfk
Subject: [Buildroot] [PATCH 1/2] package/libiio: refactor iiod init script
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

* Fix check-package issues and remove .checkpackageignore entry

* Remove fixed wait in "restart", wait for process termination in
  "stop" instead

* Print standard starting/stopping messages

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 .checkpackageignore    |  1 -
 package/libiio/S99iiod | 62 ++++++++++++++++++++++++++++++------------
 2 files changed, 44 insertions(+), 19 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d28b22ad74..bafc256c37 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -552,7 +552,6 @@ package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch l
 package/libgsm/0001-Misc-fixes-from-Archlinux.patch lib_patch.Upstream
 package/libgtk3/0001-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch lib_patch.Upstream
 package/libhdhomerun/0001-dont-strip.patch lib_patch.Upstream
-package/libiio/S99iiod Shellcheck lib_sysv.Variables
 package/libiqrf/0001-cmake-handle-static-library-and-find-required-thread.patch lib_patch.Upstream
 package/libiqrf/0002-use-only-c-language.patch lib_patch.Upstream
 package/libjson/0001-fix-broken-makefile.patch lib_patch.Upstream
diff --git a/package/libiio/S99iiod b/package/libiio/S99iiod
index df2f763461..b1d56a73fa 100644
--- a/package/libiio/S99iiod
+++ b/package/libiio/S99iiod
@@ -1,29 +1,55 @@
 #!/bin/sh
 
+DAEMON="iiod"
+PIDFILE="/var/run/$DAEMON.pid"
+
 # Server-side demuxing by default
-IIOD_OPTS=-D
+IIOD_OPTS="-D"
 
-[ -r /etc/default/iiod ] && . /etc/default/iiod
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
 
-case "$1" in
-	start)
-		echo "Starting IIO Server Daemon"
-		start-stop-daemon -S -b -q -m -p /var/run/iiod.pid -x /usr/sbin/iiod -- $IIOD_OPTS
-		exit $?
-		;;
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --background --make-pidfile \
+		--pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON" \
+		-- $IIOD_OPTS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
 
-	stop)
-		echo "Stopping IIO Server Daemon"
-		start-stop-daemon -K -q -p /var/run/iiod.pid 2>/dev/null
-		exit $?
-		;;
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon --stop --pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "$status"
+	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
+	return "$status"
+}
 
-	restart)
-		$0 stop
-		sleep 1
-		$0 start
-		;;
+restart() {
+	stop
+	start
+}
 
+case "$1" in
+	start|stop|restart)
+		"$1";;
 	*)
 		echo "Usage: $0 {start|stop|restart}"
 		exit 1
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
