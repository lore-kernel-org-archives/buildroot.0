From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 22 Feb 2020 11:47:06 -0300
Subject: [Buildroot] [PATCH] package/radvd: disable by default in systemd
 preset-all
Message-ID: <20200222144706.7896-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

We don't provide a configuration file, so disable radvd by default.

Update the help message with instructions on how to enable radvd at
build time with systemd.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/radvd/50-radvd.preset | 1 +
 package/radvd/Config.in       | 8 ++++++++
 package/radvd/radvd.mk        | 6 ++++++
 3 files changed, 15 insertions(+)
 create mode 100644 package/radvd/50-radvd.preset

diff --git a/package/radvd/50-radvd.preset b/package/radvd/50-radvd.preset
new file mode 100644
index 0000000000..90d0ee4bbc
--- /dev/null
+++ b/package/radvd/50-radvd.preset
@@ -0,0 +1 @@
+disable radvd.service
diff --git a/package/radvd/Config.in b/package/radvd/Config.in
index 48aeedc08f..fa5a20c4c1 100644
--- a/package/radvd/Config.in
+++ b/package/radvd/Config.in
@@ -5,4 +5,12 @@ config BR2_PACKAGE_RADVD
 	help
 	  IPv6 Router Advertisement Daemon.
 
+	  On busybox and sysvinit systems, radvd will be started only if
+	  a /etc/radvd.conf exists.
+
+	  To enable it at build time with systemd, add /etc/radvd.conf
+	  and a /etc/systemd/system-preset/40-radvd.preset file with
+
+	    enable radvd.service
+
 	  http://www.litech.org/radvd/
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 5679e613d4..3358264f18 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -17,6 +17,12 @@ RADVD_AUTORECONF = YES
 RADVD_LICENSE = BSD-4-Clause-like
 RADVD_LICENSE_FILES = COPYRIGHT
 
+# We don't provide /etc/radvd.conf, so disable the service by default.
+define RADVD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/radvd/50-radvd.preset \
+		$(TARGET_DIR)/usr/lib/systemd/system-preset/50-radvd.preset
+endef
+
 define RADVD_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d/S50radvd
 endef
-- 
2.18.2
