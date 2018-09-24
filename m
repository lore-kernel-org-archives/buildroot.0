From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 24 Sep 2018 02:14:45 +0200
Subject: [Buildroot] [PATCH 1/2] iputils: Bump to version s20180629
Message-ID: <20180924001446.24617-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch to fix build error:
ping.c: In function ?main?:
ping.c:212:23: error: ?AI_CANONIDN? undeclared (first use in this function); did you mean ?AI_CANONNAME??
   hints.ai_flags &= ~ AI_CANONIDN;

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...ix-AI_CANONIDN-usage-on-some-systems.patch | 57 +++++++++++++++++++
 package/iputils/iputils.hash                  |  2 +-
 package/iputils/iputils.mk                    |  2 +-
 3 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 package/iputils/0001-ping-Fix-AI_CANONIDN-usage-on-some-systems.patch

diff --git a/package/iputils/0001-ping-Fix-AI_CANONIDN-usage-on-some-systems.patch b/package/iputils/0001-ping-Fix-AI_CANONIDN-usage-on-some-systems.patch
new file mode 100644
index 0000000000..556d3786fb
--- /dev/null
+++ b/package/iputils/0001-ping-Fix-AI_CANONIDN-usage-on-some-systems.patch
@@ -0,0 +1,57 @@
+From 25899e849aa3abc1ad29ebf0b830262a859eaed5 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Sat, 21 Jul 2018 17:46:14 +0200
+Subject: [PATCH] ping: Fix AI_CANONIDN usage on some systems
+
+Commit 99f67db used AI_CANONIDN in a way, which broke compilation on
+systems where AI_CANONIDN is not defined in netdb.h (e.g. glibc < 2.3.4,
+alternative libcs that don't support IDN: e.g. current musl 1.1.19 and
+uClibc-ng 1.0.30) when not using the system libidn2.
+
+Fixes: 99f67db ping: Fix ping name encoded using ACE on C locale
+
+Reported-by: Nicholas Fish
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+---
+ ping.c | 2 +-
+ ping.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ping.c b/ping.c
+index 733477f..b241815 100644
+--- a/ping.c
++++ b/ping.c
+@@ -207,9 +207,9 @@ main(int argc, char **argv)
+ 
+ #ifdef USE_IDN
+ 	setlocale(LC_ALL, "");
+-#endif
+ 	if (!strcmp(setlocale(LC_ALL, NULL), "C"))
+ 		hints.ai_flags &= ~ AI_CANONIDN;
++#endif
+ 
+ 	/* Support being called using `ping4` or `ping6` symlinks */
+ 	if (argv[0][strlen(argv[0])-1] == '4')
+diff --git a/ping.h b/ping.h
+index 3e09685..8a0c4ef 100644
+--- a/ping.h
++++ b/ping.h
+@@ -28,7 +28,6 @@
+ #include <netinet/icmp6.h>
+ #include <linux/filter.h>
+ #include <resolv.h>
+-#include <locale.h>
+ 
+ #ifdef CAPABILITIES
+ #include <sys/prctl.h>
+@@ -36,6 +35,7 @@
+ #endif
+ 
+ #ifdef USE_IDN
++#include <locale.h>
+ #include <idn2.h>
+ #define getaddrinfo_flags (AI_CANONNAME | AI_IDN | AI_CANONIDN)
+ #define getnameinfo_flags NI_IDN
+-- 
+2.19.0.rc2
+
diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index a19348aa1f..89c3ab6013 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f813092f03d17294fd23544b129b95cdb87fe19f7970a51908a6b88509acad8a  iputils-s20161105.tar.gz
+sha256 da14105291dd491f28ea91ade854ed10aee8ba019641c80eed233de3908be7c5  iputils-s20180629.tar.gz
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 713b0e4abf..8371971231 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -11,7 +11,7 @@
 # and IPv6 updates.
 # http://www.spinics.net/lists/netdev/msg279881.html
 
-IPUTILS_VERSION = s20161105
+IPUTILS_VERSION = s20180629
 IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause, BSD-4-Clause
 # Only includes a license file for BSD
-- 
2.19.0.rc2
