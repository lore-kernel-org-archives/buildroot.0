From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 20 Sep 2007 04:08:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070920110814.D7AA6A685D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-20 04:08:13 -0700 (Thu, 20 Sep 2007)
New Revision: 19906

Log:
- this is generic infrastructure, there is no point in special-casing any individual package here.
   Don't workaround deficiencies but fix them for real


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2007-09-20 09:35:33 UTC (rev 19905)
+++ trunk/buildroot/package/Makefile.autotools.in	2007-09-20 11:08:13 UTC (rev 19906)
@@ -143,6 +143,9 @@
 	$(Q)touch $@
 
 # Patch
+# XXX: FIXME: This has to be done differently and path-independent, i.e. use
+# XXX: FIXME: the dir-part of the stem as base-dir (instead of hardcoding
+# XXX: FIXME: "package/".
 $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $($(PKG)_NAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched:
 	$(call MESSAGE,"Patching")
@@ -158,7 +161,8 @@
 	    fi; \
 	  fi; \
 	else \
-	  if test "$(wildcard package/x11r7/$($(PKG)_NAME)/$(NAMEVER)*.patch)" ; then \
+	  echo "This must be wrong. Why do you need to special-case _any_ package here? Skipping until this is resolved properly." \
+	  if false && test "$(wildcard package/x11r7/$($(PKG)_NAME)/$(NAMEVER)*.patch)" ; then \
 	    toolchain/patch-kernel.sh $(@D) package/x11r7/$($(PKG)_NAME) $(NAMEVER)\*.patch || exit 1 ; \
 	  else \
 	    toolchain/patch-kernel.sh $(@D) package/x11r7/$($(PKG)_NAME) $($(PKG)_NAME)\*.patch || exit 1 ; \
