From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:13:53 +0300
Subject: [Buildroot] [PATCH 32/38] upmpdcli: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <d18d138a47f392345210d7efe6f320e49a4e723e.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Usable .service file is provided in the package.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/upmpdcli/upmpdcli.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 0be4d91..c2ee293 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -19,6 +19,14 @@ define UPMPDCLI_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/upmpdcli/S99upmpdcli $(TARGET_DIR)/etc/init.d/S99upmpdcli
 endef
 
+define UPMPDCLI_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(@D)/systemd/upmpdcli.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/upmpdcli.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/upmpdcli.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/upmpdcli.service
+endef
+
 define UPMPDCLI_INSTALL_CONF_FILE
 	$(INSTALL) -D -m 0755 $(@D)/src/upmpdcli.conf $(TARGET_DIR)/etc/upmpdcli.conf
 endef
-- 
2.0.3
