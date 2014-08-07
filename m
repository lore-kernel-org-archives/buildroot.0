From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Aug 2014 22:19:21 +0200
Subject: [Buildroot] [git commit] dhcpdump: Fix strsep() feature test
Message-ID: <20140807202212.F0B009D3A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2a7f0d6051f71f3bb9d83b574d70814339e4b95
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the official _BSD_SOURCE feature test macro instead of the meaningless
HAVE_STRSEP macro in order to detect the availability of strsep().

This allows toolchains supporting strsep() to use it instead of the custom
implementation from dhcpdump, which also avoids the following error with some
toolchains:

	In file included from dhcpdump.c:30:0:
	dhcpdump.c: At top level:
	strsep.c:65:23: error: register name not specified for ???delim???
	  register const char *delim;
	                       ^

Signed-off-by: Beno??t Th??baudeau <benoit.thebaudeau@advansee.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../dhcpdump-0002-fix-strsep-feature-test.patch    |   27 ++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/dhcpdump/dhcpdump-0002-fix-strsep-feature-test.patch b/package/dhcpdump/dhcpdump-0002-fix-strsep-feature-test.patch
new file mode 100644
index 0000000..06bab94
--- /dev/null
+++ b/package/dhcpdump/dhcpdump-0002-fix-strsep-feature-test.patch
@@ -0,0 +1,27 @@
+Use the official _BSD_SOURCE feature test macro instead of the meaningless
+HAVE_STRSEP macro in order to detect the availability of strsep().
+
+This allows toolchains supporting strsep() to use it instead of the custom
+implementation from dhcpdump, which also avoids the following error with some
+toolchains:
+
+	In file included from dhcpdump.c:30:0:
+	dhcpdump.c: At top level:
+	strsep.c:65:23: error: register name not specified for ???delim???
+	  register const char *delim;
+	                       ^
+
+Signed-off-by: Beno??t Th??baudeau <benoit.thebaudeau@advansee.com>
+
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
