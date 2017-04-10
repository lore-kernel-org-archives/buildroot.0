From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Mon, 10 Apr 2017 11:16:07 +1000
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: remove deprecated
	tool gatttool
In-Reply-To: <cover.1491786787.git.sam.bobroff@au1.ibm.com>
References: <cover.1491786787.git.sam.bobroff@au1.ibm.com>
Message-ID: <20170410011607.GA3042@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gatttool is no longer built by default, as it has been deprecated.
Because the package file contains an explicit hook to install this
tool, the build fails.

Rather than enabling deprecated features, remove the explicit hook
from the package file so the tool isn't installed at all.

See
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=b1eb2c4cd057624312e0412f6c4be000f7fc3617

Fixes:
http://autobuild.buildroot.net/results/ba3/ba30d20fc10a4d538a560d75e2a81e7121328dbc

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
 package/bluez5_utils/bluez5_utils.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index d19afc39a..7d3b1edcb 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -45,14 +45,6 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-sixaxis
 endif
 
-# install gatttool (For some reason upstream choose not to do it by default)
-ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL),y)
-define BLUEZ5_UTILS_INSTALL_GATTTOOL
-	$(INSTALL) -D -m 0755 $(@D)/attrib/gatttool $(TARGET_DIR)/usr/bin/gatttool
-endef
-BLUEZ5_UTILS_POST_INSTALL_TARGET_HOOKS += BLUEZ5_UTILS_INSTALL_GATTTOOL
-endif
-
 # enable test
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_TEST),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-test
-- 
2.12.1.382.gc0f9c7058
