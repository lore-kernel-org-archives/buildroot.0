From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Nov 2014 19:38:27 +0100
Subject: [Buildroot] [PATCH] package/tzdata: fix installation commands
Message-ID: <1416335907-10074-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the destination directory already exists (e.g. because of a re-run or
a custom skeleton), then the zoneinfo files will be installed in a
sub-directory of where we are trying to install them.

Fix that by creating the destination directory and copying the content
of the source directory.

Also fix the host install commands to match what we do in the target
install commands.

Reported-by: Martin Dorwig <dorwig@tetronik.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tzdata/tzdata.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 47e29c0..d0aa857 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -26,8 +26,8 @@ TZDATA_LOCALTIME = $(call qstrip,$(BR2_TARGET_LOCALTIME))
 TZDATA_EXTRACT_CMDS =
 
 define TZDATA_INSTALL_TARGET_CMDS
-	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share
-	cp -a $(HOST_DIR)/usr/share/zoneinfo $(TARGET_DIR)/usr/share/zoneinfo
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/zoneinfo
+	cp -a $(HOST_DIR)/usr/share/zoneinfo/* $(TARGET_DIR)/usr/share/zoneinfo
 	cd $(TARGET_DIR)/usr/share/zoneinfo;    \
 	for zone in posix/*; do                 \
 	    ln -sfn "$${zone}" "$${zone##*/}";  \
@@ -59,7 +59,7 @@ define HOST_TZDATA_BUILD_CMDS
 endef
 
 define HOST_TZDATA_INSTALL_CMDS
-	mkdir -p $(HOST_DIR)/usr/share/zoneinfo
+	$(INSTALL) -d -m 0755 $(HOST_DIR)/usr/share/zoneinfo
 	cp -a $(@D)/_output/* $(@D)/*.tab $(HOST_DIR)/usr/share/zoneinfo
 endef
 
-- 
1.9.1
