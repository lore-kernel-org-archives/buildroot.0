From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  8 Nov 2014 10:22:23 -0300
Subject: [Buildroot] [PATCH] arptables: re-enable for static
Message-ID: <1415452943-11931-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a small patch to re-enable arptables for static builds.
The dlfcn.h is a stray include for a past attempt at loadable plugins
but the code is disabled so there's no need for it.

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../0001-arptables-disable-dlfcn.h-include.patch   | 32 ++++++++++++++++++++++
 package/arptables/Config.in                        |  5 ----
 package/arptables/arptables.hash                   |  2 ++
 3 files changed, 34 insertions(+), 5 deletions(-)
 create mode 100644 package/arptables/0001-arptables-disable-dlfcn.h-include.patch
 create mode 100644 package/arptables/arptables.hash

diff --git a/package/arptables/0001-arptables-disable-dlfcn.h-include.patch b/package/arptables/0001-arptables-disable-dlfcn.h-include.patch
new file mode 100644
index 0000000..a5d56d2
--- /dev/null
+++ b/package/arptables/0001-arptables-disable-dlfcn.h-include.patch
@@ -0,0 +1,32 @@
+From 948a96d710f377fb0ed8d78c7fb85b299c80ef13 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Sat, 8 Nov 2014 10:12:54 -0300
+Subject: [PATCH] arptables: disable dlfcn.h include
+
+The relevant code is disabled in libarptc_incl.c so it's not required
+and breaks the ability to build it in a pure-static toolchain.
+
+Status: sent upstream.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ arptables.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/arptables.c b/arptables.c
+index 64ac3aa..fe270bc 100644
+--- a/arptables.c
++++ b/arptables.c
+@@ -35,7 +35,9 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <inttypes.h>
++#if 0
+ #include <dlfcn.h>
++#endif
+ #include <ctype.h>
+ #include <stdarg.h>
+ #include <limits.h>
+-- 
+2.0.4
+
diff --git a/package/arptables/Config.in b/package/arptables/Config.in
index 15414a0..873e791 100644
--- a/package/arptables/Config.in
+++ b/package/arptables/Config.in
@@ -1,12 +1,7 @@
 config BR2_PACKAGE_ARPTABLES
 	bool "arptables"
 	depends on BR2_USE_MMU # needs fork()
-	depends on !BR2_PREFER_STATIC_LIB # needs dlopen()
 	help
 	  Tool to set up, maintain, and inspect the tables of ARP rules.
 
 	  http://ebtables.sourceforge.net
-
-comment "arptables needs a toolchain w/ dynamic library"
-	depends on BR2_USE_MMU
-	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/arptables/arptables.hash b/package/arptables/arptables.hash
new file mode 100644
index 0000000..95b9997
--- /dev/null
+++ b/package/arptables/arptables.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	277985e29ecd93bd759a58242cad0e02ba9d4a6e1b7795235e3b507661bc0049	arptables-v0.0.4.tar.gz
-- 
2.0.4
