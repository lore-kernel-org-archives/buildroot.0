From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 23 Sep 2010 22:09:25 +0200
Subject: [Buildroot] [git commit master 1/1] openvpn: bump version,
	fix build with --disable-crypto
Message-ID: <20100923200951.D69F48B654@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=abbd7223b23252d718b379c2a7345038b4a159eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...envpn-2.1.3-fix-build-with-disable-crypto.patch |   30 ++++++++++++++++++++
 package/openvpn/openvpn.mk                         |    2 +-
 2 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 package/openvpn/openvpn-2.1.3-fix-build-with-disable-crypto.patch

diff --git a/package/openvpn/openvpn-2.1.3-fix-build-with-disable-crypto.patch b/package/openvpn/openvpn-2.1.3-fix-build-with-disable-crypto.patch
new file mode 100644
index 0000000..5466558
--- /dev/null
+++ b/package/openvpn/openvpn-2.1.3-fix-build-with-disable-crypto.patch
@@ -0,0 +1,30 @@
+[PATCH] fix build with --disable-crypto
+
+options.c is missing the definition for struct context when built with
+--disable-crypto, as it then doesn't get pulled in through push.h,
+leading to build errors like:
+
+options.c: In function ???parse_http_proxy_fallback???:
+options.c:1474: error: dereferencing pointer to incomplete type
+options.c:1477: error: dereferencing pointer to incomplete type
+options.c:1478: error: dereferencing pointer to incomplete type
+
+Fix it by including forward.h
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ options.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+Index: openvpn-2.1.3/options.c
+===================================================================
+--- openvpn-2.1.3.orig/options.c
++++ openvpn-2.1.3/options.c
+@@ -29,6 +29,7 @@
+ 
+ #include "syshead.h"
+ 
++#include "forward.h"
+ #include "buffer.h"
+ #include "error.h"
+ #include "common.h"
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 8d99cab..7d8fb0c 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENVPN_VERSION = 2.1.2
+OPENVPN_VERSION = 2.1.3
 OPENVPN_SITE = http://openvpn.net/release
 OPENVPN_CONF_OPT = --enable-small
 
-- 
1.7.1
