From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 12:25:45 +0200
Subject: [Buildroot] [git commit] package/iptables: fix build on musl
Message-ID: <20151004102608.64BEF817E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=208e687ced05d479bb523626af103a6de07dc08e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/68b/68bf8830f87ab32f4fd650c9dd4a8c80592983a9/
http://autobuild.buildroot.net/results/d9b/d9bb677fb5510adf05ffb4afbc63ead83d7e18dd/
http://autobuild.buildroot.net/results/4b8/4b80b6d0131b624301a5cfcd5541897f411043c9/

.. and others.

This patch includes two backported patches from iptables git, plus one
pending patch not integrated yet.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../iptables/0003-consistently-use-errno.h.patch   |   92 ++++++++++++++++++++
 .../0004-include-remove-libc5-support-code.patch   |   51 +++++++++++
 package/iptables/0005-fix-build-with-musl.patch    |   67 ++++++++++++++
 3 files changed, 210 insertions(+), 0 deletions(-)

diff --git a/package/iptables/0003-consistently-use-errno.h.patch b/package/iptables/0003-consistently-use-errno.h.patch
new file mode 100644
index 0000000..0ec1e5a
--- /dev/null
+++ b/package/iptables/0003-consistently-use-errno.h.patch
@@ -0,0 +1,92 @@
+From a9214a0b718812d823a933ad580a96a3bf5f4dc6 Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Sat, 2 May 2015 21:51:01 +0200
+Subject: [PATCH 1/3] consistently use <errno.h>
+
+On glibc, <sys/errno.h> is a synomym for <errno.h>.
+<errno.h> is specified by POSIX, so use that.
+
+Fixes compilation error with musl libc
+
+Backported from :
+http://git.netfilter.org/iptables/commit/?id=043e52bc42021f71b85229f6d78bf7e75b282765
+
+Upstream-Status: backport
+Signed-off-by: Florian Westphal <fw@strlen.de>
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+---
+ iptables/ip6tables-restore.c | 2 +-
+ iptables/ip6tables-save.c    | 2 +-
+ iptables/iptables-restore.c  | 2 +-
+ iptables/iptables-save.c     | 2 +-
+ iptables/iptables-xml.c      | 2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/iptables/ip6tables-restore.c b/iptables/ip6tables-restore.c
+index b8b9e0d..0927e6d 100644
+--- a/iptables/ip6tables-restore.c
++++ b/iptables/ip6tables-restore.c
+@@ -9,7 +9,7 @@
+  */
+ 
+ #include <getopt.h>
+-#include <sys/errno.h>
++#include <errno.h>
+ #include <stdbool.h>
+ #include <string.h>
+ #include <stdio.h>
+diff --git a/iptables/ip6tables-save.c b/iptables/ip6tables-save.c
+index d819b30..f0349d3 100644
+--- a/iptables/ip6tables-save.c
++++ b/iptables/ip6tables-save.c
+@@ -6,7 +6,7 @@
+  * This code is distributed under the terms of GNU GPL v2
+  */
+ #include <getopt.h>
+-#include <sys/errno.h>
++#include <errno.h>
+ #include <stdio.h>
+ #include <fcntl.h>
+ #include <stdlib.h>
+diff --git a/iptables/iptables-restore.c b/iptables/iptables-restore.c
+index 8c942ff..d00b9e7 100644
+--- a/iptables/iptables-restore.c
++++ b/iptables/iptables-restore.c
+@@ -6,7 +6,7 @@
+  */
+ 
+ #include <getopt.h>
+-#include <sys/errno.h>
++#include <errno.h>
+ #include <stdbool.h>
+ #include <string.h>
+ #include <stdio.h>
+diff --git a/iptables/iptables-save.c b/iptables/iptables-save.c
+index e599fce..3fbdb77 100644
+--- a/iptables/iptables-save.c
++++ b/iptables/iptables-save.c
+@@ -6,7 +6,7 @@
+  *
+  */
+ #include <getopt.h>
+-#include <sys/errno.h>
++#include <errno.h>
+ #include <stdio.h>
+ #include <fcntl.h>
+ #include <stdlib.h>
+diff --git a/iptables/iptables-xml.c b/iptables/iptables-xml.c
+index 9628447..695cd67 100644
+--- a/iptables/iptables-xml.c
++++ b/iptables/iptables-xml.c
+@@ -7,7 +7,7 @@
+  */
+ 
+ #include <getopt.h>
+-#include <sys/errno.h>
++#include <errno.h>
+ #include <string.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+-- 
+2.4.3
+
diff --git a/package/iptables/0004-include-remove-libc5-support-code.patch b/package/iptables/0004-include-remove-libc5-support-code.patch
new file mode 100644
index 0000000..8137ece
--- /dev/null
+++ b/package/iptables/0004-include-remove-libc5-support-code.patch
@@ -0,0 +1,51 @@
+From 401673e9d37ea1e6da0bc335b1d7a2bbf445c690 Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Sat, 2 May 2015 21:51:38 +0200
+Subject: [PATCH 2/3] include: remove libc5 support code
+
+Current code makes the assumption that !defined(__GLIBC__) means libc5
+which is very unlikely the case nowadays.
+
+Fixes compile error because of conflict between kernel and musl headers.
+
+Backported from :
+http://git.netfilter.org/iptables/commit/?id=0bb1859e2d6dd79a0a59c3ee65f6a78cba118b86
+
+Upstream-Status: backport
+Signed-off-by: Florian Westphal <fw@strlen.de>
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+---
+ include/libiptc/ipt_kernel_headers.h | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/include/libiptc/ipt_kernel_headers.h b/include/libiptc/ipt_kernel_headers.h
+index 18861fe..a5963e9 100644
+--- a/include/libiptc/ipt_kernel_headers.h
++++ b/include/libiptc/ipt_kernel_headers.h
+@@ -5,7 +5,6 @@
+ 
+ #include <limits.h>
+ 
+-#if defined(__GLIBC__) && __GLIBC__ == 2
+ #include <netinet/ip.h>
+ #include <netinet/in.h>
+ #include <netinet/ip_icmp.h>
+@@ -13,15 +12,4 @@
+ #include <netinet/udp.h>
+ #include <net/if.h>
+ #include <sys/types.h>
+-#else /* libc5 */
+-#include <sys/socket.h>
+-#include <linux/ip.h>
+-#include <linux/in.h>
+-#include <linux/if.h>
+-#include <linux/icmp.h>
+-#include <linux/tcp.h>
+-#include <linux/udp.h>
+-#include <linux/types.h>
+-#include <linux/in6.h>
+-#endif
+ #endif
+-- 
+2.4.3
+
diff --git a/package/iptables/0005-fix-build-with-musl.patch b/package/iptables/0005-fix-build-with-musl.patch
new file mode 100644
index 0000000..d5e0c2e
--- /dev/null
+++ b/package/iptables/0005-fix-build-with-musl.patch
@@ -0,0 +1,67 @@
+From 2f2fde48594ec34e93ab409cd83442efe58e10ad Mon Sep 17 00:00:00 2001
+From: Brendan Heading <brendanheading@gmail.com>
+Date: Mon, 31 Aug 2015 15:24:44 +0100
+Subject: [PATCH 3/3] fix build with musl
+
+Add needed headers they are just not needed for glibc6+ but also
+for musl
+Define additional TCOPTS if not there
+
+u_initX types are in sys/types.h be explicit about it
+
+Upstream-Status: Pending
+
+bh: this is a copy of the patch at the link below, modified to remove
+the changes to include/libiptc/ipt_kernel_headers.h as these are
+already integrated in the upstream tree. See :
+
+http://lists.openembedded.org/pipermail/openembedded-core/2015-April/103613.html
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+---
+ extensions/libxt_TCPOPTSTRIP.c           | 15 +++++++++++++++
+ include/linux/netfilter_ipv4/ip_tables.h |  1 +
+ 2 files changed, 16 insertions(+)
+
+diff --git a/extensions/libxt_TCPOPTSTRIP.c b/extensions/libxt_TCPOPTSTRIP.c
+index 6897857..8a170b2 100644
+--- a/extensions/libxt_TCPOPTSTRIP.c
++++ b/extensions/libxt_TCPOPTSTRIP.c
+@@ -12,6 +12,21 @@
+ #ifndef TCPOPT_MD5SIG
+ #	define TCPOPT_MD5SIG 19
+ #endif
++#ifndef TCPOPT_MAXSEG
++#	define TCPOPT_MAXSEG 2
++#endif
++#ifndef TCPOPT_WINDOW
++#	define TCPOPT_WINDOW 3
++#endif
++#ifndef TCPOPT_SACK_PERMITTED
++#	define TCPOPT_SACK_PERMITTED 4
++#endif
++#ifndef TCPOPT_SACK
++#	define TCPOPT_SACK 5
++#endif
++#ifndef TCPOPT_TIMESTAMP
++#	define TCPOPT_TIMESTAMP 8
++#endif
+ 
+ enum {
+ 	O_STRIP_OPTION = 0,
+diff --git a/include/linux/netfilter_ipv4/ip_tables.h b/include/linux/netfilter_ipv4/ip_tables.h
+index 57fd82a..4807246 100644
+--- a/include/linux/netfilter_ipv4/ip_tables.h
++++ b/include/linux/netfilter_ipv4/ip_tables.h
+@@ -15,6 +15,7 @@
+ #ifndef _IPTABLES_H
+ #define _IPTABLES_H
+ 
++#include <sys/types.h>
+ #include <linux/types.h>
+ 
+ #include <linux/netfilter_ipv4.h>
+-- 
+2.4.3
+
