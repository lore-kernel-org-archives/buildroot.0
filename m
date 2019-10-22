From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 10:49:23 +0200
Subject: [Buildroot] [PATCH] package/libselinux: install Python modules to
 target
Message-ID: <20191022084924.5854-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While LIBSELINUX_INSTALL_STAGING_CMDS uses
$(LIBSELINUX_MAKE_INSTALL_TARGETS), LIBSELINUX_INSTALL_TARGET_CMDS
does not use it. Due to this, the Python module is only installed to
$(STAGING_DIR) and not to $(TARGET_DIR).

Fix this by using $(LIBSELINUX_MAKE_INSTALL_TARGETS) in
LIBSELINUX_INSTALL_TARGET_CMDS.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Adam Duskett <aduskett@gmail.com>
---
 package/libselinux/libselinux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index c707c8a25e..c68721e3a7 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -72,7 +72,8 @@ endef
 
 define LIBSELINUX_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		$(LIBSELINUX_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
+		$(LIBSELINUX_MAKE_OPTS) DESTDIR=$(TARGET_DIR) \
+		$(LIBSELINUX_MAKE_INSTALL_TARGETS)
 	# Create the selinuxfs mount point
 	if [ ! -d "$(TARGET_DIR)/selinux" ]; then mkdir $(TARGET_DIR)/selinux; fi
 	if ! grep -q "selinuxfs" $(TARGET_DIR)/etc/fstab; then \
-- 
2.21.0
