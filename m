From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 17 Sep 2007 14:50:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  package
Message-ID: <20070917215055.576C530046@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-17 14:50:54 -0700 (Mon, 17 Sep 2007)
New Revision: 19875

Log:
- add v9a and v9b settings.
  Will need to change the GCC_TARGET_TUNE accordingly.


Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-09-17 13:44:03 UTC (rev 19874)
+++ trunk/buildroot/Config.in	2007-09-17 21:50:54 UTC (rev 19875)
@@ -315,6 +315,8 @@
 	bool "tsc701"
 config BR2_sparc_v9
 	bool "v9"
+config BR2_sparc_v9a
+	bool "v9a"
 config BR2_sparc_v9b
 	bool "v9b"
 config BR2_sparc_ultrasparc
@@ -334,6 +336,8 @@
 
 config BR2_sparc64_v9
 	bool "v9"
+config BR2_sparc64_v9a
+	bool "v9a"
 config BR2_sparc64_v9b
 	bool "v9b"
 config BR2_sparc64_ultrasparc
@@ -349,6 +353,7 @@
 	default V7	if BR2_sparc_v7 || BR2_sparc_cypress || BR2_sparc_sparclite || BR2_sparc_f930 || BR2_sparc_f934 || BR2_sparc_sparclite86x || BR2_sparc_sparclet || BR2_sparc_tsc701
 	default V8	if BR2_sparc_v8 || BR2_sparc_supersparc || BR2_sparc_hypersparc
 	default V9	if BR2_sparc_v9 || BR2_sparc_ultrasparc || BR2_sparc_ultrasparc3 || BR2_sparc_niagara || BR2_sparc64_v9 || BR2_sparc64_ultrasparc || BR2_sparc64_ultrasparc3 || BR2_sparc64_niagara
+	default V9	if BR2_sparc_v9a || BR2_sparc64_v9a
 	default V9B	if BR2_sparc_v9b || BR2_sparc64_v9b
 
 choice
@@ -584,7 +589,9 @@
 	default sparclite86x	if BR2_sparc_sparclite86x
 	default sparclet	if BR2_sparc_sparclet
 	default tsc701		if BR2_sparc_tsc701
-	default v9		if BR2_sparc_v9 || BR2_sparc_v9b || BR2_sparc64_v9 || BR2_sparc64_v9b
+	default v9		if BR2_sparc_v9 || BR2_sparc64_v9
+	default v9		if BR2_sparc_v9a || BR2_sparc64_v9a
+	default v9		if BR2_sparc_v9b || BR2_sparc64_v9b
 	default ultrasparc	if BR2_sparc_ultrasparc || BR2_sparc64_ultrasparc
 	default ultrasparc3	if BR2_sparc_ultrasparc3 || BR2_sparc64_ultrasparc3
 	default niagara		if BR2_sparc_niagara || BR2_sparc64_niagara

Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-09-17 13:44:03 UTC (rev 19874)
+++ trunk/buildroot/package/Makefile.in	2007-09-17 21:50:54 UTC (rev 19875)
@@ -46,12 +46,10 @@
 TARGET_CFLAGS+=-msoft-float
 endif
 
-ifeq ($(BR2_sparc_v9b),y)
+# enable VIS for v9a and v9b
+ifeq ($(findstring y,$(BR2_sparc_v9a)$(BR2_sparc64_v9a)$(BR2_sparc_v9b)$(BR2_sparc64_v9b)),y)
 TARGET_CFLAGS+=-mvis
 endif
-ifeq ($(BR2_sparc64_v9b),y)
-TARGET_CFLAGS+=-mvis
-endif
 
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 
