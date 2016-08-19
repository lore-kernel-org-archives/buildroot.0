From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 23:33:11 +0200
Subject: [Buildroot] [git commit] sane-backends: backport upstream commit to
	fix musl build
Message-ID: <20160819213400.5BD8282297@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b73fe4a68b41fb7804101ed516aa6c806ff18260
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a new patch to sane-backends, backported from upstream,
to fix the build with the musl C library.

Fixes:

  http://autobuild.buildroot.net/results/86c0d172f97a09230a1b589d599c54a656dae66d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-Add-missing-sys-types.h-includes.patch    | 106 +++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/package/sane-backends/0002-Add-missing-sys-types.h-includes.patch b/package/sane-backends/0002-Add-missing-sys-types.h-includes.patch
new file mode 100644
index 0000000..8ab41f1
--- /dev/null
+++ b/package/sane-backends/0002-Add-missing-sys-types.h-includes.patch
@@ -0,0 +1,106 @@
+From d33f16f463e888846d69ddfbeeb963d40972b654 Mon Sep 17 00:00:00 2001
+From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
+Date: Thu, 15 Oct 2015 12:35:00 +0900
+Subject: [PATCH] Add missing <sys/types.h> includes
+
+[Thomas: backport from upstream commit
+33495ef9b42a783c8f5f2c056ac5699481d3cc7e, allows to fix the build with
+the musl C library.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ backend/epsonds-io.c     | 3 +++
+ backend/hp5400.c         | 3 +++
+ backend/hp5590.c         | 3 +++
+ backend/kvs20xx_cmd.h    | 4 ++++
+ backend/kvs40xx.h        | 3 +++
+ include/sane/sanei_udp.h | 3 +++
+ 6 files changed, 19 insertions(+)
+
+diff --git a/backend/epsonds-io.c b/backend/epsonds-io.c
+index 28bacfc..512997d 100644
+--- a/backend/epsonds-io.c
++++ b/backend/epsonds-io.c
+@@ -16,6 +16,9 @@
+ #include "sane/config.h"
+ #include <ctype.h>
+ #include <unistd.h>     /* sleep */
++#ifdef HAVE_SYS_TYPES_H
++#include <sys/types.h>
++#endif
+ 
+ #include "epsonds.h"
+ #include "epsonds-io.h"
+diff --git a/backend/hp5400.c b/backend/hp5400.c
+index 61de3db..cfa2dc9 100644
+--- a/backend/hp5400.c
++++ b/backend/hp5400.c
+@@ -67,6 +67,9 @@
+ #include <stdlib.h>		/* malloc, free */
+ #include <string.h>		/* memcpy */
+ #include <stdio.h>
++#ifdef HAVE_SYS_TYPES_H
++#include <sys/types.h>
++#endif
+ 
+ 
+ #define HP5400_CONFIG_FILE "hp5400.conf"
+diff --git a/backend/hp5590.c b/backend/hp5590.c
+index 7b1cd60..5422372 100644
+--- a/backend/hp5590.c
++++ b/backend/hp5590.c
+@@ -48,6 +48,9 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <unistd.h>
++#ifdef HAVE_SYS_TYPES_H
++#include <sys/types.h>
++#endif
+ 
+ #include "../include/sane/sane.h"
+ #define BACKEND_NAME hp5590
+diff --git a/backend/kvs20xx_cmd.h b/backend/kvs20xx_cmd.h
+index c18b754..4acaf62 100644
+--- a/backend/kvs20xx_cmd.h
++++ b/backend/kvs20xx_cmd.h
+@@ -9,6 +9,10 @@
+    Panasonic KV-S20xx USB-SCSI scanners.
+ */
+ 
++#ifdef HAVE_SYS_TYPES_H
++#include <sys/types.h>
++#endif
++
+ #define COMMAND_BLOCK	1
+ #define DATA_BLOCK	2
+ #define RESPONSE_BLOCK	3
+diff --git a/backend/kvs40xx.h b/backend/kvs40xx.h
+index fa17163..02e0da6 100644
+--- a/backend/kvs40xx.h
++++ b/backend/kvs40xx.h
+@@ -10,6 +10,9 @@
+ 
+ #include "../include/sane/config.h"
+ #include <semaphore.h>
++#ifdef HAVE_SYS_TYPES_H
++#include <sys/types.h>
++#endif
+ 
+ #undef  BACKEND_NAME
+ #define BACKEND_NAME kvs40xx
+diff --git a/include/sane/sanei_udp.h b/include/sane/sanei_udp.h
+index c44afdd..e32fc1a 100644
+--- a/include/sane/sanei_udp.h
++++ b/include/sane/sanei_udp.h
+@@ -27,6 +27,9 @@
+ #include <netinet/in.h>
+ #include <netdb.h>
+ #endif
++#ifdef HAVE_SYS_TYPES_H
++#include <sys/types.h>
++#endif
+ 
+ extern SANE_Status sanei_udp_open(const char *host, int port, int *fdp);
+ extern SANE_Status sanei_udp_open_broadcast(int *fdp);
+-- 
+2.7.4
+
