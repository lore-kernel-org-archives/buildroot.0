From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Oct 2020 23:30:51 +0200
Subject: [Buildroot] [git commit] package/libselinux: fix the selinuxfs
 mount point
Message-ID: <20201006212016.E3A97878A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=641a3bc4450203c08b3054488fcdd506d750af7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For 9 years the recommended mount point for selinuxfs has been
/sys/fs/selinux, as stated in Linux kernel commit 7a627e3b9a2b:

"""
For selinuxfs, this mount point should be in /sys/fs/selinux/
"""

As other projects follow this convention, not doing so result in
potential issues. One of them is the refpolicy not correctly labelling
and supporting the mount point.

Fix this by using /sys/fs/selinux as of now in Buildroot.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libselinux/libselinux.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index c96b5a4431..8087af539a 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -70,10 +70,8 @@ define LIBSELINUX_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(LIBSELINUX_MAKE_OPTS) DESTDIR=$(TARGET_DIR) \
 		$(LIBSELINUX_MAKE_INSTALL_TARGETS)
-	# Create the selinuxfs mount point
-	if [ ! -d "$(TARGET_DIR)/selinux" ]; then mkdir $(TARGET_DIR)/selinux; fi
 	if ! grep -q "selinuxfs" $(TARGET_DIR)/etc/fstab; then \
-		echo "none /selinux selinuxfs noauto 0 0" >> $(TARGET_DIR)/etc/fstab ; fi
+		echo "none /sys/fs/selinux selinuxfs noauto 0 0" >> $(TARGET_DIR)/etc/fstab ; fi
 endef
 
 HOST_LIBSELINUX_DEPENDENCIES = \
