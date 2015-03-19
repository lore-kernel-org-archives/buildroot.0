From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 19 Mar 2015 09:27:37 +0000
Subject: [Buildroot] [PATCH 2/2] trinity: fix building with uClibc
In-Reply-To: <1426757257-2057-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1426757257-2057-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1426757257-2057-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"#include <linux/serial.h>" is needed in order to build trinity
successfully with uClibc. Otherwise it would fail displaying an error
message like this one:

-----------------------------------------
ioctls/vt.c:152:8: error: invalid application of 'sizeof' to incomplete
type 'struct serial_rs485'
  IOCTL(TIOCGRS485),

ioctls/vt.c:155:8: error: invalid application of 'sizeof' to incomplete
type 'struct serial_rs485'
  IOCTL(TIOCSRS485),
-----------------------------------------

Backporting an upstream patch to fix this problem.

Upstream commit:

  https://github.com/kernelslacker/trinity/commit/fb4a1adc4540f0702b84aa900f2b8ebed004885d

Fixes:

  http://autobuild.buildroot.net/results/ca1/ca18c7d19ac2870d6b973923c8225509a12f831a/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...ssing-include-to-fix-building-with-uClibc.patch |   47 ++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)
 create mode 100644 package/trinity/0001-vt.c-add-missing-include-to-fix-building-with-uClibc.patch

diff --git a/package/trinity/0001-vt.c-add-missing-include-to-fix-building-with-uClibc.patch b/package/trinity/0001-vt.c-add-missing-include-to-fix-building-with-uClibc.patch
new file mode 100644
index 0000000..e1d23cd
--- /dev/null
+++ b/package/trinity/0001-vt.c-add-missing-include-to-fix-building-with-uClibc.patch
@@ -0,0 +1,47 @@
+vt.c: add missing include to fix building with uClibc
+
+Backporting an upstream patch to fix a building issue with uClibc.
+
+Upstream commit:
+
+  https://github.com/kernelslacker/trinity/commit/fb4a1adc4540f0702b84aa900f2b8ebed004885d
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From fb4a1adc4540f0702b84aa900f2b8ebed004885d Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Wed, 18 Mar 2015 09:58:46 +0000
+Subject: [PATCH] vt.c: add missing include to fix building with uClibc
+
+"#include <linux/serial.h>" is needed in order to build trinity
+successfully with uClibc. Otherwise it would fail displaying an error
+message like this one:
+
+ioctls/vt.c:152:8: error: invalid application of 'sizeof' to incomplete
+type 'struct serial_rs485'
+  IOCTL(TIOCGRS485),
+
+ioctls/vt.c:155:8: error: invalid application of 'sizeof' to incomplete
+type 'struct serial_rs485'
+  IOCTL(TIOCSRS485),
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ ioctls/vt.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/ioctls/vt.c b/ioctls/vt.c
+index 5e7e7d7..a4a7e0c 100644
+--- a/ioctls/vt.c
++++ b/ioctls/vt.c
+@@ -1,6 +1,7 @@
+ #include <sys/vt.h>
+ #include <sys/ioctl.h>
+ #include <linux/kd.h>
++#include <linux/serial.h>
+ 
+ #include "utils.h"
+ #include "ioctls.h"
+-- 
+1.7.1
+
-- 
1.7.1
