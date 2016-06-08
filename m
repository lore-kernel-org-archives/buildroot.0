From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 23:24:39 +0200
Subject: [Buildroot] [git commit] package/openpowerlink: fix uClibc build
Message-ID: <20160608212445.F27C381EF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebb6878fffd0ce85814c0781a4167dee069a11a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the demo application code, va_list type is used in eventlogstring.h
so stdarg.h must be included to define it.

This problem occurs with a uClibc-ng based toolchain.

Fixes:
http://autobuild.buildroot.net/results/a9e/a9e7615a19922706039bf97ccb94bcf5b99330b2

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...apps-include-stdarg.h-in-eventlogstring.h.patch | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/package/openpowerlink/0007-apps-include-stdarg.h-in-eventlogstring.h.patch b/package/openpowerlink/0007-apps-include-stdarg.h-in-eventlogstring.h.patch
new file mode 100644
index 0000000..70e44c2
--- /dev/null
+++ b/package/openpowerlink/0007-apps-include-stdarg.h-in-eventlogstring.h.patch
@@ -0,0 +1,61 @@
+From 533f40e097b8d08e1dfeb03e2484a4369fad778f Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Wed, 8 Jun 2016 13:13:36 +0200
+Subject: [PATCH] [FIX] apps: include stdarg.h in eventlogstring.h
+
+va_list type is used in eventlogstring.h so it must include stdarg.h to define
+it.
+
+Upstream status: Pending
+https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2/pull/127
+
+Fixes:
+http://autobuild.buildroot.net/results/a9e/a9e7615a19922706039bf97ccb94bcf5b99330b2/build-end.log
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ apps/common/src/eventlog/eventlog.c       | 1 -
+ apps/common/src/eventlog/eventlogstring.c | 1 -
+ apps/common/src/eventlog/eventlogstring.h | 2 ++
+ 3 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/apps/common/src/eventlog/eventlog.c b/apps/common/src/eventlog/eventlog.c
+index f2193e2..eba1101 100644
+--- a/apps/common/src/eventlog/eventlog.c
++++ b/apps/common/src/eventlog/eventlog.c
+@@ -47,7 +47,6 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ //------------------------------------------------------------------------------
+ 
+ #include <stdio.h>
+-#include <stdarg.h>
+ #include <time.h>
+ 
+ #include <oplk/debugstr.h>
+diff --git a/apps/common/src/eventlog/eventlogstring.c b/apps/common/src/eventlog/eventlogstring.c
+index 9fb677b..a55a1a4 100644
+--- a/apps/common/src/eventlog/eventlogstring.c
++++ b/apps/common/src/eventlog/eventlogstring.c
+@@ -47,7 +47,6 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ #include "eventlogstring.h"
+ 
+ #include <stdio.h>
+-#include <stdarg.h>
+ #include <time.h>
+ 
+ #include <oplk/debugstr.h>
+diff --git a/apps/common/src/eventlog/eventlogstring.h b/apps/common/src/eventlog/eventlogstring.h
+index 2c291a6..3a5f2fa 100644
+--- a/apps/common/src/eventlog/eventlogstring.h
++++ b/apps/common/src/eventlog/eventlogstring.h
+@@ -41,6 +41,8 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ //------------------------------------------------------------------------------
+ // includes
+ //------------------------------------------------------------------------------
++#include <stdarg.h>
++
+ #include <oplk/oplk.h>
+ #include <oplk/nmt.h>
+ 
+-- 
+2.5.5
+
