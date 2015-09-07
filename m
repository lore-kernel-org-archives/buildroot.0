From: Francesco Nwokeka <francesco.nwokeka@gmail.com>
Date: Mon,  7 Sep 2015 10:36:06 +0200
Subject: [Buildroot] [PATCH 5/5] package/at: added previous patches from
	v3.1.13 and left out obsolete patches
Message-ID: <1441614966-10707-1-git-send-email-francesco.nwokeka@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francesco Nwokeka <francesco.nwokeka@gmail.com>
---
 package/at/0003-getloadavg.c-fix.patch             | 30 ++++++++++++++++++++++
 package/at/0004-parsetime.l-include-config-h.patch | 16 ++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 package/at/0003-getloadavg.c-fix.patch
 create mode 100644 package/at/0004-parsetime.l-include-config-h.patch

diff --git a/package/at/0003-getloadavg.c-fix.patch b/package/at/0003-getloadavg.c-fix.patch
new file mode 100644
index 0000000..e073927
--- /dev/null
+++ b/package/at/0003-getloadavg.c-fix.patch
@@ -0,0 +1,30 @@
+[PATCH]: fix getloadavg.c compilation, revert to 3.1.10 version
+
+getloadavg.c shipped with 3.1.13 doesn't compile because it references
+headers not shipped. Fix it by simply reverting to the 3.1.10 version.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ getloadavg.c |    7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+Index: at-3.1.13/getloadavg.c
+===================================================================
+--- at-3.1.13.orig/getloadavg.c
++++ at-3.1.13/getloadavg.c
+@@ -66,11 +66,12 @@ Boston, MA  02110-1301  USA */
+ 
+ /* This should always be first.  */
+ #ifdef HAVE_CONFIG_H
+-#include <config.h>
++#include "config.h"
+ #endif
+ 
+-#include "lisp.h"
+-#include "sysfile.h" /* for encapsulated open, close, read, write */
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <fcntl.h>
+ 
+ #ifndef HAVE_GETLOADAVG
+ 
diff --git a/package/at/0004-parsetime.l-include-config-h.patch b/package/at/0004-parsetime.l-include-config-h.patch
new file mode 100644
index 0000000..f4111eb
--- /dev/null
+++ b/package/at/0004-parsetime.l-include-config-h.patch
@@ -0,0 +1,16 @@
+Make sure to include config.h so that NEEDS_* macros are properly
+taken into account. This was a problem for NEEDS_YYWRAP, which was set
+to 1 in config.h, but the corresponding code wasn't compiled in.
+
+Index: at-3.1.13/parsetime.l
+===================================================================
+--- at-3.1.13.orig/parsetime.l
++++ at-3.1.13/parsetime.l
+@@ -4,6 +4,7 @@
+ #include <time.h>
+ #include "y.tab.h"
+ #include "parsetime.h"
++#include "config.h"
+ 
+ char *last_token = NULL;
+ char **my_argv;
-- 
2.5.1
