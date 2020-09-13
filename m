From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 15:14:55 +0200
Subject: [Buildroot] [git commit] package/haveged: change systemd service
 file to run earlier
Message-ID: <20200913130613.B7EBE821A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d872a9dbbab8d9eed295a53415d01b58b62a3493
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop default dependencies, haveged needs nothing but local sockets and
/dev/random.

The service file now mostly matches the upstream Fedora file, except a
lot of isolation options have been dropped. The benefit for a
completely controlled system is small, and those option would pull in
dependencies, delaying entropy being filled up.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/haveged/haveged.service | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/package/haveged/haveged.service b/package/haveged/haveged.service
index 91035c6711..5a2336b0a7 100644
--- a/package/haveged/haveged.service
+++ b/package/haveged/haveged.service
@@ -1,10 +1,22 @@
 [Unit]
-Description=Entropy Harvesting Daemon
-Documentation=man:haveged(8)
+# inspiration from upstream init.d/service.fedora
+Description=Entropy Daemon based on the HAVEGE algorithm
+Documentation=man:haveged(8) http://www.issihosts.com/haveged/
+DefaultDependencies=no
+# This would wait for filesystems, but we only need /dev/random, which
+# is certainly available after systemd initialised
+# After=systemd-tmpfiles-setup-dev.service
+Before=sysinit.target shutdown.target systemd-journald.service
 
 [Service]
-ExecStart=/usr/sbin/haveged -F -w 1024 -v 1
-SuccessExitStatus=143
+ExecStart=/usr/sbin/haveged -w 1024 -v 1 --Foreground
+Restart=always
+SuccessExitStatus=137 143
+
+# Only simple isolation methods that don't pull in dependencies
+CapabilityBoundingSet=CAP_SYS_ADMIN
+SecureBits=noroot-locked
+ProtectSystem=full
 
 [Install]
-WantedBy=multi-user.target
+WantedBy=sysinit.target
