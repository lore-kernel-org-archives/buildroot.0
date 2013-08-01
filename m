From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Aug 2013 17:18:00 +0200
Subject: [Buildroot] [git commit] dropwatch: fix build failure with binutils
	2.23.1+
Message-ID: <20130801151900.46DA39AF7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8dd2241e615dd590fb1b96f816b8ad9e2f7a080
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ch-1.4-build.patch => dropwatch-01-build.patch} |    0
 .../dropwatch/dropwatch-02-binutils-2.23.1.patch   |   74 ++++++++++++++++++++
 2 files changed, 74 insertions(+), 0 deletions(-)

diff --git a/package/dropwatch/dropwatch-1.4-build.patch b/package/dropwatch/dropwatch-01-build.patch
similarity index 100%
rename from package/dropwatch/dropwatch-1.4-build.patch
rename to package/dropwatch/dropwatch-01-build.patch
diff --git a/package/dropwatch/dropwatch-02-binutils-2.23.1.patch b/package/dropwatch/dropwatch-02-binutils-2.23.1.patch
new file mode 100644
index 0000000..4d43356
--- /dev/null
+++ b/package/dropwatch/dropwatch-02-binutils-2.23.1.patch
@@ -0,0 +1,74 @@
+libbfd from binutils 2.23.1+ requires PACKAGE* definitions from autoconf.
+Patch from https://fedorahosted.org/dropwatch/ticket/5
+Upstream status: new.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -aurd src.orig/lookup.c src/lookup.c
+--- a/src/lookup.c	2011-10-03 22:51:38.000000000 +0400
++++ b/src/lookup.c	2013-02-18 09:13:56.683214438 +0400
+@@ -27,13 +27,13 @@
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <sys/utsname.h>
+-#include <bfd.h>
+ #include <string.h>
+ #include <unistd.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+
+ #include "lookup.h"
++#include <bfd.h>
+
+ extern struct lookup_methods bfd_methods;
+ extern struct lookup_methods kallsym_methods;
+diff -aurd src.orig/lookup.h src/lookup.h
+--- a/src/lookup.h	2011-10-03 22:51:38.000000000 +0400
++++ b/src/lookup.h	2013-02-18 09:11:00.506895026 +0400
+@@ -28,6 +28,9 @@
+ #include <stdlib.h>
+ #include <asm/types.h>
+
++// satisfy PR 14072 in bfd.h
++#define PACKAGE 1
++#define PACKAGE_VERSION 1
+
+ /*
+  * Initalization routine
+diff -aurd src.orig/lookup_bfd.c src/lookup_bfd.c
+--- a/src/lookup_bfd.c	2012-01-16 22:34:11.000000000 +0400
++++ b/src/lookup_bfd.c	2013-02-18 09:14:02.472984310 +0400
+@@ -25,13 +25,13 @@
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <sys/utsname.h>
+-#include <bfd.h>
+ #include <string.h>
+ #include <unistd.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+
+ #include "lookup.h"
++#include <bfd.h>
+
+
+ static int lookup_bfd_init(void)
+diff -aurd src.orig/lookup_kas.c src/lookup_kas.c
+--- a/src/lookup_kas.c	2012-05-31 02:43:23.000000000 +0400
++++ b/src/lookup_kas.c	2013-02-18 09:14:07.906101713 +0400
+@@ -25,7 +25,6 @@
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <sys/utsname.h>
+-#include <bfd.h>
+ #include <string.h>
+ #include <unistd.h>
+ #include <sys/types.h>
+@@ -33,6 +32,7 @@
+ #include <sys/queue.h>
+
+ #include "lookup.h"
++#include <bfd.h>
+
+ struct symbol_entry {
+ 	char *sym_name;
