From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Sep 2014 13:24:46 -0000
Subject: [Buildroot] [git commit] chrony: add sysv initscript
Message-ID: <20140901132445.A3ED69D5C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d016a6a30dd86f5d6a02663fa4729a75e48ae379
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/chrony/S49chrony |   26 ++++++++++++++++++++++++++
 package/chrony/chrony.mk |    4 ++++
 2 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/chrony/S49chrony b/package/chrony/S49chrony
new file mode 100755
index 0000000..66a50d5
--- /dev/null
+++ b/package/chrony/S49chrony
@@ -0,0 +1,26 @@
+#!/bin/sh
+#
+# Start chrony
+
+[ -f /etc/chrony.conf ] || exit 0
+
+case "$1" in
+  start)
+	echo "Starting chrony: "
+	chronyd && echo "OK" || echo "FAIL"
+	;;
+  stop)
+	echo -n "Stopping chrony: "
+	killall chronyd && echo "OK" || echo "FAIL"
+	;;
+  restart|reload)
+	"$0" stop
+	sleep 1
+	"$0" start
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 09a4a1e..afe0fc8 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -39,4 +39,8 @@ define CHRONY_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
 endef
 
+define CHRONY_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/chrony/S49chrony $(TARGET_DIR)/etc/init.d/S49chrony
+endef
+
 $(eval $(generic-package))
