From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Aug 2015 11:21:28 +0200
Subject: [Buildroot] [git commit branch/next] package/ifplugd: add patch to
	fix musl build error
Message-ID: <20150808105653.12D5E7FE0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3dcbb9e56c1c712c505d4b3b67c78936d17d118b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The musl C library does not define type names such as `__uint32_t`. Instead we
use the integer types declared in the ISO C standard header file <stdint.h>.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ifplugd/0004-musl-fix-types.patch |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/ifplugd/0004-musl-fix-types.patch b/package/ifplugd/0004-musl-fix-types.patch
new file mode 100644
index 0000000..174f9c8
--- /dev/null
+++ b/package/ifplugd/0004-musl-fix-types.patch
@@ -0,0 +1,24 @@
+The musl C library does not define type names such as `__uint32_t`. Instead we
+use the integer types declared in the ISO C standard header file <stdint.h>.
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
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
