From: David De Grave (Essensium/Mind) <david.degrave@mind.be>
Date: Tue, 15 May 2018 12:18:02 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/iucode-tool: Add systemd service
 config
Message-ID: <20180515101802.6040-1-david.degrave@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alex Suykov <alex.suykov@gmail.com>

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>
---
Changes v1 -> v2
	- Add 'RemainAfterExist=yes' to the unit file.
	- Change the link target to relative.
Changes v2 -> v3
	- Fixed copy/paste error in the link target.
---
 package/iucode-tool/iucode-tool.mk |  8 ++++++++
 package/iucode-tool/iucode.service | 10 ++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/iucode-tool/iucode.service

diff --git a/package/iucode-tool/iucode-tool.mk b/package/iucode-tool/iucode-tool.mk
index fb746c3cb8..38f9da438e 100644
--- a/package/iucode-tool/iucode-tool.mk
+++ b/package/iucode-tool/iucode-tool.mk
@@ -18,4 +18,12 @@ define IUCODE_TOOL_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S00iucode-tool
 endef
 
+define IUCODE_TOOL_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/iucode-tool/iucode.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/iucode.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/iucode.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/iucode.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/iucode-tool/iucode.service b/package/iucode-tool/iucode.service
new file mode 100644
index 0000000000..d99acc6a54
--- /dev/null
+++ b/package/iucode-tool/iucode.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Upload microcode into the processor
+
+[Service]
+Type=oneshot
+ExecStart=/usr/sbin/iucode_tool -k /usr/share/misc/intel-microcode.dat
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
-- 
2.13.6
