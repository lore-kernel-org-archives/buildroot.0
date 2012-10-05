From: Valentine Barshak <gvaxon@gmail.com>
Date: Fri,  5 Oct 2012 21:25:34 +0400
Subject: [Buildroot] [PATCH] sylpheed: Fix includedir
Message-ID: <1349457934-6208-1-git-send-email-gvaxon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The sylpheed headers are installed to the target directory,
creating full staging directory path in the target rootfs,
which is wrong.
This happens because the headers are installed to
$(DESTDIR)$(includedir), while DESTDIR is set to
$(TARGET_DIR) and includedir is $(STAGING_DIR)/usr/include.

Remove $(DESTDIR) from the include paths in the Makefile
to have sylpheed install its headers to staging include
directory instead.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
---
 package/sylpheed/sylpheed-fix-includedir.patch | 89 ++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 package/sylpheed/sylpheed-fix-includedir.patch

diff --git a/package/sylpheed/sylpheed-fix-includedir.patch b/package/sylpheed/sylpheed-fix-includedir.patch
new file mode 100644
index 0000000..3971699
--- /dev/null
+++ b/package/sylpheed/sylpheed-fix-includedir.patch
@@ -0,0 +1,89 @@
+The sylpheed headers are installed to the target directory,
+creating full staging directory path in the target rootfs,
+which is wrong.
+This happens because the headers are installed to
+$(DESTDIR)$(includedir), while DESTDIR is set to
+$(TARGET_DIR) and includedir is $(STAGING_DIR)/usr/include.
+
+Remove $(DESTDIR) from the include paths in the Makefile
+to have sylpheed install its headers to staging include
+directory instead.
+
+Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
+
+diff -pruN sylpheed-3.1.0.orig/libsylph/Makefile.in sylpheed-3.1.0/libsylph/Makefile.in
+--- sylpheed-3.1.0.orig/libsylph/Makefile.in	2012-09-25 22:47:21.794759554 +0400
++++ sylpheed-3.1.0/libsylph/Makefile.in	2012-09-25 22:47:39.797760345 +0400
+@@ -502,20 +502,20 @@ uninstall-info-am:
+ libsylph_0includeHEADERS_INSTALL = $(INSTALL_HEADER)
+ install-libsylph_0includeHEADERS: $(libsylph_0include_HEADERS)
+ 	@$(NORMAL_INSTALL)
+-	$(mkinstalldirs) $(DESTDIR)$(libsylph_0includedir)
++	$(mkinstalldirs) $(libsylph_0includedir)
+ 	@list='$(libsylph_0include_HEADERS)'; for p in $$list; do \
+ 	  if test -f "$$p"; then d=; else d="$(srcdir)/"; fi; \
+ 	  f="`echo $$p | sed -e 's|^.*/||'`"; \
+-	  echo " $(libsylph_0includeHEADERS_INSTALL) $$d$$p $(DESTDIR)$(libsylph_0includedir)/$$f"; \
+-	  $(libsylph_0includeHEADERS_INSTALL) $$d$$p $(DESTDIR)$(libsylph_0includedir)/$$f; \
++	  echo " $(libsylph_0includeHEADERS_INSTALL) $$d$$p $(libsylph_0includedir)/$$f"; \
++	  $(libsylph_0includeHEADERS_INSTALL) $$d$$p $(libsylph_0includedir)/$$f; \
+ 	done
+ 
+ uninstall-libsylph_0includeHEADERS:
+ 	@$(NORMAL_UNINSTALL)
+ 	@list='$(libsylph_0include_HEADERS)'; for p in $$list; do \
+ 	  f="`echo $$p | sed -e 's|^.*/||'`"; \
+-	  echo " rm -f $(DESTDIR)$(libsylph_0includedir)/$$f"; \
+-	  rm -f $(DESTDIR)$(libsylph_0includedir)/$$f; \
++	  echo " rm -f $(libsylph_0includedir)/$$f"; \
++	  rm -f $(libsylph_0includedir)/$$f; \
+ 	done
+ 
+ ETAGS = etags
+@@ -609,7 +609,7 @@ check: $(BUILT_SOURCES)
+ all-am: Makefile $(LTLIBRARIES) $(HEADERS)
+ 
+ installdirs:
+-	$(mkinstalldirs) $(DESTDIR)$(libdir) $(DESTDIR)$(libsylph_0includedir)
++	$(mkinstalldirs) $(DESTDIR)$(libdir) $(libsylph_0includedir)
+ install: $(BUILT_SOURCES)
+ 	$(MAKE) $(AM_MAKEFLAGS) install-am
+ install-exec: install-exec-am
+diff -pruN sylpheed-3.1.0.orig/src/Makefile.in sylpheed-3.1.0/src/Makefile.in
+--- sylpheed-3.1.0.orig/src/Makefile.in	2012-09-25 22:47:21.803759364 +0400
++++ sylpheed-3.1.0/src/Makefile.in	2012-09-25 22:47:39.798760332 +0400
+@@ -771,20 +771,20 @@ uninstall-info-am:
+ libsylpheed_plugin_0includeHEADERS_INSTALL = $(INSTALL_HEADER)
+ install-libsylpheed_plugin_0includeHEADERS: $(libsylpheed_plugin_0include_HEADERS)
+ 	@$(NORMAL_INSTALL)
+-	$(mkinstalldirs) $(DESTDIR)$(libsylpheed_plugin_0includedir)
++	$(mkinstalldirs) $(libsylpheed_plugin_0includedir)
+ 	@list='$(libsylpheed_plugin_0include_HEADERS)'; for p in $$list; do \
+ 	  if test -f "$$p"; then d=; else d="$(srcdir)/"; fi; \
+ 	  f="`echo $$p | sed -e 's|^.*/||'`"; \
+-	  echo " $(libsylpheed_plugin_0includeHEADERS_INSTALL) $$d$$p $(DESTDIR)$(libsylpheed_plugin_0includedir)/$$f"; \
+-	  $(libsylpheed_plugin_0includeHEADERS_INSTALL) $$d$$p $(DESTDIR)$(libsylpheed_plugin_0includedir)/$$f; \
++	  echo " $(libsylpheed_plugin_0includeHEADERS_INSTALL) $$d$$p $(libsylpheed_plugin_0includedir)/$$f"; \
++	  $(libsylpheed_plugin_0includeHEADERS_INSTALL) $$d$$p $(libsylpheed_plugin_0includedir)/$$f; \
+ 	done
+ 
+ uninstall-libsylpheed_plugin_0includeHEADERS:
+ 	@$(NORMAL_UNINSTALL)
+ 	@list='$(libsylpheed_plugin_0include_HEADERS)'; for p in $$list; do \
+ 	  f="`echo $$p | sed -e 's|^.*/||'`"; \
+-	  echo " rm -f $(DESTDIR)$(libsylpheed_plugin_0includedir)/$$f"; \
+-	  rm -f $(DESTDIR)$(libsylpheed_plugin_0includedir)/$$f; \
++	  echo " rm -f $(libsylpheed_plugin_0includedir)/$$f"; \
++	  rm -f $(libsylpheed_plugin_0includedir)/$$f; \
+ 	done
+ 
+ # This directory's subdirectories are mostly independent; you can cd
+@@ -963,7 +963,7 @@ install-binPROGRAMS: install-libLTLIBRAR
+ 
+ installdirs: installdirs-recursive
+ installdirs-am:
+-	$(mkinstalldirs) $(DESTDIR)$(libdir) $(DESTDIR)$(bindir) $(DESTDIR)$(libsylpheed_plugin_0includedir)
++	$(mkinstalldirs) $(DESTDIR)$(libdir) $(DESTDIR)$(bindir) $(libsylpheed_plugin_0includedir)
+ 
+ install: $(BUILT_SOURCES)
+ 	$(MAKE) $(AM_MAKEFLAGS) install-recursive
-- 
1.7.11.4
