From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 19:17:46 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/iputils: move binaries to the
 location also used by Busybox
Message-ID: <20190617171747.7713-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

iputils installs several programs that are also implemented as applets
in Busybox. Two of these (arping and tftpd) are installed by iputils
in /bin, while Busybox installs them in /usr/sbin, causing both to be
present if both iputils and busybox are enabled.

This commit moves the binaries installed by iputils to /usr/sbin, so
that only these are installed (Busybox will be installed later thanks
to its optional dependency on iputils, but it will not override the
tools installed by iputils).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes since v1:
 - Take into account BR2_ROOTFS_MERGED_USR when moving the ping
   program
---
 package/iputils/iputils.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 8be54b4788..7bd756f040 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -52,6 +52,17 @@ endif
 # XSL Stylesheets for DocBook 5 not packaged for buildroot
 IPUTILS_CONF_OPTS += -DBUILD_MANS=false -DBUILD_HTML_MANS=false
 
+# move iputils binaries to the same location as where Busybox installs
+# the corresponding applets, so that we have a single version of the
+# tools (from iputils)
+define IPUTILS_MOVE_BINARIES
+	mv $(TARGET_DIR)/usr/bin/arping $(TARGET_DIR)/usr/sbin/arping
+	$(if $(BR2_ROOTFS_MERGED_USR),,\
+		mv $(TARGET_DIR)/usr/bin/ping $(TARGET_DIR)/bin/ping)
+	mv $(TARGET_DIR)/usr/bin/tftpd $(TARGET_DIR)/usr/sbin/tftpd
+endef
+IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_BINARIES
+
 # handle permissions ourselves
 IPUTILS_CONF_OPTS += -DNO_SETCAP_OR_SUID=true
 define IPUTILS_PERMISSIONS
-- 
2.21.0
