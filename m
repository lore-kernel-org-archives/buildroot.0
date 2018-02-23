From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Feb 2018 16:52:06 +0100
Subject: [Buildroot] [git commit branch/next] iptables: bump to version 1.6.2
Message-ID: <20180223155218.1C42988162@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1a8cdca5d5990ded69ebf521a4a4aa325fe1f6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also removed a patch fixing the build with musl as it made its way into
the 1.6.2 version.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...utils-nfsynproxy-fix-build-with-musl-libc.patch | 44 ----------------------
 package/iptables/iptables.hash                     |  6 +--
 package/iptables/iptables.mk                       |  2 +-
 3 files changed, 4 insertions(+), 48 deletions(-)

diff --git a/package/iptables/0001-utils-nfsynproxy-fix-build-with-musl-libc.patch b/package/iptables/0001-utils-nfsynproxy-fix-build-with-musl-libc.patch
deleted file mode 100644
index 1f86ad1354..0000000000
--- a/package/iptables/0001-utils-nfsynproxy-fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 06e0312d0bfd1f0b9e7c23ab654f18524d49e86b Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 2 Mar 2017 09:20:48 +0200
-Subject: [PATCH] utils: nfsynproxy: fix build with musl libc
-
-The musl libc exposes some struct tcphdr field only when _GNU_SOURCE is
-defined. Fix the following build failure:
-
-nfsynproxy.c: In function ???parse_packet???:
-nfsynproxy.c:34:9: error: ???const struct tcphdr??? has no member named ???syn???
-  if (!th->syn || !th->ack)
-         ^
-nfsynproxy.c:34:21: error: ???const struct tcphdr??? has no member named ???ack???
-  if (!th->syn || !th->ack)
-                     ^
-nfsynproxy.c:42:8: error: ???const struct tcphdr??? has no member named ???res2???
-  if (th->res2 == 0x1)
-        ^
-nfsynproxy.c:45:13: error: ???const struct tcphdr??? has no member named ???doff???
-  length = th->doff * 4 - sizeof(*th);
-             ^
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: pending (http://patchwork.ozlabs.org/patch/734503/)
-
- utils/nfsynproxy.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/utils/nfsynproxy.c b/utils/nfsynproxy.c
-index baedc92c5d9f..bf5c416340f1 100644
---- a/utils/nfsynproxy.c
-+++ b/utils/nfsynproxy.c
-@@ -6,6 +6,7 @@
-  * published by the Free Software Foundation.
-  */
- 
-+#define _GNU_SOURCE
- #include <stdlib.h>
- #include <stdbool.h>
- #include <unistd.h>
--- 
-2.11.0
-
diff --git a/package/iptables/iptables.hash b/package/iptables/iptables.hash
index b673c8abdb..8b191797fb 100644
--- a/package/iptables/iptables.hash
+++ b/package/iptables/iptables.hash
@@ -1,3 +1,3 @@
-# From ftp://ftp.netfilter.org/pub/iptables/iptables-1.6.1.tar.bz2.{md5sum,sha1sum}
-md5	ab38a33806b6182c6f53d6afb4619add	iptables-1.6.1.tar.bz2
-sha1	b2592490ca7a6c2cd0f069e167a4337c86acdf91	iptables-1.6.1.tar.bz2
+# From ftp://ftp.netfilter.org/pub/iptables/iptables-1.6.2.tar.bz2.{md5sum,sha1sum}
+md5	7d2b7847e4aa8832a18437b8a4c1873d	iptables-1.6.2.tar.bz2
+sha1	6279effbf8f2c7ff53d19ae13308f8a6e6a60dd9	iptables-1.6.2.tar.bz2
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 44cfde2b9a..49a537f608 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPTABLES_VERSION = 1.6.1
+IPTABLES_VERSION = 1.6.2
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_INSTALL_STAGING = YES
