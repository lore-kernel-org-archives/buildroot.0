From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 12:41:55 +0100
Subject: [Buildroot] [git commit] doom-wad: bump to version 1.9
Message-ID: <20151224114853.437B1826F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8b82f89965897e7aa65948095d0f6382f5b642ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add a hash file.

The extraction method had to be changed, since the WAD file for this
version is not distributed as a stand-alone file, but comes inside a
2-part DOS self-extracting zip archive.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/doom-wad/doom-wad.hash |  2 ++
 package/doom-wad/doom-wad.mk   | 14 +++++++++-----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/doom-wad/doom-wad.hash b/package/doom-wad/doom-wad.hash
new file mode 100644
index 0000000..fa069c1
--- /dev/null
+++ b/package/doom-wad/doom-wad.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	cacf0142b31ca1af00796b4a0339e07992ac5f21bc3f81e7532fe1b5e1b486e6	doom19s.zip
diff --git a/package/doom-wad/doom-wad.mk b/package/doom-wad/doom-wad.mk
index 6f4f9da..d3ac731 100644
--- a/package/doom-wad/doom-wad.mk
+++ b/package/doom-wad/doom-wad.mk
@@ -4,16 +4,20 @@
 #
 ################################################################################
 
-DOOM_WAD_VERSION = 1.8
-DOOM_WAD_SOURCE = doom-$(DOOM_WAD_VERSION).wad.gz
-DOOM_WAD_SITE = ftp://ftp.idsoftware.com/idstuff/doom
+DOOM_WAD_VERSION = 1.9
+DOOM_WAD_SOURCE = doom$(subst .,,$(DOOM_WAD_VERSION))s.zip
+# Official server currently unavailable
+# DOOM_WAD_SITE = ftp://ftp.idsoftware.com/idstuff/doom
+DOOM_WAD_SITE = http://www.jbserver.com/downloads/games/doom/misc/shareware
 
 define DOOM_WAD_EXTRACT_CMDS
-	$(ZCAT) $(DL_DIR)/$($(PKG)_SOURCE) > $(@D)/doom1.wad
+	$(UNZIP) -p $(DL_DIR)/$($(PKG)_SOURCE) 'DOOMS_19.[12]' > \
+		$(@D)/doom-$(DOOM_WAD_VERSION).zip
+	$(UNZIP) -d $(@D) $(@D)/doom-$(DOOM_WAD_VERSION).zip DOOM1.WAD
 endef
 
 define DOOM_WAD_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/doom1.wad \
+	$(INSTALL) -m 0644 -D $(@D)/DOOM1.WAD \
 		$(TARGET_DIR)/usr/share/games/doom/doom1.wad
 endef
 
