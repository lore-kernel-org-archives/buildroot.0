From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 23:43:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/macchanger: fix musl build
Message-ID: <1453588987-16758-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/2bc/2bccf3fd7060870a337c0bd7a9a750d0ad4e2c1c/
http://autobuild.buildroot.net/results/7d3/7d3f5bb036039b6966682eaf59b8600849f27034/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/macchanger/0001-fix-build-with-musl.patch | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 package/macchanger/0001-fix-build-with-musl.patch

diff --git a/package/macchanger/0001-fix-build-with-musl.patch b/package/macchanger/0001-fix-build-with-musl.patch
new file mode 100644
index 0000000..e6f6db5
--- /dev/null
+++ b/package/macchanger/0001-fix-build-with-musl.patch
@@ -0,0 +1,23 @@
+Fix musl build
+
+Downloaded from:
+https://github.com/openwrt/packages/blob/master/utils/macchanger/patches/0001-fix-build-with-musl.patch
+
+Bug was already reported upstream:
+https://github.com/alobbs/macchanger/issues/14
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+Index: macchanger-1.7.0/src/netinfo.c
+===================================================================
+--- macchanger-1.7.0.orig/src/netinfo.c
++++ macchanger-1.7.0/src/netinfo.c
+@@ -113,7 +113,7 @@ mc_net_info_get_permanent_mac (const net
+ 	epa->size = IFHWADDRLEN;
+ 
+ 	memcpy(&req, &(net->dev), sizeof(struct ifreq));
+-	req.ifr_data = (caddr_t)epa;
++	req.ifr_data = (char *)epa;
+ 
+ 	if (ioctl(net->sock, SIOCETHTOOL, &req) < 0) {
+ 		perror ("[ERROR] Could not read permanent MAC");
-- 
2.7.0.rc3
