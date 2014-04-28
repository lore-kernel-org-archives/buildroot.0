From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Apr 2014 14:08:19 +0200
Subject: [Buildroot] [git commit] iproute2: fix build without threads
Message-ID: <20140428121300.3F8579C9C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a0947ce96bda22e81f60544c3ae9f37ed7fab7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

arpd link command lists -pthread explicitly. Disable arpd when threads are not
supported.

Fixes:
http://autobuild.buildroot.net/results/88e/88eac71e674f773439b953956af3ded71465cf9e/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iproute2/iproute2.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index e51c33b..841deb2 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -32,8 +32,8 @@ define IPROUTE2_WITH_IPTABLES
 endef
 endif
 
-# arpd needs BerkeleyDB
-ifeq ($(BR2_PACKAGE_BERKELEYDB_COMPAT185),y)
+# arpd needs BerkeleyDB and links against pthread
+ifeq ($(BR2_PACKAGE_BERKELEYDB_COMPAT185)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 IPROUTE2_DEPENDENCIES += berkeleydb
 else
 define IPROUTE2_DISABLE_ARPD
