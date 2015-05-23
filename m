From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:07:42 +0300
Subject: [Buildroot] [PATCH 28/38] squid: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <46428a55d4456ed7558735aafeb331bc37cef9ea.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

squid comes with a .service file, but does not install it.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/squid/squid.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 745c9ad..5a9fbb7 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -81,4 +81,12 @@ define SQUID_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S97squid
 endef
 
+define SQUID_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/tools/squid.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/squid.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/squid.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/squid.service
+endef
+
 $(eval $(autotools-package))
-- 
2.0.3
