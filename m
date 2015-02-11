From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 11 Feb 2015 18:52:21 +0100
Subject: [Buildroot] [PATCH] pkg-cmake: reduce output when being silent
Message-ID: <1423677141-10912-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use CMAKE_RULE_MESSAGES and CMAKE_INSTALL_MESSAGE variables to reduce
cmake output when it is a silent build.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/pkg-cmake.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 6c9955d..de11134 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -31,6 +31,12 @@ CMAKE_HOST_C_COMPILER = $(HOSTCC)
 CMAKE_HOST_CXX_COMPILER = $(HOSTCXX)
 endif
 
+ifdef QUIET
+CMAKE_QUIET = -DCMAKE_RULE_MESSAGES=OFF -DCMAKE_INSTALL_MESSAGE=NEVER
+else
+CMAKE_QUIET =
+endif
+
 ################################################################################
 # inner-cmake-package -- defines how the configuration, compilation and
 # installation of a CMake package should be done, implements a few hooks to
@@ -86,6 +92,7 @@ define $(2)_CONFIGURE_CMDS
 		-DBUILD_TESTING=OFF \
 		-DBUILD_SHARED_LIBS=$$(if $$(BR2_STATIC_LIBS),OFF,ON) \
 		-DUSE_CCACHE=$$(if $$(BR2_CCACHE),ON,OFF) \
+		$$(CMAKE_QUIET) \
 		$$($$(PKG)_CONF_OPTS) \
 	)
 endef
-- 
2.1.0
