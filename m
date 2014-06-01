From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  1 Jun 2014 11:24:28 +0200
Subject: [Buildroot] [PATCH v4 06/11] pkg-cmake.mk: globally disable
	BUILD_TESTING flag
In-Reply-To: <1401614673-3703-1-git-send-email-s.martin49@gmail.com>
References: <1401614673-3703-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1401614673-3703-7-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This CMake flag is used to enable tests. It may not disable the test
programs from being built, but it controls the test execution.

Since we don't care about building the tests (and usually disable them
when possible), make sure Buildroot won't try to run them.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
changes v3 -> v4:
- rebase
- disable BUILD_TESTING for host-package as well (Arnout)

changes v2 -> v3:
- new patch
---
 package/pkg-cmake.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 1de1d4a..c34b979 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -65,6 +65,7 @@ define $(2)_CONFIGURE_CMDS
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_COLOR_MAKEFILE=OFF \
+		-DBUILD_TESTING=OFF \
 		-DBUILD_SHARED_LIBS=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON) \
 		-DUSE_CCACHE=$(if $(BR2_CCACHE),ON,OFF) \
 		$$($$(PKG)_CONF_OPT) \
@@ -85,6 +86,7 @@ define $(2)_CONFIGURE_CMDS
 		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" \
 		-DCMAKE_INSTALL_PREFIX="$$(HOST_DIR)/usr" \
 		-DUSE_CCACHE=$(if $(BR2_CCACHE),ON,OFF) \
+		-DBUILD_TESTING=OFF \
 		$$($$(PKG)_CONF_OPT) \
 	)
 endef
-- 
1.9.2
