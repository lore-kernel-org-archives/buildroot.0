From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 12:45:32 +0200
Subject: [Buildroot] [git commit] package/avahi: use upstream-provided
	systemd files
Message-ID: <20141019111437.99C7AAF1F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b41c827a25de45f69cf302914d4c39b5e2ce7a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using the buildroot-provided avahi-daemon.service file, bootup never
finishes, because multi-user.target is waiting for avahi-daemon to exit,
which is caused by "Type=oneshot" (in avahi-daemon.service).

Upstream's systemd files get already installed to /lib/systemd.
They're not an exact copy of S50avahi-daemon, but work flawlessly,
so use these units:

* avahi-daemon.service, auto-enabled (ln -fs in AVAHI_INSTALL_INIT_SYSTEMD)
* avahi-daemon.socket,
  not auto-enabled, but a dependency of avahi-daemon.service
* avahi-dnsconfd.service, auto-enabled

[Thomas: use simpler absolute paths for the symbolic links instead of
relative paths. Suggested by Maxime Hadjinlian.]

Signed-off-by: Andr?? Erdmann <dywi@mailerd.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avahi/avahi-daemon.service |   15 ---------------
 package/avahi/avahi.mk             |    8 ++++----
 2 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/package/avahi/avahi-daemon.service b/package/avahi/avahi-daemon.service
deleted file mode 100644
index c9b7b1f..0000000
--- a/package/avahi/avahi-daemon.service
+++ /dev/null
@@ -1,15 +0,0 @@
-[Unit]
-Description=Avahi daemon
-Requires=dbus.target
-After=syslog.target network.target auditd.service
-
-[Service]
-Type=oneshot
-RemainAfterExit=ye
-ExecStart=/usr/sbin/avahi-daemon -s
-ExecReload=/usr/sbin/avahi-daemon -r
-ExecStop=/usr/sbin/avahi-daemon -k
-Restart=restart-always
-
-[Install]
-WantedBy=multi-user.target
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 93d093c..3508002 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -164,14 +164,14 @@ endif
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
 
 define AVAHI_INSTALL_INIT_SYSTEMD
-  $(INSTALL) -D -m 644 package/avahi/avahi-daemon.service \
-    $(TARGET_DIR)/etc/systemd/system/avahi-daemon.service
-
   mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 
-  ln -fs ../avahi-daemon.service \
+  ln -fs /lib/systemd/system/avahi-daemon.service \
     $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/avahi-daemon.service
 
+  ln -fs /lib/systemd/system/avahi-dnsconfd.service \
+    $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/avahi-dnsconfd.service
+
   mkdir -p $(TARGET_DIR)/usr/lib/tmpfiles.d
 
   $(INSTALL) -D -m 644 package/avahi/avahi_tmpfiles.conf \
