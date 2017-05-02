From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 May 2017 22:51:59 +0200
Subject: [Buildroot] [git commit] package/rapidjson: switch to CMake
Message-ID: <20170502205235.CDF657FB5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e810284ccb055dcab6dcf6abf41a15a77ee7888a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upcoming Kodi v18 depends on RapidJSON and detects it by using pkg-conf:
https://github.com/xbmc/xbmc/blob/master/cmake/modules/FindRapidJSON.cmake#L13

Currently our package installs only the header files, but RapidJSON.pc
is also needed. Luckily this can be fixed by switching to CMake which
does the job, also add configure options to disable the CMake build of
executables.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rapidjson/rapidjson.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
index d06f529..4d69bc3 100644
--- a/package/rapidjson/rapidjson.mk
+++ b/package/rapidjson/rapidjson.mk
@@ -13,8 +13,9 @@ RAPIDJSON_LICENSE_FILES = license.txt
 RAPIDJSON_INSTALL_TARGET = NO
 RAPIDJSON_INSTALL_STAGING = YES
 
-define RAPIDJSON_INSTALL_STAGING_CMDS
-	cp -dpfr $(@D)/include/* $(STAGING_DIR)/usr/include
-endef
+RAPIDJSON_CONF_OPTS = \
+	-DRAPIDJSON_BUILD_DOC=OFF \
+	-DRAPIDJSON_BUILD_EXAMPLES=OFF \
+	-DRAPIDJSON_BUILD_TESTS=OFF
 
-$(eval $(generic-package))
+$(eval $(cmake-package))
