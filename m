From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Tue, 13 Jan 2009 07:26:56 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
Message-ID: <20090113072656.64F4A76850@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2009-01-13 07:26:55 +0000 (Tue, 13 Jan 2009)
New Revision: 24809

Log:
samba: properly disable largefile if not selected in Buildroot


Modified:
   trunk/buildroot/package/samba/samba.mk


Changeset:
Modified: trunk/buildroot/package/samba/samba.mk
===================================================================
--- trunk/buildroot/package/samba/samba.mk	2009-01-13 00:46:39 UTC (rev 24808)
+++ trunk/buildroot/package/samba/samba.mk	2009-01-13 07:26:55 UTC (rev 24809)
@@ -11,6 +11,10 @@
 SAMBA_BINARY:=bin/smbd
 SAMBA_TARGET_BINARY:=usr/sbin/smbd
 
+ifneq ($(BR2_LARGEFILE),y)
+SAMBA_DISABLE_LARGEFILE:=--disable-largefile
+endif
+
 $(DL_DIR)/$(SAMBA_SOURCE):
 	$(WGET) -P $(DL_DIR) $(SAMBA_SITE)/$(SAMBA_SOURCE)
 
@@ -55,7 +59,7 @@
 		--disable-shared-libs \
 		--disable-static \
 		--disable-cups \
-		$(BR2_LARGEFILE) \
+		$(SAMBA_DISABLE_LARGEFILE) \
 	)
 	touch $@
 
