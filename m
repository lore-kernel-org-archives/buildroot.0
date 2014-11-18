From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 21:50:05 +0100
Subject: [Buildroot] [git commit] package/tzdata: fix installation commands
Message-ID: <20141118205136.78D5BB48CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=20271a0011c21ed15704017ec83be6d21b47c1ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the destination directory already exists (e.g. because of a re-run or
a custom skeleton), then the zoneinfo files will be installed in a
sub-directory of where we are trying to install them.

Fix that by creating the destination directory and copying the content
of the source directory.

Also fix the host install commands to match what we do in the target
install commands.

Reported-by: Martin Dorwig <dorwig@tetronik.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tzdata/tzdata.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

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
 
