From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 20:32:43 +0100
Subject: [Buildroot] [git commit] lighttpd: use upstream systemd service file
Message-ID: <20150320194323.22F9A8181B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c986d663d77ad50c59f3191d49c51cb4da4d3198
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lighttpd/lighttpd.mk      |    6 +++---
 package/lighttpd/lighttpd.service |   10 ----------
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 8f34561..cdbf91d 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -84,12 +84,12 @@ define LIGHTTPD_INSTALL_INIT_SYSV
 endef
 
 define LIGHTTPD_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0644 package/lighttpd/lighttpd.service \
-		$(TARGET_DIR)/etc/systemd/system/lighttpd.service
+	$(INSTALL) -D -m 0644 $(@D)/doc/systemd/lighttpd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/lighttpd.service
 
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 
-	ln -fs ../lighttpd.service \
+	ln -fs ../../../../usr/lib/systemd/lighttpd.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/lighttpd.service
 endef
 
diff --git a/package/lighttpd/lighttpd.service b/package/lighttpd/lighttpd.service
deleted file mode 100644
index 0ca5357..0000000
--- a/package/lighttpd/lighttpd.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=Lighttpd Web Server
-After=network.target
-
-[Service]
-ExecStart=/usr/sbin/lighttpd-angel -f /etc/lighttpd/lighttpd.conf -D
-ExecReload=/bin/kill -HUP $MAINPID
-
-[Install]
-WantedBy=multi-user.target
