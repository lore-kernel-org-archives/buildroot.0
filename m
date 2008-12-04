From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Thu,  4 Dec 2008 08:13:08 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20081204161308.C6C7D3C8DF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-04 08:13:08 -0800 (Thu, 04 Dec 2008)
New Revision: 24272

Log:
avahi: add dependency to host-autoconf

Avahi uses autoconf during ./configure, make sure it is available and used
before building avahi.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2008-12-04 16:10:44 UTC (rev 24271)
+++ trunk/buildroot/package/avahi/avahi.mk	2008-12-04 16:13:08 UTC (rev 24272)
@@ -53,7 +53,7 @@
 	touch $@
 
 $(AVAHI_DIR)/.configured: $(AVAHI_DIR)/.unpacked $(AVAHI_EXTRA_DEPS)
-	(cd $(AVAHI_DIR) && rm -rf config.cache && autoconf)
+	(cd $(AVAHI_DIR) && rm -rf config.cache && PATH=$(TARGET_PATH) autoconf)
 	(cd $(AVAHI_DIR) && \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
@@ -180,7 +180,7 @@
 		 $(TARGET_DIR)/usr/sbin/avahi-daemon
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
-avahi: uclibc libdaemon $(if $(BR2_ENABLE_LOCALE),gettext libintl) $(AVAHI_TARGETS)
+avahi: host-autoconf uclibc libdaemon $(if $(BR2_ENABLE_LOCALE),gettext libintl) $(AVAHI_TARGETS)
 
 avahi-clean:
 	-$(MAKE) -C $(AVAHI_DIR) distclean
