Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CCAEE0209
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 14:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E92D407D1;
	Tue, 30 Dec 2025 14:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INqptbPj1YLT; Tue, 30 Dec 2025 14:51:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA5844046E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767106297;
	bh=THjQwbyn0PgxyTlH2rrRgHX7+uXRmowqL6isObjjWBU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=T4/UB1jazc+qkcNoz4H7upUVAAuSQExpv6cv74m3oWzaxtEBc05lgKbftXpQ4ZLkI
	 SRuemo6KBzUDS8vE9QeHBI+FqGyW3xQESARQmCHEaxJRNS4tmxJQUUpJnqvQ5EwG1t
	 43z8LhVE2fdRb2NCCeovgh3M2BvQpy76lYtVdU1TNTfjg3vabFdaFJfFJTkj1L7aFP
	 Ew0Xq6me0tFgSwWTd8Y2efzM+8AqfP+sCkb/cHCePv7Of90efaMRrC/v+2y6IxhXkA
	 6cpTpMlcANS1po6hO9ydALqKk8ugrE3a4+8hXsrBFyaAjo7ZuYk0820N5oJ5iE8pBx
	 IeD1oidFK5+0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA5844046E;
	Tue, 30 Dec 2025 14:51:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B0DD835B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 14:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2D5560791
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 14:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EZ_FZQmMGt8g for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 14:51:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 51B0B605E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51B0B605E5
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51B0B605E5
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 14:51:33 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.107.189]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5wPh-1vXb3o0nHv-003XS0; Tue, 30
 Dec 2025 15:51:31 +0100
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Tue, 30 Dec 2025 15:51:17 +0100
Message-ID: <20251230145117.3375118-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:OALX97CBhpyhzga0hMHAirFULvSODIzZZEfDdjWLkgxAor6WxIh
 Q3oxyjQ8V8B8JAyUTUofhb7R3nUD2qB/nMQjKntd8m74aI8GcyBKrBeB/3NugodnYujBMDd
 SFYhxB12wjcCH69g1kwkEvZbsyf2ZtmEUaHOYqs+VGbKaUttBH/cEXKr5AmbMBIPv1RoOgu
 cc7noCjKotLVErgEjJ9wA==
UI-OutboundReport: notjunk:1;M01:P0:O3XGdcQG6Hg=;MywU1iGqNgCpfZCpi/ev2yD3yX7
 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
 MrZHy2XHAcrHpdB9Fren85eIbo+Ke
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1767106291; x=1767711091; i=fiona.klute@gmx.de;
 bh=cWNRUHbfQh5WBYfnniCpGlkLOSKngtm54vbZ/T7VLmE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=hqS4HKvcigv0OkAwAZ5ps0na4yjMH0hJOV3mHwsSBziAnWHXD1zHlRDQwf3tb/d+
 +JFoq0hctl/LZi/Ia+2K6SYR2/evsitUrzPIMsE6vwlON5DmuPMCbZBvKWnW3kDGs
 kfwclSOR4kFSuvaz66pz0PRvdEOE2jE4Dv3OChYnPhJkKlyz0oMSQDSY9yn84TsYq
 Bs+flq0a0gA2IQv10ehzYVMY7RLftaU3aQuOYcCsQcVArcYIHBZlodRYJIuIbFw9b
 yXBJ+vQ5sWE5NShgwIj9xUSDfv90zu3K1eevcwpso+ysIe8u3zsbnRb/uM6ij2wJ9
 0fmIQebxA2qORwRpdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=hqS4HKvc
Subject: [Buildroot] [PATCH 1/1] package/busybox: tidy up klogd init script
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

* Wait for process to stop before deleting PID file, instead of fixed
  wait during restart

* Use long form options

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Restarting klogd is probably not common, but it's nicer this way. :-)

 package/busybox/S02klogd | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/busybox/S02klogd b/package/busybox/S02klogd
index 0677e1e5ca..f76d4e72d4 100644
--- a/package/busybox/S02klogd
+++ b/package/busybox/S02klogd
@@ -13,7 +13,8 @@ KLOGD_ARGS=""
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
+	start-stop-daemon --start --background --make-pidfile \
+		--pidfile "$PIDFILE" --exec "/sbin/$DAEMON" \
 		-- -n $KLOGD_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
@@ -26,20 +27,24 @@ start() {
 
 stop() {
 	printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon -K -q -p "$PIDFILE"
+	start-stop-daemon --stop --pidfile "$PIDFILE" --exec "/sbin/$DAEMON"
 	status=$?
 	if [ "$status" -eq 0 ]; then
-		rm -f "$PIDFILE"
 		echo "OK"
 	else
 		echo "FAIL"
+		return "$status"
 	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/sbin/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
 	return "$status"
 }
 
 restart() {
 	stop
-	sleep 1
 	start
 }
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
