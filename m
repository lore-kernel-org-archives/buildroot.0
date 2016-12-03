From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Dec 2016 16:24:23 +0100
Subject: [Buildroot] [git commit] cmake: pass HOST_CONFIGURE_OPTS at
	configure time
Message-ID: <20161203152853.C2D0481933@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0904b80b47245cf85d414f78c381b9cf61c6ef4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we bumped CMake from 3.5.2 to 3.6.3 in commit
99ed85d74081a8611a6f6d1f3d745a5c40aef975, CMake uses pkg-config during
its configure step to find available libraries on the host.

If host-pkgconf was not built before host-cmake, everything was working
fine. However, if host-pkgconf was built before, the configure step of
host-cmake was finding pkg-config and used it to find
libraries. Unfortunately, since we were not passing
PKG_CONFIG_PATH/PKG_CONFIG_SYSROOT_DIR, pkg-config was behaving in its
"default" mode, i.e returning results valid when building things for the
target, not for the host. This lead to header paths pointing to the
staging directory being used when building native binary objects,
causing all sort of build failures.

This commit fixes that by passing $(HOST_CONFIGURE_OPTS) to the
environment of host-cmake configure step. This variable contains
HOST_MAKE_ENV, which itself contains the appropriate
PKG_CONFIG_PATH/PKG_CONFIG_SYSROOT_DIR definitions.

At the same time, we drop LDFLAGS="$(HOST_LDFLAGS)" because this
definition is already in $(HOST_CONFIGURE_OPTS).

Fixes:

  http://autobuild.buildroot.net/results/4e703ed8c2eb0f914794038b0ef7bd73a67f38ce/
  (and 424 similar build failures)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cmake/cmake.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index f4c61aa..107715c 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -39,7 +39,7 @@ HOST_CMAKE_CXXFLAGS = $(shell echo $(HOST_CXXFLAGS) | sed -r "s%$(HOST_CPPFLAGS)
 
 define HOST_CMAKE_CONFIGURE_CMDS
 	(cd $(@D); \
-		LDFLAGS="$(HOST_LDFLAGS)" \
+		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CMAKE_CFLAGS)" \
 		./bootstrap --prefix=$(HOST_DIR)/usr \
 			--parallel=$(PARALLEL_JOBS) -- \
