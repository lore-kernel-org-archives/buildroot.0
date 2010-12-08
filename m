From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 8 Dec 2010 23:37:48 +0100
Subject: [Buildroot] [git commit master 1/1] dhrystone: new benchmark package
Message-ID: <20101208223825.156BD8D570@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9ffc2e809c9a1a6be135d6ec5503e8d0717d2cc0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                           |    2 +-
 package/Config.in                                 |    1 +
 package/dhrystone/Config.in                       |    6 ++
 package/dhrystone/Makefile                        |   12 +++++
 package/dhrystone/dhrystone-2-HZ.patch            |   17 +++++++
 package/dhrystone/dhrystone-2-cmdline-nruns.patch |   53 +++++++++++++++++++++
 package/dhrystone/dhrystone-2-exit.patch          |   14 ++++++
 package/dhrystone/dhrystone-2-headers.patch       |   15 ++++++
 package/dhrystone/dhrystone-2-prototypes.patch    |   35 ++++++++++++++
 package/dhrystone/dhrystone.mk                    |   34 +++++++++++++
 10 files changed, 188 insertions(+), 1 deletions(-)
 create mode 100644 package/dhrystone/Config.in
 create mode 100644 package/dhrystone/Makefile
 create mode 100644 package/dhrystone/dhrystone-2-HZ.patch
 create mode 100644 package/dhrystone/dhrystone-2-cmdline-nruns.patch
 create mode 100644 package/dhrystone/dhrystone-2-exit.patch
 create mode 100644 package/dhrystone/dhrystone-2-headers.patch
 create mode 100644 package/dhrystone/dhrystone-2-prototypes.patch
 create mode 100644 package/dhrystone/dhrystone.mk

diff --git a/CHANGES b/CHANGES
index bf9a0a9..de9dcf4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,7 @@
 
 	Updated/fixed packages: cloop, m4, openssh, qt, xz
 
-	New packages: lsuio, rsh-redone, whetstone
+	New packages: dhrystone, lsuio, rsh-redone, whetstone
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/Config.in b/package/Config.in
index 42d7517..10d8918 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -17,6 +17,7 @@ source "package/xz/Config.in"
 endmenu
 
 menu "Debugging, profiling and benchmark"
+source "package/dhrystone/Config.in"
 source "package/dmalloc/Config.in"
 source "package/kexec/Config.in"
 source "package/lmbench/Config.in"
diff --git a/package/dhrystone/Config.in b/package/dhrystone/Config.in
new file mode 100644
index 0000000..d6fb7a7
--- /dev/null
+++ b/package/dhrystone/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_DHRYSTONE
+	bool "dhrystone"
+	help
+	  easy-to-use integer benchmark
+
+	  http://www.netlib.org/benchmark/dhry-c
diff --git a/package/dhrystone/Makefile b/package/dhrystone/Makefile
new file mode 100644
index 0000000..d628ddb
--- /dev/null
+++ b/package/dhrystone/Makefile
@@ -0,0 +1,12 @@
+CPPFLAGS += -DNO_PROTOTYPES=1
+LDLIBS += -lm
+
+all: dhrystone
+
+dhrystone: dhry_1.o dhry_2.o
+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS)
+
+clean:
+	rm -f *.o dhrystone
+
+.PHONY: all clean
diff --git a/package/dhrystone/dhrystone-2-HZ.patch b/package/dhrystone/dhrystone-2-HZ.patch
new file mode 100644
index 0000000..e3b8a0e
--- /dev/null
+++ b/package/dhrystone/dhrystone-2-HZ.patch
@@ -0,0 +1,17 @@
+Get HZ value from system rather than requiring via CPPFLAGS
+
+Patch by Robin Getz <rgetz@blackfin.uclinux.org>
+
+--- a/dhry.h
++++ b/dhry.h
+@@ -359,6 +359,10 @@
+                 /* for "times" */
+ #endif
+ 
++#ifndef HZ
++#include <sys/param.h>
++#endif
++
+ #define Mic_secs_Per_Second     1000000.0
+                 /* Berkeley UNIX C returns process times in seconds/HZ */
+ 
diff --git a/package/dhrystone/dhrystone-2-cmdline-nruns.patch b/package/dhrystone/dhrystone-2-cmdline-nruns.patch
new file mode 100644
index 0000000..1164610
--- /dev/null
+++ b/package/dhrystone/dhrystone-2-cmdline-nruns.patch
@@ -0,0 +1,53 @@
+let people specify the number of runs on the command line
+
+Patch by Vivi Li <vivi.li@analog.com>
+
+--- a/dhry_1.c
++++ b/dhry_1.c
+@@ -66,7 +70,7 @@
+ /* end of variables for time measurement */
+ 
+ 
+-main ()
++main(int argc, char *argv[])
+ /*****/
+ 
+   /* main program, corresponds to procedures        */
+@@ -101,6 +105,13 @@
+         /* Warning: With 16-Bit processors and Number_Of_Runs > 32000,  */
+         /* overflow may occur for this array element.                   */
+ 
++  Number_Of_Runs = 0;
++  if ( argc == 2 ) {
++      if (atoi(argv[1]) > 0) {
++          Number_Of_Runs = atoi(argv[1]);
++      }
++  }
++
+   printf ("\n");
+   printf ("Dhrystone Benchmark, Version 2.1 (Language: C)\n");
+   printf ("\n");
+@@ -114,13 +125,17 @@
+     printf ("Program compiled without 'register' attribute\n");
+     printf ("\n");
+   }
+-  printf ("Please give the number of runs through the benchmark: ");
+-  {
+-    int n;
+-    scanf ("%d", &n);
+-    Number_Of_Runs = n;
++
++  if (!Number_Of_Runs) {
++      printf ("Please give the number of runs through the benchmark: ");
++      fflush (stdout);
++      {
++          int n;
++          scanf ("%d", &n);
++          Number_Of_Runs = n;
++      }
++      printf ("\n");
+   }
+-  printf ("\n");
+ 
+   printf ("Execution starts, %d runs through Dhrystone\n", Number_Of_Runs);
+ 
diff --git a/package/dhrystone/dhrystone-2-exit.patch b/package/dhrystone/dhrystone-2-exit.patch
new file mode 100644
index 0000000..8d99f4e
--- /dev/null
+++ b/package/dhrystone/dhrystone-2-exit.patch
@@ -0,0 +1,14 @@
+trust the exit status of the program
+
+Patch by Robin Getz <rgetz@blackfin.uclinux.org>
+
+--- a/dhry_1.c
++++ b/dhry_1.c
+@@ -274,6 +289,7 @@
+     printf ("\n");
+   }
+   
++  exit(0);
+ }
+ 
+ 
diff --git a/package/dhrystone/dhrystone-2-headers.patch b/package/dhrystone/dhrystone-2-headers.patch
new file mode 100644
index 0000000..82bb60d
--- /dev/null
+++ b/package/dhrystone/dhrystone-2-headers.patch
@@ -0,0 +1,15 @@
+get prototypes for malloc/exit/strcpy
+
+Patch by Mike Frysinger <vapier@gentoo.org>
+
+--- a/dhry.h
++++ b/dhry.h
+@@ -388,6 +388,8 @@
+ /* General definitions: */
+ 
+ #include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
+                 /* for strcpy, strcmp */
+ 
+ #define Null 0 
diff --git a/package/dhrystone/dhrystone-2-prototypes.patch b/package/dhrystone/dhrystone-2-prototypes.patch
new file mode 100644
index 0000000..7fdcf94
--- /dev/null
+++ b/package/dhrystone/dhrystone-2-prototypes.patch
@@ -0,0 +1,35 @@
+Avoid collision with C library using NO_PROTOTYPES found in code already
+
+Patch by Robin Getz <rgetz@blackfin.uclinux.org>
+
+--- a/dhry_1.c
++++ b/dhry_1.c
+@@ -28,7 +28,9 @@
+ int             Arr_1_Glob [50];
+ int             Arr_2_Glob [50] [50];
+ 
++#ifndef NO_PROTOTYPES
+ extern char     *malloc ();
++#endif
+ Enumeration     Func_1 ();
+   /* forward declaration necessary since Enumeration may not simply be int */
+ 
+@@ -45,14 +45,18 @@
+ 
+ #ifdef TIMES
+ struct tms      time_info;
++#ifndef NO_PROTOTYPES
+ extern  int     times ();
+                 /* see library function "times" */
++#endif
+ #define Too_Small_Time 120
+                 /* Measurements should last at least about 2 seconds */
+ #endif
+ #ifdef TIME
++#ifndef NO_PROTOTYPES
+ extern long     time();
+                 /* see library function "time"  */
++#endif
+ #define Too_Small_Time 2
+                 /* Measurements should last at least 2 seconds */
+ #endif
diff --git a/package/dhrystone/dhrystone.mk b/package/dhrystone/dhrystone.mk
new file mode 100644
index 0000000..a03beec
--- /dev/null
+++ b/package/dhrystone/dhrystone.mk
@@ -0,0 +1,34 @@
+#############################################################
+#
+# dhrystone
+#
+#############################################################
+
+DHRYSTONE_VERSION = 2
+DHRYSTONE_SOURCE = dhry-c
+DHRYSTONE_SITE = http://www.netlib.org/benchmark/
+
+define DHRYSTONE_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define DHRYSTONE_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+define DHRYSTONE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/dhrystone $(TARGET_DIR)/usr/bin/dhrystone
+endef
+
+define DHRYSTONE_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/dhrystone
+endef
+
+$(eval $(call GENTARGETS,package,dhrystone))
+
+$(BUILD_DIR)/dhrystone-$(DHRYSTONE_VERSION)/.stamp_extracted:
+	@$(call MESSAGE,"Extracting")
+	$(Q)mkdir -p $(@D)
+	$(Q)cd $(@D) && $(SHELL) $(DL_DIR)/$($(PKG)_SOURCE)
+	$(Q)cp $($(PKG)_DIR_PREFIX)/dhrystone/Makefile $(@D)/
+	$(Q)touch $@
-- 
1.7.2.2
