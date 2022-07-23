Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD84C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F76840982;
	Sat, 23 Jul 2022 20:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F76840982
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NRfIQwoB6Llr; Sat, 23 Jul 2022 20:19:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 729A940334;
	Sat, 23 Jul 2022 20:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 729A940334
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14B911BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E46158261C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E46158261C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NEdbaxHhNe6u for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:18:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0B37827A5
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0B37827A5
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3642685143; Sat, 23 Jul 2022 20:05:10 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 22:17:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5691b74f4cd4860d0759bb51e4a522fa6475482d
X-Git-Newrev: d9ef4fb3153fa5e9b4cdbcdd7f193feb3ec82443
X-Patchwork-Hint: ignore
Message-Id: <20220723200510.3642685143@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-connect: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d9ef4fb3153fa5e9b4cdbcdd7f193feb3ec82443
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mender-connect is a daemon responsible for handling bidirectional (websocket)
communication with the Mender server. The daemon is responsible for
implementing a range of troubleshooting features to the device as well as
several enhancement to the mender-client.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                          |  1 +
 package/mender-connect/Config.in           | 33 +++++++++++++++++
 package/mender-connect/S43mender-connect   | 53 +++++++++++++++++++++++++++
 package/mender-connect/mender-connect.hash | 34 +++++++++++++++++
 package/mender-connect/mender-connect.mk   | 59 ++++++++++++++++++++++++++++++
 5 files changed, 180 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 477372e828..5e7499c396 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2569,6 +2569,7 @@ menu "System tools"
 	source "package/lxc/Config.in"
 	source "package/makedumpfile/Config.in"
 	source "package/mender/Config.in"
+	source "package/mender-connect/Config.in"
 	source "package/mender-grubenv/Config.in"
 	source "package/mfoc/Config.in"
 	source "package/moby-buildkit/Config.in"
diff --git a/package/mender-connect/Config.in b/package/mender-connect/Config.in
new file mode 100644
index 0000000000..0845910880
--- /dev/null
+++ b/package/mender-connect/Config.in
@@ -0,0 +1,33 @@
+config BR2_PACKAGE_MENDER_CONNECT
+	bool "mender-connect"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, mender
+	depends on BR2_USE_WCHAR # libglib2 -> gettext
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
+comment "mender-connect needs a toolchain w/ threads, wchar"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/mender-connect/S43mender-connect b/package/mender-connect/S43mender-connect
new file mode 100644
index 0000000000..4cc21510c4
--- /dev/null
+++ b/package/mender-connect/S43mender-connect
@@ -0,0 +1,53 @@
+#!/bin/sh
+DAEMON="mender-connect"
+DAEMON_PATH="/usr/bin/mender-connect"
+PIDFILE="/var/run/${DAEMON}.pid"
+
+MENDER_CONNECT_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "${DAEMON}"
+	umask 077
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -bmSqp "$PIDFILE" -x ${DAEMON_PATH} \
+		-- -daemon ${DAEMON_ARGS}
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
+	printf 'Stopping %s: ' "${DAEMON}"
+	start-stop-daemon -K -q -p "$PIDFILE"
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
diff --git a/package/mender-connect/mender-connect.hash b/package/mender-connect/mender-connect.hash
new file mode 100644
index 0000000000..46f37f954b
--- /dev/null
+++ b/package/mender-connect/mender-connect.hash
@@ -0,0 +1,34 @@
+# Locally computed:
+sha256  6410bcd76cebd21e9f18fe5768928d67163e4bb2b6ae76d0e20815400d907657  mender-connect-2.0.2.tar.gz
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
index 0000000000..1b0285cffc
--- /dev/null
+++ b/package/mender-connect/mender-connect.mk
@@ -0,0 +1,59 @@
+################################################################################
+#
+# mender-connect
+#
+################################################################################
+
+MENDER_CONNECT_VERSION = 2.0.2
+MENDER_CONNECT_SITE = $(call github,mendersoftware,mender-connect,$(MENDER_CONNECT_VERSION))
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
