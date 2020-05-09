From: Vadym Kochan <vadim4j@gmail.com>
Date: Sat,  9 May 2020 22:09:47 +0300
Subject: [Buildroot] [PATCH v2] package/ndisc6: fix compilation for glibc <
 2.19
Message-ID: <20200509190947.453850-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glibc version before 2.19 version allows to use BSD-mode via #define
_BSD_SOURCE, it defines another one

    __FAVOR_BSD

which provides BSD-style tcp/udp headers where fields are different than
in GNU version.

In glibc > 2.18 there is no such ability to use BSD mode, but it
supports both kinds of tcp/udp headers because of using __extension__
union.

Since trace-{udp,tcp}.c uses BSD-style tcp/udp headers, it fails on
toolchains with glibc < 2.19 version.

So fix it by defining __FAVOR_BSD define only for tcp/udp headers.

Fixes: http://autobuild.buildroot.net/results/d05d5471d10a2b6634711ccad75d7f86d222cc31

Signed-off-by: Vadym Kochan <vadim4j@gmail.com>
---

v2:
    Fix wrong description which refers to particular codesourcery
    toolchain instead to the glibc which is the real root cause of the
    issue.

 ...x-compilation-with-glibc-which-uses-.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/ndisc6/0002-trace-udp-tcp-fix-compilation-with-glibc-which-uses-.patch

diff --git a/package/ndisc6/0002-trace-udp-tcp-fix-compilation-with-glibc-which-uses-.patch b/package/ndisc6/0002-trace-udp-tcp-fix-compilation-with-glibc-which-uses-.patch
new file mode 100644
index 0000000000..299cefbb79
--- /dev/null
+++ b/package/ndisc6/0002-trace-udp-tcp-fix-compilation-with-glibc-which-uses-.patch
@@ -0,0 +1,46 @@
+From c87e9800e24d0afbebb385b049c7e7024a9c6555 Mon Sep 17 00:00:00 2001
+From: Vadym Kochan <vadim4j@gmail.com>
+Date: Sat, 9 May 2020 19:29:24 +0300
+Subject: [PATCH] trace-{udp,tcp}: fix compilation with glibc which uses
+ __FAVOR_BSD
+
+Use __FAVOR_BSD define to enable BSD-like tcp/udp headers for glibc
+versions older than 2.19, because later glibc implementations uses:
+
+    __extension__ union
+
+to provide both headers variants.
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
