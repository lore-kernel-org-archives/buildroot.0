From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Mon,  4 Aug 2014 20:20:14 +0200
Subject: [Buildroot] [PATCH 1/1] dhcpdump: Fix strsep() feature test
Message-ID: <1407176414-13376-1-git-send-email-benoit.thebaudeau@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the official _BSD_SOURCE feature test macro instead of the meaningless
HAVE_STRSEP macro in order to detect the availability of strsep().

This allows toolchains supporting strsep() to use it instead of the custom
implementation from dhcpdump, which also avoids the following error with some
toolchains:

  In file included from dhcpdump.c:30:0:
  dhcpdump.c: At top level:
  strsep.c:65:23: error: register name not specified for ?delim?
    register const char *delim;
                         ^

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
---
 package/dhcpdump/dhcpdump-1.8-fix-strsep-feature-test.patch | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 package/dhcpdump/dhcpdump-1.8-fix-strsep-feature-test.patch

diff --git a/package/dhcpdump/dhcpdump-1.8-fix-strsep-feature-test.patch b/package/dhcpdump/dhcpdump-1.8-fix-strsep-feature-test.patch
new file mode 100644
index 0000000..10b826c
--- /dev/null
+++ b/package/dhcpdump/dhcpdump-1.8-fix-strsep-feature-test.patch
@@ -0,0 +1,12 @@
+diff -Nrdup dhcpdump-1.8.orig/dhcpdump.c dhcpdump-1.8/dhcpdump.c
+--- dhcpdump-1.8.orig/dhcpdump.c	2008-06-24 05:26:52.000000000 +0200
++++ dhcpdump-1.8/dhcpdump.c	2011-05-31 19:22:15.987388498 +0200
+@@ -26,7 +26,7 @@
+ #include <regex.h>
+ #include "dhcp_options.h"
+ 
+-#ifndef HAVE_STRSEP
++#ifndef _BSD_SOURCE
+ #include "strsep.c"
+ #endif
+ 
-- 
1.9.1
