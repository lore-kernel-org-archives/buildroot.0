Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB0FC05027
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 10:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 263EA60BDB;
	Mon, 23 Jan 2023 10:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 263EA60BDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HmuzH-cFDyJ6; Mon, 23 Jan 2023 10:32:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ED2760BD1;
	Mon, 23 Jan 2023 10:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ED2760BD1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D119F1BF348
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 10:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A639A81F11
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 10:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A639A81F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LsXRsG5oaoU1 for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 10:32:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8018E81F10
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8018E81F10
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 10:32:31 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 q10-20020a1cf30a000000b003db0edfdb74so4078471wmq.1
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 02:32:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=89EVbpO2/4qfdprCClh7ueq7lUkTEqHFQ7top/QH47Q=;
 b=LJ2XFVxqRT/F8N4mOFp0kOI4Qew3cHBp6SbLG4w0l5jGtrRsZ4DvYUGIY/keXZjZCX
 f5HXqOV2df+rFDfqD49X9vUKUE5LPqUwMXnrEgqC4V++m2f5U7C4JJKrSbx5gtXXLPWu
 JyonhinpViKmrcGVeodlBZbZLyp9c2+k/eF/Jx8zKLal1mEJxFhfoYKVb0hCmFW+L/SI
 rIWATc6b3uzpQjmgKs5ZJpP3HRDj8b5KP8rr+IAip6KnxXREtmrg/0CYHWXXaPGLRWyw
 hrJKkix4O2YPd5Z5F9wrUzbyDS1LnTdOhfdZG2wVAN5kcgTt+PzLFkYguHQThOqlxyWN
 547g==
X-Gm-Message-State: AFqh2kp52rhz1brOAV/m3JptJv7AfE/Oj3JiHH/GiDdSWNSLUAquUcq/
 W0Tf3p3Xy39OTWl/lq/en+msKdpaZvif1Q==
X-Google-Smtp-Source: AMrXdXuzABD19Kl/x18JCzn3eUyb3iwkAOKkLZcAZ5wfhpVayDQi+OJdZuasHe0zUf84ok8Nv0Gmkw==
X-Received: by 2002:a05:600c:3d06:b0:3da:f945:2354 with SMTP id
 bh6-20020a05600c3d0600b003daf9452354mr23616558wmb.41.1674469949080; 
 Mon, 23 Jan 2023 02:32:29 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003db2b81660esm10540966wmo.21.2023.01.23.02.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 02:32:28 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 23 Jan 2023 11:32:24 +0100
Message-Id: <20230123103224.1267225-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=89EVbpO2/4qfdprCClh7ueq7lUkTEqHFQ7top/QH47Q=;
 b=GzU2p5sFbD9Y+ij9+OkCMdCYNoJkcR3/zMArYWLJWUqpMFitQIFNfNeUCeOs8ZCZQ2
 JNw3TOg44DZGNVCWYyL5t9T5/0J1qBX/4aZvVEjwR3WtMaxUUjOEXbxtlV9/pO9B02fs
 ik0TIQn9JQfZsC5YMAiOaFpGPZfIQoM9l0RHcWaa4mkZZUkJeRs3apP4lPQLTW4V8q2u
 +LSJBo6GwfU3tFws0bbgQClC9inMCNTzwet7sTGf0c2n7kktDNBnboLrlyaPAyhwHFuy
 WgAon3uk5pjFXYpNWwGAteLxUQMlKlPnZfGBoj1H9T5lp6fv+Bzxvr13BGKzFV6oD4I/
 6KZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GzU2p5sF
Subject: [Buildroot] [PATCH] package/fluent-bit: add new package
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
Cc: Samuel Martin <s.martin49@gmail.com>, Grim Delcour <grim.delcour@barco.com>,
 Anton Danneels <anton.danneels@barco.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fluent Bit is a super fast, lightweight, and highly
scalable logging and metrics processor and forwarder.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/Config.in                  |  1 +
 package/fluent-bit/Config.in       | 13 ++++++++
 package/fluent-bit/S99fluent-bit   | 51 ++++++++++++++++++++++++++++++
 package/fluent-bit/fluent-bit.hash |  3 ++
 package/fluent-bit/fluent-bit.mk   | 43 +++++++++++++++++++++++++
 5 files changed, 111 insertions(+)
 create mode 100644 package/fluent-bit/Config.in
 create mode 100644 package/fluent-bit/S99fluent-bit
 create mode 100644 package/fluent-bit/fluent-bit.hash
 create mode 100644 package/fluent-bit/fluent-bit.mk

diff --git a/package/Config.in b/package/Config.in
index 995dae2c57..b281a67157 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2610,6 +2610,7 @@ menu "System tools"
 	source "package/efivar/Config.in"
 	source "package/embiggen-disk/Config.in"
 	source "package/emlog/Config.in"
+	source "package/fluent-bit/Config.in"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
 	source "package/gkrellm/Config.in"
diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
new file mode 100644
index 0000000000..c8f9d4e489
--- /dev/null
+++ b/package/fluent-bit/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_FLUENT_BIT
+	bool "fluent-bit"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBYAML
+	help
+	  Fast and Lightweight Logs and Metrics processor.
+
+	  https://github.com/fluent/fluent-bit
+
+comment "fluent-bit needs a glibc toolchain, dynamic library"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS
diff --git a/package/fluent-bit/S99fluent-bit b/package/fluent-bit/S99fluent-bit
new file mode 100644
index 0000000000..e53a5fdfb1
--- /dev/null
+++ b/package/fluent-bit/S99fluent-bit
@@ -0,0 +1,51 @@
+#!/bin/sh
+#
+# Starts fluent-bit.
+#
+NAME=fluent-bit
+DAEMON=/usr/bin/$NAME
+PID_FILE="/var/run/$NAME.pid"
+CONF_FILE="/etc/$NAME/$NAME.conf"
+
+[ -r /etc/default/$NAME ] && . /etc/default/$NAME
+
+start() {
+	printf "Starting fluent-bit: "
+	start-stop-daemon -S -q -b -m -p $PID_FILE --exec $DAEMON -- -c $CONF_FILE
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	printf "Stopping fluent-bit: "
+	start-stop-daemon -K -q -p $PID_FILE
+	# Fluent-bit takes max 5 seconds to exit,
+	# so wait max 30 x 0.2 = 6 seconds.
+	TIMEOUT=30
+	while pidof $NAME >/dev/null; do
+		[ $TIMEOUT -eq 0 ] && echo "FAIL" && return 1
+		TIMEOUT=$((TIMEOUT - 1))
+		sleep 0.2
+	done
+	echo "OK"
+}
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+start)
+	start
+	;;
+stop)
+	stop
+	;;
+restart | reload)
+	restart
+	;;
+*)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+	;;
+esac
+
+exit $?
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
new file mode 100644
index 0000000000..ce7cea7b59
--- /dev/null
+++ b/package/fluent-bit/fluent-bit.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  8ff5566389033669feabc9c69a5c6f417dad5c8b066454388e6a706507262acf  fluent-bit-2.0.8.tar.gz
+sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
new file mode 100644
index 0000000000..c213ca2239
--- /dev/null
+++ b/package/fluent-bit/fluent-bit.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# fluent-bit
+#
+################################################################################
+
+FLUENT_BIT_VERSION = 2.0.8
+FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
+FLUENT_BIT_LICENSE = Apache-2.0
+FLUENT_BIT_LICENSE_FILES = LICENSE
+FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml libopenssl
+
+FLUENT_BIT_CONF_OPTS += \
+	-DFLB_DEBUG=No \
+	-DFLB_RELEASE=Yes \
+	-DFLB_EXAMPLES=No \
+	-DFLB_CHUNK_TRACE=No \
+	-DFLB_BACKTRACE=No \
+	-DFLB_LUAJIT=No
+
+# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
+# large file support.
+# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information.
+FLUENT_BIT_CONF_OPTS += \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -U_FILE_OFFSET_BITS"
+
+# Move the config files from /usr/etc/ to /etc/.
+FLUENT_BIT_CONF_OPTS += \
+	-DCMAKE_INSTALL_SYSCONFDIR="/etc/"
+
+define FLUENT_BIT_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/fluent-bit/S99fluent-bit \
+		$(TARGET_DIR)/etc/init.d/S99fluent-bit
+endef
+
+define FLUENT_BIT_POST_INSTALL_TARGET_HOOK
+	cp -dpf $(@D)/lib/libminiz*.so* $(TARGET_DIR)/usr/lib/
+endef
+
+FLUENT_BIT_POST_INSTALL_TARGET_HOOKS += FLUENT_BIT_POST_INSTALL_TARGET_HOOK
+
+$(eval $(cmake-package))
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
