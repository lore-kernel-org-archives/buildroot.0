From: Jens <irimi@gmx.de>
Date: Fri, 09 Apr 2010 17:23:52 +0200
Subject: [Buildroot] [Bug 849] "customize" package copies files to wrong
 place in target tree
In-Reply-To: <20100409145501.366AD8A341@busybox.osuosl.org>
References: <bug-849-163@https.bugs.busybox.net/>
	<20100409145501.366AD8A341@busybox.osuosl.org>
Message-ID: <4BBF4688.3040008@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

that simple patch works fine for me (just using cp with  'r' option):

BR,
Jens

diff -Nur --exclude=config buildroot.orig/package/customize/customize.mk 
buildroot/package/customize/customize.mk
--- buildroot.orig/package/customize/customize.mk    2010-02-26 
15:52:48.000000000 +0100
+++ buildroot/package/customize/customize.mk    2010-04-05 
00:59:40.000000000 +0200
@@ -6,14 +6,8 @@
 CUST_DIR:=package/customize/source
 
 $(BUILD_DIR)/.customize:
-    rm -f $(BUILD_DIR)/series
-    (cd $(CUST_DIR); \
-     /bin/ls -d * > $(BUILD_DIR)/series || \
-     touch $(BUILD_DIR)/series )
-    for f in `cat $(BUILD_DIR)/series`; do \
-        cp -af $(CUST_DIR)/$$f $(TARGET_DIR)/$$f; \
-    done
-    rm -f $(BUILD_DIR)/series
+    cp -arf $(CUST_DIR)/* $(TARGET_DIR)/
+#    rm -f $(BUILD_DIR)/series
     touch $@
 
 customize: $(BUILD_DIR)/.customize


> https://bugs.busybox.net/show_bug.cgi?id=849
>
> --- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2010-04-09 14:55:00 UTC ---
> *** Bug 1135 has been marked as a duplicate of this bug. ***
>   
