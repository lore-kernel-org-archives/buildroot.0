From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Sun, 18 Nov 2012 02:15:13 +0200
Subject: [Buildroot] [PATCH] busybox: needs linux-pam dependency added if
	using custom busybox .config & busybox login applet
Message-ID: <1353197713-20796-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If BusyBox custom .config has login applet (CONFIG_LOGIN) enabled
then the build process will complain about missing Linux PAM
headers.
This will add the needed linux-pam dependency

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/busybox/busybox.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 549e150..f2a102a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -30,6 +30,13 @@ BUSYBOX_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
 BUSYBOX_LDFLAGS += -ltirpc
 endif
 
+# linux-pam must be built first if user has custom
+# BusyBox .config file and that file has also login
+# applet (CONFIG_LOGIN) enabled.
+ifeq ($(shell sed -n "s/CONFIG_LOGIN=\(y\)/\1/p" $(BR2_PACKAGE_BUSYBOX_CONFIG)),y)
+BUSYBOX_DEPENDENCIES += linux-pam
+endif
+
 BUSYBOX_BUILD_CONFIG = $(BUSYBOX_DIR)/.config
 # Allows the build system to tweak CFLAGS
 BUSYBOX_MAKE_ENV = $(TARGET_MAKE_ENV) CFLAGS="$(BUSYBOX_CFLAGS)"
-- 
1.7.7.6
