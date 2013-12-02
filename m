From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Dec 2013 13:11:31 +0100
Subject: [Buildroot] [git commit] package: add rtptools
Message-ID: <20131202122005.C17899BED0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=735b59b0e09fafe43d8286f037c623a7b156f8bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Notice that the license is quite special. It is basically MIT with the
difference that it only allows use for:

'research and educational purpose and without fee ... Use of this software
 in whole or in parts for direct commercial advantage requires explicit
 prior permission'

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                  |    1 +
 package/rtptools/Config.in                         |    7 +++
 .../rtptools-01-host2ip-no-nis-on-uClibc.patch     |   45 ++++++++++++++++++++
 package/rtptools/rtptools.mk                       |   12 +++++
 4 files changed, 65 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f9bd88c..5b9d775 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -870,6 +870,7 @@ source "package/rpcbind/Config.in"
 source "package/rsh-redone/Config.in"
 source "package/rsync/Config.in"
 source "package/rtorrent/Config.in"
+source "package/rtptools/Config.in"
 source "package/samba/Config.in"
 source "package/sconeserver/Config.in"
 source "package/ser2net/Config.in"
diff --git a/package/rtptools/Config.in b/package/rtptools/Config.in
new file mode 100644
index 0000000..80bbb7a
--- /dev/null
+++ b/package/rtptools/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_RTPTOOLS
+	bool "rtptools"
+	help
+	  The rtptools distribution consists of a number of small
+	  applications that can be used for processing RTP data.
+
+	  http://www.cs.columbia.edu/irt/software/rtptools/
diff --git a/package/rtptools/rtptools-01-host2ip-no-nis-on-uClibc.patch b/package/rtptools/rtptools-01-host2ip-no-nis-on-uClibc.patch
new file mode 100644
index 0000000..f1a72f9
--- /dev/null
+++ b/package/rtptools/rtptools-01-host2ip-no-nis-on-uClibc.patch
@@ -0,0 +1,45 @@
+host2ip.c: disable NIS support when building with uClibc
+
+uClibc doesn't have NIS support, so simply disable the fallback.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ host2ip.c |   11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+Index: rtptools-1.20/host2ip.c
+===================================================================
+--- rtptools-1.20.orig/host2ip.c
++++ rtptools-1.20/host2ip.c
+@@ -3,7 +3,16 @@
+ #include <netdb.h>           /* gethostbyname() */
+ #include <netinet/in.h>      /* sockaddr_in */
+ #include <arpa/inet.h>       /* inet_addr() */
++
++#include <features.h>
++#ifndef __UCLIBC__
++#define HAVE_YP
++#endif
++
++#ifdef HAVE_YP
+ #include <rpcsvc/ypclnt.h>   /* YP */
++#endif
++
+ #include <string.h>          /* strlen() added by Akira 12/27/01 */ 
+ #include "sysdep.h"
+ 
+@@ -28,6 +37,7 @@
+   else if ((hep = gethostbyname(host))) {
+     in = *(struct in_addr *)(hep->h_addr_list[0]);
+   }
++#ifdef HAVE_YP
+   /* As a last resort, try YP. */
+   else {
+     static char *domain = 0;  /* YP domain */
+@@ -39,5 +49,6 @@
+       in.s_addr = inet_addr(value);
+     }
+   }
++#endif
+   return in;
+ } /* host2ip */
diff --git a/package/rtptools/rtptools.mk b/package/rtptools/rtptools.mk
new file mode 100644
index 0000000..2f67bf3
--- /dev/null
+++ b/package/rtptools/rtptools.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# rtptools
+#
+################################################################################
+
+RTPTOOLS_VERSION = 1.20
+RTPTOOLS_SITE = http://www.cs.columbia.edu/irt/software/rtptools/download/
+RTPTOOLS_LICENSE = MIT-like (research and education only)
+RTPTOOLS_LICENSE_FILES = COPYRIGHT
+
+$(eval $(autotools-package))
