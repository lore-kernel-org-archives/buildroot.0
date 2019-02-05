From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Feb 2019 13:40:10 +0100
Subject: [Buildroot] [git commit] package/mender: adding a writable location
Message-ID: <20190205130901.6D0F283F64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e78d5161787ed3bbfbb7bd72bb22022de91a72b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mender needs /var/lib/mender to be writable at the service start, the
path is hardcoded and thus we cannot change it.
This patch solves the problem using the same approach we have for
dropbear.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mender/mender.mk      |  2 ++
 package/mender/mender.service | 12 +++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index a5cece7044..3203df8a47 100644
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
index 9ede55acb5..8b60a4f1aa 100644
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
 
