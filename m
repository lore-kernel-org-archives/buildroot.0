From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 18 May 2021 16:54:21 +0300
Subject: [Buildroot] [PATCH v2 3/5] package/seatd: install init scripts
In-Reply-To: <20210518135423.194507-1-aperez@igalia.com>
References: <20210513163325.1775639-1-aperez@igalia.com>
 <20210518135423.194507-1-aperez@igalia.com>
Message-ID: <20210518135423.194507-4-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add commands to the seatd package to install the systemd unit included
in the source tarball and a SysV init script, and ensure that the
"video" group gets created.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
Changes v1 -> v2:
  - Add SEATD_USERS (suggested by Yann)
  - Only install init scripts if BR2_PACKAGE_SEATD_DAEMON is enabled.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/seatd/S70seatd | 38 ++++++++++++++++++++++++++++++++++++++
 package/seatd/seatd.mk | 15 +++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100755 package/seatd/S70seatd

diff --git a/package/seatd/S70seatd b/package/seatd/S70seatd
new file mode 100755
index 0000000000..a91302c6c1
--- /dev/null
+++ b/package/seatd/S70seatd
@@ -0,0 +1,38 @@
+#! /bin/sh
+#
+# Starts seatd
+#
+
+DAEMON=/usr/bin/seatd
+PIDFILE=/run/seatd.pid
+
+case "$1" in
+	start)
+		printf 'Starting seatd: '
+		if start-stop-daemon -S -x "$DAEMON" -p "$PIDFILE" -m -b -- -g video
+		then
+			echo OK
+		else
+			echo FAIL
+		fi
+		;;
+	stop)
+		if start-stop-daemon -K -x "$DAEMON" -p "$PIDFILE"
+		then
+			echo OK
+		else
+			echo FAIL
+		fi
+		;;
+	restart)
+		"$0" stop || true
+		sleep 1
+		"$0" start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+		;;
+esac
+
+exit 0
diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
index 2e90270555..2abcefbfaa 100644
--- a/package/seatd/seatd.mk
+++ b/package/seatd/seatd.mk
@@ -30,6 +30,21 @@ endif
 
 ifeq ($(BR2_PACKAGE_SEATD_DAEMON),y)
 SEATD_CONF_OPTS += -Dseatd=enabled -Dserver=enabled
+
+define SEATD_USERS
+	- - video -1 - - - - -
+endef
+
+define SEATD_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D $(SEATD_PKGDIR)/S70seatd \
+		$(TARGET_DIR)/etc/init.d/S70seatd
+endef
+
+define SEATD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -m 0644 -D $(@D)/contrib/systemd/seatd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/seatd.service
+endef
+
 else
 SEATD_CONF_OPTS += -Dseatd=disabled -Dserver=disabled
 endif
-- 
2.31.1
