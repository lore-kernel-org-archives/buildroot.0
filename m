From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 May 2010 15:07:05 +0200
Subject: [Buildroot] [git commit master] bzip2: fixup build after ea448fe
	(convert to gentargets, add host package, bump version)
Message-ID: <20100503130922.4EC158D390@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2a2403af1d8f87e31e79b5927bb64c74c6993e2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a few typos/mistakes introduced in commit ea448fe:

- bzip2 soname is not the same as package version
- It is PKG_INSTALL_STAGING, not PKG_STAGING_INSTALL
- Typo: BZIP2_INSTALL_TARGET_CMDS, not B2IP_INSTALL_TARGET_CMDS

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    2 +-
 package/bzip2/bzip2.mk |   23 ++++++++++++-----------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9561a0a..4aba557 100644
--- a/CHANGES
+++ b/CHANGES
@@ -12,7 +12,7 @@
 	New packages: librsync, libatomic_ops, libusb-compat, lmbench,
 	netperf, squid
 
-	Updated/fixed packages: alsa-utils, busybox, directfb, dnsmasq,
+	Updated/fixed packages: alsa-utils, busybox, bzip2, directfb, dnsmasq,
 	dosfstools, e2fsprogs, eeprog, fbv, freetype, haserl, hostapd,
 	iperf, iptables, iw, less, libaio, libdrm, libgcrypt, libglib2,
 	libpng, libxml2, libxslt, linux-fusion, lua, matchbox, mdadm,
diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index 43ab5f2..39e1832 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -4,13 +4,14 @@
 #
 #############################################################
 BZIP2_VERSION:=1.0.5
+BZIP2_SONAME=1.0.4
 BZIP2_SOURCE:=bzip2-$(BZIP2_VERSION).tar.gz
 BZIP2_SITE:=http://www.bzip.org/$(BZIP2_VERSION)
-BZIP2_STAGING_INSTALL=YES
+BZIP2_INSTALL_STAGING=YES
 
 define BZIP2_FIX_MAKEFILE
 	$(SED) "s,ln \$$(,ln -snf \$$(,g" $(@D)/Makefile
-	$(SED) "s,ln -s (lib.*),ln -snf \$$1; ln -snf libbz2.so.$(BZIP2_VERSION) \
+	$(SED) "s,ln -s (lib.*),ln -snf \$$1; ln -snf libbz2.so.$(BZIP2_SONAME) \
 	    libbz2.so,g" $(@D)/Makefile-libbz2_so
 	$(SED) "s:-O2:$(TARGET_CFLAGS):" $(@D)/Makefile
 	$(SED) "s:-O2:$(TARGET_CFLAGS):" $(@D)/Makefile-libbz2_so
@@ -39,22 +40,22 @@ endef
 
 define BZIP2_INSTALL_STAGING_CMDS
 	cp $(@D)/bzlib.h $(STAGING_DIR)/usr/include/
-	cp $(@D)/libbz2.so.$(BZIP2_VERSION) $(STAGING_DIR)/usr/lib/
+	cp $(@D)/libbz2.so.$(BZIP2_SONAME) $(STAGING_DIR)/usr/lib/
 	cp $(@D)/libbz2.a $(STAGING_DIR)/usr/lib/
 	(cd $(STAGING_DIR)/usr/lib/; \
-		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so; \
-		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so.1.0; \
-		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so.1; \
+		ln -snf libbz2.so.$(BZIP2_SONAME) libbz2.so; \
+		ln -snf libbz2.so.$(BZIP2_SONAME) libbz2.so.1.0; \
+		ln -snf libbz2.so.$(BZIP2_SONAME) libbz2.so.1; \
 	)
 endef
 
-define B2IP_INSTALL_TARGET_CMDS
+define BZIP2_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
 	$(MAKE) PREFIX=$(TARGET_DIR)/usr -C $(@D) install
-	cp $(@D)/libbz2.so.$(BZIP2_VERSION) $(TARGET_DIR)/usr/lib/
+	cp $(@D)/libbz2.so.$(BZIP2_SONAME) $(TARGET_DIR)/usr/lib/
 	(cd $(TARGET_DIR)/usr/lib; \
-		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so.1.0; \
-		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so; \
+		ln -snf libbz2.so.$(BZIP2_SONAME) libbz2.so.1.0; \
+		ln -snf libbz2.so.$(BZIP2_SONAME) libbz2.so; \
 	)
 	(cd $(TARGET_DIR)/usr/bin; \
 		ln -snf bzip2 bunzip2; \
@@ -78,7 +79,7 @@ endef
 
 define HOST_BZIP2_FIX_MAKEFILE
 	$(SED) "s,ln \$$(,ln -snf \$$(,g" $(@D)/Makefile
-	$(SED) "s,ln -s (lib.*),ln -snf \$$1; ln -snf libbz2.so.$(BZIP2_VERSION) \
+	$(SED) "s,ln -s (lib.*),ln -snf \$$1; ln -snf libbz2.so.$(BZIP2_SONAME) \
 	    libbz2.so,g" $(@D)/Makefile-libbz2_so
 	$(SED) "s:-O2:$(HOST_CFLAGS):" $(@D)/Makefile
 	$(SED) "s:-O2:$(HOST_CFLAGS):" $(@D)/Makefile-libbz2_so
-- 
1.6.3.3
