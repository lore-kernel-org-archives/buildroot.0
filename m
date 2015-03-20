From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 14:11:39 +0100
Subject: [Buildroot] [git commit] package/haveged: add systemd units
Message-ID: <20150320132231.CB1F8818AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=99d30f1fafcfe0a146151fbc5d25b57551ee3a4f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
Reviewed-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/haveged/haveged.mk      |    8 ++++++++
 package/haveged/haveged.service |   10 ++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index 88d85cd..c68f766 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -14,4 +14,12 @@ define HAVEGED_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S21haveged
 endef
 
+define HAVEGED_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/haveged/haveged.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/haveged.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs /usr/lib/systemd/system/haveged.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/haveged.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/haveged/haveged.service b/package/haveged/haveged.service
new file mode 100644
index 0000000..d87fe5b
--- /dev/null
+++ b/package/haveged/haveged.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Entropy Harvesting Daemon
+Documentation=man:haveged(8)
+
+[Service]
+ExecStart=/usr/bin/haveged -F -w 1024 -v 1
+SuccessExitStatus=143
+
+[Install]
+WantedBy=multi-user.target
