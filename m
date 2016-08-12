From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Aug 2016 22:49:55 +0200
Subject: [Buildroot] [PATCH 2/8] package/rpcbind: include cdefs.h where
	needed
In-Reply-To: <cover.1471033837.git.yann.morin.1998@free.fr>
References: <cover.1471033837.git.yann.morin.1998@free.fr>
Message-ID: <f7f60956c8c50882df893c4aff93799f398d2e8b.1471033837.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rpcbind uses a macro defined in sys/cdefs.h but does not included it
explicitly, relying on the glibc behaviour to include it from its own
headers.

Now that we also have a sys/cdefs.h for musl (which completes the triade
glibc/uClibc/musl), sys/cdefs.h is always available.

Fixes:
    http://autobuild.buildroot.org/results/346/346c5b562c244ddb039db2f86f71d670a01ed9ce/
    http://autobuild.buildroot.org/results/d77/d77454265c45539178c008c5d92509c441447675/
    and numerous such autobuild failures

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...003-src-include-cdefs.h-for-the-__P-macro.patch | 126 +++++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 package/rpcbind/0003-src-include-cdefs.h-for-the-__P-macro.patch

diff --git a/package/rpcbind/0003-src-include-cdefs.h-for-the-__P-macro.patch b/package/rpcbind/0003-src-include-cdefs.h-for-the-__P-macro.patch
new file mode 100644
index 0000000..0cae0cf
--- /dev/null
+++ b/package/rpcbind/0003-src-include-cdefs.h-for-the-__P-macro.patch
@@ -0,0 +1,126 @@
+From 50ce1b2e3158f0fd1102b7f56d9264057a1a0c01 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Fri, 12 Aug 2016 00:06:28 +0200
+Subject: [PATCH] src: include cdefs.h for the __P() macro
+
+The __P() macro is defined in cdefs.h, so we must include it explcitly
+rather than relying on it being included by another header.
+
+cdefs.h is a glibc-ism; glibc includes it almost everywhere form its own
+headers. So it automatically gets included for glibc.
+
+However, cdefs.h is not present in musl, so its headers do not include
+it. We must thus include it when we need __P() (of course, one will have
+to provide his own cdefs.h in this case).
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ src/check_bound.c  | 1 +
+ src/pmap_svc.c     | 1 +
+ src/rpcb_svc.c     | 1 +
+ src/rpcb_svc_4.c   | 1 +
+ src/rpcb_svc_com.c | 1 +
+ src/rpcbind.c      | 1 +
+ src/util.c         | 1 +
+ src/warmstart.c    | 1 +
+ 8 files changed, 8 insertions(+)
+
+diff --git a/src/check_bound.c b/src/check_bound.c
+index c70b845..df14fbc 100644
+--- a/src/check_bound.c
++++ b/src/check_bound.c
+@@ -49,6 +49,7 @@ static	char sccsid[] = "@(#)check_bound.c 1.11 89/04/21 Copyr 1989 Sun Micro";
+ 
+ #include <sys/types.h>
+ #include <sys/socket.h>
++#include <sys/cdefs.h>
+ #include <rpc/rpc.h>
+ #include <stdio.h>
+ #include <netconfig.h>
+diff --git a/src/pmap_svc.c b/src/pmap_svc.c
+index ad28b93..5993c0b 100644
+--- a/src/pmap_svc.c
++++ b/src/pmap_svc.c
+@@ -49,6 +49,7 @@ static	char sccsid[] = "@(#)pmap_svc.c 1.23 89/04/05 Copyr 1984 Sun Micro";
+ #ifdef PORTMAP
+ #include <sys/types.h>
+ #include <sys/socket.h>
++#include <sys/cdefs.h>
+ #include <stdio.h>
+ #include <rpc/rpc.h>
+ #include <rpc/pmap_prot.h>
+diff --git a/src/rpcb_svc.c b/src/rpcb_svc.c
+index bd92201..eb5b49c 100644
+--- a/src/rpcb_svc.c
++++ b/src/rpcb_svc.c
+@@ -42,6 +42,7 @@
+  * version 3 of rpcbind.
+  */
+ #include <sys/types.h>
++#include <sys/cdefs.h>
+ #include <rpc/rpc.h>
+ #include <rpc/rpcb_prot.h>
+ #include <netconfig.h>
+diff --git a/src/rpcb_svc_4.c b/src/rpcb_svc_4.c
+index b673452..69d75e3 100644
+--- a/src/rpcb_svc_4.c
++++ b/src/rpcb_svc_4.c
+@@ -44,6 +44,7 @@
+ 
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#include <sys/cdefs.h>
+ #include <rpc/rpc.h>
+ #include <stdio.h>
+ #include <unistd.h>
+diff --git a/src/rpcb_svc_com.c b/src/rpcb_svc_com.c
+index 148fe42..9369e27 100644
+--- a/src/rpcb_svc_com.c
++++ b/src/rpcb_svc_com.c
+@@ -43,6 +43,7 @@
+ #include <sys/stat.h>
+ #include <sys/param.h>
+ #include <sys/poll.h>
++#include <sys/cdefs.h>
+ #include <bits/poll.h>
+ #include <sys/socket.h>
+ #include <rpc/rpc.h>
+diff --git a/src/rpcbind.c b/src/rpcbind.c
+index c4265cd..37fc660 100644
+--- a/src/rpcbind.c
++++ b/src/rpcbind.c
+@@ -50,6 +50,7 @@
+ #include <sys/file.h>
+ #include <sys/socket.h>
+ #include <sys/un.h>
++#include <sys/cdefs.h>
+ #include <netinet/in.h>
+ #include <rpc/rpc.h>
+ #include <rpc/rpc_com.h>
+diff --git a/src/util.c b/src/util.c
+index a6c835b..5bbec1d 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -42,6 +42,7 @@
+ #include <sys/types.h>
+ #include <sys/socket.h>
+ #include <sys/queue.h>
++#include <sys/cdefs.h>
+ #include <net/if.h>
+ #include <netinet/in.h>
+ #include <ifaddrs.h>
+diff --git a/src/warmstart.c b/src/warmstart.c
+index b6eb73e..f3a9c29 100644
+--- a/src/warmstart.c
++++ b/src/warmstart.c
+@@ -34,6 +34,7 @@
+ 
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#include <sys/cdefs.h>
+ #include <stdio.h>
+ #include <rpc/rpc.h>
+ #include <rpc/rpcb_prot.h>
+-- 
+2.7.4
+
-- 
2.7.4
