From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 27 Nov 2019 17:26:07 -0800
Subject: [Buildroot] [PATCH v4 4/6] package/polkit: add init service file
In-Reply-To: <20191128012609.3632661-1-aduskett@gmail.com>
References: <20191128012609.3632661-1-aduskett@gmail.com>
Message-ID: <20191128012609.3632661-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Add a S50polkit file which starts polkit for non-systemd based systems.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/polkit/S50polkit | 15 +++++++++++++++
 package/polkit/polkit.mk |  5 +++++
 2 files changed, 20 insertions(+)
 create mode 100644 package/polkit/S50polkit

diff --git a/package/polkit/S50polkit b/package/polkit/S50polkit
new file mode 100644
index 0000000000..55c10e99ae
--- /dev/null
+++ b/package/polkit/S50polkit
@@ -0,0 +1,15 @@
+#!/bin/sh
+#
+# start polkitd
+#
+
+case "$1" in
+	start)
+		start-stop-daemon -q -S -x /usr/lib/polkit-1/polkitd -- --no-debug &
+		;;
+	*)
+  echo "Usage: $0 {start}"
+		exit 1
+esac
+
+exit $?
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index b440cd2f1c..8bb4512aee 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -44,4 +44,9 @@ define POLKIT_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/polkit.service
 endef
 
+define POLKIT_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/polkit/S50polkit \
+		$(TARGET_DIR)/etc/init.d/S50polkit
+endef
+
 $(eval $(autotools-package))
-- 
2.23.0
