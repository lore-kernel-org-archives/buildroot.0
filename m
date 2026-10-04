Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF8CCA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 15:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DD7160612;
	Sun,  4 Oct 2026 15:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgpsBJJ9HiO8; Sun,  4 Oct 2026 15:21:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C9B5460603
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791127275;
	b=dhD+AkDQQtogPrIC/QPC0C3Hu5Xx1OB1mE7B53UBp5+PLEJw7U4M8xjAY0AHD7IQJNgQ
	 e2lJiWAGnvrCJy0FsyPLM8f4U/rjYFN2rPShehtopxz/w4I3MvVLtAFetqqCFYseqwYpa
	 lW62gbNV/uhYOILdis8x2JGBFVO8D2C3BgbCdWgK5AOjwk4Ou1DRAS+yClLNPyFYWqSJ1
	 BJq9YscsAx2W856BklS5FE3KLGFSQYSWw7X7EH72z6KL79Sv8VL7V4uMcIJFNqlOYUlyB
	 a8PM24ujfGYejL4P+2hIdjOc5mAQHFS6jr65AxkDuYRo7d/27vmgMN6jBh7QrI6zsYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791127275;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2ofB0Nfzs9KCFcJ1KV0lebowUcqPuLq8cg8yc4k2VXQ=;
	b=XaKpkVG6e4hhcODmSNYcL99ONJMLN7P5X2Q9p1gm7SWS1FH+khPaPtbqgo5AIxKs/vHv
	 fJ3nBRuBs5bb5kGyMc2OETLTPdXKZucpI1hl7Jce9OCbeaHOzNaI41jcl4uZBNH6Ae2vc
	 8C+H8tCoHrrXK9eJPCBvC6fxCa3HoHAP0iHD1Da9mgt8GzxBMDs32JbbQcph6+IXfXMZ4
	 zYOJb0nMKYLjXIJZMUGyPwj/0lEm32egSpj/5NnauUI7ks8qgbAH3jEHYlI6LMAfK+Nug
	 RcgEHJwQBdWLh8pFcP0OizJ+urfTn5P5LWjYnglHgvzlTi4cP2RjzQLHSqucVrSRnng==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791127275;
	bh=2ofB0Nfzs9KCFcJ1KV0lebowUcqPuLq8cg8yc4k2VXQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Sp0CA8RuGPumuz3hOtHtM/zcepJUYTWfPxTZeJJHKCsQ7aSm16NDYlxApGu4+y23U
	 HPI8tnZlDMDAjrUg4DHCwVZ6BQq9JmeN/yEIxGJCTuNiHwpDr4Leys1J7PCfHqbcII
	 NxrGK8qMs7DmjlbIJbsqzNTzXxwB7+JYCbEZpWQndMJm49UixCu+2wu8Kyvx8TI07r
	 h4V0I+u/newLktIIMpOZfLpK6EojE4Knm01F/IzdsxPLEeefiSDSbFzpiFuB+uqlJ+
	 KNh/kpC5Nj0pKFqzXz+QESPzd6wlwXlHw+XBo3neoaDAljxbamcd/Ng1QVp5gKw/nH
	 ++//1Fkb4GAXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9B5460603;
	Sun,  4 Oct 2026 15:21:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D459032F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C607A40049
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VOYJF7OQiqkH for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 15:21:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 10C4640068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791127273;
 b=PHaH47SoZTmICibqHocfB94S0ziFN6hHUwmlpGhj6AVk+GR5i2mXR9/s75Ss5bcCPwai
 sH7f3LVB+3xRkFoE8iX70cviPMpPCq33i29JgttGM75xu74hm9rzJgCFBvPiNM7uzU90w
 IKj6lfQJqqjGpYl9s6cjpXJkb2ihcwrGylAWUGN2M20N2pLrBzfNwBxQZFogpxgqKn/7E
 HhVi+S8X/1l1E+id5btDDTwLwbBNYT4WYf1gRoMx6SrmjM1ISfXN9R7l54P6facdWKOWJ
 M+RU5jAJSzTdqvGrwDRFHm5tyur3LxT166sZ51JNG7bV1DphND48oke3Xo8n78LDouw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791127273;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=Q5hTXRhIrVNWdzBoRE5ZKO4CVn/T2vOygXv2UyWyBlA=;
 b=ECnNysu/liTO/cRl7mJP9+vqygDHwJsX7s2v8xDJ74XyHTWHoK2d7tkSBO8fkbG5beb0
 xIcvanGZbX3Q4yHkbMiV8mbu+bA/VvnR2muWOWfkEGBNX7J+C4ZHSWeLla8x8eYbYkIFh
 84Kv1hCBztzKyWTGGYEz1l8LhteW2Dgp7KWuC/LwUx/g6bDeyhf5JmBsSJ41KVNxTXQ0B
 JYEjEzizi6crWtPDlun9qNQaTejfHQjd7mV+KPLlHHOgf159ApuTxkAhn323V41FVBk7F
 s9RmnaUR3TNK79jLaFMYYUC5qtPTe7PAInfRg0KscyHJyC1Jfh76WVua95hzNFmk2Hw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmx.net; 
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=dwN0u22U; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10C4640068
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:21:12 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsYqp-1wOZab42SR-010BhS; Sun, 04
 Oct 2026 17:21:07 +0200
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 17:21:04 +0200
Message-ID: <20261004152104.1403546-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:hbYSL1+dpEUT4OXaKZi1aCqm6vewRXa0zMagSAlC9sMDNtlm++3
 tKrKcUnMaasSToiIcGWv6VdG76clrs5H+MS4UJ553r67svJHJi350uYjvcp4C2k/SkpEAHn
 9Ze91nql6AqpJFccwkJ1qmHxXbeDYzvZdll8Z/hLVhcSQhBuXXdZZ30hUa61cxa7Ylq8H7z
 bAg3l2VfA11voAYQgJ9BA==
UI-OutboundReport: notjunk:1;M01:P0:SVP7bRCRxFQ=;U8o35eOjvdJrBryEnXw3veKMVVO
 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
Subject: [Buildroot] [PATCH v1] package/dhcpcd: update S41dhcpcd (fix
 check-package warnings)
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: John Stile <johns@msli.com>, Peter Seiderer <ps.report@gmx.net>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update S41dhcpcd:

- use plain "dhcpcd" for DAEMON (instead of "/sbin/dhcpcd"), adjust
  PIDFILE accordingly and while at it use quotation marks for variable
  definitions
- fix indent (tabs vs. spaces)

Fixes:

  $ ./utils/check-package package/dhcpcd/*
  package/dhcpcd/S41dhcpcd:6: Do not include path in DAEMON (https://nightly.buildroot.org/#adding-packages-start-script)
  package/dhcpcd/S41dhcpcd:8: Incorrect PIDFILE value  (https://nightly.buildroot.org/#adding-packages-start-script)
  package/dhcpcd/S41dhcpcd:13: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
  package/dhcpcd/S41dhcpcd:17: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
  package/dhcpcd/S41dhcpcd:21: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
  package/dhcpcd/S41dhcpcd:25: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
  package/dhcpcd/S41dhcpcd:30: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/dhcpcd/S41dhcpcd | 46 ++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/package/dhcpcd/S41dhcpcd b/package/dhcpcd/S41dhcpcd
index 55794f4075..e52e935da2 100644
--- a/package/dhcpcd/S41dhcpcd
+++ b/package/dhcpcd/S41dhcpcd
@@ -3,31 +3,31 @@
 # Start/stop dhcpcd
 #
 
-DAEMON=/sbin/dhcpcd
-CONFIG=/etc/dhcpcd.conf
-PIDFILE=/var/run/dhcpcd/pid
+DAEMON="dhcpcd"
+CONFIG="/etc/dhcpcd.conf"
+PIDFILE="/var/run/$DAEMON/pid"
 
 [ -f $CONFIG ] || exit 0
 
 case "$1" in
-  start)
-	echo "Starting dhcpcd..."
-	start-stop-daemon -S -x "$DAEMON" -p "$PIDFILE" -- -f "$CONFIG"
-	;;
-  stop)
-	echo "Stopping dhcpcd..."
-	start-stop-daemon -K -x "$DAEMON" -p "$PIDFILE" -o
-	;;
-  reload|force-reload)
-	echo "Reloading dhcpcd configuration..."
-	"$DAEMON" -s reload
-	;;
-  restart)
-	"$0" stop
-	sleep 1 # Prevent race condition: ensure dhcpcd stops before start.
-	"$0" start
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart|reload|force-reload}"
-	exit 1
+	start)
+		echo "Starting dhcpcd..."
+		start-stop-daemon -S -x "/sbin/$DAEMON" -p "$PIDFILE" -- -f "$CONFIG"
+		;;
+	stop)
+		echo "Stopping dhcpcd..."
+		start-stop-daemon -K -x "/sbin/$DAEMON" -p "$PIDFILE" -o
+		;;
+	reload|force-reload)
+		echo "Reloading dhcpcd configuration..."
+		"$DAEMON" -s reload
+		;;
+	restart)
+		"$0" stop
+		sleep 1 # Prevent race condition: ensure dhcpcd stops before start.
+		"$0" start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload|force-reload}"
+		exit 1
 esac
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
