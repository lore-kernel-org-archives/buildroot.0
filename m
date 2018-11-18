From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Nov 2018 17:58:48 +0100
Subject: [Buildroot] [PATCH 1/1] flatcc: fix debug build
Message-ID: <20181118165848.2111-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

flatcc is named flatcc_d if BR2_ENABLE_DEBUG is set because of the
following line in CMakeLists.txt: set(CMAKE_DEBUG_POSTFIX "_d")

So update FLATCC_TARGET_REMOVE_FLATCC_COMPILER hook to replace flatcc
by flatcc*

Fixes:
 - http://autobuild.buildroot.org/results/a47f49cd2fdd809257bd7e83dca620f2e6aac85b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flatcc/flatcc.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/flatcc/flatcc.mk b/package/flatcc/flatcc.mk
index 9f961a37b1..1c8d0ec7fb 100644
--- a/package/flatcc/flatcc.mk
+++ b/package/flatcc/flatcc.mk
@@ -19,8 +19,9 @@ HOST_FLATCC_CONF_OPTS += -DFLATCC_TEST=OFF
 FLATCC_CONF_OPTS += -DFLATCC_INSTALL=ON
 HOST_FLATCC_CONF_OPTS += -DFLATCC_INSTALL=ON
 
+# compiler is named flatcc or flatcc_d depending on BR2_ENABLE_DEBUG value
 define FLATCC_TARGET_REMOVE_FLATCC_COMPILER
-	rm $(TARGET_DIR)/usr/bin/flatcc
+	rm $(TARGET_DIR)/usr/bin/flatcc*
 endef
 
 FLATCC_POST_INSTALL_TARGET_HOOKS += FLATCC_TARGET_REMOVE_FLATCC_COMPILER
-- 
2.17.1
