From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sun,  6 May 2007 21:04:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070507040435.0EC3048584@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-05-06 21:04:34 -0700 (Sun, 06 May 2007)
New Revision: 18580

Log:
If any of the netkit packages were selected, we disable their counterparts in Busybox and warn the user.


Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2007-05-07 04:03:42 UTC (rev 18579)
+++ trunk/buildroot/package/busybox/busybox.mk	2007-05-07 04:04:34 UTC (rev 18580)
@@ -78,6 +78,16 @@
 	# force mdev on
 	$(SED) "s/^.*CONFIG_MDEV.*/CONFIG_MDEV=y/" $(BUSYBOX_DIR)/.config
 endif
+ifeq ($(BR2_PACKAGE_NETKITBASE),y)
+	# disable usage of inetd if netkit-base package is selected
+	$(SED) "s/^.*CONFIG_INETD.*/CONFIG_INETD=n/;" $(BUSYBOX_DIR)/.config
+	@echo "WARNING!! CONFIG_INETD option disabled!"
+endif
+ifeq ($(BR2_PACKAGE_NETKITTELNET),y)
+	# disable usage of telnetd if netkit-telnetd package is selected
+	$(SED) "s/^.*CONFIG_TELNETD.*/CONFIG_TELNETD=n/;" $(BUSYBOX_DIR)/.config
+	@echo "WARNING!! CONFIG_TELNETD option disabled!"
+endif
 	yes "" | $(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" -C $(BUSYBOX_DIR) oldconfig
 	touch $@
