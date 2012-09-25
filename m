From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Tue, 25 Sep 2012 12:17:03 +0200
Subject: [Buildroot] [PATCH 1/1] allow to pass the number of parallel jobs
	via command line
Message-ID: <1348568223-13874-1-git-send-email-plagnioj@jcrosoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

use PARALLEL_JOBS=x for this

This will overwrite the value in BR2_JLEVEL

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 Makefile            |    2 ++
 package/Makefile.in |    2 ++
 2 files changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 6536bca..13e8139 100644
--- a/Makefile
+++ b/Makefile
@@ -730,6 +730,8 @@ endif
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
 	@echo
+	@echo '  make PARALLEL_JOBS=x   - X => number of jobs for each package this overwrite the KConfig BR2_JLEVEL'
+	@echo
 	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
 	@echo
diff --git a/package/Makefile.in b/package/Makefile.in
index 64508b2..fcf5b13 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -9,12 +9,14 @@ HOSTMAKE :=$(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
 # If BR2_LEVEL is 0, scale the maximum concurrency with the number of
 # CPUs.  A coefficient of 2 is used in order to keep processors busy
 # while waiting on I/O.
+ifeq ($(PARALLEL_JOBS),)
 ifeq ($(BR2_JLEVEL),0)
 PARALLEL_JOBS:=$(shell echo \
 	$$((2 * `getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1`)))
 else
 PARALLEL_JOBS:=$(BR2_JLEVEL)
 endif
+endif
 
 MAKE1:=$(HOSTMAKE) -j1
 MAKE:=$(HOSTMAKE) -j$(PARALLEL_JOBS)
-- 
1.7.10.4
