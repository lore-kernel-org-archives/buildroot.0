From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 14 Jun 2008 14:01:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080614210104.1A0473C8C9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-14 14:01:03 -0700 (Sat, 14 Jun 2008)
New Revision: 22340

Log:
package/Makefile.autotools.in: support 'make external-deps'



Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-06-14 21:00:59 UTC (rev 22339)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-06-14 21:01:03 UTC (rev 22340)
@@ -130,6 +130,10 @@
 
 # Retrieve and unpack the archive
 $(BUILD_DIR)/%/.stamp_downloaded:
+# support make external-deps
+ifeq ($(strip $(WGET)),$(TOPDIR)toolchain/wget-show-external-deps.sh)
+	$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
+else
 	$(call MESSAGE,"Downloading")
 ifdef BR2_PRIMARY_SITE
 	-$(Q)test -e $(DL_DIR)/$($(PKG)_SOURCE) || $(WGET) -P $(DL_DIR) $(BR2_PRIMARY_SITE)/$($(PKG)_SOURCE)
@@ -138,6 +142,7 @@
 	$(if $($(PKG)_PATCH),$(Q)test -e $(DL_DIR)/$($(PKG)_PATCH) || $(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_PATCH))
 	$(Q)mkdir -p $(@D)
 	$(Q)touch $@
+endif
 
 # Retrieve and unpack the archive
 $(BUILD_DIR)/%/.stamp_extracted:
