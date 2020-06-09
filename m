From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 10 Jun 2020 00:41:15 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/haveged: Change service file to
 run early
In-Reply-To: <20200609224116.13607-1-nolange79@gmail.com>
References: <20200609224116.13607-1-nolange79@gmail.com>
Message-ID: <20200609224116.13607-2-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop default dependencies, haveged needs nothing but
local sockets and /dev/random.

The service file now mostly matches the upstream fedora file,
except alot of isolation options have been dropped.
The benefit for a completely controlled system is small,
and those option would pull in dependencies, delaying
entropy being filled up.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/haveged/haveged.service | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/package/haveged/haveged.service b/package/haveged/haveged.service
index 91035c6711..cfdaa93a37 100644
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
+# This would wait for filesystems, but we only need /dev/random,
+# which is certainly available after systemd initialised
+# After=systemd-tmpfiles-setup-dev.service
+Before=sysinit.target shutdown.target systemd-journald.service
 
 [Service]
-ExecStart=/usr/sbin/haveged -F -w 1024 -v 1
-SuccessExitStatus=143
+ExecStart=/usr/sbin/haveged -w 1024 -v 1 --Foreground
+Restart=always
+SuccessExitStatus=137 143
+
+# Only simple isolation methods that dont pull in dependencies
+CapabilityBoundingSet=CAP_SYS_ADMIN
+SecureBits=noroot-locked
+ProtectSystem=full
 
 [Install]
-WantedBy=multi-user.target
+WantedBy=sysinit.target
-- 
2.26.2
