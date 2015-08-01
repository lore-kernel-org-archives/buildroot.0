From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat,  1 Aug 2015 18:54:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/ifplugd: add patch to fix musl
	build error
Message-ID: <1438448071-26514-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The musl C library does not define type names such as `__uint32_t`. Instead we
use the integer types declared in the ISO C standard header file <stdint.h>.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/ifplugd/0004-musl-fix-types.patch | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/ifplugd/0004-musl-fix-types.patch

diff --git a/package/ifplugd/0004-musl-fix-types.patch b/package/ifplugd/0004-musl-fix-types.patch
new file mode 100644
index 0000000..174f9c8
--- /dev/null
+++ b/package/ifplugd/0004-musl-fix-types.patch
@@ -0,0 +1,24 @@
+The musl C library does not define type names such as `__uint32_t`. Instead we
+use the integer types declared in the ISO C standard header file <stdint.h>.
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+
+diff -purN ifplugd-0.28.orig/src/ethtool-local.h ifplugd-0.28/src/ethtool-local.h
+--- ifplugd-0.28.orig/src/ethtool-local.h	2015-08-01 18:43:47.360916834 +0200
++++ ifplugd-0.28/src/ethtool-local.h	2015-08-01 18:44:24.256037746 +0200
+@@ -21,10 +21,12 @@
+  * Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
+  */
+ 
++#include <stdint.h>
++
+ typedef unsigned long long u64;
+-typedef __uint32_t u32;        
+-typedef __uint16_t u16;        
+-typedef __uint8_t u8;          
++typedef uint32_t u32;
++typedef uint16_t u16;
++typedef uint8_t u8;
+ 
+ #include "ethtool-kernel.h"
+ 
-- 
2.5.0
