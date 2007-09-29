From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 29 Sep 2007 03:05:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070929100508.C2CC330073@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-29 03:05:08 -0700 (Sat, 29 Sep 2007)
New Revision: 20111

Log:
- make sure that strip and all it's arguments are passed if used via
  STRIP=$(TARGET_STRIP) (i.e. without quoting). Thanks to Dimitry Golubovsky
  for mentioning this.


Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-09-29 09:58:13 UTC (rev 20110)
+++ trunk/buildroot/package/Makefile.in	2007-09-29 10:05:08 UTC (rev 20111)
@@ -109,7 +109,7 @@
 STRIP_STRIP_ALL:=--strip-all
 REMOVE_SECTION_COMMENT:=--remove-section=.comment
 REMOVE_SECTION_NOTE:=--remove-section=.note
-TARGET_STRIP=$(TARGET_CROSS)strip $(REMOVE_SECTION_COMMENT) $(REMOVE_SECTION_NOTE)
+TARGET_STRIP="$(TARGET_CROSS)strip $(REMOVE_SECTION_COMMENT) $(REMOVE_SECTION_NOTE)"
 STRIP=$(TARGET_STRIP)
 endif
 ifeq ($(BR2_STRIP_sstrip),y)
@@ -118,11 +118,11 @@
 STRIP_STRIP_ALL:=
 REMOVE_SECTION_COMMENT:=
 REMOVE_SECTION_NOTE:=
-TARGET_STRIP=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-sstrip
+TARGET_STRIP="$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-sstrip"
 STRIP=$(TARGET_STRIP)
 endif
 ifeq ($(BR2_STRIP_none),y)
-TARGET_STRIP=true -Not_stripping
+TARGET_STRIP="true -Not_stripping"
 STRIP=$(TARGET_STRIP)
 endif
 INSTALL=/usr/bin/install
