From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 10:27:35 +0200
Subject: [Buildroot] [git commit] package/mbuffer: fix include to get
 'struct timespec'
Message-ID: <20200413081504.BCA738E968@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3722b75923f59d30b04096fe32467bac165ef95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch for mbuffer that fixes the build with older
glibc versions, by making sure we abide by the standards to get the
definition of 'struct timespec'.

Fixes:

  http://autobuild.buildroot.net/results/598a3c22dfff7915db4ac2cb1fae0dec67cc0f7e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...c-properly-get-struct-timespec-definition.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/mbuffer/0001-globals.c-properly-get-struct-timespec-definition.patch b/package/mbuffer/0001-globals.c-properly-get-struct-timespec-definition.patch
new file mode 100644
index 0000000000..fd14a5d759
--- /dev/null
+++ b/package/mbuffer/0001-globals.c-properly-get-struct-timespec-definition.patch
@@ -0,0 +1,38 @@
+From 1fc7ac1e29eb6a0311d2d4c209f55adb92740d50 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Mon, 13 Apr 2020 09:56:16 +0200
+Subject: [PATCH] globals.c: properly get 'struct timespec' definition
+
+'struct timespec' is defined in <time.h>, and according to man
+nanosleep(2), only available if _POSIX_C_SOURCE >= 199309L.
+
+Fixes:
+
+globals.c:90:2: error: storage size of 'Starttime' isn't known
+  Starttime;
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ globals.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/globals.c b/globals.c
+index 5c10312..1c0ce80 100644
+--- a/globals.c
++++ b/globals.c
+@@ -17,10 +17,11 @@
+  *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
+  */
+ 
++#define _POSIX_C_SOURCE 199309L
+ #include "dest.h"
+ #include "globals.h"
+ #include <fcntl.h>
+-#include <sys/time.h>
++#include <time.h>
+ 
+ dest_t *Dest = 0;
+ 
+-- 
+2.25.2
+
