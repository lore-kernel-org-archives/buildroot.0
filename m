From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Oct 2018 10:03:53 +0200
Subject: [Buildroot] [git commit] haproxy: put back dependency on __sync_*_4
Message-ID: <20181014080257.5523383682@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=443c21ec373a35e8d5a0c8750f6ed2312623b27e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

__sync_*_4 intrinsics is used by common/hathreads.h when gcc < 4.7 but
also by contrib/tcploop.c or include/proto/shctx.h so put back a
mandatory dependency on BR2_TOOLCHAIN_HAS_SYNC_4 which has been
wrongly removed by commit f22fca4bf27f884950dd7804020e5d5193b570b9
("haproxy: tweak thread activation").

Fixes:
 - http://autobuild.buildroot.net/results/52c88f2f27e1a3c42cf71554cf680da86d933ef6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/haproxy/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/haproxy/Config.in b/package/haproxy/Config.in
index fbe5941b55..cbcbc0c388 100644
--- a/package/haproxy/Config.in
+++ b/package/haproxy/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HAPROXY
 	bool "haproxy"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
 	help
 	  HAProxy is a free, very fast and reliable solution offering
 	  high availability, load balancing, and proxying for TCP and
