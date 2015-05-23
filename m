From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:04:50 +0300
Subject: [Buildroot] [PATCH 12/38] iucode-tool: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <847e8022549a877d66b377c8a7e8d18f4cef5ea1.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/iucode-tool/iucode-tool.mk | 8 ++++++++
 package/iucode-tool/iucode.service | 9 +++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 package/iucode-tool/iucode.service

diff --git a/package/iucode-tool/iucode-tool.mk b/package/iucode-tool/iucode-tool.mk
index 44d49d9..ba6641a 100644
--- a/package/iucode-tool/iucode-tool.mk
+++ b/package/iucode-tool/iucode-tool.mk
@@ -19,4 +19,12 @@ define IUCODE_TOOL_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S00iucode-tool
 endef
 
+define IUCODE_TOOL_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/iucode-tool/iucode.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/iucode.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/iucode.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/iucode.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/iucode-tool/iucode.service b/package/iucode-tool/iucode.service
new file mode 100644
index 0000000..e5caef8
--- /dev/null
+++ b/package/iucode-tool/iucode.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=Upload microcode into the processor
+
+[Service]
+Type=oneshot
+ExecStart=/usr/sbin/iucode_tool -k /usr/share/misc/intel-microcode.dat
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
