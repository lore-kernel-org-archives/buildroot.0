Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07009C05027
	for <buildroot@archiver.kernel.org>; Fri, 20 Jan 2023 07:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3B8A82437;
	Fri, 20 Jan 2023 07:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3B8A82437
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SXMyBk9gG2NB; Fri, 20 Jan 2023 07:10:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D21A182433;
	Fri, 20 Jan 2023 07:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D21A182433
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 654BC1BF2A7
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 07:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DC5241C6D
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 07:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DC5241C6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NUn3cQDyA_z2 for <buildroot@lists.busybox.net>;
 Fri, 20 Jan 2023 07:10:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B278E41C66
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B278E41C66
 for <buildroot@buildroot.org>; Fri, 20 Jan 2023 07:10:52 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so2947033wms.4
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 23:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RJB9Z7SSrQdiCWA2sQcEYT4hvJDEO2YQJsnIzfIX7uM=;
 b=1M+5fbBTF7HmwR32/2yfyYFCSkjOu1hvYnlqczKiAg/4Y0NdiMTEZYw2qRCfPre/uA
 +Tov3cZjf0xi9lDc7ByhbjUo6SNg9qeOVR6OF8KbkVt7lTTtsQZ6ywKAEnYwIoromqBI
 J6aoLa8bAvgpEjL31LrXAH9twi8X5rWReW8+S+SGrOFU0//rDF4EbdFyLdz2vkh8bilT
 xv0noLMVjH42oiWzu22qlHeyxqfj17/7Zyg7h/p5XYsj7qmp3BPYGM/hFD7pZ5ePum5A
 XmUSS54TEOusRVGReHTM+u4C0YRMBT8G2acpiBtWwY71ml2OZJpbBtX2oQ3JPwQarEW3
 pFaQ==
X-Gm-Message-State: AFqh2kpV1XCGq3Oo601NpfEa4CL7jI8OdsTKR4QXV0k1dIv37XOmWESr
 9F7SaLhQGeMfDT9WIT8A1qadtSSIYg5VSw==
X-Google-Smtp-Source: AMrXdXtJ1O/se3axrKS9u9J2yv9sEP/C5hE6vXFqrLca/ruD0u2zquTG3rW6jcOhW7Wf4AJ0GVNugg==
X-Received: by 2002:a05:600c:4f07:b0:3db:2295:9977 with SMTP id
 l7-20020a05600c4f0700b003db22959977mr4537418wmq.40.1674198650398; 
 Thu, 19 Jan 2023 23:10:50 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 bi13-20020a05600c3d8d00b003daf98d7e35sm1365154wmb.14.2023.01.19.23.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 23:10:49 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Fri, 20 Jan 2023 08:10:43 +0100
Message-Id: <20230120071043.1169953-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=RJB9Z7SSrQdiCWA2sQcEYT4hvJDEO2YQJsnIzfIX7uM=;
 b=cCjVUtQyhkl2rVwaXw07dZ59ABWklcVvDyhxCLmBdZy26wnDyB41B25iFU7R50++66
 IYSsYLQGUO7VWsZexsxui2MKKJ9nkWjGwzaSau5VIIXdkLpsPA3fkz/Yyygq2M18xgB4
 lmZNtsW60nM/WwX4F/QqmYh02+fxaKq9gWT6PKXUwMW0J8zJo+qd67PY1OVHxs+2n0kQ
 EnfioXl8DhyTFA8Np0vfk1z4Si8h2v6Hn4yryqZV0uq603Cvq3CVcfNuk8+mgJLqk3Gz
 1VblR4mCS+uReFY7z1haUgd21HsSCz8yOx9Yfp0nBrd6V9E6ChAZF94Ki1DR+KZDt/xx
 6XNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cCjVUtQy
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
 package/fluent-bit/fluent-bit.mk   | 40 +++++++++++++++++++++++
 5 files changed, 108 insertions(+)
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
index 0000000000..f0391b08e0
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
+	cp -dpf $(@D)/lib/libminiz*.so* $(TARGET_DIR)/usr/lib/
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
