From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 23:19:09 +0100
Subject: [Buildroot] [git commit] infra/pkg-cmake: use an obviously-invalid
 value for CMAKE_SYSTEM_VERSION
Message-ID: <20190116221944.C3BA08D783@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc8a5f56b99164219c51d4f0e297dcf726a81bfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 36568732e4, we expanded toolchain.cmake to also define the value for
CMAKE_SYSTEM_VERSION, as the cmake documentation states that it must be
manually defined when doing cross-compilation [0]:

    When the CMAKE_SYSTEM_NAME variable is set explicitly to enable
    cross compiling then the value of CMAKE_SYSTEM_VERSION must also
    be set explicitly to specify the target system version.

However, the fix in 36568732e4 uses the version of the kernel headers,
assuming that would be the oldest kernel we could run on. Yet, this is
not the case, because glibc (for example) has fallbacks to support
running on kernels older than the headers it was built against.

The cmake official wiki [1] additionally states:

  * CMAKE_SYSTEM_VERSION : optional, version of your target system, not
    used very much.

Folllowed a little bit below, by:

  * CMAKE_TOOLCHAIN_FILE : absolute or relative path to a cmake script
    which sets up all the toolchain related variables mentioned above

    For instance for crosscompiling from Linux to Embedded Linux on PowerPC
    this file could look like this:

        # this one is important
        SET(CMAKE_SYSTEM_NAME Linux)
        #this one not so much
        SET(CMAKE_SYSTEM_VERSION 1)

    [...]

Furthermore, using the kernel headers version can be a bit misleading (as
it really looks like is is the correct version to use when it is not),
while it is obvious that 1 is not really the output of `uname -r` and
thus is definitely not misleading.

Finally, random searches [2] about CMAKE_SYSTEM_VERSION, mostly only
turns up issues related with Windows, Mac-OS, and to a lesser extent,
Android (where it is forcibly set to 1), with issues realted to running
under just Linux (as opposed to Adnroid) mostly non-existent.

Consequently, we revert to using the value that is suggested in the
cmake WiKi, i.e. 1, and which is basically what we also used as a
workaround in the azure-iot-sdk-c paclkage up until d300b1d3b1.

A case were we will need to have a real kernel version, is if we one day
have a cmake-based pacakge that builds and installs a kernel module [3],
because it will need the _running_ kernel version to install it in
/lib/modules/VERSION/, but in that case it will anyway most probably
not be the headers version.

[0] https://cmake.org/cmake/help/v3.8/variable/CMAKE_SYSTEM_VERSION.html
[1] https://gitlab.kitware.com/cmake/community/wikis/doc/cmake/CrossCompiling
[2] https://duckduckgo.com/?q=CMAKE_SYSTEM_VERSION
[3] https://stackoverflow.com/questions/38205745/cmake-system-version-not-updated-for-new-kernel

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-cmake.mk                | 1 -
 support/misc/toolchainfile.cmake.in | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index dd048b0949..51a1929ebb 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -264,7 +264,6 @@ define TOOLCHAIN_CMAKE_INSTALL_FILES
 		-e 's#@@TARGET_CC@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CC)))#' \
 		-e 's#@@TARGET_CXX@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CXX)))#' \
 		-e 's#@@TARGET_FC@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_FC)))#' \
-		-e 's#@@CMAKE_SYSTEM_VERSION@@#$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))#' \
 		-e 's#@@CMAKE_SYSTEM_PROCESSOR@@#$(call qstrip,$(CMAKE_SYSTEM_PROCESSOR))#' \
 		-e 's#@@TOOLCHAIN_HAS_FORTRAN@@#$(if $(BR2_TOOLCHAIN_HAS_FORTRAN),1,0)#' \
 		-e 's#@@CMAKE_BUILD_TYPE@@#$(if $(BR2_ENABLE_DEBUG),Debug,Release)#' \
diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index 276b36629f..b25031a656 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -15,7 +15,7 @@ string(REPLACE "/share/buildroot" "" RELOCATED_HOST_DIR ${CMAKE_CURRENT_LIST_DIR
 list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR})
 
 set(CMAKE_SYSTEM_NAME Buildroot)
-set(CMAKE_SYSTEM_VERSION @@CMAKE_SYSTEM_VERSION@@)
+set(CMAKE_SYSTEM_VERSION 1)
 set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
 
 # Set the {C,CXX}FLAGS appended by CMake depending on the build type
