Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95E8C3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 15:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 894B5410C3;
	Mon, 16 Sep 2024 15:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUGOx6heB2Mz; Mon, 16 Sep 2024 15:13:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B14041090
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B14041090;
	Mon, 16 Sep 2024 15:13:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 357AF1BF41D
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13CE440C28
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pl2CoDGhHOkp for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 15:12:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 89F1140C2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89F1140C2A
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89F1140C2A
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 15:12:23 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c254a544bfso654673a12.1
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 08:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726499541; x=1727104341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ApxJXtCqY9AeiHRMpy313H1fQCVk43HcZISd5dEiCI=;
 b=VGTb5Pp8AHhbqYL7fxAYzSXYqVTcILIAJjlpWQQle8Ca/ePN9OCTrtkyGLBNZKMCmX
 x/qLbDKNP7KaaLngISb0D5tt1SxoGybzdeSzrnf5C4X8PHZUnClfUvPYFu8vUN4Y8uMt
 hUKvsSx4BhxWwlWvuP40jErkIQ8QgOJmjlGfGzLD/fh/oN8RSKE0MRoCJTFTEK4lT6LO
 L35Pwu6p0/g9K5SsejxDrTgh5PmPsosE5+ubwd4DO2wuAUThakEebba7COMjIXp+rd6J
 hsUu1RZlyexOV1zjFwi30CWFJRM2Zy3otAJliroBFLao7azba9/q0iKZdxZJGKwzBk2k
 JxeQ==
X-Gm-Message-State: AOJu0YwoYpyyhV7Y7N59v9OE6hxIcdXGXYW3Gb+AoCOuCbsKFxY+JheI
 JUfB0ueCKtDyekUrHb1LCjoK73+X+HdEe8QHe9N3r7r5XJd0HomSg8CuDElwR3cSdopvCdICnpI
 p6Lf+AA==
X-Google-Smtp-Source: AGHT+IHYXfov1SjHEZ0j8B/7ZREsXou5z+tvA+6jHtkShq1XPMHM4kSLWwXIPxOn1XX1oQjZk61MGA==
X-Received: by 2002:a17:907:6ea5:b0:a80:f54c:ad68 with SMTP id
 a640c23a62f3a-a90293fbce6mr760029266b.2.1726499541025; 
 Mon, 16 Sep 2024 08:12:21 -0700 (PDT)
Received: from adam-laptop.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f440bsm330460166b.86.2024.09.16.08.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 08:12:20 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 17:12:05 +0200
Message-ID: <20240916151206.947484-13-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
References: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726499541; x=1727104341;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ApxJXtCqY9AeiHRMpy313H1fQCVk43HcZISd5dEiCI=;
 b=dE1YuH8ywPgwL3bPLJwW2Wzywsrq1c46IQEAP/fIQdJPJ2nH/2Anysh4Ww5evh2k/b
 g8kUN5JJASwKdQ6fKvUWMLCHNKcS1abhVHPVrCU4dGyQNsIrs4k/k52gkKt9NrIasgnX
 34vbuXLAorOOSR2cUmJqZPLCKh3d5kSlT9xfU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=dE1YuH8y
Subject: [Buildroot] [PATCH 12/13] package/audit/S02auditd: fix shellcheck
 and check-package warnings
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Antoine Tenart <atenart@kernel.org>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tested with qemu_x86_64_defconfig. start, stop, restart, reload, and rotate
all work with busybox ash shell.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/audit/S02auditd | 44 ++++++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/package/audit/S02auditd b/package/audit/S02auditd
index dd3dc22d6d..b23c49a125 100644
--- a/package/audit/S02auditd
+++ b/package/audit/S02auditd
@@ -8,27 +8,22 @@
 #              will be sent to syslog.
 #
 
-NAME=auditd
-DAEMON=/usr/sbin/${NAME}
-CONFIG=/etc/audit/auditd.conf
-PIDFILE=/var/run/${NAME}.pid
+DAEMON="auditd"
+PIDFILE="/var/run/${DAEMON}.pid"
 
 start(){
-	printf "Starting ${NAME}: "
+	printf "Starting %s: " "${DAEMON}"
 
 	# Create dir to store log files in if one doesn't exist. Create
 	# the directory with SELinux permissions if possible
-	command -v selabel_lookup >/dev/null 2>&1
-	if [ $? = 0 ]; then
-		mkdir -p /var/log/audit -Z `selabel_lookup -b file -k /var/log/audit | cut -d ' ' -f 3`
+	if command -v selabel_lookup >/dev/null 2>&1; then
+		mkdir -p /var/log/audit -Z "$(selabel_lookup -b file -k /var/log/audit | cut -d ' ' -f 3)"
 	else
 		mkdir -p /var/log/audit
 	fi
 
 	# Run audit daemon executable
-	start-stop-daemon -S -q -p ${PIDFILE} --exec ${DAEMON}
-
-	if [ $? = 0 ]; then
+	if start-stop-daemon -S -q -p "${PIDFILE}" --exec /usr/sbin/"${DAEMON}"; then
 		# Load the default rules
 		test -f /etc/audit/rules.d/audit.rules && /usr/sbin/auditctl -R /etc/audit/rules.d/audit.rules >/dev/null
 		echo "OK"
@@ -38,22 +33,31 @@ start(){
 }
 
 stop(){
-	printf "Stopping ${NAME}: "
+	printf "Stopping %s: " "${DAEMON}"
 
-	start-stop-daemon -K -q -p ${PIDFILE}
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	if start-stop-daemon -K -q -p "${PIDFILE}"; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
 }
 
 reload(){
-	printf "Reloading ${NAME} configuration: "
-	start-stop-daemon --stop -s 1 -p ${PIDFILE} 1>/dev/null
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf "Reloading %s configuration: " "${DAEMON}"
+	if start-stop-daemon --stop -s 1 -p "${PIDFILE}" 1>/dev/nulll; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
 }
 
 rotate(){
-	printf "Rotating ${NAME} logs: "
-	start-stop-daemon --stop -s 10 -p ${PIDFILE} 1>/dev/null
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf "Rotating %s logs: " "${DAEMON}"
+	if start-stop-daemon --stop -s 10 -p "${PIDFILE}" 1>/dev/null; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
 }
 
 case "$1" in
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
