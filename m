From: Vadym Kochan <vadim4j@gmail.com>
Date: Sat,  9 May 2020 20:05:03 +0300
Subject: [Buildroot] [PATCH] package/ndisc6: fix for codesourcery compilation
Message-ID: <20200509170503.346103-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

trace-{udp,tcp}.c uses BSD-style headers, it builds ok on some
latest libc compilation because they use:

    __extension__ union

but for example on codesourcery toolchain 4.x version it requires that
__FAVOR_BSD is defined. So fix it by defining this define only for
tcp/udp headers.

Fixes: http://autobuild.buildroot.net/results/d05d5471d10a2b6634711ccad75d7f86d222cc31

Signed-off-by: Vadym Kochan <vadim4j@gmail.com>
---
 ...x-compilation-for-codesourcery-toolc.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/ndisc6/0002-trace-udp-tcp-fix-compilation-for-codesourcery-toolc.patch

diff --git a/package/ndisc6/0002-trace-udp-tcp-fix-compilation-for-codesourcery-toolc.patch b/package/ndisc6/0002-trace-udp-tcp-fix-compilation-for-codesourcery-toolc.patch
new file mode 100644
index 0000000000..58b7584b4f
--- /dev/null
+++ b/package/ndisc6/0002-trace-udp-tcp-fix-compilation-for-codesourcery-toolc.patch
@@ -0,0 +1,46 @@
+From f654332ff631bf31e12c65685fd504166c93ef7f Mon Sep 17 00:00:00 2001
+From: Vadym Kochan <vadim4j@gmail.com>
+Date: Sat, 9 May 2020 19:29:24 +0300
+Subject: [PATCH] trace-{udp,tcp}: fix compilation for codesourcery toolchain
+
+Use __FAVOR_BSD define to enable BSD-like tcp/udp headers only
+for this particular case. Looks like this is needed for some old
+gcc versions (4.x?) because modern libc implementations uses:
+
+    __extension__ union
+
+to use both headers variants.
+
+Signed-off-by: Vadym Kochan <vadim4j@gmail.com>
+---
+ src/trace-tcp.c | 1 +
+ src/trace-udp.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/trace-tcp.c b/src/trace-tcp.c
+index 1b367ae..5d6ab8f 100644
+--- a/src/trace-tcp.c
++++ b/src/trace-tcp.c
+@@ -33,6 +33,7 @@
+ #include <unistd.h> // getpid()
+ #include <sys/socket.h> // SOCK_STREAM
+ #include <netinet/in.h>
++#define __FAVOR_BSD
+ #include <netinet/tcp.h>
+ 
+ #include "traceroute.h"
+diff --git a/src/trace-udp.c b/src/trace-udp.c
+index aa9364e..6b287ec 100644
+--- a/src/trace-udp.c
++++ b/src/trace-udp.c
+@@ -32,6 +32,7 @@
+ #include <sys/types.h>
+ #include <sys/socket.h> // SOCK_DGRAM
+ #include <netinet/in.h>
++#define __FAVOR_BSD
+ #include <netinet/udp.h>
+ 
+ #include "traceroute.h"
+-- 
+2.26.2
+
-- 
2.26.2
