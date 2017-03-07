From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  7 Mar 2017 23:20:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: fix gatttool install
Message-ID: <20170307222045.27303-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since this commit

http://git.kernel.org/cgit/bluetooth/bluez.git/commit/configure.ac?id=b1eb2c4cd057624312e0412f6c4be000f7fc3617

gatttool is only installed when using --enable-deprecated

Fixes
http://autobuild.buildroot.net/results/a0c/a0caac737848e7c4c97a8325fc29b11e69c1d70c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/bluez5_utils/bluez5_utils.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 4d31a187b..38baf4f56 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -47,10 +47,13 @@ endif
 
 # install gatttool (For some reason upstream choose not to do it by default)
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL),y)
+BLUEZ5_UTILS_CONF_OPTS += --enable-deprecated
 define BLUEZ5_UTILS_INSTALL_GATTTOOL
 	$(INSTALL) -D -m 0755 $(@D)/attrib/gatttool $(TARGET_DIR)/usr/bin/gatttool
 endef
 BLUEZ5_UTILS_POST_INSTALL_TARGET_HOOKS += BLUEZ5_UTILS_INSTALL_GATTTOOL
+else
+BLUEZ5_UTILS_CONF_OPTS += --disable-deprecated
 endif
 
 # enable test
-- 
2.11.0
