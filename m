From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 23 May 2014 18:03:46 +0200
Subject: [Buildroot] [PATCH] dropbear: fix missing directory with systemd
Message-ID: <1400861026-5987-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the current systemd unit files, the folder '/etc/dropbear' is not
created, which caused dropbear to fail to create its keys and then
accept connections.

This add a new file which is used by systemd to create the correct
directory structure.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/dropbear/dropbear.mk            | 3 +++
 package/dropbear/dropbear_tmpfiles.conf | 1 +
 2 files changed, 4 insertions(+)
 create mode 100644 package/dropbear/dropbear_tmpfiles.conf

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 2ac6211..f176f7c 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -49,6 +49,9 @@ define DROPBEAR_INSTALL_INIT_SYSTEMD
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -fs ../dropbear.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dropbear.service
+	mkdir -p $(TARGET_DIR)/usr/lib/tmpfiles.d
+	$(INSTALL) -D -m 644 package/dropbear/dropbear_tmpfiles.conf \
+		$(TARGET_DIR)/usr/lib/tmpfiles.d/dropbear.conf
 endef
 
 ifeq ($(BR2_USE_MMU),y)
diff --git a/package/dropbear/dropbear_tmpfiles.conf b/package/dropbear/dropbear_tmpfiles.conf
new file mode 100644
index 0000000..ba2cd5a
--- /dev/null
+++ b/package/dropbear/dropbear_tmpfiles.conf
@@ -0,0 +1 @@
+d /etc/dropbear 0755 default default
-- 
2.0.0.rc0
