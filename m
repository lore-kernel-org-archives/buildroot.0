Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74CBC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 18:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B13C8406D;
	Wed, 22 Jun 2022 18:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B13C8406D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d1JaBui5jp8x; Wed, 22 Jun 2022 18:49:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0BE383E05;
	Wed, 22 Jun 2022 18:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0BE383E05
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CDDC1BF408
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 18:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17456405A7
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 18:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17456405A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Im1slMPWCntn for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 18:48:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAC40404A6
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CAC40404A6
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 18:48:35 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id r1so16116470plo.10
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 11:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q0swSv1H+8IlIjBMK+KyS9ZFBHKIte8Xk9MIbS0qEGo=;
 b=weV7XKb0u0081zB50Y4uZeMVNXZBI7z/O/c3byKoGhTezhGldzaxMimXZFY9UpQPOh
 Y9NaaIVIsNQPnzBuHfWUHVA8aE63gnKv0A6xdKVa07sd6qt1QmO//aIwGVJgUo+LLQK8
 SUE64P6QL+3f/+EqE85NXnvvCq3RXm7ITQ8pSnOuCaVsRdZmMiK14DYxNVDvA25iBT+8
 hHyTYgWoWTTEQ35TPFOVi8Z7wBlDEMziJYTVhoBzMnNa1NipcTH62im/kfFTa65F48b6
 lXj9+1EpZyLxEbW24XZWjBNk+G+ueBK3lu6gGNr3yysBMPtz1eGSzvixOpitqtUEJb/5
 hBvg==
X-Gm-Message-State: AJIora9LQ/RAbxb/9azr/Uz6YzWLqExj8pSN83PRazE5W+ZL/5jbPRQP
 LeBm2GacUKHUkEEc7gsKKmUwFkPEEVY=
X-Google-Smtp-Source: AGRyM1vpzcTyEs5aK/9RR0cyiVxjBDjedwoWiTO1KtGoj70XU0hHfn59thncF02ubwwOC112QMhf1w==
X-Received: by 2002:a17:90a:a002:b0:1e8:6ea3:849c with SMTP id
 q2-20020a17090aa00200b001e86ea3849cmr5109823pjp.179.1655923714775; 
 Wed, 22 Jun 2022 11:48:34 -0700 (PDT)
Received: from adam-workstation.goriv.co ([47.153.95.92])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a1709027e0200b0015e8da1f9e8sm13143075plm.77.2022.06.22.11.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 11:48:34 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 11:48:24 -0700
Message-Id: <20220622184824.289640-5-aduskett@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622184824.289640-1-aduskett@gmail.com>
References: <20220622184824.289640-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q0swSv1H+8IlIjBMK+KyS9ZFBHKIte8Xk9MIbS0qEGo=;
 b=MCKITOvIN19m9VkpjCklkxx3Zn3lqOoVD0FYEC2Bpj8uFPI6GKw6aMWinEh1SyXTRE
 GrHb7TshV1jKy3sCkrQejxfhmJSuO6rHN33/KhTy4HIZWRt3U2o99lMuY/d0Bgdwuwqe
 wiKC4eBqwCnyIwx6VaRZmRlaGFHumSUlaB4TipWnqcd3J0qoBw1gbraGVkhYk4TVJRhJ
 FHryEoH13jjjr8X3CD/j0+x6xS6rGtp3maJAXnGIe1rGlpaRqSuqzxcnWAel5R8TPDE3
 udCtTOCTvjCPW3Gi6ikvwLCIARyOpkMcf+jn+pKtcOr2CeS5jxGl8nvLN+QwimCWm8gR
 TsiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MCKITOvI
Subject: [Buildroot] [PATCH 5/5] package/mender-connect: new package
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

mender-connect is a daemon responsible for handling bidirectional (websocket)
communication with the Mender server. The daemon is responsible for
implementing a range of troubleshooting features to the device as well as
several enhancement to the mender-client.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/Config.in                          |  1 +
 package/mender-connect/Config.in           | 32 ++++++++++++
 package/mender-connect/S43mender-connect   | 41 +++++++++++++++
 package/mender-connect/mender-connect.hash | 34 ++++++++++++
 package/mender-connect/mender-connect.mk   | 60 ++++++++++++++++++++++
 5 files changed, 168 insertions(+)
 create mode 100644 package/mender-connect/Config.in
 create mode 100644 package/mender-connect/S43mender-connect
 create mode 100644 package/mender-connect/mender-connect.hash
 create mode 100644 package/mender-connect/mender-connect.mk

diff --git a/package/Config.in b/package/Config.in
index f09da05be0..284ee55d88 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2558,6 +2558,7 @@ menu "System tools"
 	source "package/lxc/Config.in"
 	source "package/makedumpfile/Config.in"
 	source "package/mender/Config.in"
+	source "package/mender-connect/Config.in"
 	source "package/mender-grubenv/Config.in"
 	source "package/mfoc/Config.in"
 	source "package/moby-buildkit/Config.in"
diff --git a/package/mender-connect/Config.in b/package/mender-connect/Config.in
new file mode 100644
index 0000000000..0567135d99
--- /dev/null
+++ b/package/mender-connect/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_MENDER_CONNECT
+	bool "mender-connect"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib
+	depends on BR2_USE_WCHAR # libglib -> gettext
+	depends on BR2_USE_MMU # dbus -> fork()
+	select BR2_PACKAGE_DBUS # runtime
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_MENDER # runtime
+	select BR2_PACKAGE_OPENSSL
+	help
+	  mender-connect is a daemon responsible for handling
+	  bidirectional (websocket) communication with the Mender
+	  server. The daemon is responsible for implementing a range of
+	  troubleshooting features to the device as well as several
+	  enhancement to the mender-client.
+
+	  Mender Connect is loosely coupled with the Mender Client. The
+	  main information passed between mender-client and
+	  mender-connect is the device authorization status. Since only
+	  accepted devices can interact with the Mender Server, the
+	  Mender Client passes over DBus the authorization token which
+	  Mender Connect uses to establish a Websocket connection to the
+	  server.
+
+	  https://github.com/mendersoftware/mender-connect
+
+comment "mender-connect needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mender-connect/S43mender-connect b/package/mender-connect/S43mender-connect
new file mode 100644
index 0000000000..abcceb0e02
--- /dev/null
+++ b/package/mender-connect/S43mender-connect
@@ -0,0 +1,41 @@
+#!/bin/sh
+DAEMON="mender-connect"
+DAEMON_PATH="/usr/bin/mender-connect"
+PIDFILE="/var/run/${DAEMON}.pid"
+DAEMON_ARGS="-daemon"
+
+start() {
+	printf 'Starting %s: ' "${DAEMON}"
+	umask 077
+	start-stop-daemon -bmSqp "$PIDFILE" -x ${DAEMON_PATH} -- ${DAEMON_ARGS}
+	status=$?
+	[ "${status}" = 0 ] && echo "OK" || echo "FAIL"
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "${DAEMON}"
+	start-stop-daemon -Kqp "$PIDFILE"
+	status=$?
+	[ "${status}" = 0 ] && echo "OK" || echo "FAIL"
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
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
+
+exit $?
diff --git a/package/mender-connect/mender-connect.hash b/package/mender-connect/mender-connect.hash
new file mode 100644
index 0000000000..cd6cf0f7c0
--- /dev/null
+++ b/package/mender-connect/mender-connect.hash
@@ -0,0 +1,34 @@
+# Locally computed:
+sha256  6410bcd76cebd21e9f18fe5768928d67163e4bb2b6ae76d0e20815400d907657  2.0.2.tar.gz
+sha256  78b3954421ec6499c3f9735b96d52288574ae80c747416a52548d7f526f26e8c  LIC_FILES_CHKSUM.sha256
+
+# Vendor licenses
+# Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
+
+#
+# Apache-2.0
+sha256  1033348db7606a7e61b6484f293847cf8d7a35766efebb97e304d4bd5d7f3f6b  LICENSE
+sha256  3eb823230e5d112e1bd032ccc82ae765cf676d0d6d46a1a1daa2d658b3005b67  vendor/github.com/mendersoftware/go-lib-micro/LICENSE
+#
+# BSD-2-Clause
+sha256  2be1b548b0387ca8948e1bb9434e709126904d15f622cc2d0d8e7f186e4d122d  vendor/github.com/gorilla/websocket/LICENSE
+sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor/github.com/pkg/errors/LICENSE
+sha256  1530185dd39cdde7cb2f786a7a5fcf8bc34368b6ae73c15e72bafe88fd80b9a2  vendor/github.com/vmihailenco/msgpack/v5/LICENSE
+sha256  0f02aac22084ef463aa5f42f566feeec6aa4c99653519744a8c25cb079da5b5d  vendor/github.com/vmihailenco/tagparser/v2/LICENSE
+#
+# BSD-3-Clause
+sha256  2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477  vendor/github.com/pmezard/go-difflib/LICENSE
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/sys/LICENSE
+#
+# ISC
+sha256  1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251  vendor/github.com/davecgh/go-spew/LICENSE
+#
+# MIT
+sha256  a2a1cea59d9c2d71908082f516f86bb560abf857646ecf69d70c121ead14aef4  vendor/github.com/creack/pty/LICENSE
+sha256  caa932df46551b53643952fe03b351d55db97be73b5393b986dcf6b05d3c416a  vendor/github.com/go-ozzo/ozzo-validation/v4/LICENSE
+sha256  92a328e1d5f3269b42e2ce32b4494eafdb3132f204a911c5c95cf3d8465490e4  vendor/github.com/satori/go.uuid/LICENSE
+sha256  51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b  vendor/github.com/sirupsen/logrus/LICENSE
+sha256  b2663894033a05fd80261176cd8da1d72546e25842d5c1abcc852ca23b6b61b0  vendor/github.com/stretchr/objx/LICENSE
+sha256  f8e536c1c7b695810427095dc85f5f80d44ff7c10535e8a9486cf393e2599189  vendor/github.com/stretchr/testify/LICENSE
+sha256  da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de55345fd7  vendor/github.com/urfave/cli/v2/LICENSE
+sha256  d18f6323b71b0b768bb5e9616e36da390fbd39369a81807cca352de4e4e6aa0b  vendor/gopkg.in/yaml.v3/LICENSE
diff --git a/package/mender-connect/mender-connect.mk b/package/mender-connect/mender-connect.mk
new file mode 100644
index 0000000000..bb9cfde236
--- /dev/null
+++ b/package/mender-connect/mender-connect.mk
@@ -0,0 +1,60 @@
+################################################################################
+#
+# mender-connect
+#
+################################################################################
+
+MENDER_CONNECT_VERSION = 2.0.2
+MENDER_CONNECT_SOURCE = $(MENDER_CONNECT_VERSION).tar.gz
+MENDER_CONNECT_SITE = https://github.com/mendersoftware/mender-connect/archive
+MENDER_CONNECT_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
+
+# Vendor license paths generated with:
+#    awk '{print $2}' LIC_FILES_CHKSUM.sha256 | grep vendor
+MENDER_CONNECT_LICENSE_FILES = \
+	LIC_FILES_CHKSUM.sha256 \
+	LICENSE \
+	vendor/github.com/mendersoftware/go-lib-micro/LICENSE \
+	vendor/github.com/gorilla/websocket/LICENSE \
+	vendor/github.com/pkg/errors/LICENSE \
+	vendor/github.com/vmihailenco/msgpack/v5/LICENSE \
+	vendor/github.com/vmihailenco/tagparser/v2/LICENSE \
+	vendor/github.com/pmezard/go-difflib/LICENSE \
+	vendor/golang.org/x/sys/LICENSE \
+	vendor/github.com/davecgh/go-spew/LICENSE \
+	vendor/github.com/creack/pty/LICENSE \
+	vendor/github.com/go-ozzo/ozzo-validation/v4/LICENSE \
+	vendor/github.com/satori/go.uuid/LICENSE \
+	vendor/github.com/sirupsen/logrus/LICENSE \
+	vendor/github.com/stretchr/objx/LICENSE \
+	vendor/github.com/stretchr/testify/LICENSE \
+	vendor/github.com/urfave/cli/v2/LICENSE \
+	vendor/gopkg.in/yaml.v3/LICENSE
+
+MENDER_CONNECT_DEPENDENCIES = \
+	dbus \
+	libglib2 \
+	mender \
+	openssl
+
+MENDER_CONNECT_LDFLAGS = -X github.com/mendersoftware/mender-connect/config.Version=$(MENDER_CONNECT_VERSION)
+
+define MENDER_CONNECT_INSTALL_CONFIG_FILES
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender
+
+	$(INSTALL) -D -m 0644 $(@D)/examples/mender-connect.conf \
+		$(TARGET_DIR)/etc/mender/mender-connect.conf
+endef
+MENDER_CONNECT_POST_INSTALL_TARGET_HOOKS += MENDER_CONNECT_INSTALL_CONFIG_FILES
+
+define MENDER_CONNECT_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/support/mender-connect.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/mender-connect.service
+endef
+
+define MENDER_CONNECT_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(MENDER_CONNECT_PKGDIR)/S43mender-connect \
+		$(TARGET_DIR)/etc/init.d/S43mender-connect
+endef
+
+$(eval $(golang-package))
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
