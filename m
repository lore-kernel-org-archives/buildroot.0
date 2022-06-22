Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A24C43334
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 18:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 882CB61298;
	Wed, 22 Jun 2022 18:49:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 882CB61298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jN-eZBoz_AFr; Wed, 22 Jun 2022 18:49:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 853856129F;
	Wed, 22 Jun 2022 18:49:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 853856129F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 970A81BF408
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 18:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71EAD837C9
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 18:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71EAD837C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rcZH0YEIFSmB for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 18:48:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4184783E30
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4184783E30
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 18:48:33 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id a15so9685668pfv.13
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 11:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3SQ6y1z69xp62JLJVoso+JTyu4N0EnZ7LwIek9P0T+E=;
 b=7fP4hinI2fkxwyHpzmxz4xf/lSQuuqGRGHd0cq5tg4S1XBb4/dLJF4/yvOR09upTxg
 CchpGjji3WdXq6DIhzDc3/qlmZhsih8S75CbEyktD1FNDwR9rchNH16UJkOLXRPaUWBl
 VO5b74ehOL2Pndy01PKSGvOv0QcTDN5B9Sfl+K9F36C0xN3Yh9SuGsg7MaE4OULznW9o
 OE/ZAPxLuUXe5VCFb9v+ryXJ5KX/g5VTApZEBcl5ai8RkOVNQYb7EvhA3tLPv3oN1PWt
 nUVvzF2ZkTUcj6Q3yTGlq2wHa4y/nl7BuRkLzfhNr+BLuwdSHMJ13Y2rDNXwSuhyIqaz
 h7rw==
X-Gm-Message-State: AJIora9bvWwBnLNq0vLJAYSm3/uplJ+/6NrdLBYBAFOTuto37K977yHi
 IZ5vHMK7xJrPOncGvO0fHp/eDeTkMRg=
X-Google-Smtp-Source: AGRyM1tYM0ut5sA9y43eZXksC00jyqo0R1mvbqF/JfoOZrL5yYqQswRNhpFUvHzuPZ5jcUPdv2ivcg==
X-Received: by 2002:a62:be01:0:b0:525:1ee2:1481 with SMTP id
 l1-20020a62be01000000b005251ee21481mr19015029pff.30.1655923712200; 
 Wed, 22 Jun 2022 11:48:32 -0700 (PDT)
Received: from adam-workstation.goriv.co ([47.153.95.92])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a1709027e0200b0015e8da1f9e8sm13143075plm.77.2022.06.22.11.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 11:48:31 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 11:48:22 -0700
Message-Id: <20220622184824.289640-3-aduskett@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622184824.289640-1-aduskett@gmail.com>
References: <20220622184824.289640-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3SQ6y1z69xp62JLJVoso+JTyu4N0EnZ7LwIek9P0T+E=;
 b=aeAOWU24lsAhaBS5PhwHbiI1CK5cBsFy5PuX9y7xOZQNIUxd3qRmI96VrS7iB979AT
 h+KpyjlgW9v6qMPPSsGuICtHA2Daznui5DHpdvLo7n5IYbhKKEXXfGORovEtFc2FMqU1
 8FToiVnFNAwybDtO1gzQ/KBhN/iY3Gp97DFHNEdupMvpct0vxcnypI3HnzwM5BxIPMNi
 rK1eYlLvMUp4nj9U5wbuzVc5LtsEsP1NwMZziVP7ezH+ILvKl2FOue0cHqXXoFLpvfSQ
 fsT4IN7l8f/5OUKzAJHVf3JEl2n0KhinebhBgzORDcFCS34G7m5XGRGA3WIRjYbG9SS3
 LCkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aeAOWU24
Subject: [Buildroot] [PATCH 3/5] package/mender/S42mender: fix check-pkg and
 shellcheck warnings
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Anisse Astier <anisse@astier.eu>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Copy the basic syntax of package/polkit/S50polkit and change the following:

  - Add DAEMON, DAEMON_PATH, PIDFILE and DAEMON_ARGS variables.
  - Fix shellcheck warning SC2166 on line 16.
  - Fix shellcheck warning SC2181 on lines 29 and 34 by assigning the return
    code from the start-stop-daemon binary to a variable, and then check the
    value of the variable.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/mender/S42mender | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/package/mender/S42mender b/package/mender/S42mender
index dc60f94f8b..29008beca0 100644
--- a/package/mender/S42mender
+++ b/package/mender/S42mender
@@ -2,6 +2,10 @@
 #
 # Starts mender service.
 #
+DAEMON="mender"
+DAEMON_PATH="/usr/bin/mender"
+PIDFILE="/var/run/${DAEMON}.pid"
+DAEMON_ARGS="-daemon"
 
 start() {
 	# If /var/lib/mender is a symlink to /var/run/mender, and
@@ -9,8 +13,7 @@ start() {
 	#     create the directory pointed to by the symlink.
 	#   - the filesystem is RW (i.e. we can rm the symlink),
 	#     replace the symlink with an actual directory
-	if [ -L /var/lib/mender \
-	     -a "$(readlink /var/lib/mender)" = "/var/run/mender" ]
+	if [ -L /var/lib/mender ] && [ "$(readlink /var/lib/mender)" = "/var/run/mender" ]
 	then
 		if rm -f /var/lib/mender >/dev/null 2>&1; then
 			mkdir -p /var/lib/mender
@@ -23,15 +26,16 @@ start() {
 
 	printf "Starting mender service: "
 	umask 077
-
-	start-stop-daemon -S -q -b -m -p /var/run/mender.pid \
-		--exec /usr/bin/mender -- daemon
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	start-stop-daemon -bmSqp "$PIDFILE" -x ${DAEMON_PATH} -- ${DAEMON_ARGS}
+	status=$?
+	[ "${status}" = 0 ] && echo "OK" || echo "FAIL"
 }
+
 stop() {
 	printf "Stopping mender service: "
-	start-stop-daemon -K -q -p /var/run/mender.pid
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	start-stop-daemon -Kqp "$PIDFILE"
+	status=$?
+	[ "${status}" = 0 ] && echo "OK" || echo "FAIL"
 }
 restart() {
 	stop
@@ -49,7 +53,7 @@ case "$1" in
 		restart
 		;;
 	*)
-		echo "Usage: $0 {start|stop|restart}"
+		echo "Usage: $0 {start|stop|reload|restart}"
 		exit 1
 esac
 
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
