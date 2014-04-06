From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Apr 2014 17:04:48 +0200
Subject: [Buildroot] [PATCH] package/eudev: use new upstream patch to fix
	fcntl issue
Message-ID: <1396796688-31522-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

This is upstream's third attempt at fixing the issue.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 ...e-87-fails-to-build-on-linux-headers-3.13.patch | 183 ++++++++++++++-------
 1 file changed, 121 insertions(+), 62 deletions(-)

diff --git a/package/eudev/eudev-0001-Fix-issue-87-fails-to-build-on-linux-headers-3.13.patch b/package/eudev/eudev-0001-Fix-issue-87-fails-to-build-on-linux-headers-3.13.patch
index 80f7aa8..5a37470 100644
--- a/package/eudev/eudev-0001-Fix-issue-87-fails-to-build-on-linux-headers-3.13.patch
+++ b/package/eudev/eudev-0001-Fix-issue-87-fails-to-build-on-linux-headers-3.13.patch
@@ -1,85 +1,144 @@
-From c5a77c7d10bafac25deca8e3c36946df0dc43071 Mon Sep 17 00:00:00 2001
-From: "Anthony G. Basile" <blueness@gentoo.org>
-Date: Sat, 15 Mar 2014 08:16:41 -0400
-Subject: [PATCH] Fix issue #87: fails to build on linux headers 3.13
+commit 4b76ac0bff27c0a32fc22591ec4543768ae5b991
+Author: Anthony G. Basile <blueness@gentoo.org>
+Date:   Sat Apr 5 16:32:30 2014 -0400
 
-Commit 80b10107cb added #include <linux/fcntl.h> in
-src/accelerometer and friends for builds on uclibc.
-This only works with glibc and musl systems with
-linux headers 3.9 but fails with linux headers 3.13.
+    Revisit issue #87: fails to build on linux headers 3.13
+    
+    We switch to defining _GNU_SOURCE as we do for cdrom_id.c
+    for a more consistant approach to this issue.
+    
+    Signed-off-by: Anthony G. Basile <blueness@gentoo.org>
 
-We keep <linux/fcntl.h> but drop <fcntl.h>.
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Signed-off-by: Anthony G. Basile <blueness@gentoo.org>
----
- src/accelerometer/accelerometer.c |    1 -
- src/ata_id/ata_id.c               |    1 -
- src/collect/collect.c             |    1 -
- src/mtd_probe/mtd_probe.c         |    1 -
- src/scsi_id/scsi_serial.c         |    1 -
- 5 files changed, 5 deletions(-)
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 
 diff --git a/src/accelerometer/accelerometer.c b/src/accelerometer/accelerometer.c
-index f65631a..386775b 100644
+index beed53c..501caa4 100644
 --- a/src/accelerometer/accelerometer.c
 +++ b/src/accelerometer/accelerometer.c
-@@ -50,7 +50,6 @@
- #include <math.h>
- #include <sys/types.h>
- #include <sys/stat.h>
--#include <fcntl.h>
- #include <stdlib.h>
- #include <unistd.h>
- #include <getopt.h>
+@@ -44,6 +44,10 @@
+  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+  */
+ 
++#ifndef _GNU_SOURCE
++#define _GNU_SOURCE 1
++#endif
++
+ #include <stdio.h>
+ #include <string.h>
+ #include <stdbool.h>
+@@ -58,10 +62,6 @@
+ #include <linux/limits.h>
+ #include <linux/input.h>
+ 
+-#ifdef __UCLIBC__
+-#include <linux/fcntl.h>
+-#endif
+-
+ #include "libudev.h"
+ #include "libudev-private.h"
+ 
 diff --git a/src/ata_id/ata_id.c b/src/ata_id/ata_id.c
-index a25c713..500669c 100644
+index 93dbb53..b416cde 100644
 --- a/src/ata_id/ata_id.c
 +++ b/src/ata_id/ata_id.c
-@@ -23,7 +23,6 @@
+@@ -19,6 +19,10 @@
+  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+  */
+ 
++#ifndef _GNU_SOURCE
++#define _GNU_SOURCE 1
++#endif
++
+ #include <stdio.h>
  #include <stdlib.h>
  #include <stdint.h>
- #include <unistd.h>
--#include <fcntl.h>
- #include <ctype.h>
- #include <string.h>
- #include <errno.h>
+@@ -41,10 +45,6 @@
+ #include <linux/bsg.h>
+ #include <arpa/inet.h>
+ 
+-#ifdef __UCLIBC__
+-#include <linux/fcntl.h>
+-#endif
+-
+ #include "libudev.h"
+ #include "libudev-private.h"
+ #include "log.h"
 diff --git a/src/collect/collect.c b/src/collect/collect.c
-index fbaf87f..7fefc62 100644
+index 9d1a97e..05d6517 100644
 --- a/src/collect/collect.c
 +++ b/src/collect/collect.c
-@@ -24,7 +24,6 @@
+@@ -19,6 +19,10 @@
+  *
+  */
+ 
++#ifndef _GNU_SOURCE
++#define _GNU_SOURCE 1
++#endif
++
+ #include <stdio.h>
+ #include <stdlib.h>
  #include <stddef.h>
- #include <unistd.h>
- #include <signal.h>
--#include <fcntl.h>
- #include <errno.h>
- #include <string.h>
- #include <getopt.h>
+@@ -31,10 +35,6 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ 
+-#ifdef __UCLIBC__
+-#include <linux/fcntl.h>
+-#endif
+-
+ #include "libudev.h"
+ #include "libudev-private.h"
+ #include "macro.h"
 diff --git a/src/mtd_probe/mtd_probe.c b/src/mtd_probe/mtd_probe.c
-index e604a72..bab2e8e 100644
+index ffba0eb..0fbf3ab 100644
 --- a/src/mtd_probe/mtd_probe.c
 +++ b/src/mtd_probe/mtd_probe.c
-@@ -22,7 +22,6 @@
- #include <mtd/mtd-user.h>
- #include <sys/types.h>
- #include <sys/stat.h>
--#include <fcntl.h>
+@@ -16,6 +16,11 @@
+  * Foundation, Inc., 51 Franklin St, Fifth Floor,
+  * Boston, MA  02110-1301  USA
+  */
++
++#ifndef _GNU_SOURCE
++#define _GNU_SOURCE 1
++#endif
++
+ #include "mtd_probe.h"
+ #include <stdio.h>
+ #include <sys/ioctl.h>
+@@ -26,10 +31,6 @@
  #include <unistd.h>
  #include <stdlib.h>
- #include <linux/fcntl.h>
+ 
+-#ifdef __UCLIBC__
+-#include <linux/fcntl.h>
+-#endif
+-
+ int main(int argc, char** argv)
+ {
+         int mtd_fd;
 diff --git a/src/scsi_id/scsi_serial.c b/src/scsi_id/scsi_serial.c
-index b60b154..7c5f7a3 100644
+index b9a94e6..c3f957d 100644
 --- a/src/scsi_id/scsi_serial.c
 +++ b/src/scsi_id/scsi_serial.c
-@@ -23,7 +23,6 @@
- #include <stdio.h>
- #include <errno.h>
- #include <string.h>
--#include <fcntl.h>
- #include <stdlib.h>
- #include <unistd.h>
- #include <syslog.h>
---
-1.7.9.5
-
+@@ -17,6 +17,10 @@
+  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+  */
+ 
++#ifndef _GNU_SOURCE
++#define _GNU_SOURCE 1
++#endif
++
+ #include <sys/types.h>
+ #include <sys/ioctl.h>
+ #include <sys/stat.h>
+@@ -34,10 +38,6 @@
+ #include <linux/types.h>
+ #include <linux/bsg.h>
+ 
+-#ifdef __UCLIBC__
+-#include <linux/fcntl.h>
+-#endif
+-
+ #include "libudev.h"
+ #include "libudev-private.h"
+ #include "scsi.h"
-- 
1.8.3.2
