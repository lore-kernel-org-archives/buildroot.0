From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 24 Oct 2019 11:06:01 +0200
Subject: [Buildroot] [git commit] package/libselinux: install Python modules
 to target
Message-ID: <20191024090134.25EDA8434E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8e4cc9dc4d67f384d11d4aaa321dac7ba73dba8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
