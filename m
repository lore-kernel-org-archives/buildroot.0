From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 02 Mar 2015 22:27:17 -0000
Subject: [Buildroot] [git commit] pkg-cmake: reduce output when being silent
Message-ID: <20150302222716.52A24807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96e7bca18bd55a70c7f837949c791af52ba91e7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use CMAKE_RULE_MESSAGES and CMAKE_INSTALL_MESSAGE variables to reduce
cmake output when it is a silent build.

[Thomas:
 - use ifneq instead of ifdef
 - remove unneeded else clause
 - also add to the host variant of the configure commands]

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-cmake.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 6c9955d..958639f 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -31,6 +31,10 @@ CMAKE_HOST_C_COMPILER = $(HOSTCC)
 CMAKE_HOST_CXX_COMPILER = $(HOSTCXX)
 endif
 
+ifneq ($(QUIET),)
+CMAKE_QUIET = -DCMAKE_RULE_MESSAGES=OFF -DCMAKE_INSTALL_MESSAGE=NEVER
+endif
+
 ################################################################################
 # inner-cmake-package -- defines how the configuration, compilation and
 # installation of a CMake package should be done, implements a few hooks to
@@ -86,6 +90,7 @@ define $(2)_CONFIGURE_CMDS
 		-DBUILD_TESTING=OFF \
 		-DBUILD_SHARED_LIBS=$$(if $$(BR2_STATIC_LIBS),OFF,ON) \
 		-DUSE_CCACHE=$$(if $$(BR2_CCACHE),ON,OFF) \
+		$$(CMAKE_QUIET) \
 		$$($$(PKG)_CONF_OPTS) \
 	)
 endef
@@ -121,6 +126,7 @@ define $(2)_CONFIGURE_CMDS
 		-DBUILD_TEST=OFF \
 		-DBUILD_TESTS=OFF \
 		-DBUILD_TESTING=OFF \
+		$$(CMAKE_QUIET) \
 		$$($$(PKG)_CONF_OPTS) \
 	)
 endef
