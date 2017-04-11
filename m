From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 12 Apr 2017 00:26:30 +0200
Subject: [Buildroot] [PATCH 01/14] package/hiredis: add missing library
	symlink
Message-ID: <20170411222643.9770-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While testing minetest with libhiredis library, the game crached due to
missing libhiredis.so.0.13 library.

Since the build system doesn't use "make install" and install manually
headers and library file, it must also create the symlink
libhiredis.so.0.13 -> libhiredis.so

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hiredis/hiredis.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index 53ad0b9..6472934 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-HIREDIS_VERSION = v0.13.3
+HIREDIS_VERSION_MAJOR = 0.13
+HIREDIS_VERSION = v$(HIREDIS_VERSION_MAJOR).3
 HIREDIS_SITE = $(call github,redis,hiredis,$(HIREDIS_VERSION))
 HIREDIS_LICENSE = BSD-3-Clause
 HIREDIS_LICENSE_FILES = COPYING
@@ -37,12 +38,14 @@ define HIREDIS_INSTALL_STAGING_CMDS
 		$(@D)/adapters $(HIREDIS_INCLUDE_DIR)
 	$(INSTALL) -D -m 0644 $(@D)/hiredis.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/hiredis.pc
+	ln -sf libhiredis.so $(STAGING_DIR)/usr/lib/libhiredis.so.$(HIREDIS_VERSION_MAJOR)
 	$(INSTALL) -m 0644 -t $(STAGING_DIR)/usr/lib $(@D)/libhiredis*
 endef
 
 define HIREDIS_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/lib
 	$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/lib $(@D)/libhiredis*
+	ln -sf libhiredis.so $(TARGET_DIR)/usr/lib/libhiredis.so.$(HIREDIS_VERSION_MAJOR)
 endef
 
 $(eval $(generic-package))
-- 
2.9.3
