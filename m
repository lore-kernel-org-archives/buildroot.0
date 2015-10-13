From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 13 Oct 2015 11:18:13 +0100
Subject: [Buildroot] [PATCH v3] sane-backends: add systemd support
Message-ID: <1444731493-22371-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The content of the saned.socket and saned at .service files is based on the
instructions of the sane-backends manual.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v2 -> v3:
  - Create the "target.wants" directories for the socket and the service
    and put symlinks in there pointing to the real files. (Suggested by
    Maxime Hadjinlian)

Changes v1 -> v2:
  - Install the systemd files in /usr/lib/systemd/system. (Suggested by
    Maxime Hadjinlian)
  - Create saned user and group (Highlighted by Maxime Hadjinlian)
  - Amend the commit log since we are not using the location for the
    systemd files specified in the manual.

 package/sane-backends/sane-backends.mk |   24 ++++++++++++++++++++++++
 package/sane-backends/saned.socket     |   10 ++++++++++
 package/sane-backends/saned at .service   |   18 ++++++++++++++++++
 3 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 package/sane-backends/saned.socket
 create mode 100644 package/sane-backends/saned at .service

diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 0c0b5a9..b8d6a84 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -14,6 +14,13 @@ SANE_BACKENDS_INSTALL_STAGING = YES
 SANE_BACKENDS_CONF_OPTS = \
 	$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-pthread,--disable-pthread)
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+SANE_BACKENDS_CONF_OPTS += --with-systemd
+SANE_BACKENDS_DEPENDENCIES += systemd
+else
+SANE_BACKENDS_CONF_OPTS += --without-systemd
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 SANE_BACKENDS_DEPENDENCIES += libusb
 SANE_BACKENDS_CONF_OPTS += --enable-libusb_1_0
@@ -50,4 +57,21 @@ endef
 
 SANE_BACKENDS_POST_CONFIGURE_HOOKS += SANE_BACKENDS_DISABLE_DOCS
 
+define SANE_BACKENDS_USERS
+	saned -1 saned -1 * /etc/sane.d - - Saned User
+endef
+
+define SANE_BACKENDS_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -m 0644 -D package/sane-backends/saned.socket \
+		$(TARGET_DIR)/usr/lib/systemd/system/saned.socket
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/socket.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/saned.socket \
+		$(TARGET_DIR)/etc/systemd/system/socket.target.wants/saned.socket
+	$(INSTALL) -m 0644 -D package/sane-backends/saned at .service \
+		$(TARGET_DIR)/usr/lib/systemd/system/saned at .service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/saned at .service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/saned at .service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/sane-backends/saned.socket b/package/sane-backends/saned.socket
new file mode 100644
index 0000000..1aa19e7
--- /dev/null
+++ b/package/sane-backends/saned.socket
@@ -0,0 +1,10 @@
+[Unit]
+Description=saned incoming socket
+
+[Socket]
+ListenStream=6566
+Accept=yes
+MaxConnections=1
+
+[Install]
+WantedBy=sockets.target
diff --git a/package/sane-backends/saned at .service b/package/sane-backends/saned at .service
new file mode 100644
index 0000000..1905dbf
--- /dev/null
+++ b/package/sane-backends/saned at .service
@@ -0,0 +1,18 @@
+[Unit]
+Description=Scanner Service
+Requires=saned.socket
+
+[Service]
+ExecStart=/usr/sbin/saned
+User=saned
+Group=saned
+StandardInput=null
+StandardOutput=syslog
+StandardError=syslog
+Environment=SANE_CONFIG_DIR=/etc/sane.d
+# If you need to debug your configuration uncomment the next line and
+# change it as appropriate to set the desired debug options
+# Environment=SANE_DEBUG_DLL=255 SANE_DEBUG_BJNP=5
+
+[Install]
+Also=saned.socket
-- 
1.7.1
