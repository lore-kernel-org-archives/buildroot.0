From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Dec 2016 22:07:33 -0600
Subject: [Buildroot] [PATCH] quagga: Create /var/run/quagga on sysv
Message-ID: <1482293253-61002-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Brandon Maier <brandon.maier@rockwellcollins.com>

The /var/run/quagga directory needs to be created at boot in order for
Quagga to work. Without it Quagga will fail to create the pid lock file.
It's already supported in systemd, now add basic support for sysv.

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/quagga/S99quagga | 6 ++++++
 package/quagga/quagga.mk | 4 ++++
 2 files changed, 10 insertions(+)
 create mode 100644 package/quagga/S99quagga

diff --git a/package/quagga/S99quagga b/package/quagga/S99quagga
new file mode 100644
index 0000000..e964387
--- /dev/null
+++ b/package/quagga/S99quagga
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+if [ ! -d /var/run/quagga ]; then
+       mkdir -p /var/run/quagga
+       chown quagga:quagga /var/run/quagga
+fi
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index ad2aff4..4beff5d 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -79,4 +79,8 @@ define QUAGGA_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/quagga at .service
 endef
 
+define QUAGGA_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/quagga/S99quagga $(TARGET_DIR)/etc/init.d/S99quagga
+endef
+
 $(eval $(autotools-package))
-- 
1.9.1
