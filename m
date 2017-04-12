From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:34:12 +0200
Subject: [Buildroot] [git commit] package/hiredis: fix installation logic of
	library
Message-ID: <20170412193436.95F9C80270@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96daacb720cffe1f83259462bef9d3da92925cd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While testing minetest with libhiredis library, the game crached due to
missing libhiredis.so.0.13 library.

The hiredis.mk doesn't use "make install" because "make install" depends
on building both the shared and static libraries, which fails in
static-only scenarios.

However, the installation logic in hiredis.mk is bogus: it installs the
library as libhiredis.so, while its SONAME is libhiredis.so.0.13. We fix
this by using the same logic as the one done by the package "make
install" process: install the library as libhiredis.so.0.13, and create
libhiredis.so as a symbolic link to it.

While at it:

 - Install the library 0755, this is more common.

 - Do not create $(TARGET_DIR)/usr/lib, since $(INSTALL) -D will create
   the necessary directories for the destination path.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: rework to use the same installation logic as the one from
hiredis "make install".]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hiredis/hiredis.mk | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index 53ad0b9..c2be936 100644
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
@@ -37,12 +38,15 @@ define HIREDIS_INSTALL_STAGING_CMDS
 		$(@D)/adapters $(HIREDIS_INCLUDE_DIR)
 	$(INSTALL) -D -m 0644 $(@D)/hiredis.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/hiredis.pc
-	$(INSTALL) -m 0644 -t $(STAGING_DIR)/usr/lib $(@D)/libhiredis*
+	$(INSTALL) -D -m 0755 $(@D)/libhiredis.so \
+		$(STAGING_DIR)/usr/lib/libhiredis.so.$(HIREDIS_VERSION_MAJOR)
+	ln -sf libhiredis.so.$(HIREDIS_VERSION_MAJOR) $(STAGING_DIR)/usr/lib/libhiredis.so
 endef
 
 define HIREDIS_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/lib
-	$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/lib $(@D)/libhiredis*
+	$(INSTALL) -D -m 0755 $(@D)/libhiredis.so \
+		$(TARGET_DIR)/usr/lib/libhiredis.so.$(HIREDIS_VERSION_MAJOR)
+	ln -sf libhiredis.so.$(HIREDIS_VERSION_MAJOR) $(TARGET_DIR)/usr/lib/libhiredis.so
 endef
 
 $(eval $(generic-package))
