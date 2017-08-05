From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  5 Aug 2017 15:06:05 +0200
Subject: [Buildroot] [PATCH] pkg-cmake.mk: set pkg-config env. vars. in the
	host configure environment
Message-ID: <20170805130605.25877-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cmake may run pkg-config to find the dependencies when configuring a
package. Because of the value of PATH, and it will use the Buildroot's
pkg-config wrapper, which, by default, is configured (via some
environment variables) to find the target dependencies.

So, this change makes sure the pkg-config environment variables are
properly set for finding host dependencies when configuring a
host-package.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/pkg-cmake.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 914bda7482..a91b0c2f57 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -109,6 +109,11 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
+	PKG_CONFIG="$$(PKG_CONFIG_HOST_BINARY)" \
+	PKG_CONFIG_SYSROOT_DIR="/" \
+	PKG_CONFIG_LIBDIR="$$(HOST_DIR)/lib/pkgconfig:$$(HOST_DIR)/share/pkgconfig"
+	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
+	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
 		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
-- 
2.13.4
