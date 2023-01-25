Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4D6C27C76
	for <buildroot@archiver.kernel.org>; Wed, 25 Jan 2023 16:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28D58400A4;
	Wed, 25 Jan 2023 16:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28D58400A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5rko3Dhsjt4z; Wed, 25 Jan 2023 16:05:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44846403C4;
	Wed, 25 Jan 2023 16:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44846403C4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4839B1BF588
 for <buildroot@lists.busybox.net>; Wed, 25 Jan 2023 16:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DF6C403C4
 for <buildroot@lists.busybox.net>; Wed, 25 Jan 2023 16:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DF6C403C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IQjzjXzdAwRe for <buildroot@lists.busybox.net>;
 Wed, 25 Jan 2023 16:05:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCEFB400A4
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCEFB400A4
 for <buildroot@buildroot.org>; Wed, 25 Jan 2023 16:05:18 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so1575042wma.1
 for <buildroot@buildroot.org>; Wed, 25 Jan 2023 08:05:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HmsUccHPbyoilrNcmcqHeIiusmv50mNgOMnDMuZvYsI=;
 b=Q71P+o4NUlyHSj1h6rWebF+Ks8Ea/4JY8H6WGyVBsyoCbTW8i+ph2yXDc+w1sl+FZM
 Y7QR6Wsbbvqh2pd0XqLhUWqtl1e32yZfZreokrGbCpd4XId7euLdGQvwA58c2bWteA8P
 vMfvuGx0tDcuqTUK1ceJoO6un5c2RshemMlTenyElU+QN84K3xUNgvgc0IhfgpVOIE+T
 uWo06R9MSFh/31DLpkXkvGxBJ27Jqzxs5HDpBbncEiOsJZiPB2r+FYN9+/0TGevY8A5t
 AaqpSppYbicB3uGLLb8k84tum2MH2BV3gYeMbZuFRbtAr0etRY3ri2c/ykvUYW8BFCev
 I4hA==
X-Gm-Message-State: AFqh2kojSX7eE+99YhEJos8UxNsadz8Ys6TlxoIo/6TTXJnauXpHBKP0
 jYC5zG7IgYxM4jNDwld9nr/dU/mqYTveiQ==
X-Google-Smtp-Source: AMrXdXtRKAFmm8zch758rOtq8DzSKe0tpRuj4a/wlF1FGbe1RQ2yCo0/JxMzw+AGiZu1gTX55Lbvuw==
X-Received: by 2002:a05:600c:5021:b0:3d9:9755:d659 with SMTP id
 n33-20020a05600c502100b003d99755d659mr32361851wmr.22.1674662716450; 
 Wed, 25 Jan 2023 08:05:16 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 m14-20020a05600c4f4e00b003a3442f1229sm2552312wmq.29.2023.01.25.08.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 08:05:16 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Wed, 25 Jan 2023 17:05:13 +0100
Message-Id: <20230125160513.2960401-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230123151459.1899697-1-thomas.devoogdt@barco.com>
References: <20230123151459.1899697-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HmsUccHPbyoilrNcmcqHeIiusmv50mNgOMnDMuZvYsI=;
 b=FYtM7zrCnuuzajFgpA7Z23YBheWPlvy3CXMZCsGQfYDZCjDT7XfNUGxFniQ4MwiJkd
 65yAXPmQb67zIW5zatWwezMkkeugnOvURrjQOJQkzE6+DyfP4P2mDBarJq6b1kRi/Nhm
 oQrjVG1xRhr7iDrkKMr65QR20Cn+xgeP6IwcwnycB7cHnMSwoEZ6Wo3QUUniUbb7bQ35
 lbDMNf1kOJS9bSUV52T5pv5h7lOlhI7ApgyEgxEVKiP178ZjbwxB49ts8pj5cG5QDirB
 3x6Hhnx9QzZh/o/A070h96xeK3NxSUyLF/eHccVS846erxcYaZ31fUCuJfPAefK2MCmN
 5Khw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FYtM7zrC
Subject: [Buildroot] [PATCH v4] package/fluent-bit: add new package
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

Changes v3 -> v4:
  - .mk: dropped patch & use BUILD_SHARED_LIBS=OFF
  - .mk: added issue links
  - .S99fluent-bit: fixed all the ./utils/check-package issues & synced with S01syslogd

 package/Config.in                  |  1 +
 package/fluent-bit/Config.in       | 13 ++++++
 package/fluent-bit/S99fluent-bit   | 72 ++++++++++++++++++++++++++++++
 package/fluent-bit/fluent-bit.hash |  3 ++
 package/fluent-bit/fluent-bit.mk   | 49 ++++++++++++++++++++
 5 files changed, 138 insertions(+)
 create mode 100644 package/fluent-bit/Config.in
 create mode 100644 package/fluent-bit/S99fluent-bit
 create mode 100644 package/fluent-bit/fluent-bit.hash
 create mode 100644 package/fluent-bit/fluent-bit.mk

diff --git a/package/Config.in b/package/Config.in
index 68df6f1478..e18f75bf75 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2531,6 +2531,7 @@ menu "System tools"
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
index 0000000000..f4ba0e4448
--- /dev/null
+++ b/package/fluent-bit/S99fluent-bit
@@ -0,0 +1,72 @@
+#!/bin/sh
+
+DAEMON="fluent-bit"
+PID_FILE="/var/run/$DAEMON.pid"
+CONF_FILE="/etc/$DAEMON/$DAEMON.conf"
+
+FLUENT_BIT_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -b -m -p "$PID_FILE" --exec "/usr/bin/$DAEMON" \
+		-- -c "$CONF_FILE" $FLUENT_BIT_ARGS
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
+	start-stop-daemon -K -q -p "$PID_FILE"
+	status=$?
+
+	if [ -f "$PID_FILE" ]; then
+		pid=$(cat "$PID_FILE")
+		rm -f "$PID_FILE"
+
+		# https://docs.fluentbit.io/manual/administration/configuring-fluent-bit/yaml/configuration-file#config_section
+		# The default grace time is set to 5 seconds, so use 6 seconds to have some margin.
+		timeout=6
+		while kill -0 "$pid" 2>/dev/null; do
+			[ $timeout -eq 0 ] && status=1 && break
+			timeout=$((timeout - 1))
+			sleep 1
+		done
+	fi
+
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
index 0000000000..ab7bc282fc
--- /dev/null
+++ b/package/fluent-bit/fluent-bit.mk
@@ -0,0 +1,49 @@
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
+# Force miniz to be compiled statically.
+# https://github.com/fluent/fluent-bit/issues/6711
+FLUENT_BIT_CONF_OPTS += \
+	-DBUILD_SHARED_LIBS=OFF
+
+# Move the config files from /usr/etc/ to /etc/.
+# https://github.com/fluent/fluent-bit/issues/6619
+FLUENT_BIT_CONF_OPTS += \
+	-DCMAKE_INSTALL_SYSCONFDIR="/etc/"
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
+$(eval $(cmake-package))
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
