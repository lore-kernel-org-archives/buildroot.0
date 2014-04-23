From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 24 Apr 2014 00:48:29 +0200
Subject: [Buildroot] [PATCH 10/14] pkg-cmake.mk: globally drive the
	CMAKE_BUILD_TYPE flag using BR2_ENABLE_DEBUG
In-Reply-To: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
References: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398293313-17580-11-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This CMake flag is usually used to adjust compiler flags (like: -Ox, -g,
etc).

So, it makes sense for Buildroot to globally drive this CMake flags in
the cmake-package infrastructure.

However, if a package prefer overriding this default setting, it still
can via the <PKG>_CONF_OPT variable.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- new patch
---
 package/pkg-cmake.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index e0efccb..1c52a53 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -63,6 +63,7 @@ define $(2)_CONFIGURE_CMDS
 	PATH=$(BR_PATH) \
 	$$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
+		-DCMAKE_BUILD_TYPE=$(if $(BR2_ENABLE_DEBUG),Debug,Release) \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_COLOR_MAKEFILE=OFF \
 		-DBUILD_TESTING=OFF \
-- 
1.9.2
