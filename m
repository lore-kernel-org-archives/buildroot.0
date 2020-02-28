From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 28 Feb 2020 18:30:52 +0100
Subject: [Buildroot] [PATCH 2/2] package/libtirpc: fix build when missing
 <bits/endian.h>
In-Reply-To: <20200228173052.5128-1-petr.vorel@gmail.com>
References: <20200228173052.5128-1-petr.vorel@gmail.com>
Message-ID: <20200228173052.5128-2-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes build on riscv64:

http://autobuild.buildroot.net/results/a334f774e95fb7805568fc3868d5cf1d790a6e73
http://autobuild.buildroot.net/results/9cf80bdd4d329788c89596b56205ef215ee09c35

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...r_float-do-not-include-bits-endian.h.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/libtirpc/0006-xdr_float-do-not-include-bits-endian.h.patch

diff --git a/package/libtirpc/0006-xdr_float-do-not-include-bits-endian.h.patch b/package/libtirpc/0006-xdr_float-do-not-include-bits-endian.h.patch
new file mode 100644
index 0000000000..2527726015
--- /dev/null
+++ b/package/libtirpc/0006-xdr_float-do-not-include-bits-endian.h.patch
@@ -0,0 +1,33 @@
+From d04f4d6f0e682f16b0ce96839ab4eadade591eb1 Mon Sep 17 00:00:00 2001
+From: Rosen Penev <rosenp@gmail.com>
+Date: Tue, 21 Jan 2020 11:51:16 -0500
+Subject: [PATCH 2/2] xdr_float: do not include bits/endian.h
+
+bits/endian.h is an internal header. endian.h should be included.
+
+Fixes compilation with recent musl.
+
+Signed-off-by: Rosen Penev <rosenp@gmail.com>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[ upstream status: d04f4d6f0e682f16b0ce96839ab4eadade591eb1 ]
+---
+ src/xdr_float.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/xdr_float.c b/src/xdr_float.c
+index 26bc865..349d48f 100644
+--- a/src/xdr_float.c
++++ b/src/xdr_float.c
+@@ -83,7 +83,7 @@ static struct sgl_limits {
+ };
+ #else
+ 
+-#include <bits/endian.h>
++#include <endian.h>
+ #define IEEEFP
+ 
+ #endif /* vax */
+-- 
+2.25.1
+
-- 
2.25.1
