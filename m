From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed,  8 Dec 2010 10:53:59 +0100
Subject: [Buildroot] [PATCH 07/17] udev: ensure startup script is well
	installed
In-Reply-To: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
References: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1291802049-18764-8-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

In case /etc/init.d does not exists.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/udev/udev.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 90dbdce..8da2798 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -88,7 +88,9 @@ define UDEV_INSTALL_TARGET_CMDS
 		LDFLAGS="-warn-common" \
 		USE_LOG=false USE_SELINUX=false \
 		udevdir=$(UDEV_ROOT) EXTRAS="$(UDEV_BUILD_EXTRAS)" -C $(@D) install
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/etc/init.d
 	$(INSTALL) -m 0755 package/udev/S10udev $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/etc/udev/rules.d
 	$(INSTALL) -m 0644 $(@D)/etc/udev/frugalware/* $(TARGET_DIR)/etc/udev/rules.d
 	( grep udev_root $(TARGET_DIR)/etc/udev/udev.conf > /dev/null 2>&1 || echo 'udev_root=/dev' >> $(TARGET_DIR)/etc/udev/udev.conf )
 	install -m 0755 -D $(@D)/udevstart $(TARGET_DIR)/sbin/udevstart
-- 
1.7.2.3
