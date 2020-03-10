From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 10 Mar 2020 09:07:19 +0100
Subject: [Buildroot] [PATCH v3 2/3] package/linuxptp: rename systemd service
 scripts
In-Reply-To: <20200310080722.12742-1-heiko.thiery@gmail.com>
References: <20200310080722.12742-1-heiko.thiery@gmail.com>
Message-ID: <20200310080722.12742-3-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the same name as for the SysVinit scripts. This name is also used in
debian.

linuxptp-system-clock.service -> phc2sys.service
linuxptp.service -> ptp4l.service

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/linuxptp/linuxptp.mk                              | 8 ++++----
 .../{linuxptp-system-clock.service => phc2sys.service}    | 2 +-
 package/linuxptp/{linuxptp.service => ptp4l.service}      | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename package/linuxptp/{linuxptp-system-clock.service => phc2sys.service} (89%)
 rename package/linuxptp/{linuxptp.service => ptp4l.service} (87%)

diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index ba57396f86..921c55ad59 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -40,10 +40,10 @@ define LINUXPTP_INSTALL_INIT_SYSV
 endef
 
 define LINUXPTP_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 $(LINUXPTP_PKGDIR)/linuxptp.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/linuxptp.service
-	$(INSTALL) -D -m 644 $(LINUXPTP_PKGDIR)/linuxptp-system-clock.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/linuxptp-system-clock.service
+	$(INSTALL) -D -m 644 $(LINUXPTP_PKGDIR)/ptp4l.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/ptp4l.service
+	$(INSTALL) -D -m 644 $(LINUXPTP_PKGDIR)/phc2sys.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/phc2sys.service
 endef
 
 $(eval $(generic-package))
diff --git a/package/linuxptp/linuxptp-system-clock.service b/package/linuxptp/phc2sys.service
similarity index 89%
rename from package/linuxptp/linuxptp-system-clock.service
rename to package/linuxptp/phc2sys.service
index 57beec4579..63b0ca23c3 100644
--- a/package/linuxptp/linuxptp-system-clock.service
+++ b/package/linuxptp/phc2sys.service
@@ -1,6 +1,6 @@
 [Unit]
 Description=Precision Time Protocol system clock synchronization
-After=linuxptp.service
+After=ptp4l.service
 
 [Service]
 ExecStart=/usr/sbin/phc2sys -s /dev/ptp0 -c CLOCK_REALTIME -w -S 1.0
diff --git a/package/linuxptp/linuxptp.service b/package/linuxptp/ptp4l.service
similarity index 87%
rename from package/linuxptp/linuxptp.service
rename to package/linuxptp/ptp4l.service
index 14e9814b06..07f0b68fad 100644
--- a/package/linuxptp/linuxptp.service
+++ b/package/linuxptp/ptp4l.service
@@ -3,7 +3,7 @@ Description=Precision Time Protocol daemon
 After=syslog.target network.target
 Before=time-sync.target
 Wants=time-sync.target
-Wants=linuxptp-system-clock.service
+Wants=phc2sys.service
 
 [Service]
 ExecStart=/usr/sbin/ptp4l -f /etc/linuxptp.cfg
-- 
2.20.1
