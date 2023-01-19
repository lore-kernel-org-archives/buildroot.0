Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764A4C38142
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0944360C20;
	Thu, 19 Jan 2023 10:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0944360C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11f6P8y5Mp0N; Thu, 19 Jan 2023 10:51:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1531760B28;
	Thu, 19 Jan 2023 10:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1531760B28
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B0981BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15372821FB
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15372821FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EI3NL_AY4iz4 for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:51:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8F62821F5
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8F62821F5
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:51:27 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id g10so1182619wmo.1
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 02:51:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WlpxEkhxDRkAURXDE8oOdJ5tNEkkPbA9/wScE+8D0GY=;
 b=B/C2Z4CXwNCGUWo2oNFdbdGGLpHRZfGXSZ/CuGyEFV2sAG0iKr0Ju59lWBISMMyIeq
 bWv/tD3zfeD5l4HZhhYFN6wFitWqYHJuzTzVYmowAmlURVuzsfSWmAThL4DSYTvLFbCA
 nZ9ulHoGCEYu00THzao9fnsE7KEDVkO6Luwyh/G8jzAASS9uSdGIqeBSuhmh7l+b97mZ
 kfZ/Tu9YZMCsHuJn6ppAcXtZtElvWq/Twflw4wl+mrR0/UDz4kRpQ7QNJB0nwCSr2uXA
 rgjd4AOZKxcl2mX6LboWQlNklEv0CW2IRFQcGE07Bn0EpC+weU42OcC2K0hyL74w4dMn
 z1yQ==
X-Gm-Message-State: AFqh2kqGvX5OqvVBW4GRrsYXXSWmjHSURao2EDR5sTKzg8HCydeRYg/L
 3KAg4kHCVNwPSihlArLczpmillSDVpg=
X-Google-Smtp-Source: AMrXdXsp6b8943hrO2jZ7aO3qiLn3IDFlt9GlJlY1TCMt+L4ykQuaQIHZNiqBbL+H3ly0iAzepeS5A==
X-Received: by 2002:a05:600c:24ce:b0:3da:18c5:e48b with SMTP id
 14-20020a05600c24ce00b003da18c5e48bmr18417198wmu.18.1674125485626; 
 Thu, 19 Jan 2023 02:51:25 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 n37-20020a05600c502500b003db03725e86sm4755166wmr.8.2023.01.19.02.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 02:51:25 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Thu, 19 Jan 2023 11:51:22 +0100
Message-Id: <20230119105122.3063862-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=WlpxEkhxDRkAURXDE8oOdJ5tNEkkPbA9/wScE+8D0GY=;
 b=A8SyWje6oXdByCMZcmweNOYM92Zh/OBWYBlqJEr78/P5GD8tI54NPJAKjYGaXxfG94
 MLyfnXxlgksTD360hUiin6BDDqy0M0P+Pak537WV7aqEpghgLK4rsXtqVTRe4Tw9W4K2
 fUDt2J/B4bniYMAgLvdO8hqHAsHl7zIcWrtLTHW238vnJcf+ZI88tHAXMl4exqIuAq/S
 lYohuIYL97/lZqfCRhUZUS2gTiVqjy8H7XlvcTHdODdTQKuA8FC8QlAxlCYNMGn9Y76g
 t3SiLlYBbcXJVy+HJSR4Bxr20oXaIZ30fL7qtUHpBq/1FA6osJ46Gb+zmRj7aYmoNp2x
 /RWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=A8SyWje6
Subject: [Buildroot] [PATCH 1/1] package/fluent-bit: add new package
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
 package/fluent-bit/S99fluent-bit   | 49 ++++++++++++++++++++++++++++++
 package/fluent-bit/fluent-bit.hash |  3 ++
 package/fluent-bit/fluent-bit.mk   | 40 ++++++++++++++++++++++++
 5 files changed, 106 insertions(+)
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
index 0000000000..c47d6e6dc6
--- /dev/null
+++ b/package/fluent-bit/S99fluent-bit
@@ -0,0 +1,49 @@
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
+	TIMEOUT=15 # wait max 15 x 0.2 seconds
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
index 0000000000..ca95a8bf93
--- /dev/null
+++ b/package/fluent-bit/fluent-bit.mk
@@ -0,0 +1,40 @@
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
+define FLUENT_BIT_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/fluent-bit/S99fluent-bit \
+		$(TARGET_DIR)/etc/init.d/S99fluent-bit
+endef
+
+define FLUENT_BIT_POST_INSTALL_TARGET_HOOK
+	cp -dpf $(@D)/lib/libminiz*.so* $(TARGET_DIR)/usr/lib/fluent-bit/
+	rm -rf $(TARGET_DIR)/etc/fluent-bit/ && mv $(TARGET_DIR)/usr/etc/fluent-bit $(TARGET_DIR)/etc/
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
