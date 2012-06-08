From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Jun 2012 12:30:46 -0300
Subject: [Buildroot] [PATCH 7/7] bzip2: security bump to version 1.0.6
In-Reply-To: <1339169446-26972-1-git-send-email-gustavo@zacarias.com.ar>
References: <1339169446-26972-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1339169446-26972-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump bzip2 to version 1.0.6 to fix CVE-2010-0405

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bzip2/bzip2.mk |   29 ++++++++++++++---------------
 1 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index 1bc4449..59c993e 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -3,15 +3,14 @@
 # bzip2
 #
 #############################################################
-BZIP2_VERSION:=1.0.5
-BZIP2_SONAME=1.0.4
-BZIP2_SOURCE:=bzip2-$(BZIP2_VERSION).tar.gz
-BZIP2_SITE:=http://www.bzip.org/$(BZIP2_VERSION)
-BZIP2_INSTALL_STAGING=YES
+
+BZIP2_VERSION = 1.0.6
+BZIP2_SITE = http://www.bzip.org/$(BZIP2_VERSION)
+BZIP2_INSTALL_STAGING = YES
 
 define BZIP2_FIX_MAKEFILE
 	$(SED) "s,ln \$$(,ln -snf \$$(,g" $(@D)/Makefile
-	$(SED) "s,ln -s (lib.*),ln -snf \$$1; ln -snf libbz2.so.$(BZIP2_SONAME) \
+	$(SED) "s,ln -s (lib.*),ln -snf \$$1; ln -snf libbz2.so.$(BZIP2_VERSION)) \
 	    libbz2.so,g" $(@D)/Makefile-libbz2_so
 	$(SED) "s:-O2:$(TARGET_CFLAGS):" $(@D)/Makefile
 	$(SED) "s:-O2:$(TARGET_CFLAGS):" $(@D)/Makefile-libbz2_so
@@ -42,12 +41,12 @@ define BZIP2_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
 	$(MAKE) PREFIX=$(STAGING_DIR)/usr -C $(@D) install
 	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/lib
-	cp $(@D)/libbz2.so.$(BZIP2_SONAME) $(STAGING_DIR)/usr/lib/
+	cp $(@D)/libbz2.so.$(BZIP2_VERSION) $(STAGING_DIR)/usr/lib/
 	cp $(@D)/libbz2.a $(STAGING_DIR)/usr/lib/
 	(cd $(STAGING_DIR)/usr/lib/; \
-		ln -snf libbz2.so.$(BZIP2_SONAME) libbz2.so; \
-		ln -snf libbz2.so.$(BZIP2_SONAME) libbz2.so.1.0; \
-		ln -snf libbz2.so.$(BZIP2_SONAME) libbz2.so.1; \
+		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so; \
+		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so.1.0; \
+		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so.1; \
 	)
 endef
 
@@ -56,11 +55,11 @@ define BZIP2_INSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,bzip2 bunzip2 bzcat)
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
 	$(MAKE) PREFIX=$(TARGET_DIR)/usr -C $(@D) install
-	cp $(@D)/libbz2.so.$(BZIP2_SONAME) $(TARGET_DIR)/usr/lib/
+	cp $(@D)/libbz2.so.$(BZIP2_VERSION) $(TARGET_DIR)/usr/lib/
 	(cd $(TARGET_DIR)/usr/lib; \
-		ln -snf libbz2.so.$(BZIP2_SONAME) libbz2.so.1.0; \
-		ln -snf libbz2.so.$(BZIP2_SONAME) libbz2.so.1; \
-		ln -snf libbz2.so.$(BZIP2_SONAME) libbz2.so; \
+		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so.1.0; \
+		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so.1; \
+		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so; \
 	)
 	(cd $(TARGET_DIR)/usr/bin; \
 		ln -snf bzip2 bunzip2; \
@@ -84,7 +83,7 @@ endef
 
 define HOST_BZIP2_FIX_MAKEFILE
 	$(SED) "s,ln \$$(,ln -snf \$$(,g" $(@D)/Makefile
-	$(SED) "s,ln -s (lib.*),ln -snf \$$1; ln -snf libbz2.so.$(BZIP2_SONAME) \
+	$(SED) "s,ln -s (lib.*),ln -snf \$$1; ln -snf libbz2.so.$(BZIP2_VERSION) \
 	    libbz2.so,g" $(@D)/Makefile-libbz2_so
 	$(SED) "s:-O2:$(HOST_CFLAGS):" $(@D)/Makefile
 	$(SED) "s:-O2:$(HOST_CFLAGS):" $(@D)/Makefile-libbz2_so
-- 
1.7.3.4
