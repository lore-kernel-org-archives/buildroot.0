From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Oct 2018 21:45:27 +0200
Subject: [Buildroot] [PATCH 1/1] haproxy: put back dependency on __sync_*_4
Message-ID: <20181005194527.12140-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

__sync_*_4 intrinsics is used by common/hathreads.h when gcc < 4.7 but
also by contrib/tcploop.c or include/proto/shctx.h so put back a
mandatory dependency on BR2_TOOLCHAIN_HAS_SYNC_4 which has been wrongly
removed by patch 978001

Fixes:
 - http://autobuild.buildroot.net/results/52c88f2f27e1a3c42cf71554cf680da86d933ef6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.17.1
