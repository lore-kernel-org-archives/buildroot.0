From: Norbert Lange <nolange79@gmail.com>
Date: Sat,  6 Jun 2020 00:54:21 +0200
Subject: [Buildroot] [PATCH] package/haveged: Allow service to run early
Message-ID: <20200605225421.13494-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop default dependencies, haveged needs nothing but
local sockets and /dev/random.
This allows the entropy to be available earlier.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/haveged/haveged.service | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/haveged/haveged.service b/package/haveged/haveged.service
index 91035c6711..ed9f043a91 100644
--- a/package/haveged/haveged.service
+++ b/package/haveged/haveged.service
@@ -1,10 +1,13 @@
 [Unit]
 Description=Entropy Harvesting Daemon
 Documentation=man:haveged(8)
+DefaultDependencies=no
+Conflicts=shutdown.target
+Before=sysinit.target shutdown.target systemd-update-done.service
 
 [Service]
 ExecStart=/usr/sbin/haveged -F -w 1024 -v 1
 SuccessExitStatus=143
 
 [Install]
-WantedBy=multi-user.target
+WantedBy=sysinit.target
-- 
2.26.2
