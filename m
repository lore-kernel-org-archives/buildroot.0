From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 13 May 2021 19:33:23 +0300
Subject: [Buildroot] [PATCH 4/6] package/seatd: install init scripts
In-Reply-To: <20210513163325.1775639-1-aperez@igalia.com>
References: <20210513163325.1775639-1-aperez@igalia.com>
Message-ID: <20210513163325.1775639-5-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add commands to the seatd package to install the systemd unit included
in the source tarball and a SysV init script.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/seatd/S70seatd | 38 ++++++++++++++++++++++++++++++++++++++
 package/seatd/seatd.mk | 10 ++++++++++
 2 files changed, 48 insertions(+)
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
index 45da53904f..abb7cb888f 100644
--- a/package/seatd/seatd.mk
+++ b/package/seatd/seatd.mk
@@ -39,4 +39,14 @@ else
 SEATD_CONF_OPTS += -Dserver=disabled
 endif
 
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
 $(eval $(meson-package))
-- 
2.31.1
