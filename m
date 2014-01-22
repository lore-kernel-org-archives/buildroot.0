From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 22 Jan 2014 21:59:37 +0100
Subject: [Buildroot] [PATCH v2 1/5] pkg-cmake.mk: build shared library when
	!BR2_PREFER_STATIC_LIB
Message-ID: <1390424381-6889-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CMake offers a couple of places where one can specify how to build a
library:
- when you create the library target itself, by calling
  add_library(target [SHARED|STATIC] ...)
- or globally, when you configure the build, by setting the
  BUILD_SHARED_LIBS CMake flag.

* if the library target kind of library is specified:
    it overrides the global setting BUILD_SHARED_LIBS;
* else, if the global setting BUILD_SHARED_LIBS is set:
    it builds according to the BUILD_SHARED_LIBS flags;
* otherwise:
    for linux, it will build static library (like BUILD_SHARED_LIBS
    default is OFF).

So, we can consider the setting BUILD_SHARED_LIBS acts a bit similarly
to the autotools ones '--disable-static' and '--enable-shared'.
Thus, it makes sense for Buildroot to globally drive to CMake flags in
the cmake-package infrastructure.

It seems we never trigger this so far because:
- either we specified it in the *.mk file (e.g. opencv.mk);
- or it was already set per target by the projects' upstreams.

Followup patches will clean the remaining BUILD_SHARED_LIBS in the
package *.mk files.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- extend commit message.
---
 package/pkg-cmake.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 463cd63..aedd1fc 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -64,6 +64,7 @@ define $(2)_CONFIGURE_CMDS
 	$$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
+		-DBUILD_SHARED_LIBS=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON) \
 		$$($$(PKG)_CONF_OPT) \
 	)
 endef
-- 
1.8.5.3
