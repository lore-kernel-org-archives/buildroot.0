From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 21 Apr 2017 01:05:32 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/rapidjson: switch to CMake
Message-ID: <20170420230532.21678-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upcoming Kodi v18 depends on RapidJSON and detects it by using pkg-conf:
https://github.com/xbmc/xbmc/blob/master/cmake/modules/FindRapidJSON.cmake#L13

Currently our package installs only the header files, but RapidJSON.pc
is also needed. Luckily this can be fixed by switching to CMake which
does the job, also add configure options to disable the CMake build of
executables.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: add configure options to disable build of example code, rapidjson
    is a header-only package, fixes broken -march=native (Thomas)

 package/rapidjson/rapidjson.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
index d06f52962..4d69bc345 100644
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
-- 
2.11.0
