From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 28 Jan 2009 15:12:06 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20090128151207.0D728769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-28 15:12:05 +0000 (Wed, 28 Jan 2009)
New Revision: 25097

Log:
avahi-autoipd: fix issue with repeated builds

The avahi-autoipd target install step adds /var/lib/avahi-autoipd as a
symlink to /tmp/avahi-autoipd, which is fine, except if your /var/lib is
already a symlink to /tmp (E.G. like the default target_skeleton is).

If that's the case, then you end up adding a /tmp/avahi-autoipd symlink
pointing to itself, causing subsequent builds to fail
(Too many levels of symbolic links in the ln -sf call). Fix it by simply
first removing the symlink if it's there.

Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2009-01-28 14:33:41 UTC (rev 25096)
+++ trunk/buildroot/package/avahi/avahi.mk	2009-01-28 15:12:05 UTC (rev 25097)
@@ -158,6 +158,7 @@
 	chmod 0755 $(TARGET_DIR)/usr/share/udhcpc/default.script
 	cp -af package/avahi/S05avahi-setup.sh $(TARGET_DIR)/etc/init.d/
 	cp $(STAGING_DIR)/usr/sbin/avahi-autoipd $@
+	rm -f $(TARGET_DIR)/var/lib/avahi-autoipd
 	ln -sf /tmp/avahi-autoipd $(TARGET_DIR)/var/lib/avahi-autoipd
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
