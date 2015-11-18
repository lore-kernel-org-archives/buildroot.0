From: James Knight <james.knight@rockwellcollins.com>
Date: Wed, 18 Nov 2015 11:39:24 -0500
Subject: [Buildroot] [PATCH 1/1] chrony: bump to version 2.2
Message-ID: <1447864764-2208-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the new version, documentation is not generated part of the main
build. This removes the need to alter the Makefile to remove the invoke
on the `chrony.txt` target. Cleanup also allows a switch to using
autotools and explicitly disabling seccomp (since its experimental) and
tomcrypt (Buildroot does not have libtomcrypt at this time).

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/chrony/chrony.hash |  6 +++---
 package/chrony/chrony.mk   | 29 ++++++++---------------------
 2 files changed, 11 insertions(+), 24 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index ba7f95e..066ecb5 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,3 +1,3 @@
-# From http://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2014/09/msg00000.html
-md5	04ab702fc81150db06809562a9aaed92  chrony-1.31.tar.gz
-sha1	71bb46cad2f15760192795e60efdf23069973908  chrony-1.31.tar.gz
+# From http://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2015/10/msg00002.html
+md5  17bc77d3d2ce942675f9600b60452717         chrony-2.2.tar.gz
+sha1 eed81b53ef504430128a3a6fa5b56f7ee2fdf2b1 chrony-2.2.tar.gz
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 72c4c4b..4874f22 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,12 +4,17 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 1.31
+CHRONY_VERSION = 2.2
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPLv2
 CHRONY_LICENSE_FILES = COPYING
 
-CHRONY_CONF_OPTS = --host-system=Linux --host-machine=$(BR2_ARCH) --prefix=/usr
+CHRONY_CONF_OPTS = \
+    --host-system=Linux \
+    --host-machine=$(BR2_ARCH) \
+    --prefix=/usr \
+    --without-seccomp \
+    --without-tomcrypt
 
 ifeq ($(BR2_PACKAGE_LIBNSS),y)
 CHRONY_DEPENDENCIES += host-pkgconf libnss
@@ -23,24 +28,6 @@ else
 CHRONY_CONF_OPTS += --disable-readline
 endif
 
-# Ditch the doc build, needs makeinfo and we don't need them
-define CHRONY_DISABLE_DOCS
-	$(SED) 's/chronyc chrony.txt/chronyc/' $(@D)/Makefile.in
-endef
-CHRONY_POST_PATCH_HOOKS += CHRONY_DISABLE_DOCS
-
-define CHRONY_CONFIGURE_CMDS
-	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure $(CHRONY_CONF_OPTS)
-endef
-
-define CHRONY_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define CHRONY_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
-endef
-
 define CHRONY_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/chrony/S49chrony $(TARGET_DIR)/etc/init.d/S49chrony
 endef
@@ -53,4 +40,4 @@ define CHRONY_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/chrony.service
 endef
 
-$(eval $(generic-package))
+$(eval $(autotools-package))
-- 
1.9.5.msysgit.1
