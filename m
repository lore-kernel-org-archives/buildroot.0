From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 17:13:49 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] flatcc: fix debug build
Message-ID: <20181126161037.AA2DF886CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93d98bce66eed4159663e3fb0d5bfab5627557fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

flatcc is named flatcc_d if BR2_ENABLE_DEBUG is set because of the
following line in CMakeLists.txt: set(CMAKE_DEBUG_POSTFIX "_d")

So update FLATCC_TARGET_REMOVE_FLATCC_COMPILER hook to replace flatcc
by flatcc*

Fixes:
 - http://autobuild.buildroot.org/results/a47f49cd2fdd809257bd7e83dca620f2e6aac85b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f7abb6250282d3860e2330d5412e25606d78efe6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
