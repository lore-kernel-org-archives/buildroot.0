From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 22:55:49 +0200
Subject: [Buildroot] [git commit] package/avahi: Add sysusers.d snippet
Message-ID: <20180326205554.BAD728105A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7cbfcb322c42caa8b3c3651df8a0b7696f04a99c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/avahi/avahi.mk            | 9 +++++++++
 package/avahi/avahi_sysusers.conf | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index ef621620f0..baffe3cb69 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -190,6 +190,13 @@ endif
 
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUSERS),y)
+define AVAHI_INSTALL_SYSTEMD_SYSUSERS
+	$(INSTALL) -D -m 644 package/avahi/avahi_sysusers.conf \
+		$(TARGET_DIR)/usr/lib/sysusers.d/avahi.conf
+endef
+endif
+
 define AVAHI_INSTALL_INIT_SYSTEMD
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 
@@ -201,6 +208,8 @@ define AVAHI_INSTALL_INIT_SYSTEMD
 
 	$(INSTALL) -D -m 644 package/avahi/avahi_tmpfiles.conf \
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/avahi.conf
+
+	$(AVAHI_INSTALL_SYSTEMD_SYSUSERS)
 endef
 
 define AVAHI_INSTALL_DAEMON_INIT_SYSV
diff --git a/package/avahi/avahi_sysusers.conf b/package/avahi/avahi_sysusers.conf
new file mode 100644
index 0000000000..463ce97cea
--- /dev/null
+++ b/package/avahi/avahi_sysusers.conf
@@ -0,0 +1,5 @@
+# sysusers.d snippet for creating the avahi system user automatically
+# at boot on systemd-based systems that ship with an unpopulated
+# /etc. See sysusers.d(5) for details.
+
+u avahi - "Avahi mDNS/DNS-SD Stack"
