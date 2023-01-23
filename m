Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F522C38142
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 13:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 915D681F60;
	Mon, 23 Jan 2023 13:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 915D681F60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WDUSZMRditA8; Mon, 23 Jan 2023 13:53:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B233581F54;
	Mon, 23 Jan 2023 13:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B233581F54
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 707731BF359
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 13:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BEFE60D60
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 13:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BEFE60D60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GF5xd0PyYNii for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 13:52:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE73A60C18
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE73A60C18
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 13:52:58 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so8606253wmc.1
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 05:52:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZyqCxW2GajQd8FoWt3r0fRRJdijwz6oEghSyxkRBTS8=;
 b=rGueaR8juszqG91y4qn+uKEjWSz24i5Shn/aYLmuiYz7tsZpAQyn2mlPQ1zD6Rsji8
 /hsh2mb5yzF26hie7nbjmpJBcGcXw4kt0kTYyShmmJ/i0pcsBYLgmhugaqCyhUV+Duh5
 2p+RT/rQYsthckpcqnaXaKGpUH3wQN6gw0pnMvz5QwTbf742f7pdJR59LdwJ6ptMezNV
 7bqtOIctghcDrNxAqOqUafJOf5lxslblihWHFOIRsiWs29fF8yamCODg7JdGsoRpKu76
 EOS/lSh50HsbodVU5tZmoAXamv1kgvzpun0Ta6n2WdCXAMeriz+4QycRsWuRuKqIqvdL
 LmIQ==
X-Gm-Message-State: AFqh2krRU2s+iI8cj+miRMwhwmT0zGOl27tAeEL48eRnDR7Rk7SqSbv/
 AX69ZIR5Dt0PbmBeaDT0RGFlOaqNZrvYuKPA
X-Google-Smtp-Source: AMrXdXsLNd6zNnfzqzQMfRLU1kqItNbIk5WuKeAA1k12pbO49vh+Y30AuiYVKGbCrrryOh8Hua5wXA==
X-Received: by 2002:a05:600c:331d:b0:3d3:591a:bfda with SMTP id
 q29-20020a05600c331d00b003d3591abfdamr31906784wmp.27.1674481976442; 
 Mon, 23 Jan 2023 05:52:56 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 hg8-20020a05600c538800b003d974076f13sm10576346wmb.3.2023.01.23.05.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:52:56 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 23 Jan 2023 14:52:53 +0100
Message-Id: <20230123135253.1733981-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=ZyqCxW2GajQd8FoWt3r0fRRJdijwz6oEghSyxkRBTS8=;
 b=dPLnrQV1yATVTqtpCZYWE+8z46lzMrGp8onzAr8RUZI6LGofx8CgE3aM+uV3yVtHEP
 fb7YNcVU3FsTrMZOINf7tpjBQCVc375u0G69Hcyf80pFtcNxGQuUk14OQOwQ9nQZdqJz
 MlP2o13gKzQ3WjJKAIEfAs8x/cfsEofpYyGh0dEHQ705yHv1S1ZQzx18ID01LqQTq2cr
 V12nOHlgvtDoewF6o5iVzI99Mdg7akY8IcgusPXh1JkRDV1nv/60MrolwzPkQCPeC60r
 aY/9qkl/DC0q0wQI6shKoMBa3TqfBegnkvXDDQfdsTpPNselYBpC9Kctk2uRo1boJV0w
 XrGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dPLnrQV1
Subject: [Buildroot] [PATCH v2] package/fluent-bit: add new package
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
 package/fluent-bit/Config.in       | 13 +++++++
 package/fluent-bit/S99fluent-bit   | 55 ++++++++++++++++++++++++++++++
 package/fluent-bit/fluent-bit.hash |  3 ++
 package/fluent-bit/fluent-bit.mk   | 43 +++++++++++++++++++++++
 5 files changed, 115 insertions(+)
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
index 0000000000..1d5a40e020
--- /dev/null
+++ b/package/fluent-bit/S99fluent-bit
@@ -0,0 +1,55 @@
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
+
+stop() {
+	printf "Stopping fluent-bit: "
+	start-stop-daemon -K -q -p $PID_FILE
+	# https://docs.fluentbit.io/manual/administration/configuring-fluent-bit/yaml/configuration-file#config_section
+	# The default grace time is set to 5 seconds, so use 6 seconds to have some margin.
+	TIMEOUT=6
+	PID=$(cat $PID_FILE 2>/dev/null)
+	while kill -0 $PID 2>/dev/null; do
+		[ $TIMEOUT -eq 0 ] && echo "FAIL" && return 1
+		TIMEOUT=$((TIMEOUT - 1))
+		sleep 1
+	done
+	rm -f $PID_FILE
+	echo "OK"
+}
+
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
