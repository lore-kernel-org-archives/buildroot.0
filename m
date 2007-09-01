From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  1 Sep 2007 10:10:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070901171056.0B17FA65B1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-01 10:10:55 -0700 (Sat, 01 Sep 2007)
New Revision: 19749

Log:
- rephrase r19284 -- explicitely list base targets for World
  Needed for toplevel parallel builds to work properly.


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-09-01 17:09:08 UTC (rev 19748)
+++ trunk/buildroot/Makefile	2007-09-01 17:10:55 UTC (rev 19749)
@@ -209,12 +209,13 @@
 TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
-
+TARGETS_ALL:=$(patsubst %,__real_tgt_%,$(TARGETS))
 # all targets depend on the crosscompiler and it's prerequisites
-$(TARGETS): $(BASE_TARGETS)
+$(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 
 $(BR2_DEPENDS_DIR): .config
 	rm -rf $@
+	mkdir -p $(@D)
 	cp -dpRf $(CONFIG)/buildroot-config $@
 
 dirs: $(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
@@ -223,11 +224,11 @@
 
 $(BASE_TARGETS): dirs
 
-world: dependencies dirs target-host-info $(BASE_TARGETS) $(TARGETS)
+world: dependencies dirs target-host-info $(BASE_TARGETS) $(TARGETS_ALL)
 
 
 .PHONY: all world dirs clean dirclean distclean source \
-	$(BASE_TARGETS) $(TARGETS) \
+	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
 	$(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(BR2_DEPENDS_DIR) \
