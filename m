From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 15 Feb 2019 22:42:53 +0100
Subject: [Buildroot] [PATCH] package/mender: fix missing /var/lib
Message-ID: <20190215214253.28202-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mender needs /var/lib directory to be available: on some configurations
/var/lib is not available and thus the mender package installation fails.
This patch does a mkdir to ensure the /var/lib directory is always
available.

Fixes:
http://autobuild.buildroot.net/results/02fde80f6b4bc57d5f2833bd979bf166252eab16
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/mender/mender.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index cd18c0055a..07f6e5e5f9 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -57,6 +57,7 @@ define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -D -m 0755 package/mender/device_type \
 			$(TARGET_DIR)/etc/mender/device_type
 
+	mkdir -p $(TARGET_DIR)/var/lib
 	ln -snf /var/run/mender $(TARGET_DIR)/var/lib/mender
 endef
 
-- 
2.17.1
