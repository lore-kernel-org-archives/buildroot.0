From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Jun 2010 20:56:17 +0200
Subject: [Buildroot] [git commit master] tn5250: bump version and convert to
	autotargets
Message-ID: <20100606185744.073028D280@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8ac2bba9bbaee491ddb083d8ce80abf3130e2f2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1903

[Peter: add --without-ssl when openssl isn't enabled]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                |    4 +-
 package/tn5250/Config.in               |    1 +
 package/tn5250/tn5250-0.16.4-001.patch |   28 ----------
 package/tn5250/tn5250.mk               |   86 ++++++++++----------------------
 4 files changed, 30 insertions(+), 89 deletions(-)
 delete mode 100644 package/tn5250/tn5250-0.16.4-001.patch

diff --git a/CHANGES b/CHANGES
index eaac40d..7c42459 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,7 +7,8 @@
 	New packages: cgilua, copas, coxpcall, luafilesystem,
 	luasocket, rings, wsapi, xavante
 
-	Updated/fixed packages: cdrkit, libidn, netperf, qt, usbutils
+	Updated/fixed packages: cdrkit, libidn, netperf, qt, tn5250,
+	usbutils
 
 	Removed packages: modutils
 
@@ -17,6 +18,7 @@
 	#1879: Bump iptables to 1.4.8
 	#1885: Add a bunch of lua modules
 	#1897: Bump libusb to 1.0.7
+	#1903: Bump tn5250 to 0.17.4 and migrate to autotargets
 	#1909: netperf-2.4.5 fails to build because of undeclared SOCK_DCCP
 
 2010.05, Released May 30th, 2010:
diff --git a/package/tn5250/Config.in b/package/tn5250/Config.in
index cddf44d..807def0 100644
--- a/package/tn5250/Config.in
+++ b/package/tn5250/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TN5250
 	bool "tn5250"
+	select BR2_PACKAGE_NCURSES
 	help
 	  Telnet client that emulates 5250 terminals and printers.
 
diff --git a/package/tn5250/tn5250-0.16.4-001.patch b/package/tn5250/tn5250-0.16.4-001.patch
deleted file mode 100644
index 5854e65..0000000
--- a/package/tn5250/tn5250-0.16.4-001.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-diff -urN tn5250-0.16.4-0rig/src/common.h tn5250-0.16.4/src/common.h
---- tn5250-0.16.4-0rig/src/common.h	1970-01-01 01:00:00.000000000 +0100
-+++ tn5250-0.16.4/src/common.h	2007-07-25 15:33:37.000000000 +0200
-@@ -0,0 +1,2 @@
-+#define	TRUE	1
-+#define	FALSE	0
-diff -urN tn5250-0.16.4-0rig/src/host3270.c tn5250-0.16.4/src/host3270.c
---- tn5250-0.16.4-0rig/src/host3270.c	2002-03-20 09:50:36.000000000 +0100
-+++ tn5250-0.16.4/src/host3270.c	2007-07-25 15:34:25.000000000 +0200
-@@ -20,6 +20,7 @@
-  * 
-  */
- 
-+#include "common.h"
- #include "tn5250-private.h"
- #include "host3270.h"
- #include "codes3270.h"
-diff -urN tn5250-0.16.4-0rig/src/host5250.c tn5250-0.16.4/src/host5250.c
---- tn5250-0.16.4-0rig/src/host5250.c	2002-03-20 09:50:36.000000000 +0100
-+++ tn5250-0.16.4/src/host5250.c	2007-07-25 15:33:10.000000000 +0200
-@@ -19,6 +19,7 @@
-  * Boston, MA 02111-1307 USA
-  */
- 
-+#include "common.h"
- #include "tn5250-private.h"
- #include "host5250.h"
- 
diff --git a/package/tn5250/tn5250.mk b/package/tn5250/tn5250.mk
index 205cd30..ac9c1f1 100644
--- a/package/tn5250/tn5250.mk
+++ b/package/tn5250/tn5250.mk
@@ -1,65 +1,31 @@
-TN5250_VERSION:=0.16.4
-TN5250_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tn5250
-TN5250_DIR:=$(BUILD_DIR)/tn5250-$(TN5250_VERSION)
-TN5250_SOURCE:=tn5250-$(TN5250_VERSION).tar.gz
-TN5250_CAT:=$(ZCAT)
-
-$(DL_DIR)/$(TN5250_SOURCE):
-	$(call DOWNLOAD,$(TN5250_SITE),$(TN5250_SOURCE))
-
-$(TN5250_DIR)/.dist: $(DL_DIR)/$(TN5250_SOURCE)
-	$(TN5250_CAT) $(DL_DIR)/$(TN5250_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(TN5250_DIR) package/tn5250 tn5250\*.patch
-	-touch $(TN5250_DIR)/.dist
-
-$(TN5250_DIR)/.configured: $(TN5250_DIR)/.dist
-	(cd $(TN5250_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		$(DISABLE_NLS) \
-		--with-slang --without-x --without-ssl \
-	)
-	touch $(TN5250_DIR)/.configured
-
-$(TN5250_DIR)/src/tn5250: $(TN5250_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(TN5250_DIR)
-
-$(TARGET_DIR)/usr/bin/tn5250: $(TN5250_DIR)/src/tn5250
-	install -c $(TN5250_DIR)/src/tn5250 $(TARGET_DIR)/usr/bin/tn5250
-
-tn5250: slang $(TARGET_DIR)/usr/bin/tn5250
-
-tn5250-source: $(DL_DIR)/$(TN5250_SOURCE)
-
-tn5250-clean:
-	-$(MAKE) -C $(TN5250_DIR) clean
-	rm -f $(TARGET_DIR)/usr/bin/tn5250
-
-tn5250-dirclean:
-	rm -rf $(TN5250_DIR)
-
-
-
 #############################################################
 #
-# Toplevel Makefile options
+# tn5250
 #
 #############################################################
-ifeq ($(BR2_PACKAGE_TN5250),y)
-TARGETS+=tn5250
+
+TN5250_VERSION = 0.17.4
+TN5250_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tn5250
+TN5250_MAKE_OPT = CPPFLAGS=""
+TN5250_DEPENDENCIES = ncurses
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	TN5250_CONF_OPT += --with-ssl
+	TN5250_DEPENDENCIES += openssl
+else
+	TN5250_CONF_OPT += --without-ssl
 endif
+
+$(eval $(call AUTOTARGETS,package,tn5250))
+
+$(TN5250_HOOK_POST_INSTALL):
+	rm -f $(TARGET_DIR)/usr/bin/5250keys
+	rm -f $(TARGET_DIR)/usr/bin/xt5250
+	touch $@
+
+$(TN5250_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(TN5250_DIR)
+	rm -f $(TARGET_DIR)/usr/lib/lib5250.*
+	rm -rf $(TARGET_DIR)/usr/share/tn5250
+	rm -f $(TN5250_TARGET_INSTALL_TARGET) $(TN5250_HOOK_POST_INSTALL)
-- 
1.6.3.3
