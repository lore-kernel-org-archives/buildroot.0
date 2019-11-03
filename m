From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Sun,  3 Nov 2019 17:56:31 +0100
Subject: [Buildroot] [PATCH 06/15] package/avahi: adapt to preset-all
In-Reply-To: <20191103165640.21819-1-jeremy.rosen@smile.fr>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
Message-ID: <20191103165640.21819-7-jeremy.rosen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

avahi was not enabled, we now need to disable it explicitely

Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
---
 package/avahi/50-avahi.preset | 3 +++
 package/avahi/avahi.mk        | 2 ++
 2 files changed, 5 insertions(+)
 create mode 100644 package/avahi/50-avahi.preset

diff --git a/package/avahi/50-avahi.preset b/package/avahi/50-avahi.preset
new file mode 100644
index 0000000000..998772ea96
--- /dev/null
+++ b/package/avahi/50-avahi.preset
@@ -0,0 +1,3 @@
+disable avahi-daemon.service
+disable avahi-daemon.socket
+disable avahi-dnsconfd.service
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 53021f6b6d..2df63c5273 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -198,6 +198,8 @@ endef
 endif
 
 define AVAHI_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/avahi/50-avahi.preset \
+		$(TARGET_DIR)/usr/lib/systemd/system-preset/50-avahi.preset
 	$(INSTALL) -D -m 644 package/avahi/avahi_tmpfiles.conf \
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/avahi.conf
 
-- 
2.24.0.rc1
