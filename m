Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029B4C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C4B0605AF;
	Wed, 27 Jul 2022 15:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C4B0605AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVW6mgAWKNpE; Wed, 27 Jul 2022 15:33:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69180600C6;
	Wed, 27 Jul 2022 15:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69180600C6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75EF11BF41A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F16D40613
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F16D40613
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UB9XruDAFCTu for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:33:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5088D4013D
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5088D4013D
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F298A866EA; Wed, 27 Jul 2022 15:19:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 17:33:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff506cdeb7d8c7f98164a77b516d1bcc5c2d67f3
X-Git-Newrev: eb671037fbdd25de7df9af0ee860e93806005c25
X-Patchwork-Hint: ignore
Message-Id: <20220727151928.F298A866EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gitlab-runner: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3353551284081782379=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3353551284081782379==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=eb671037fbdd25de7df9af0ee860e93806005c25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We rely on config.toml to be created manually during first boot as
setup stage. Even with an empty config.toml file, the gitlab-runner
needs gitlab registration token to register to a gitlab server.

Use the 14.5.1 release since 14.5.2 and 14.6.0 triggers a build error [1]
due a patch for GO < 1.17.
(helpers/patches/issue_28732/syscall.go:11:2: undefined: syscall.Issue28732Fix)

Tested:
https://gitlab.com/kubu93/buildroot/-/pipelines/442604876

[1] https://gitlab.com/gitlab-org/gitlab-runner/-/issues/28766

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Jérémy Rosen <jeremy.rosen@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                  |  2 +
 package/Config.in                           |  1 +
 package/gitlab-runner/Config.in             | 31 ++++++++++++++
 package/gitlab-runner/S95gitlab-runner      | 64 +++++++++++++++++++++++++++++
 package/gitlab-runner/gitlab-runner.hash    |  3 ++
 package/gitlab-runner/gitlab-runner.mk      | 33 +++++++++++++++
 package/gitlab-runner/gitlab-runner.service | 18 ++++++++
 7 files changed, 152 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 769fc43069..50a295a743 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1828,6 +1828,7 @@ F:	configs/orangepi_zero_plus_defconfig
 F:	package/argparse/
 F:	package/dt-utils/
 F:	package/easydbus/
+F:	package/gitlab-runner/
 F:	package/lua-flu/
 F:	package/lua-stdlib/
 F:	package/luaossl/
@@ -2524,6 +2525,7 @@ F:	package/enlightenment/
 F:	package/flare-engine/
 F:	package/flare-game/
 F:	package/gcc/
+F:	package/gitlab-runner/
 F:	package/glibc/
 F:	package/irrlicht/
 F:	package/liblinear/
diff --git a/package/Config.in b/package/Config.in
index 9e355723d6..174cfde73e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2142,6 +2142,7 @@ menu "Miscellaneous"
 	source "package/collectl/Config.in"
 	source "package/domoticz/Config.in"
 	source "package/empty/Config.in"
+	source "package/gitlab-runner/Config.in"
 	source "package/gnuradio/Config.in"
 	source "package/googlefontdirectory/Config.in"
 	source "package/gqrx/Config.in"
diff --git a/package/gitlab-runner/Config.in b/package/gitlab-runner/Config.in
new file mode 100644
index 0000000000..72c2742562
--- /dev/null
+++ b/package/gitlab-runner/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_GITLAB_RUNNER
+	bool "gitlab-runner"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # git
+	depends on BR2_USE_WCHAR # tar
+	select BR2_PACKAGE_BASH # runtime, shells/bash.go probably want to support bashism.
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
+	select BR2_PACKAGE_CA_CERTIFICATES # runtime
+	select BR2_PACKAGE_GIT # runtime
+	select BR2_PACKAGE_LIBCURL # runtime
+	select BR2_PACKAGE_LIBCURL_CURL # runtime
+	select BR2_PACKAGE_LIBCURL_OPENSSL # runtime, for ca-certificates.
+	select BR2_PACKAGE_OPENSSL # runtime
+	select BR2_PACKAGE_LIBOPENSSL # runtime
+	select BR2_PACKAGE_LIBOPENSSL_BIN # runtime
+	select BR2_PACKAGE_TAR # runtime
+	help
+	  GitLab Runner is the open source project that is used to run
+	  your jobs and send the results back to GitLab. It is used in
+	  conjunction with GitLab CI/CD, the open-source continuous
+	  integration service included with GitLab that coordinates the
+	  jobs.
+
+	  https://docs.gitlab.com/runner/
+
+comment "gitlab-runner needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gitlab-runner/S95gitlab-runner b/package/gitlab-runner/S95gitlab-runner
new file mode 100644
index 0000000000..2a50e7151a
--- /dev/null
+++ b/package/gitlab-runner/S95gitlab-runner
@@ -0,0 +1,64 @@
+#!/bin/sh
+
+DAEMON="gitlab-runner"
+PIDFILE="/var/run/$DAEMON.pid"
+
+GITLAB_RUNNER_ARGS="run"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -m -b -p "$PIDFILE" -c "$DAEMON:$DAEMON" -x "/usr/bin/$DAEMON" \
+		-- $GITLAB_RUNNER_ARGS
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
+	start-stop-daemon -K -q -p "$PIDFILE" -u "$DAEMON"
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
+reload() {
+	printf 'Reloading %s: ' "$DAEMON"
+	start-stop-daemon -K -s HUP -q -p "$PIDFILE" -u "$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
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
diff --git a/package/gitlab-runner/gitlab-runner.hash b/package/gitlab-runner/gitlab-runner.hash
new file mode 100644
index 0000000000..f4fab595b5
--- /dev/null
+++ b/package/gitlab-runner/gitlab-runner.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  63a7963f750ec45a7cb34a660b7247a0aa6def98706b7bd80efc95053e66822d  gitlab-runner-14.5.1.tar.gz
+sha256  0ae968b7ddd25da0209c3c6594aac1ac74ddf90385940b02b420463e2e0734de  LICENSE
diff --git a/package/gitlab-runner/gitlab-runner.mk b/package/gitlab-runner/gitlab-runner.mk
new file mode 100644
index 0000000000..fde776e631
--- /dev/null
+++ b/package/gitlab-runner/gitlab-runner.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# gitlab-runner
+#
+################################################################################
+
+GITLAB_RUNNER_VERSION = 14.5.1
+GITLAB_RUNNER_SITE = https://gitlab.com/gitlab-org/gitlab-runner/-/archive/v$(GITLAB_RUNNER_VERSION)
+GITLAB_RUNNER_LICENSE = MIT
+GITLAB_RUNNER_LICENSE_FILES = LICENSE
+
+GITLAB_RUNNER_LDFLAGS = \
+	-X gitlab.com/gitlab-org/gitlab-runner/common.VERSION=$(GITLAB_RUNNER_VERSION)
+
+# Don't run gitlab runner as root.
+define GITLAB_RUNNER_USERS
+	gitlab-runner -1 gitlab-runner -1 * /var/run/dbus /bin/false - Gitlab Runner
+endef
+
+define GITLAB_RUNNER_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/gitlab-runner/S95gitlab-runner \
+		$(TARGET_DIR)/etc/init.d/S95gitlab-runner
+endef
+
+define GITLAB_RUNNER_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/var/lib/gitlab-runner
+	$(INSTALL) -D -m 0644 package/gitlab-runner/gitlab-runner.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/gitlab-runner.service
+endef
+
+GITLAB_RUNNER_POST_INSTALL_TARGET_HOOKS += GITLAB_RUNNER_INSTALL_CONFIG
+
+$(eval $(golang-package))
diff --git a/package/gitlab-runner/gitlab-runner.service b/package/gitlab-runner/gitlab-runner.service
new file mode 100644
index 0000000000..cba751a3d6
--- /dev/null
+++ b/package/gitlab-runner/gitlab-runner.service
@@ -0,0 +1,18 @@
+[Unit]
+Description=GitLab Runner
+After=network.target
+ConditionFileIsExecutable=/usr/bin/gitlab-runner
+
+[Service]
+Environment="DAEMON_ARGS=run --working-directory /var/lib/gitlab-runner --config /etc/gitlab-runner/config.toml --service gitlab-runner --syslog --user gitlab-runner"
+EnvironmentFile=-/etc/default/%p
+StartLimitInterval=5
+StartLimitBurst=10
+ExecStart=/usr/bin/gitlab-runner $DAEMON_ARGS
+ExecReload=/bin/kill -HUP $MAINPID
+
+Restart=always
+RestartSec=120
+
+[Install]
+WantedBy=multi-user.target

--===============3353551284081782379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3353551284081782379==--
