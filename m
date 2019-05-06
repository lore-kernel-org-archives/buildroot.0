From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 May 2019 21:28:33 +0200
Subject: [Buildroot] [git commit] package/owfs: delay sysvinit start until
 after network and avahi
Message-ID: <20190506193013.8595583A4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efc6ccbddc1737a534b2cb54f72bb9c2b2f58461
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In its default configuration, owserver opens a TCP socket on the 'lo'
interface. However, in some situations, the 'lo' interface may not yet
be up until S40network is started. This causes owserver not to start its
TCP socket, which makes it impossible for the owfs client to connect to
it.

In addition, owserver may have avahi integration.

Therefore, delay the start of owserver and owfs until after S40network
and S50avahi-daemon.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/owfs/{S25owserver => S55owserver} | 0
 package/owfs/{S30owfs => S60owfs}         | 0
 package/owfs/owfs.mk                      | 8 ++++----
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/owfs/S25owserver b/package/owfs/S55owserver
similarity index 100%
rename from package/owfs/S25owserver
rename to package/owfs/S55owserver
diff --git a/package/owfs/S30owfs b/package/owfs/S60owfs
similarity index 100%
rename from package/owfs/S30owfs
rename to package/owfs/S60owfs
diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index cd1c2dba6d..fccc2efa58 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -31,8 +31,8 @@ OWFS_CONF_OPTS += \
 	--with-fuseinclude=$(STAGING_DIR)/usr/include \
 	--with-fuselib=$(STAGING_DIR)/usr/lib
 define OWFS_INSTALL_FUSE_INIT_SYSV
-	$(INSTALL) -D -m 0755 $(OWFS_PKGDIR)S30owfs \
-		$(TARGET_DIR)/etc/init.d/S30owfs
+	$(INSTALL) -D -m 0755 $(OWFS_PKGDIR)S60owfs \
+		$(TARGET_DIR)/etc/init.d/S60owfs
 endef
 define OWFS_CREATE_MOUNTPOINT
 	mkdir -p $(TARGET_DIR)/dev/1wire
@@ -102,8 +102,8 @@ endif
 OWFS_MAKE = $(MAKE) $(OWFS_EXTRA_MAKE_OPTS)
 
 define OWFS_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 $(OWFS_PKGDIR)S25owserver \
-		$(TARGET_DIR)/etc/init.d/S25owserver
+	$(INSTALL) -D -m 0755 $(OWFS_PKGDIR)S55owserver \
+		$(TARGET_DIR)/etc/init.d/S55owserver
 	$(OWFS_INSTALL_FUSE_INIT_SYSV)
 endef
 
