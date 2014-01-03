From: Ivan Sergeev <vsergeev@kumunetworks.com>
Date: Thu,  2 Jan 2014 17:38:32 -0800
Subject: [Buildroot] [PATCH 1/1] skeleton: add systemd network.service unit
Message-ID: <1388713112-4686-1-git-send-email-vsergeev@kumunetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add and enable a systemd unit file to bring up / down network with ifup /
ifdown, analogous to the skeleton/etc/init.d/S40network init script.

Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
---
 .../system/multi-user.target.wants/network.service  |  1 +
 system/skeleton/etc/systemd/system/network.service  | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 120000 system/skeleton/etc/systemd/system/multi-user.target.wants/network.service
 create mode 100644 system/skeleton/etc/systemd/system/network.service

diff --git a/system/skeleton/etc/systemd/system/multi-user.target.wants/network.service b/system/skeleton/etc/systemd/system/multi-user.target.wants/network.service
new file mode 120000
index 0000000..d3558f9
--- /dev/null
+++ b/system/skeleton/etc/systemd/system/multi-user.target.wants/network.service
@@ -0,0 +1 @@
+../network.service
\ No newline at end of file
diff --git a/system/skeleton/etc/systemd/system/network.service b/system/skeleton/etc/systemd/system/network.service
new file mode 100644
index 0000000..0d77bb8
--- /dev/null
+++ b/system/skeleton/etc/systemd/system/network.service
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
-- 
1.8.4.2
