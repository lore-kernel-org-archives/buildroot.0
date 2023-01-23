Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92ADCC54E94
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 15:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05F4A40A8B;
	Mon, 23 Jan 2023 15:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05F4A40A8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K2VUeoKcDGJY; Mon, 23 Jan 2023 15:15:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA26440AAD;
	Mon, 23 Jan 2023 15:15:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA26440AAD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB23F1BF3D5
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 15:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A293841737
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 15:15:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A293841737
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4n5M4PKr7AOM for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 15:15:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C9A141774
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C9A141774
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 15:15:03 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d2so11112541wrp.8
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 07:15:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7QwXZCX7ETgXm1SUSIAunQVgVevGuUASqrMzUQJ7PsM=;
 b=UvTRqr0skecnmJsROJPJENrGz0lNNEL9soxomtWsum8DrXU2gCdbUNj1v1GdE0UShn
 HVC4qXiC8WTZmH1AsdVUj99pwq03UsQqDxfhJWwbz5HEN9a94aGBak3JwHQB1mLNYL7m
 nevUBIbhrPAR+P1JlRLCEnttPVEWkbggG96cLyxpo9oJ+52YpApKYRpjFiu83+uHRxgY
 sC7lYffIkm9W0CWeg+bSQtuEogVdCqJ/pNffpIQs756iHNeIH9nhmq9dwy8KOM3UozOU
 SC6moPKxSDd7gkxPJPRlK4uQ2Dd2CWvqgfJ7REKyuAyxlj6i1B768N22miBkoPDoQei9
 ljPw==
X-Gm-Message-State: AFqh2krWKSY9dHKnuzrh2nkdAjkMAkUsRvH+5VAtz990DI100YaS9eHO
 aFRagGv+1tmxMI6+KecN3nw0LTWywVw3bQjh
X-Google-Smtp-Source: AMrXdXsQYQg8iPDNfB6Q4SlfU29q38h/98J5OZNNii0LK4jF/6G9xpjdsRm/1DYQezL/PRCwO+cIVA==
X-Received: by 2002:a05:6000:120f:b0:2bd:befd:2061 with SMTP id
 e15-20020a056000120f00b002bdbefd2061mr22071869wrx.21.1674486901748; 
 Mon, 23 Jan 2023 07:15:01 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 bu9-20020a056000078900b002be1dcb6efbsm18828293wrb.9.2023.01.23.07.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:15:01 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 23 Jan 2023 16:14:59 +0100
Message-Id: <20230123151459.1899697-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=7QwXZCX7ETgXm1SUSIAunQVgVevGuUASqrMzUQJ7PsM=;
 b=ApZdA1Po7A0u3SxOAhGT7saKEKx0xyqweLyi44bgwONeDqA8JR/KbQEKn3wdh73PLF
 jloR6tXazpMQU9wk7LauE5R6YNEs6pJ6mMLcOaOx15Zv+iYeAQy4U0xSHQGmALDV4dXb
 eVTIRCn8YcXmgCYVaoWAUDeVFxJqSSaE1ptuX4zEISYwSYZvktS+2PLSFgMK/3o68zWq
 +ntDzgML0mhp1RG1H3dnkLZuVthY8UYjrAQKa6TfJVtj6EQo1xGetPEbJTyTq2t+m3kR
 dvPvQ3EFwruPQ9im7SYzfArgLLEXOgsgD2cpjRvTSe1IUNX+nw/RDEj3ltDN6TrHQ7p/
 Ja2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ApZdA1Po
Subject: [Buildroot] [PATCH v3] package/fluent-bit: add new package
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
 package/Config.in                             |  1 +
 ...ts.txt-Miniz-compile-as-a-static-lib.patch | 36 ++++++++++++
 package/fluent-bit/Config.in                  | 13 +++++
 package/fluent-bit/S99fluent-bit              | 55 +++++++++++++++++++
 package/fluent-bit/fluent-bit.hash            |  3 +
 package/fluent-bit/fluent-bit.mk              | 43 +++++++++++++++
 6 files changed, 151 insertions(+)
 create mode 100644 package/fluent-bit/0001-CMakeLists.txt-Miniz-compile-as-a-static-lib.patch
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
diff --git a/package/fluent-bit/0001-CMakeLists.txt-Miniz-compile-as-a-static-lib.patch b/package/fluent-bit/0001-CMakeLists.txt-Miniz-compile-as-a-static-lib.patch
new file mode 100644
index 0000000000..8594c2a6e6
--- /dev/null
+++ b/package/fluent-bit/0001-CMakeLists.txt-Miniz-compile-as-a-static-lib.patch
@@ -0,0 +1,36 @@
+From b82a0d5f4f1d4c8cf6c5da542be999b30456e27c Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Mon, 23 Jan 2023 09:57:17 +0100
+Subject: [PATCH] CMakeLists.txt: Miniz: compile as a static lib
+
+https://github.com/fluent/fluent-bit/issues/6711
+
+Buildroot enforces globally wide that all packages are
+dynamically linked (if BR2_SHARED_LIBS), so that means
+that these options slept through the subdirectories.
+The libminiz.so is not installed by cmake, causing the
+fluent-bit to crash. This patch forces libminiz to be
+compiled statically.
+
+upstream: https://github.com/fluent/fluent-bit/pull/6723
+
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a7adb02de..ac1b9cd75 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -510,6 +510,7 @@ add_definitions(-DMPACK_EXTENSIONS=1)
+ add_subdirectory(${FLB_PATH_LIB_MPACK} EXCLUDE_FROM_ALL)
+ 
+ # Miniz (zip)
++FLB_OPTION(BUILD_SHARED_LIBS OFF)
+ add_subdirectory(${FLB_PATH_LIB_MINIZ} EXCLUDE_FROM_ALL)
+ 
+ # ring buffer library
+-- 
+2.39.0
+
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
index 0000000000..9f59316b5b
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
+	-DFLB_BACKTRACE=No
+
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+FLUENT_BIT_CONF_OPTS += -DFLB_LUAJIT=Yes
+FLUENT_BIT_DEPENDENCIES += luajit
+else
+FLUENT_BIT_CONF_OPTS += -DFLB_LUAJIT=No
+endif
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
+$(eval $(cmake-package))
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
