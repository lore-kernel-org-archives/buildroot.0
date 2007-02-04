From: Doug the RockRat <rickyrockrat@yahoo.com>
Date: Sun, 4 Feb 2007 14:32:22 -0800 (PST)
Subject: [Buildroot] patch for makedevs to put in target - svn 17728
Message-ID: <265874.9205.qm@web62003.mail.re1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--- svn/buildroot/target/makedevs/Config.in    
1969-12-31 17:00:00.000000000 -0700
+++
buildroot-2007-02-02.diff/target/makedevs/Config.in
2007-02-03 05:54:22.000000000 -0700
@@ -0,0 +1,5 @@
+config BR2_TARGET_MAKEDEVS
+       bool "make devices from config"
+       default n
+       help
+         Create device nodes whatnot for the target
device, in conjunction with device file.
diff -ruN svn/buildroot/target/makedevs/makedevs.mk
buildroot-2007-02-02.diff/target/makedevs/makedevs.mk
--- svn/buildroot/target/makedevs/makedevs.mk  
2007-02-02 10:49:25.000000000 -0700
+++
buildroot-2007-02-02.diff/target/makedevs/makedevs.mk 
     2007-02-03 05:57:10.000000000 -0700
@@ -20,7 +20,19 @@
        $(INSTALL) -m 755 $(MAKEDEVS_DIR)/makedevs
$(STAGING_DIR)/bin/makedevs
        touch -c $(STAGING_DIR)/bin/makedevs

-makedevs: $(STAGING_DIR)/bin/makedevs
+$(TARGET_DIR)/sbin/makedevs:
$(MAKEDEVS_DIR)/makedevs.c
+       $(TARGET_CC) -Wall -Werror -O2
$(MAKEDEVS_DIR)/makedevs.c -o
$(TARGET_DIR)/sbin/makedevs
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_TARGET_MAKEDEVS)),y)
+TARGETS+=$(TARGET_DIR)/sbin/makedevs
+endif
+
+makedevs: $(STAGING_DIR)/bin/makedevs
$(TARGET_DIR)/sbin/makedevs

 makedevs-source:




 
____________________________________________________________________________________
Cheap talk?
Check out Yahoo! Messenger's low PC-to-Phone call rates.
http://voice.yahoo.com
