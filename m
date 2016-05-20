From: Charles Hardin <ckhardin@exablox.com>
Date: Fri, 20 May 2016 15:02:57 -0700
Subject: [Buildroot] [FYI] Think the CMake build for debug symbols is
	RelWithDebInfo
Message-ID: <49BF7B7F-D120-4004-8ABB-11D2B33DD1AD@exablox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the debug information in Config,in

config BR2_ENABLE_DEBUG
        bool "build packages with debugging symbols"
        help
          Build packages with debugging symbols enabled. All libraries
          and binaries in the 'staging' directory will have debugging
          symbols, which allows remote debugging even if libraries and
          binaries are stripped on the target. Whether libraries and
          binaries are stripped on the target is controlled by the
          BR2_STRIP_* options below.

So, I think the proper interpretation of this for a cmake build type is actually RelWithDebInfo to
get the debug symbols for the release builds.

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 81dcfcc..bca3603 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -87,7 +87,7 @@ define $(2)_CONFIGURE_CMDS
        PATH=$$(BR_PATH) \
        $$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
                -DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
-               -DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),Debug,Release) \
+               -DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),RelWithDebInfo,Release) \
                -DCMAKE_INSTALL_PREFIX="/usr" \
                -DCMAKE_COLOR_MAKEFILE=OFF \
                -DBUILD_DOC=OFF \

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160520/73abab30/attachment.html>
