From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 21:35:45 +0200
Subject: [Buildroot] [git commit branch/next] package/iucode-tool: Add
 systemd service config
Message-ID: <20180519193557.177D58B433@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81fe62e09560f770a1d5de0ee2fd5810a022c072
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iucode-tool/iucode-tool.mk |  8 ++++++++
 package/iucode-tool/iucode.service | 10 ++++++++++
 2 files changed, 18 insertions(+)

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
