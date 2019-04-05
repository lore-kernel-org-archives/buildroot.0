From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Apr 2019 22:32:39 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/libfuse: Install
 udev rules and set permissions
Message-ID: <20190405204612.7CDFF890AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c5958664e4357c9a995415995966c38f21df145
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

This fixes some omissions from the installation.

Install the udev rules.

Tell buildroot about the fuse device.

Apply setuid permissions on the fusermount tool.

Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit ea62ff85b59aa1ff7757787061eb451b4b4780df)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfuse/libfuse.mk | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index e8a79a3166..84027ebedb 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -14,11 +14,22 @@ LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 LIBFUSE_CONF_OPTS = \
 	--disable-example \
 	--enable-lib \
-	--enable-util
+	--enable-util \
+	UDEV_RULES_PATH=/lib/udev/rules.d
 
 define LIBFUSE_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/bin/
 	cp -dpf $(STAGING_DIR)/usr/lib/libfuse.so* $(TARGET_DIR)/usr/lib/
+	mkdir -p $(TARGET_DIR)/lib/udev/rules.d
+	cp $(STAGING_DIR)/lib/udev/rules.d/*-fuse.rules $(TARGET_DIR)/lib/udev/rules.d
+endef
+
+define LIBFUSE_DEVICES
+	/dev/fuse  c  666  0  0  10  229  0  0  -
+endef
+
+define LIBFUSE_PERMISSIONS
+	/usr/bin/fusermount f 4755 0 0 - - - - -
 endef
 
 $(eval $(autotools-package))
