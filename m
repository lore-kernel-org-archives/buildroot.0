From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Oct 2014 22:13:53 +0200
Subject: [Buildroot] [git commit] ser2net: Fix compilation failures due to
	missing TIOCSRS485 macro
Message-ID: <20141007203313.3BD30B0EAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e2ab06ad78f01f0c8b66c884d2c6b2fa771f068
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Apply a patch sent upstream to fix a compilation failure present on some
architectures which do not define the TIOCSRS485 macro and do not
include the <asm-generic/ioctls.h> header. This is how the error looks
like:

devcfg.c:781:34: error: 'TIOCSRS485' undeclared (first use in this
function)

Patch sent upstream:
	https://sourceforge.net/p/ser2net/mailman/message/32905302/

Fixes:
	http://autobuild.buildroot.net/results/5376a3f64c95f14449b956df006741ffeca1350b/
	http://autobuild.buildroot.net/results/d182d94562a549c79c0c9fb01777a7cb83d7ab4c/
	http://autobuild.buildroot.net/results/478c5ad2f5541adef4218ad485aab4d78cf29210/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...2net-0001-Fix-TIOCSRS485-undeclared-error.patch |   65 ++++++++++++++++++++
 1 files changed, 65 insertions(+), 0 deletions(-)

diff --git a/package/ser2net/ser2net-0001-Fix-TIOCSRS485-undeclared-error.patch b/package/ser2net/ser2net-0001-Fix-TIOCSRS485-undeclared-error.patch
new file mode 100644
index 0000000..9c6d168
--- /dev/null
+++ b/package/ser2net/ser2net-0001-Fix-TIOCSRS485-undeclared-error.patch
@@ -0,0 +1,65 @@
+ser2net: Fix compilation failures due to missing TIOCSRS485 macro
+
+Patch sent upstream:
+	https://sourceforge.net/p/ser2net/mailman/message/32905302/
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From: Yegor Yefremov <yegorslists@googlemail.com>
+
+include <asm-generic/ioctls.h> fixes compilations for systems,
+where <asm-generic/ioctls.h> won't be included automatically.
+
+Move special Linux includes to dataxfer.h.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ dataxfer.h | 5 +++--
+ devcfg.c   | 2 --
+ 2 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/dataxfer.h b/dataxfer.h
+index bd2665e..c3d7431 100644
+--- a/dataxfer.h
++++ b/dataxfer.h
+@@ -20,8 +20,6 @@
+ #ifndef DATAXFER
+ #define DATAXFER
+ 
+-#include <linux/serial.h>
+-
+ #include "controller.h"
+ 
+ #ifdef USE_UUCP_LOCKING
+@@ -30,6 +28,9 @@ extern int uucp_locking_enabled;
+ 
+ #ifdef linux
+ 
++#include <linux/serial.h>
++#include <asm-generic/ioctls.h>
++
+ #define USE_RS485_FEATURE
+ 
+ /* Check, if the toolchain provides serial_rs485 structure and macros */
+diff --git a/devcfg.c b/devcfg.c
+index ab819a6..1f84714 100644
+--- a/devcfg.c
++++ b/devcfg.c
+@@ -18,7 +18,6 @@
+  */
+ 
+ /* This code handles generating the configuration for the serial port. */
+-
+ #include <unistd.h>
+ #include <termios.h>
+ #include <sys/ioctl.h>
+@@ -31,7 +30,6 @@
+ #include <signal.h>
+ #include <errno.h>
+ #include <syslog.h>
+-#include <linux/serial.h>
+ 
+ #include "ser2net.h"
+ #include "selector.h"
+-- 
+1.9.1
