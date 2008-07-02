From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  2 Jul 2008 01:58:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080702085819.9648B3C632@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-02 01:58:18 -0700 (Wed, 02 Jul 2008)
New Revision: 22607

Log:
Makefile.autotools.in: fix source handling

Handling source/source-check/external-deps together doesn't work, as
wget will then download the sources every time make source is called
even if it's available in DL_DIR

Instead detect source-check/external-deps from MAKELEVEL.

Support downloadable package patches in source-check/external-deps
while we're at it.

Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-07-02 07:20:16 UTC (rev 22606)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-07-02 08:58:18 UTC (rev 22607)
@@ -130,9 +130,10 @@
 
 # Retrieve and unpack the archive
 $(BUILD_DIR)/%/.stamp_downloaded:
-# support make source/source-check/external-deps
-ifneq ($(filter source,$(MAKECMDGOALS)),)
+# support make source-check/external-deps
+ifeq ($(MAKELEVEL),1)
 	$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
+	$(if $($(PKG)_PATCH),$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_PATCH))
 else
 	$(call MESSAGE,"Downloading")
 ifneq ($(strip $(subst ",,$(BR2_PRIMARY_SITE))),)
