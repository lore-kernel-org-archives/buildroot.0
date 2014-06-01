From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Jun 2014 22:19:36 +0200
Subject: [Buildroot] [git commit] pkg-cmake.mk: globally drive the
	CMAKE_BUILD_TYPE flag using BR2_ENABLE_DEBUG
Message-ID: <20140601202128.4D7379CE00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=642e44e263e9f25157594f98c393bca21544f745
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This CMake flag is usually used to adjust compiler flags (like: -Ox, -g,
etc).

So, it makes sense for Buildroot to globally drive this CMake flags in
the cmake-package infrastructure.

However, if a package prefer overriding this default setting, it still
can via the <PKG>_CONF_OPT variable.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-cmake.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 6331e0f..fb8144e 100644
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
