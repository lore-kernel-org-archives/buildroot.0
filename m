From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  5 Feb 2019 11:49:55 +0100
Subject: [Buildroot] [PATCH v3 1/5] package/mender: adding a writable
 location
In-Reply-To: <1549363799-30840-1-git-send-email-angelo@amarulasolutions.com>
References: <1549363799-30840-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1549363799-30840-2-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mender needs /var/lib/mender to be writable at the service start, the
path is hardcoded and thus we cannot change it.
This patch solves the problem using the same approach we have for
dropbear.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: <aduskett@gmail.com>
---
 package/mender/mender.mk      |  2 ++
 package/mender/mender.service | 12 +++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index a5cece7..3203df8 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -49,6 +49,8 @@ define MENDER_INSTALL_CONFIG_FILES
 		$(INSTALL) -D -m 0755 $(@D)/support/mender-inventory-$(f) \
 			$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-$(f)
 	)
+
+	ln -snf /var/run/mender $(TARGET_DIR)/var/lib/mender
 endef
 
 MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES
diff --git a/package/mender/mender.service b/package/mender/mender.service
index 9ede55a..8b60a4f 100644
--- a/package/mender/mender.service
+++ b/package/mender/mender.service
@@ -6,7 +6,17 @@ After=systemd-resolved.service
 Type=idle
 User=root
 Group=root
-ExecStartPre=/bin/mkdir -p -m 0700 /data/mender
+ExecStartPre=/bin/sh -c '\
+if [ -L /var/lib/mender \
+     -a "$(readlink /var/lib/mender)" = "/var/run/mender" ]; then \
+    if rm -f /var/lib/mender >/dev/null 2>&1; then \
+        mkdir -p /var/lib/mender; \
+    else \
+        echo "No persistent location to store mender data. Data will be lost\
+        echo "at reboot. Are you sure this is what you want to do?"; \
+        mkdir -p "$(readlink /var/lib/mender)"; \
+    fi; \
+fi'
 ExecStart=/usr/bin/mender -daemon
 Restart=on-abort
 
-- 
2.7.4
