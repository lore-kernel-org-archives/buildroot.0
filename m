From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Oct 2016 23:38:22 +0200
Subject: [Buildroot] [git commit] pppd: better fix for the Linux 4.8 kernel
	headers issue
Message-ID: <20161020213927.5348681D32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d08404d9afa211b2da4449ee12b2e89dcedc208
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 035567b2793f3649e2ddc6cd34b75dd643f47d73 solved the build issue
of pppd with Linux 4.8 kernel headers, but in the process broke the
build with older kernel headers such as 3.10.

This commit takes a different approach, by moving the <netinet/in.h>
include above linux header includes.

Linux uapi headers try to avoid redeclaring things from libc via
linux/libc-compat.h. However that only works if the libc header is
included first.

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-netinet-in.h-above-linux-header-includes.patch | 22 ++++++++++++
 .../pppd/0001-fix-building-with-linux-4.8.patch    | 39 ----------------------
 2 files changed, 22 insertions(+), 39 deletions(-)

diff --git a/package/pppd/0001-Move-netinet-in.h-above-linux-header-includes.patch b/package/pppd/0001-Move-netinet-in.h-above-linux-header-includes.patch
new file mode 100644
index 0000000..2f6933f
--- /dev/null
+++ b/package/pppd/0001-Move-netinet-in.h-above-linux-header-includes.patch
@@ -0,0 +1,22 @@
+diff --git a/pppd/plugins/rp-pppoe/pppoe.h b/pppd/plugins/rp-pppoe/pppoe.h
+index 9ab2eee..b827620 100644
+--- a/pppd/plugins/rp-pppoe/pppoe.h
++++ b/pppd/plugins/rp-pppoe/pppoe.h
+@@ -47,6 +47,8 @@
+ #include <sys/socket.h>
+ #endif
+ 
++#include <netinet/in.h>
++
+ /* Ugly header files on some Linux boxes... */
+ #if defined(HAVE_LINUX_IF_H)
+ #include <linux/if.h>
+@@ -84,8 +86,6 @@ typedef unsigned long UINT32_t;
+ #include <linux/if_ether.h>
+ #endif
+ 
+-#include <netinet/in.h>
+-
+ #ifdef HAVE_NETINET_IF_ETHER_H
+ #include <sys/types.h>
+ 
diff --git a/package/pppd/0001-fix-building-with-linux-4.8.patch b/package/pppd/0001-fix-building-with-linux-4.8.patch
deleted file mode 100644
index d09e392..0000000
--- a/package/pppd/0001-fix-building-with-linux-4.8.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 492e240a651e3d32b84cac66e4675ee99dcbe05a Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Thu, 13 Oct 2016 13:41:43 +0800
-Subject: [PATCH] ppp: fix building with linux-4.8
-
-Fix a build error when using the linux-4.8 headers that results in:
-
-In file included from pppoe.h:87:0,
-                 from plugin.c:29:
-../usr/include/netinet/in.h:211:8: note: originally defined here
- struct in6_addr
-        ^~~~~~~~
-In file included from ../usr/include/linux/if_pppol2tp.h:20:0,
-                 from ../usr/include/linux/if_pppox.h:26,
-                 from plugin.c:52:
-../usr/include/linux/in6.h:49:8: error: redefinition of 'struct sockaddr_in6'
- struct sockaddr_in6 {
-        ^~~~~~~~~~~~
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-[Thomas: downloaded from https://github.com/paulusmack/ppp/pull/69.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- pppd/plugins/rp-pppoe/pppoe.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pppd/plugins/rp-pppoe/pppoe.h b/pppd/plugins/rp-pppoe/pppoe.h
-index 9ab2eee..96d2794 100644
---- a/pppd/plugins/rp-pppoe/pppoe.h
-+++ b/pppd/plugins/rp-pppoe/pppoe.h
-@@ -84,7 +84,7 @@ typedef unsigned long UINT32_t;
- #include <linux/if_ether.h>
- #endif
- 
--#include <netinet/in.h>
-+#include <linux/in.h>
- 
- #ifdef HAVE_NETINET_IF_ETHER_H
- #include <sys/types.h>
