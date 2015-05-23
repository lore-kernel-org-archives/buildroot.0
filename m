From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:03:19 +0300
Subject: [Buildroot] [PATCH 06/38] ejabberd: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <06a1c8291627eaa04e8454148a478a758c5464a6.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/ejabberd/ejabberd.mk      |  8 ++++++++
 package/ejabberd/ejabberd.service | 10 ++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/ejabberd/ejabberd.service

diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 07ce78e..d8a931f 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -48,4 +48,12 @@ define EJABBERD_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50ejabberd
 endef
 
+define EJABBERD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/ejabberd/ejabberd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/ejabberd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/ejabberd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ejabberd.service
+endef
+
 $(eval $(rebar-package))
diff --git a/package/ejabberd/ejabberd.service b/package/ejabberd/ejabberd.service
new file mode 100644
index 0000000..830fdd6
--- /dev/null
+++ b/package/ejabberd/ejabberd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Erlang Jabber daemon
+After=network.target
+
+[Service]
+ExecStart=/usr/bin/ejabberd
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.0.3
