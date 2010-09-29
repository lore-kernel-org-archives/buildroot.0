From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 Sep 2010 22:40:31 +0200
Subject: [Buildroot] [git commit master 1/1] lockfile-progs: cleanup
	install/uninstall
Message-ID: <20100929204138.620958B7A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ccb974d7ea4a63ba3423e6bd7d91c18d02ea4fde
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install/uninstall all programs (including mail-*), and use install -D
to copy to target.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lockfile-progs/lockfile-progs.mk |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index c7b5565..f8d8cee 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -7,16 +7,25 @@ LOCKFILE_PROGS_VERSION = 0.1.15
 LOCKFILE_PROGS_SOURCE = lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
 LOCKFILE_PROGS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lockfile-progs/
 
+LOCKFILE_BINS = \
+	$(addprefix lockfile-,check create remove touch) \
+	$(addprefix mail-,lock touchlock unlock)
+
 define LOCKFILE_PROGS_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
 define LOCKFILE_PROGS_INSTALL_TARGET_CMDS
-	cp -a $(@D)/bin/lockfile* $(TARGET_DIR)/usr/bin
+	for i in $(LOCKFILE_BINS); do \
+		install -D -m 755 $(@D)/bin/$$i $(TARGET_DIR)/usr/bin/$$i; \
+	done
+endef
+
+define LOCKFILE_PROGS_UNINSTALL_TARGET_CMDS
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(LOCKFILE_BINS))
 endef
 
 define LOCKFILE_PROGS_CLEAN_CMDS
-	-rm -f $(TARGET_DIR)/usr/bin/lockfile-*
 	-$(MAKE) -C $(@D) clean
 endef
 
-- 
1.7.1
