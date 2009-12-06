From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Dec 2009 18:41:15 +0100
Subject: [Buildroot] [git commit master] Bump pcre to 7.9
Message-ID: <20091206174305.8282877787@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9f17728fb5a2bab29e2764c2def51cd732718d9b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #763.

[Peter: Only remove pcre-config from target if !BR2_HAVE_DEVFILES]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    3 ++-
 package/pcre/pcre.mk |    8 +++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 04c677b..aed2298 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,12 +1,13 @@
 2010.02, Not yet released:
 
-	Updated/fixed packages: autoconf, binutils, busybox, lighttpd
+	Updated/fixed packages: autoconf, binutils, busybox, lighttpd, pcre
 
 	Issues resolved (http://bugs.uclibc.org):
 
 	#751: Kernel 2.6 snapshot fetch fail
 	#753: Bump lighttpd package to 1.4.25
 	#761: Add binutils 2.20 to toolchain options
+	#763: [SECURITY] Update pcre to 7.9
 
 2009.11, Released December 1st, 2009:
 
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 647399e..290e534 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -3,11 +3,10 @@
 # PCRE
 #
 #############################################################
-PCRE_VERSION = 7.7
-PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
+
+PCRE_VERSION = 7.9
 PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
 PCRE_INSTALL_STAGING = YES
-PCRE_INSTALL_TARGET = YES
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 # pcre will use the host g++ if a cross version isn't available
@@ -21,4 +20,7 @@ $(PCRE_HOOK_POST_INSTALL): $(PCRE_TARGET_INSTALL_TARGET)
 		-e 's,^exec_prefix=.*,exec_prefix=$(STAGING_DIR)/usr,' \
 		$(STAGING_DIR)/usr/bin/pcre-config
 	rm -rf $(TARGET_DIR)/usr/share/doc/pcre
+ifneq ($(BR2_HAVE_DEVFILES),y)
+	rm -f $(TARGET_DIR)/usr/bin/pcre-config
+endif
 	touch $@
-- 
1.6.3.3
