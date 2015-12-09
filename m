From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Dec 2015 14:15:14 +0100
Subject: [Buildroot] [git commit] edid-decode: new package
Message-ID: <20151209131631.4526981DA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f856c1f7542cc7544ccea42d29922f118b9d40e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: pass TARGET_CFLAGS/LDFLAGS, quote TARGET_DIR]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                  |  1 +
 package/edid-decode/Config.in      |  6 ++++++
 package/edid-decode/edid-decode.mk | 20 ++++++++++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 2bdad01..0eb6fda 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -340,6 +340,7 @@ endif
 	source "package/dtv-scan-tables/Config.in"
 	source "package/dvb-apps/Config.in"
 	source "package/dvbsnoop/Config.in"
+	source "package/edid-decode/Config.in"
 	source "package/eeprog/Config.in"
 	source "package/eudev/Config.in"
 	source "package/evemu/Config.in"
diff --git a/package/edid-decode/Config.in b/package/edid-decode/Config.in
new file mode 100644
index 0000000..64297b4
--- /dev/null
+++ b/package/edid-decode/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_EDID_DECODE
+	bool "edid-decode"
+	help
+	  Decode EDID data in human-readable format.
+
+	  http://cgit.freedesktop.org/xorg/app/edid-decode/
diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
new file mode 100644
index 0000000..8fcc19e
--- /dev/null
+++ b/package/edid-decode/edid-decode.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# edid-decode
+#
+################################################################################
+
+EDID_DECODE_VERSION = 681153145d5e05ee15032ea792e967cda06e7622
+EDID_DECODE_SITE = git://anongit.freedesktop.org/git/xorg/app/edid-decode.git
+EDID_DECODE_LICENSE = MIT
+EDID_DECODE_LICENSE_FILES = edid-decode.c
+
+define EDID_DECODE_BUILD_CMDS
+	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)"
+endef
+
+define EDID_DECODE_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+endef
+
+$(eval $(generic-package))
