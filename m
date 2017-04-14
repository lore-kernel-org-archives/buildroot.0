From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Apr 2017 22:29:31 +0200
Subject: [Buildroot] [git commit] package/hiredis: fix install step for
	static build only
Message-ID: <20170414203005.A1824827D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10ffe1f65ce2975eb7fad426c466a5d80e3a82ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The previous patch [1] didn't take into acount the static build only
scenario. It tries to unconditionally install a shared library.

Handle the install step like for bzip2 package: install the shared
library only if BR2_SHARED_LIBS or BR2_SHARED_STATIC_LIBS is set and
install the static library only if BR2_STATIC_LIBS or
BR2_SHARED_STATIC_LIBS is set.

[1] 96daacb720cffe1f83259462bef9d3da92925cd9

Fixes:
http://autobuild.buildroot.net/results/6be/6be8024dd664af83fcf49ede29c8ad59a37f73d1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hiredis/hiredis.mk | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index c2be936..dd75742 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -31,6 +31,26 @@ endef
 
 HIREDIS_INCLUDE_DIR = $(STAGING_DIR)/usr/include/hiredis
 
+ifeq ($(BR2_SHARED_LIBS),)
+define HIREDIS_INSTALL_STAGING_STATIC_LIB
+	$(INSTALL) -D -m 0755 $(@D)/libhiredis.a \
+		$(STAGING_DIR)/usr/lib/libhiredis.a
+endef
+endif
+
+ifeq ($(BR2_STATIC_LIBS),)
+define HIREDIS_INSTALL_STAGING_SHARED_LIB
+	$(INSTALL) -D -m 0755 $(@D)/libhiredis.so \
+		$(STAGING_DIR)/usr/lib/libhiredis.so.$(HIREDIS_VERSION_MAJOR)
+	ln -sf libhiredis.so.$(HIREDIS_VERSION_MAJOR) $(STAGING_DIR)/usr/lib/libhiredis.so
+endef
+define HIREDIS_INSTALL_TARGET_SHARED_LIB
+	$(INSTALL) -D -m 0755 $(@D)/libhiredis.so \
+		$(TARGET_DIR)/usr/lib/libhiredis.so.$(HIREDIS_VERSION_MAJOR)
+	ln -sf libhiredis.so.$(HIREDIS_VERSION_MAJOR) $(TARGET_DIR)/usr/lib/libhiredis.so
+endef
+endif
+
 # Do not call make install as this target will build shared and static libraries
 define HIREDIS_INSTALL_STAGING_CMDS
 	mkdir -p $(HIREDIS_INCLUDE_DIR)
@@ -38,15 +58,12 @@ define HIREDIS_INSTALL_STAGING_CMDS
 		$(@D)/adapters $(HIREDIS_INCLUDE_DIR)
 	$(INSTALL) -D -m 0644 $(@D)/hiredis.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/hiredis.pc
-	$(INSTALL) -D -m 0755 $(@D)/libhiredis.so \
-		$(STAGING_DIR)/usr/lib/libhiredis.so.$(HIREDIS_VERSION_MAJOR)
-	ln -sf libhiredis.so.$(HIREDIS_VERSION_MAJOR) $(STAGING_DIR)/usr/lib/libhiredis.so
+	$(HIREDIS_INSTALL_STAGING_STATIC_LIB)
+	$(HIREDIS_INSTALL_STAGING_SHARED_LIB)
 endef
 
 define HIREDIS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/libhiredis.so \
-		$(TARGET_DIR)/usr/lib/libhiredis.so.$(HIREDIS_VERSION_MAJOR)
-	ln -sf libhiredis.so.$(HIREDIS_VERSION_MAJOR) $(TARGET_DIR)/usr/lib/libhiredis.so
+	$(HIREDIS_INSTALL_TARGET_SHARED_LIB)
 endef
 
 $(eval $(generic-package))
