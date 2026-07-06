Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DCEC43458
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 04:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E31D40A37;
	Mon,  6 Jul 2026 04:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tNcLUlc5u2b4; Mon,  6 Jul 2026 04:52:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29081409E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783313549;
	bh=0Z/UAGzhnEV3KeuKqqcOoBwXY7wjyD0Y7ori0md6f1E=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iwPDgLnch1huY98bff/T3PvoD5pvWCj3L3yFwO6hCtBdavdN7wPEBUmFUJS7QXWlg
	 GVdVfgwbx1J8r+zSZhBEzKUYwL4YRXD5oj7tan60LXN4GaJbw8754aYXXRjl6CPYP7
	 XZbUEhrtRjsSKqkKH+J1ZLEpoahqMCg6EIbgvgu7ATGm/CtaW8QqfZBGrvQ/az9M1d
	 ljZzCfCa4ojwZhMVNKrkRJouEvyBQ9eEvkWOcXcnD0RG56IYJYAUTzgQu4e3GDEH0r
	 +j2QwVGVBllO9HS8jdxKtObCmDH8WTIYMWnb+ZUEffJMJpBqpDuILadQhDA9auIU2L
	 7z7G4+I3jjuQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29081409E7;
	Mon,  6 Jul 2026 04:52:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 212FAF2
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 04:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EDFE6087B
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 04:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ufek90Qbsyu6 for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 04:52:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3DE3D60693
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DE3D60693
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DE3D60693
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 04:52:26 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5aebfa21c62so3018317e87.3
 for <buildroot@buildroot.org>; Sun, 05 Jul 2026 21:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783313544; x=1783918344;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EQ4iJ28p7ZRztbmNJfAQTSCaE0HJSrLIYNxYMB/iGRU=;
 b=R3g24KDFzNAaxCvQXsOSRi7ukTgsu4rE6JF6jA0zee6AhQ6WfSDnJiL28Fy66vLxBp
 pD2hdpP7/cKQff/I/67KwRtNkOHdpF4oED1E9KjIs1Pw0foC1hZnLzl81zyP0SKsCFql
 AAlcyxMSVNkhfj6keuyxAhWi4C3pbndmO0BP0N3OEASLLTeER81hrPGWGq7quwfkE+A4
 Bem+l+U+I1wfLEiW1dKfob84U7svSC8FIuf1Tto2nHpCiTav2X2Jn4Lssw+lbxG5v5xg
 9Yhgzq94lo5QMinJ9KZJv6zGlZ2MuX0GZ7htISQqSsP5j+zVUxzGJu8jluLpVUKQVnFq
 U2Bw==
X-Gm-Message-State: AOJu0YzMsMirfolXbd6IlGpXurTp6qlfXRdT8Msrp7orw66d7L92buiM
 qqskN3ia5zw42k/tiuahnDebFVjiN2G4dQBGEy7R+6gtkfr6MJnvThQZhsgR8r0uHDE=
X-Gm-Gg: AfdE7ckoaXHFHpphKVZ2h3Kxzrs8JbJDqYEcOyO+msjuzbcwuET7LWawCwmRD6YdGDT
 5FtIrfAxRjaEY2+XeljuZ5P6e/cBaFt0k9GNI2EDMD+YdlMOZTgKKooBLMM4NSsKS/dSQVrCq/U
 FnLDmb+VYoV2YlSkngODMaPkhdynncx1kZPnmEVun1nKf5W9h6vIaDtyHGZe+FfWvGkyKoc02XN
 2fUNrnuF/ohCGNN3vhzsXNky0a2ZZfdGvOPOu9nSMj0AM8S14aWQlYarwB71ocF0RFa1gfsOuI0
 4KPPz94vTV+KbJ5m8LTYNf8WriSFwBQU/rbArMS1sveNJ0emXSaMkTIrUqcbS6NDnQPdqfE3SqA
 XY20jst3Tv5tpYJJ5am/N5Ura8UWJ1oLVBkoO1Rm5Ot0H79ZqgYBW/uh3i8hTaB7D7qhUA8mM82
 B4GVJY5nHA1oplBYyIphTkwjYSJ2VvpvRu6vTp5eO3
X-Received: by 2002:a05:6512:6419:b0:5ae:a553:3318 with SMTP id
 2adb3069b0e04-5aed5094a80mr1348836e87.49.1783313543615; 
 Sun, 05 Jul 2026 21:52:23 -0700 (PDT)
Received: from gimli.. (h-158-174-22-6.NA.cust.bahnhof.se. [158.174.22.6])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-39b4ad1887csm16866441fa.6.2026.07.05.21.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2026 21:52:22 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>, Joachim Wiberg <troglobit@gmail.com>
Date: Mon,  6 Jul 2026 06:52:05 +0200
Message-ID: <20260706045206.2395575-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706045206.2395575-1-troglobit@gmail.com>
References: <20260706045206.2395575-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783313544; x=1783918344; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=EQ4iJ28p7ZRztbmNJfAQTSCaE0HJSrLIYNxYMB/iGRU=;
 b=bqZmQUsXQgN4HPB4Ahcl5j8lmFeCiRi8JtUNE7zguun+BumdMnyvH9H1jqwGoEzlPY
 qzUA+trBLU1/Amh9soGZFZqZFNACXUQX2c9RRfWdFp2fbRhZE760egi0K5xstjRb0NM3
 FFD7hLwymd5dCfhQpWBwNyM6mCB3yejVYPo3EaHDZht8efQH5ul8M6WEZAAsvENWehi8
 1HXCzNMtP6er6uZunXCI2Q2bjGQvxL91h5BwqYdHHV77afYseCVW/pDFwqFqPPeV2k40
 g0cPxPQJnZK5Xyc1/Wp49td/ybc3PcEWB7H4eXDSUg9IMIU76cd0uKNSyYZy+QCaQpJ2
 b4pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=bqZmQUsX
Subject: [Buildroot] [PATCH 2/3] package/mini-snmpd: add sysv init script
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A start script has been missing since the package was added, so the
daemon was not started automatically on sysv/busybox systems.

This also fixes a regression in systemd builds introduced in fccdc6bd,
when the package switched from local unit file to upstream.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/mini-snmpd/S60mini-snmpd | 52 ++++++++++++++++++++++++++++++++
 package/mini-snmpd/mini-snmpd    |  2 +-
 package/mini-snmpd/mini-snmpd.mk |  5 +++
 3 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 package/mini-snmpd/S60mini-snmpd

diff --git a/package/mini-snmpd/S60mini-snmpd b/package/mini-snmpd/S60mini-snmpd
new file mode 100644
index 0000000000..e7c61d7a85
--- /dev/null
+++ b/package/mini-snmpd/S60mini-snmpd
@@ -0,0 +1,52 @@
+#!/bin/sh
+
+DAEMON="mini-snmpd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+DAEMON_OPTS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --quiet --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON" -- $DAEMON_OPTS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon --stop --quiet --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/mini-snmpd/mini-snmpd b/package/mini-snmpd/mini-snmpd
index 0ca9901d58..371f57f15f 100644
--- a/package/mini-snmpd/mini-snmpd
+++ b/package/mini-snmpd/mini-snmpd
@@ -1,2 +1,2 @@
 # Require client authentication, thus SNMP version 2c
-EXTRA_PARAMS=-a
+DAEMON_OPTS="-a -c public -s"
diff --git a/package/mini-snmpd/mini-snmpd.mk b/package/mini-snmpd/mini-snmpd.mk
index 89eca4ce79..99bef47477 100644
--- a/package/mini-snmpd/mini-snmpd.mk
+++ b/package/mini-snmpd/mini-snmpd.mk
@@ -19,4 +19,9 @@ endef
 
 MINI_SNMPD_POST_INSTALL_TARGET_HOOKS += MINI_SNMPD_INSTALL_ETC_DEFAULT
 
+define MINI_SNMPD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/mini-snmpd/S60mini-snmpd \
+		$(TARGET_DIR)/etc/init.d/S60mini-snmpd
+endef
+
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
