From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 19:55:50 +0100
Subject: [Buildroot] [git commit] package/spdlog: support dynamic library
Message-ID: <20210126183615.C36988380D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd5f9edd202b583847e48623a630db01bd2f542b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

spdlog can install a shared library since version 1.4.0 and
https://github.com/gabime/spdlog/commit/45a18a61c633564311e51f5cbed2748e9cb70e2f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/spdlog/Config.in | 2 +-
 package/spdlog/spdlog.mk | 9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/spdlog/Config.in b/package/spdlog/Config.in
index 4aee1f7dd1..877c1b6ab7 100644
--- a/package/spdlog/Config.in
+++ b/package/spdlog/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_SPDLOG
 	depends on BR2_USE_WCHAR # fmt
 	select BR2_PACKAGE_FMT
 	help
-	  Very fast, header only, C++ logging library.
+	  Very fast, header-only/compiled, C++ logging library.
 
 	  https://github.com/gabime/spdlog
 
diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
index 3c745f60ad..f5b331526a 100644
--- a/package/spdlog/spdlog.mk
+++ b/package/spdlog/spdlog.mk
@@ -8,6 +8,7 @@ SPDLOG_VERSION = 1.8.1
 SPDLOG_SITE = $(call github,gabime,spdlog,v$(SPDLOG_VERSION))
 SPDLOG_LICENSE = MIT
 SPDLOG_LICENSE_FILES = LICENSE
+SPDLOG_INSTALL_STAGING = YES
 SPDLOG_DEPENDENCIES = fmt
 SPDLOG_CONF_OPTS += \
 	-DSPDLOG_BUILD_TESTS=OFF \
@@ -15,8 +16,10 @@ SPDLOG_CONF_OPTS += \
 	-DSPDLOG_BUILD_BENCH=OFF \
 	-DSPDLOG_FMT_EXTERNAL=ON
 
-# Header-only library
-SPDLOG_INSTALL_STAGING = YES
-SPDLOG_INSTALL_TARGET = NO
+ifeq ($(BR2_STATIC_LIBS),y)
+SPDLOG_CONF_OPTS += -DSPDLOG_BUILD_SHARED=OFF
+else
+SPDLOG_CONF_OPTS += -DSPDLOG_BUILD_SHARED=ON
+endif
 
 $(eval $(cmake-package))
