From: hamish at uclibc.org <hamish@uclibc.org>
Date: Wed,  3 Sep 2008 19:34:42 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080904023442.C39DD3C7D7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-09-03 19:34:42 -0700 (Wed, 03 Sep 2008)
New Revision: 23317

Log:
Make the autotools xyz-clean target call xyz-uninstall first, rather than duplicating its actions


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-09-04 02:30:56 UTC (rev 23316)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-09-04 02:34:42 UTC (rev 23317)
@@ -247,10 +247,6 @@
 
 $(BUILD_DIR)/%/.stamp_cleaned:
 	$(call MESSAGE,"Cleaning up")
-	-$($(PKG)_MAKE_ENV) $(MAKE)  $($(PKG)_UNINSTALL_STAGING_OPT) -C $(@D)/$($(PKG)_SUBDIR)
-	rm -f $(@D)/.stamp_staging_installed
-	-$($(PKG)_MAKE_ENV) $(MAKE)  $($(PKG)_UNINSTALL_TARGET_OPT) -C $(@D)/$($(PKG)_SUBDIR)
-	rm -f $(@D)/.stamp_target_installed
 	-$($(PKG)_MAKE_ENV) $(MAKE)  $($(PKG)_CLEAN_OPT) -C $(@D)/$($(PKG)_SUBDIR)
 	rm -f $(@D)/.stamp_built
 
@@ -368,7 +364,8 @@
 # non-build targets
 $(1)-uninstall:	$(1)-configure $$($(2)_TARGET_UNINSTALL)
 
-$(1)-clean:		$$($(2)_TARGET_CLEAN)
+$(1)-clean:		$(1)-uninstall \
+			$$($(2)_TARGET_CLEAN)
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
