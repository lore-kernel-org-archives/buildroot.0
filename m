From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 22 May 2020 18:35:11 +0200
Subject: [Buildroot] [PATCH v3: for-next] package/gitlab-runner: new package
Message-ID: <20200522163511.20487-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Marcin Niestroj <m.niestroj@grinn-global.com>

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: J?r?my Rosen <jeremy.rosen@smile.fr>
---
v3: Change daemon process to gitlab-runner user.
    see as example: https://git.buildroot.net/buildroot/tree/package/tpm2-abrmd/S80tpm2-abrmd?h=2020.05-rc2#n31

[Romain: Tested only using systemd init on aarch64 target emulated by Qemu]
v2: add service file, config file, gitlab user.
    add bash as runtime dependency.
    Add git, curl, ca-certificate, tar runtime dependencies from on debian control file for gitlab-runner package.
    Use gnu tar since we can expect tar options that are not supported by busybox tar implementation.
    Enable SSL/TLS library with openssl needed at runtime.
    Add me as "developer".
---
 DEVELOPERS                                  |  2 +
 package/Config.in                           |  1 +
 package/gitlab-runner/Config.in             | 31 ++++++++++
 package/gitlab-runner/S95gitlab-runner      | 64 +++++++++++++++++++++
 package/gitlab-runner/config.toml           |  0
 package/gitlab-runner/gitlab-runner.hash    |  3 +
 package/gitlab-runner/gitlab-runner.mk      | 39 +++++++++++++
 package/gitlab-runner/gitlab-runner.service | 19 ++++++
 8 files changed, 159 insertions(+)
 create mode 100644 package/gitlab-runner/Config.in
 create mode 100644 package/gitlab-runner/S95gitlab-runner
 create mode 100644 package/gitlab-runner/config.toml
 create mode 100644 package/gitlab-runner/gitlab-runner.hash
 create mode 100644 package/gitlab-runner/gitlab-runner.mk
 create mode 100644 package/gitlab-runner/gitlab-runner.service

diff --git a/DEVELOPERS b/DEVELOPERS
index d1426f6227..fcc7b522db 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1593,6 +1593,7 @@ F:	configs/grinn_*
 F:	package/argparse/
 F:	package/dt-utils/
 F:	package/easydbus/
+F:	package/gitlab-runner/
 F:	package/lua-flu/
 F:	package/lua-stdlib/
 F:	package/luaossl/
@@ -2213,6 +2214,7 @@ F:	package/enlightenment/
 F:	package/flare-engine/
 F:	package/flare-game/
 F:	package/gcc/
+F:	package/gitlab-runner/
 F:	package/glibc/
 F:	package/irrlicht/
 F:	package/liblinear/
diff --git a/package/Config.in b/package/Config.in
index 2871cabfcc..9df8046e55 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1954,6 +1954,7 @@ menu "Miscellaneous"
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
index 0000000000..69dcb28cce
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
+	start|stop|restart|reload)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/gitlab-runner/config.toml b/package/gitlab-runner/config.toml
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/package/gitlab-runner/gitlab-runner.hash b/package/gitlab-runner/gitlab-runner.hash
new file mode 100644
index 0000000000..2cb7df96a9
--- /dev/null
+++ b/package/gitlab-runner/gitlab-runner.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256	7f174fb82205bcf67069acadef80b0c7feaeb0dcb2dccec7df8a70d27ca268b2  gitlab-runner-12.10.0.tar.gz
+sha256  0ae968b7ddd25da0209c3c6594aac1ac74ddf90385940b02b420463e2e0734de  LICENSE
diff --git a/package/gitlab-runner/gitlab-runner.mk b/package/gitlab-runner/gitlab-runner.mk
new file mode 100644
index 0000000000..bbc22c290b
--- /dev/null
+++ b/package/gitlab-runner/gitlab-runner.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# gitlab-runner
+#
+################################################################################
+
+GITLAB_RUNNER_VERSION = 12.10.0
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
+# Install a minimal config.toml otherwise the gitlab-runner is wayting for it.
+define GITLAB_RUNNER_INSTALL_CONFIG
+	$(INSTALL) -D -m 0644 package/gitlab-runner/config.toml \
+		$(TARGET_DIR)/etc/gitlab-runner/config.toml
+endef
+
+GITLAB_RUNNER_POST_INSTALL_TARGET_HOOKS += GITLAB_RUNNER_INSTALL_CONFIG
+
+$(eval $(golang-package))
diff --git a/package/gitlab-runner/gitlab-runner.service b/package/gitlab-runner/gitlab-runner.service
new file mode 100644
index 0000000000..3ab134b335
--- /dev/null
+++ b/package/gitlab-runner/gitlab-runner.service
@@ -0,0 +1,19 @@
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
+Alias=gitlab-ci-multi-runner.service
-- 
2.21.3
