From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 18:41:08 +0200
Subject: [Buildroot] [git commit] systemd: add network unit file
Message-ID: <20140614165139.E37669CFBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb981cf80be9dae210e940847e291f4cdcfa636f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add and enable a systemd unit file to bring up or down network with ifup /
ifdown, analogous to the skeleton/etc/init.d/S40network init script.

Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
[eric.le.bihan.dev at free.fr:
  - rebase
  - install service only if systemd-networkd is not selected]
Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/network.service |   21 +++++++++++++++++++++
 package/systemd/systemd.mk      |   12 ++++++++++++
 2 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/systemd/network.service b/package/systemd/network.service
new file mode 100644
index 0000000..0d77bb8
--- /dev/null
+++ b/package/systemd/network.service
@@ -0,0 +1,21 @@
+[Unit]
+Description=Network Connectivity
+Wants=network.target
+Before=network.target
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+
+# lo is brought up earlier, which will cause the upcoming "ifup -a" to fail
+# with exit code 1, due to an "ip: RTNETLINK answers: File exists" error during
+# its "ip addr add ..." command, subsequently causing this unit to fail even
+# though it is a benign error. Flushing the lo address with the command below
+# before ifup prevents this failure.
+ExecStart=/sbin/ip addr flush dev lo
+
+ExecStart=/sbin/ifup -a
+ExecStop=/sbin/ifdown -a
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 6de7887..f3874db 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -145,12 +145,24 @@ define SYSTEMD_SANITIZE_PATH_IN_UNITS
 		-exec $(SED) 's,$(HOST_DIR),,g' {} \;
 endef
 
+define SYSTEMD_INSTALL_NETWORK_HOOK
+	$(INSTALL) -D -m 644 package/systemd/network.service \
+		$(TARGET_DIR)/etc/systemd/system/network.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../network.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/network.service
+endef
+
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_TTY_HOOK \
 	SYSTEMD_INSTALL_MACHINEID_HOOK \
 	SYSTEMD_SANITIZE_PATH_IN_UNITS
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),)
+SYSTEMD_POST_INSTALL_TARGET_HOOKS += SYSTEMD_INSTALL_NETWORK_HOOK
+endif
+
 define SYSTEMD_USERS
 	systemd-journal -1 systemd-journal -1 * /var/log/journal - - Journal
 	systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
