From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Thu, 30 Apr 2020 15:07:02 +0200
Subject: [Buildroot] [PATCH] package/gitlab-runner: new package
Message-ID: <20200430130702.2476020-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/gitlab-runner/Config.in          | 18 +++++++
 package/gitlab-runner/S95gitlab-runner   | 64 ++++++++++++++++++++++++
 package/gitlab-runner/gitlab-runner.hash |  3 ++
 package/gitlab-runner/gitlab-runner.mk   | 20 ++++++++
 6 files changed, 107 insertions(+)
 create mode 100644 package/gitlab-runner/Config.in
 create mode 100644 package/gitlab-runner/S95gitlab-runner
 create mode 100644 package/gitlab-runner/gitlab-runner.hash
 create mode 100644 package/gitlab-runner/gitlab-runner.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cc72b288be..775c3315d9 100644
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
diff --git a/package/Config.in b/package/Config.in
index 53c8ce0e29..ef2c89500c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1956,6 +1956,7 @@ menu "Miscellaneous"
 	source "package/collectl/Config.in"
 	source "package/domoticz/Config.in"
 	source "package/empty/Config.in"
+	source "package/gitlab-runner/Config.in"
 	source "package/gnuradio/Config.in"
 	source "package/googlefontdirectory/Config.in"
 	source "package/gqrx/Config.in"
diff --git a/package/gitlab-runner/Config.in b/package/gitlab-runner/Config.in
new file mode 100644
index 0000000000..717470d7c3
--- /dev/null
+++ b/package/gitlab-runner/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_GITLAB_RUNNER
+	bool "gitlab-runner"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
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
index 0000000000..4525c0e794
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
+	start-stop-daemon -S -q -m -b -p "$PIDFILE" -x "/usr/bin/$DAEMON" \
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
+reload() {
+	printf 'Reloading %s: ' "$DAEMON"
+	start-stop-daemon -K -s HUP -q -p "$PIDFILE"
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
index 0000000000..330b3ff02a
--- /dev/null
+++ b/package/gitlab-runner/gitlab-runner.mk
@@ -0,0 +1,20 @@
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
+define GITLAB_RUNNER_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/gitlab-runner/S95gitlab-runner \
+		$(TARGET_DIR)/etc/init.d/S95gitlab-runner
+endef
+
+$(eval $(golang-package))
-- 
2.26.2
