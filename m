From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 23:23:49 +0200
Subject: [Buildroot] [git commit] package/net-tools: bump version
Message-ID: <20170922212108.2CE5E8104F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a582cd3ca6389027c1b429c002a9769d3df026c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch, not needed anymore after upstream commits
https://sourceforge.net/p/net-tools/code/ci/ea3935bd7c0f36c86c40e5785326698fa3336c6a/
https://sourceforge.net/p/net-tools/code/ci/45d573a89386c934d3ebac499d00c1670437813b/

Added sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-iptunnel.c-do-not-include-netinet-ip.h.patch | 72 ----------------------
 package/net-tools/net-tools.hash                   |  2 +
 package/net-tools/net-tools.mk                     |  2 +-
 3 files changed, 3 insertions(+), 73 deletions(-)

diff --git a/package/net-tools/0001-iptunnel.c-do-not-include-netinet-ip.h.patch b/package/net-tools/0001-iptunnel.c-do-not-include-netinet-ip.h.patch
deleted file mode 100644
index a8658c4..0000000
--- a/package/net-tools/0001-iptunnel.c-do-not-include-netinet-ip.h.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From eec38a200357b195efbb23bb645ab721c040f246 Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Thu, 3 Nov 2016 12:59:39 +0000
-Subject: [PATCH] iptunnel.c: do not include netinet/ip.h
-
-This fixes a struct redefinition problem like this one:
-
-================================
-In file included from /usr/include/linux/if_tunnel.h:6:0,
-                 from iptunnel.c:34:
-/usr/include/linux/ip.h:85:8: error: redefinition of 'struct iphdr'
- struct iphdr {
-        ^
-In file included from iptunnel.c:29:0:
-/usr/include/netinet/ip.h:45:8: note: originally defined here
- struct iphdr
-        ^
-================================
-
-iptunnel.c includes netinet/ip.h which contains a definition of the
-iphdr struct.
-
-iptunnel.c also includes linux/if_tunnel.h which includes linux/ip.h
-which contains a definition of the iphdr struct.
-
-So, both netinet/ip.h and linux/ip.h define the iphdr struct, and both
-of them have been included directly or indirectly by iptunnel.c. Because
-of that the compilation fails due to a struct redefinition.
-
-The problem can be solved by just not including netinet/ip.h.
-
-However, some Linux headers included in certain toolchains may not have
-an updated linux/if_tunnel.h which includes linux/ip.h, so we need to
-include it unconditionally otherwise linux/if_tunnel.h will use the
-struct iphdr before being defined and the compilation will also fail in
-this way:
-
-================================
-In file included from iptunnel.c:33:0:
-/usr/include/linux/if_tunnel.h:37:16: error: field 'iph' has incomplete type
-  struct iphdr  iph;
-                  ^
-================================
-
-Upstream status: merge request sent
-https://sourceforge.net/p/net-tools/code/merge-requests/4/
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- iptunnel.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/iptunnel.c b/iptunnel.c
-index 3fe1b84..e2ec2d8 100644
---- a/iptunnel.c
-+++ b/iptunnel.c
-@@ -26,11 +26,11 @@
- #include <sys/socket.h>
- #include <sys/ioctl.h>
- #include <netinet/in.h>
--#include <netinet/ip.h>
- #include <arpa/inet.h>
- #include <net/if.h>
- #include <net/if_arp.h>
- #include <linux/types.h>
-+#include <linux/ip.h>
- #include <linux/if_tunnel.h>
-
- #include "config.h"
--- 
-2.10.1
-
diff --git a/package/net-tools/net-tools.hash b/package/net-tools/net-tools.hash
new file mode 100644
index 0000000..766b6fa
--- /dev/null
+++ b/package/net-tools/net-tools.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 f7cfe9e73825bac9ab1a6f99d1fc7f54bfd9d33a6f62ba58d28a566905c4e86c  net-tools-479bb4a7e11a4084e2935c0a576388f92469225b.tar.gz
diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index bc87290..adab475 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NET_TOOLS_VERSION = 3f170bff115303e92319791cbd56371e33dcbf6d
+NET_TOOLS_VERSION = 479bb4a7e11a4084e2935c0a576388f92469225b
 NET_TOOLS_SITE = git://git.code.sf.net/p/net-tools/code
 NET_TOOLS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 NET_TOOLS_LICENSE = GPL-2.0+
