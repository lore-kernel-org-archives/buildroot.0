From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jan 2021 15:45:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/zziplib: bump version to 0.13.72
Message-ID: <20210110144500.1470681-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://github.com/gdraheim/zziplib/blob/master/ChangeLog

Upstream switched the project to cmake and deprecated automake:
https://github.com/gdraheim/zziplib/commit/5116d90fef820db8a9b3e52ab5a6a11f84dcfc9d

Removed dependency to host-python3 as it is needed only for tests:
https://github.com/gdraheim/zziplib/blob/master/test/CMakeLists.txt#L21

Remove GNUmakefile to fix build error as the real makefile is Makefile.
GNUnamefile includes files which do not exist after configure and fails
to include Makefile:
https://github.com/gdraheim/zziplib/blob/master/GNUmakefile#L60

Added optional dependency to SDL2.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/zziplib/zziplib.hash |  2 +-
 package/zziplib/zziplib.mk   | 20 ++++++++++++++++----
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/package/zziplib/zziplib.hash b/package/zziplib/zziplib.hash
index b667b95373..b6a75ae0cb 100644
--- a/package/zziplib/zziplib.hash
+++ b/package/zziplib/zziplib.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  2ee1e0fbbb78ec7cc46bde5b62857bc51f8d665dd265577cf93584344b8b9de2  zziplib-0.13.71.tar.gz
+sha256  93ef44bf1f1ea24fc66080426a469df82fa631d13ca3b2e4abaeab89538518dc  zziplib-0.13.72.tar.gz
 sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  docs/COPYING.LIB
 sha256  c2aa7d58cebd24cb877bbf11d6b13a4bb7cd08b9d7db5d3037ca06c46bf4cfd8  docs/COPYING.MPL
 sha256  1c6da11efe8c43ee853fe5b21501dd72b81831ae84d58ea376bddc0620a5c361  docs/copying.htm
diff --git a/package/zziplib/zziplib.mk b/package/zziplib/zziplib.mk
index aab091ac6a..6c2efe7558 100644
--- a/package/zziplib/zziplib.mk
+++ b/package/zziplib/zziplib.mk
@@ -4,14 +4,26 @@
 #
 ################################################################################
 
-ZZIPLIB_VERSION = 0.13.71
+ZZIPLIB_VERSION = 0.13.72
 ZZIPLIB_SITE = $(call github,gdraheim,zziplib,v$(ZZIPLIB_VERSION))
 ZZIPLIB_LICENSE = LGPL-2.0+ or MPL-1.1
 ZZIPLIB_LICENSE_FILES = docs/COPYING.LIB docs/COPYING.MPL docs/copying.htm
 ZZIPLIB_INSTALL_STAGING = YES
+ZZIPLIB_CONF_OPTS += \
+	-DZZIPDOCS=OFF \
+	-DZZIPTEST=OFF
+ZZIPLIB_DEPENDENCIES = host-pkgconf zlib
 
-ZZIPLIB_DEPENDENCIES = host-pkgconf host-python3 zlib
+define ZZIPLIB_POST_EXTRACT_FIXUP
+	rm $(@D)/GNUmakefile
+endef
+ZZIPLIB_POST_EXTRACT_HOOKS += ZZIPLIB_POST_EXTRACT_FIXUP
 
-ZZIPLIB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/bin/python3
+ifeq ($(BR2_PACKAGE_SDL2),y)
+ZZIPLIB_CONF_OPTS += -DZZIPSDL=ON
+ZZIPLIB_DEPENDENCIES += sdl2
+else
+ZZIPLIB_CONF_OPTS += -DZZIPSDL=OFF
+endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.29.2
