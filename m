From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Feb 2017 22:40:01 +0100
Subject: [Buildroot] [git commit] pkg-cmake: pass <pkg>_CONF_ENV for the
	target configure step
Message-ID: <20170226214212.D52487FBDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc4250119582043bf57a6296ae0264aa95f97fac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Buildroot manual documents that <pkg>_CONF_ENV is passed in the
environment when calling cmake during the configure step. However, the
actual implementation in pkg-cmake passes HOST_<pkg>_CONF_ENV when
configuring the host variant of a cmake package, but does not pass
<pkg>_CONF_ENV when configuring the target variant of a cmake package.

This commit fixes that by passing <pkg>_CONF_ENV in the environment as
expected. It should not cause any behavior change, because this
feature is in fact not used by any package in upstream Buildroot:

$ grep CONF_ENV $(git grep -l cmake-package package/)
package/pkg-cmake.mk:$(2)_CONF_ENV			?=
package/pkg-cmake.mk:	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
package/pkg-cmake.mk:	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \

This issue was reported by Olivier <ovalentin@awox.com> as bug #9616.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-cmake.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 4e0e838..a7c8dc3 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -109,7 +109,7 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
-	$$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
+	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
 		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
