Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1575CC2D0CD
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 12:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2F0761143;
	Thu, 15 May 2025 12:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lzNaEKo-NNej; Thu, 15 May 2025 12:10:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A20996114C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A20996114C;
	Thu, 15 May 2025 12:10:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A001119
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 067B36113F
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id joECiiwduW-b for <buildroot@buildroot.org>;
 Thu, 15 May 2025 12:10:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0383760846
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0383760846
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0383760846
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:34 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5faa590dbb2so163268a12.1
 for <buildroot@buildroot.org>; Thu, 15 May 2025 05:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747311032; x=1747915832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EztWBrbWo48fCJhB+3X8jIvjRvCGoHyYqDQLb6HQmO4=;
 b=WHSBoTqzjROub38x1zVlZX+cq3oUxxieE60DcjzuzcTEQkTsZxRi4LVlxsWXVDe4e0
 eAM36TulhOp7HZtVTM0dQpqp2wUsj/1fD1yi8sOSpJNic+0WFq/t0++JJ5IQFngVep7O
 3b1ad+EmWCE4SRImudYXQFZeHBcyhB4dUBB64PxZ/Jocn+g708LMhqC9LQvOFREOxvNX
 N6fCJ6JB5NDG/tc2D4IrM03DeaJl7GgVr7bugZ8pPj8jaAQsFxIn0ldhiph2+EIPQ95Q
 Z/p8rfKwTpZ+ZpkOlgvY//XvH1vuAidSaw/hy9RIAD1GArOcuJvCoFWmfk7AAociwASa
 PdhA==
X-Gm-Message-State: AOJu0YyGKQBrjLq8zBSCZpv3UYrseuso2E5uhO/rYbV8ZFQtjW+HisuI
 LjvNciAHgBm2eWXwK67UL5/xyCJe5EsGRvXzrbV7WOeookiiKqWUAeqNNiLPkvsSdT+MVHLRcZw
 Q
X-Gm-Gg: ASbGncsQVOmKrz11XLtG1C2HHfMhwBvmuKqFG4XIjBffDTklrX8sbGh1Tf5FJ0R2lsG
 AkMbojFZs8b6DkrIPSzOIXwKD9rzyl2Y2Y9rn+ST6fQVhRmetUJ7oT78GEknlQSkjSiNrv+WoUI
 pIpXfgNwS3vyzB5Ogz9aIkpnbGz5eUXBi5116m9FsxGDEgZM7pyJOou+EbtzZj7Z46K5yyKwXSv
 QUMhSSxCt4bYfEZcAM5Yfnw928PDrhwssUUDUY2mXa2WsveEbfPPbJ4AQo8jcbW1J8qQPwzpKuH
 sjYIALW/lfsieBJfrfZsAIGQyHKvtBPQjPQ2ee2EjyBryE76KgHjyQXdoe7KQE+id+RY+osgeih
 YXET0hubKyaQK9qqgwFNb5WEYx4Ma0K39Qkxhtqu1JEJ2OXMwn6eT2YKffwCkHPmPyPRCJ0OliW
 rzjBj594CphrYfuAks4sYk
X-Google-Smtp-Source: AGHT+IGdV1zqFDf7aAsI2jcy8KXc7FTjOq9vgkJCUHADqXYzaSk5MCdStLBHBnPd5RAbGbgHikVSvQ==
X-Received: by 2002:a05:6402:50c9:b0:5fb:290c:51e9 with SMTP id
 4fb4d7f45d1cf-5ff988decb8mr2226778a12.9.1747311031710; 
 Thu, 15 May 2025 05:10:31 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9cbe523bsm10218214a12.12.2025.05.15.05.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 05:10:31 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 14:10:18 +0200
Message-ID: <20250515121027.561571-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
References: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747311032; x=1747915832;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EztWBrbWo48fCJhB+3X8jIvjRvCGoHyYqDQLb6HQmO4=;
 b=FQBqGVYrtyZqgtxAsQvQxsvVLoX1r22dWRJAgds7CgI9eaqqreFNe0m8ioAcZ1YBZn
 aIQX1wcMiQL2ms2IFVCM4tmvev1Y7qGnmoHKvPpUxDkE2IEW1CxQtRPA2thSjRbh41yj
 4qn+BaJqFBqnlTB2E/Mift9NsQai70fc0QzdY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=FQBqGVYr
Subject: [Buildroot] [PATCH 01/10] package/audit/S02auditd: fix shellcheck
 and check-package warnings
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixup S20audit to pass shellcheck -oall and check-package. The file now
closely resembles package/busybox/S01syslogd.

Tested with qemu_x86_64_defconfig. start, stop, restart, reload, and rotate
all work with busybox ash shell.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/audit/S02auditd | 66 +++++++++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 22 deletions(-)

diff --git a/package/audit/S02auditd b/package/audit/S02auditd
index dd3dc22d6d..f32f01714e 100644
--- a/package/audit/S02auditd
+++ b/package/audit/S02auditd
@@ -8,52 +8,74 @@
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
+		audit_log_selable="$(selabel_lookup -b file -k /var/log/audit | cut -d ' ' -f 3)"
+		mkdir -p /var/log/audit -Z "${audit_log_selable}"
 	else
 		mkdir -p /var/log/audit
 	fi
 
-	# Run audit daemon executable
-	start-stop-daemon -S -q -p ${PIDFILE} --exec ${DAEMON}
-
-	if [ $? = 0 ]; then
+	start-stop-daemon --start --background --make-pidfile \
+		--pidfile "${PIDFILE}" --exec "/usr/sbin/${DAEMON}"
+	status=$?
+	if [ "${status}" -eq 0 ]; then
 		# Load the default rules
 		test -f /etc/audit/rules.d/audit.rules && /usr/sbin/auditctl -R /etc/audit/rules.d/audit.rules >/dev/null
 		echo "OK"
 	else
 		echo "FAIL"
 	fi
+	return "${status}"
 }
 
 stop(){
-	printf "Stopping ${NAME}: "
-
-	start-stop-daemon -K -q -p ${PIDFILE}
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf "Stopping %s: " "${DAEMON}"
+	start-stop-daemon --stop --pidfile "${PIDFILE}" --exec "/usr/sbin/${DAEMON}"
+	status=$?
+	if [ "${status}" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "${status}"
+	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "${PIDFILE}" \
+		--exec "/sbin/${DAEMON}"; do
+		sleep 0.1
+	done
+	rm -f "${PIDFILE}"
+	return "${status}"
 }
 
 reload(){
-	printf "Reloading ${NAME} configuration: "
-	start-stop-daemon --stop -s 1 -p ${PIDFILE} 1>/dev/null
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf "Reloading %s configuration: " "${DAEMON}"
+	start-stop-daemon --stop --signal HUP --pidfile "${PIDFILE}" 1>/dev/null
+	status=$?
+	if [ "${status}" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "${status}"
 }
 
 rotate(){
-	printf "Rotating ${NAME} logs: "
-	start-stop-daemon --stop -s 10 -p ${PIDFILE} 1>/dev/null
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf "Rotating %s logs: " "${DAEMON}"
+	start-stop-daemon --stop --signal SIGUSR1 --pidfile "${PIDFILE}" 1>/dev/null
+	status=$?
+	if [ "${status}" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "${status}"
 }
 
 case "$1" in
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
