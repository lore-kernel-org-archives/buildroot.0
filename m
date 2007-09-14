From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 14 Sep 2007 11:48:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lm-sensors
Message-ID: <20070914184846.20106A605F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-14 11:48:44 -0700 (Fri, 14 Sep 2007)
New Revision: 19831

Log:
- touchup a few bits that the submitter should have done in the first place


Modified:
   trunk/buildroot/package/lm-sensors/lm-sensors.mk


Changeset:
Modified: trunk/buildroot/package/lm-sensors/lm-sensors.mk
===================================================================
--- trunk/buildroot/package/lm-sensors/lm-sensors.mk	2007-09-14 11:25:29 UTC (rev 19830)
+++ trunk/buildroot/package/lm-sensors/lm-sensors.mk	2007-09-14 18:48:44 UTC (rev 19831)
@@ -29,6 +29,7 @@
 		toolchain/patch-kernel.sh $(LM_SENSORS_DIR) $(LM_SENSORS_DIR)/debian/patches \*.patch; \
 	fi
 endif
+	-$(SED) "s/-O[[:digit:]]//g" $(LM_SENSORS_DIR)/Makefile
 	touch $@
 
 $(LM_SENSORS_DIR)/$(LM_SENSORS_BINARY): $(LM_SENSORS_DIR)/.unpacked
@@ -38,6 +39,12 @@
 		DESTDIR=$(TARGET_DIR) user
 
 $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY): $(LM_SENSORS_DIR)/$(LM_SENSORS_BINARY)
+	if [ ! -f $(TARGET_DIR)/etc/sensors.conf ]; then \
+		cp -dpf $(LM_SENSORS_DIR)/etc/sensors.conf.eg \
+			$(TARGET_DIR)/etc/sensors.conf; \
+		$(SED) '/^#/d' -e '/^[[:space:]]*$$/d' \
+			$(TARGET_DIR)/etc/sensors.conf; \
+	fi
 	cp -dpf $(LM_SENSORS_DIR)/$(LM_SENSORS_BINARY) $@
 	cp -dpf $(LM_SENSORS_DIR)/lib/libsensors.so* \
 		$(LM_SENSORS_DIR)/lib/libsensors.a $(TARGET_DIR)/usr/lib/
@@ -48,7 +55,9 @@
 
 lm-sensors-clean:
 	-$(MAKE) -C $(LM_SENSORS_DIR) clean
-	rm -f $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY)
+	rm -f $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY) \
+		$(TARGET_DIR)/lib/libsensors* \
+		$(TARGET_DIR)/etc/sensors.conf
 
 lm-sensors-dirclean:
 	rm -rf $(LM_SENSORS_DIR)
