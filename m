From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue,  2 Oct 2007 08:38:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libelf
Message-ID: <20071002153828.CD59EA493F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-10-02 08:38:27 -0700 (Tue, 02 Oct 2007)
New Revision: 20174

Log:
- make sure that the target's usr/include dir exists when installing the headers
  It would make sense to provide a $(PREREQ_TARGETDIR_USR_INCLUDE) prerequisite that expands to $(TARGET_DIR)/usr/include
  if installing any headers was requested to fix this in a generic manner..


Modified:
   trunk/buildroot/package/libelf/libelf.mk


Changeset:
Modified: trunk/buildroot/package/libelf/libelf.mk
===================================================================
--- trunk/buildroot/package/libelf/libelf.mk	2007-10-02 11:25:37 UTC (rev 20173)
+++ trunk/buildroot/package/libelf/libelf.mk	2007-10-02 15:38:27 UTC (rev 20174)
@@ -57,7 +57,9 @@
 
 ifeq ($(BR2_PACKAGE_LIBELF_HEADERS),y)
 $(TARGET_DIR)/usr/lib/libelf.so.$(LIBELF_VERSION): $(STAGING_DIR)/usr/lib/libelf.a
-	$(INSTALL) $(STAGING_DIR)/usr/lib/libelf* $(@D)
+	mkdir -p $(@D)
+	cp -dpf $(STAGING_DIR)/usr/lib/libelf* $(@D)
+	mkdir -p $(TARGET_DIR)/usr/include
 	cp -dpR $(STAGING_DIR)/usr/include/{gelf.h,libelf*} $(TARGET_DIR)/usr/include/
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
