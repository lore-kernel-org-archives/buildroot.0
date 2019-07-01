From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  1 Jul 2019 22:18:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
Message-ID: <20190701201834.19994-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch which was applied upstream.
Added patch to fix uClibc build error.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ude-stdio.h-before-tvheadend-headers.patch | 63 +++++++++++++++++++
 ...pie-linking-according-to-disable-pie.patch | 34 ----------
 package/tvheadend/tvheadend.hash              |  2 +-
 package/tvheadend/tvheadend.mk                |  2 +-
 4 files changed, 65 insertions(+), 36 deletions(-)
 create mode 100644 package/tvheadend/0002-Include-stdio.h-before-tvheadend-headers.patch
 delete mode 100644 package/tvheadend/0002-Makefile-fix-pie-linking-according-to-disable-pie.patch

diff --git a/package/tvheadend/0002-Include-stdio.h-before-tvheadend-headers.patch b/package/tvheadend/0002-Include-stdio.h-before-tvheadend-headers.patch
new file mode 100644
index 0000000000..5c111ad161
--- /dev/null
+++ b/package/tvheadend/0002-Include-stdio.h-before-tvheadend-headers.patch
@@ -0,0 +1,63 @@
+From 5387b1b8decc1767a200c7fd860472225a10878d Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Mon, 1 Jul 2019 22:08:47 +0200
+Subject: [PATCH] Include stdio.h before tvheadend headers
+
+Fixes build error with uClibc: https://www.tvheadend.org/issues/5667
+
+Patch sent upstream:
+https://github.com/tvheadend/tvheadend/pull/1283
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/main.c       | 2 +-
+ src/tvh_locale.c | 1 +
+ src/tvhlog.c     | 2 +-
+ 3 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/main.c b/src/main.c
+index 0e3bb4ab0..feb8e3025 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -16,10 +16,10 @@
+  *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
+  */
+ 
++#include <stdio.h>
+ #include <tvh_thread.h>
+ #include <sys/stat.h>
+ #include <fcntl.h>
+-#include <stdio.h>
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/src/tvh_locale.c b/src/tvh_locale.c
+index a7c5150f5..7d1420e99 100644
+--- a/src/tvh_locale.c
++++ b/src/tvh_locale.c
+@@ -16,6 +16,7 @@
+  *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
+  */
+ 
++#include <stdio.h>
+ #include "tvh_thread.h"
+ #include "tvh_locale.h"
+ #include "tvh_string.h"
+diff --git a/src/tvhlog.c b/src/tvhlog.c
+index 156b2110b..5e025cec4 100644
+--- a/src/tvhlog.c
++++ b/src/tvhlog.c
+@@ -16,9 +16,9 @@
+  *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
+  */
+ 
++#include <stdio.h>
+ #include "tvhlog.h"
+ #include <string.h>
+-#include <stdio.h>
+ #include <stdlib.h>
+ #include <sys/time.h>
+ #include <sys/types.h>
+-- 
+2.20.1
+
diff --git a/package/tvheadend/0002-Makefile-fix-pie-linking-according-to-disable-pie.patch b/package/tvheadend/0002-Makefile-fix-pie-linking-according-to-disable-pie.patch
deleted file mode 100644
index 385c94b36b..0000000000
--- a/package/tvheadend/0002-Makefile-fix-pie-linking-according-to-disable-pie.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 5cbf08213222cb507d365e6cbda87277f0b8f31e Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@micronovasrl.com>
-Date: Fri, 14 Jun 2019 14:25:08 +0200
-Subject: [PATCH] Makefile: fix -pie linking according to --disable-pie
-
-Only compilation follows './configure --disable-pie', linking instead
-doesn't, because '-pie' flag is passed to LDFLAGS uncoditionally.
-
-So add '-pie' flag only if CONFIG_PIE=yes.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
----
- Makefile | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 41783b546..4e5a947a3 100644
---- a/Makefile
-+++ b/Makefile
-@@ -62,7 +62,10 @@ LDFLAGS += -ldl -lm
- else
- LDFLAGS += -ldl -lpthread -lm
- endif
--LDFLAGS += -pie -Wl,-z,now
-+ifeq ($(CONFIG_PIE),yes)
-+LDFLAGS += -pie
-+endif
-+LDFLAGS += -Wl,-z,now
- ifeq ($(CONFIG_LIBICONV),yes)
- LDFLAGS += -liconv
- endif
--- 
-2.17.1
-
diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 43178b874a..243b6a1bdc 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 92c5f2cdda085b81fc50025afeb3ece74f60fae2b26f40a7dd07e227b0db2d9f  tvheadend-17dff3e5ffbd67174b6c0d7b49f5488e19ec1ead.tar.gz
+sha256 6efa0b62f004829f91243939181ddb08d2f7da05105e2b2305a15ce512ba3de3  tvheadend-dcc50db45b322da22241c01807643160c16ccfc2.tar.gz
 sha256 54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index b192a33d4a..1f4de5082c 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 17dff3e5ffbd67174b6c0d7b49f5488e19ec1ead
+TVHEADEND_VERSION = dcc50db45b322da22241c01807643160c16ccfc2
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.20.1
