From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jul 2015 00:10:52 +0200
Subject: [Buildroot] [git commit] pulseaudio: systemd support
Message-ID: <20150714221115.8308681D42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c42f6907fa5f1cafcb5aedafe4fc9865d0b3fb4a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - use relative path for the service symlink
 - slightly adjust the service description]

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pulseaudio/pulseaudio.mk      |    8 ++++++++
 package/pulseaudio/pulseaudio.service |   11 +++++++++++
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index e68ca68..0fcfe38 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -123,6 +123,14 @@ define PULSEAUDIO_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50pulseaudio
 endef
 
+define PULSEAUDIO_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/pulseaudio/pulseaudio.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/pulseaudio.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/pulseaudio.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/pulseaudio.service
+endef
+
 endif
 
 $(eval $(autotools-package))
diff --git a/package/pulseaudio/pulseaudio.service b/package/pulseaudio/pulseaudio.service
new file mode 100644
index 0000000..fc82f03
--- /dev/null
+++ b/package/pulseaudio/pulseaudio.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=PulseAudio Sound System
+After=syslog.target
+
+[Service]
+UMask=077
+ExecStart=/usr/bin/pulseaudio --system --daemonize=no
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
