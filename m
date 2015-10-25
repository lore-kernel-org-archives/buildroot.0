From: Rodrigo Rebello <rprebello@gmail.com>
Date: Sun, 25 Oct 2015 03:08:13 -0200
Subject: [Buildroot] [PATCH v2 2/3] doom-wad: bump to version 1.9
In-Reply-To: <1445749694-9745-1-git-send-email-rprebello@gmail.com>
References: <1445749694-9745-1-git-send-email-rprebello@gmail.com>
Message-ID: <1445749694-9745-2-git-send-email-rprebello@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add a hash file.

The extraction method has changed, since the WAD file for this version
is not distributed as a stand-alone file, but comes inside a 2-part DOS
self-extracting zip archive.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
---
Changes v1 -> v2:
  - Upgrade Doom WAD shareware file to the latest 1.9 version. This
    avoids having to pass the option "-gameversion 1.8" to the
    chocolate-doom-* executables.
---
 package/doom-wad/doom-wad.hash |  2 ++
 package/doom-wad/doom-wad.mk   | 10 ++++++----
 2 files changed, 8 insertions(+), 4 deletions(-)
 create mode 100644 package/doom-wad/doom-wad.hash

diff --git a/package/doom-wad/doom-wad.hash b/package/doom-wad/doom-wad.hash
new file mode 100644
index 0000000..fa069c1
--- /dev/null
+++ b/package/doom-wad/doom-wad.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	cacf0142b31ca1af00796b4a0339e07992ac5f21bc3f81e7532fe1b5e1b486e6	doom19s.zip
diff --git a/package/doom-wad/doom-wad.mk b/package/doom-wad/doom-wad.mk
index 6f4f9da..6c870d0 100644
--- a/package/doom-wad/doom-wad.mk
+++ b/package/doom-wad/doom-wad.mk
@@ -4,16 +4,18 @@
 #
 ################################################################################
 
-DOOM_WAD_VERSION = 1.8
-DOOM_WAD_SOURCE = doom-$(DOOM_WAD_VERSION).wad.gz
+DOOM_WAD_VERSION = 1.9
+DOOM_WAD_SOURCE = doom19s.zip
 DOOM_WAD_SITE = ftp://ftp.idsoftware.com/idstuff/doom
 
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
 
-- 
2.1.4
