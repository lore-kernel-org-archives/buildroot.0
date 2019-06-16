From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Jun 2019 22:09:17 +0200
Subject: [Buildroot] [PATCH 1/2] package/iputils: move binaries to the
 location also used by Busybox
Message-ID: <20190616200919.4378-1-thomas.petazzoni@bootlin.com>
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
 package/iputils/iputils.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 8be54b4788..fbf586729b 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -52,6 +52,16 @@ endif
 # XSL Stylesheets for DocBook 5 not packaged for buildroot
 IPUTILS_CONF_OPTS += -DBUILD_MANS=false -DBUILD_HTML_MANS=false
 
+# move iputils binaries to the same location as where Busybox installs
+# the corresponding applets, so that we have a single version of the
+# tools (from iputils)
+define IPUTILS_MOVE_BINARIES
+	mv $(TARGET_DIR)/usr/bin/arping $(TARGET_DIR)/usr/sbin/arping
+	mv $(TARGET_DIR)/usr/bin/ping $(TARGET_DIR)/bin/ping
+	mv $(TARGET_DIR)/usr/bin/tftpd $(TARGET_DIR)/usr/sbin/tftpd
+endef
+IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_BINARIES
+
 # handle permissions ourselves
 IPUTILS_CONF_OPTS += -DNO_SETCAP_OR_SUID=true
 define IPUTILS_PERMISSIONS
-- 
2.21.0
