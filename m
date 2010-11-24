From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 24 Nov 2010 22:32:15 +0100
Subject: [Buildroot] [git commit master 1/1] lrzsz: add lrz/lsz symlinks
Message-ID: <20101124213307.9E5218DEB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bc3219e48420ce4a9ee2fffe995214cb56f63bc8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Many systems support automatic zmodem transfers without needing to first
manually run the zmodem utils.  But the expectation is to run `lrz` and
not `rz`.  So install symlinks for lrz->rz and lsz->sz to support this.

This also includes a small fix to also remove sz when cleaning.

[Peter: use addprefix rather than patsubst]
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    2 +-
 package/lrzsz/lrzsz.mk |    4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8a560fe..05c9554 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,7 +3,7 @@
 	Fixes all over the tree.
 
 	Updated/fixed packages: bash, bind, busybox, libglib2,
-	libcurl, libmad, midori, module-init-tools, mtd-utils,
+	libcurl, libmad, lrzsz, midori, module-init-tools, mtd-utils,
 	openssh, openssl, pciutils, qt, sqlite, sysstat, webkit, zlib
 
 	Issues resolved (http://bugs.uclibc.org):
diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 0b7f4e6..2fce39c 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -39,10 +39,12 @@ endef
 define LRZSZ_INSTALL_TARGET_CMDS
 	cp $(@D)/src/lrz $(TARGET_DIR)/usr/bin/rz
 	cp $(@D)/src/lsz $(TARGET_DIR)/usr/bin/sz
+	ln -s rz $(TARGET_DIR)/usr/bin/lrz
+	ln -s sz $(TARGET_DIR)/usr/bin/lsz
 endef
 
 define LRZSZ_CLEAN_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/rz
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,rz sz lrz lsz)
 	-$(MAKE) -C $(@D) clean
 endef
 
-- 
1.7.2.2
