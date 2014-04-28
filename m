From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 28 Apr 2014 13:20:27 +0300
Subject: [Buildroot] [PATCH] iproute2: fix build without threads
Message-ID: <ac8ac9d4494067e153caae00d4340d9db7fb91d9.1398680427.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

arpd link command lists -pthread explicitly. Disable arpd when threads are not
supported.

Fixes:
http://autobuild.buildroot.net/results/88e/88eac71e674f773439b953956af3ded71465cf9e/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/iproute2/iproute2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index e51c33b926ed..841deb2625c9 100644
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
-- 
1.9.2
