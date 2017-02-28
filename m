From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Feb 2017 19:07:22 +0100
Subject: [Buildroot] [PATCH 1/5] core/pkg-cmake: provide our own platform
	description
In-Reply-To: <cover.1488305206.git.yann.morin.1998@free.fr>
References: <cover.1488305206.git.yann.morin.1998@free.fr>
Message-ID: <f25e9ff7873418c0b323528d6a9c2482c752cd31.1488305206.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The handling of RPATH in cmake-3.7 has changed drastically, causing a
slew of build failures dues to libraries from the host being pulled in:

  - domoticz : http://autobuild.buildroot.org/results/fd0/fd0ba54c7abf973691b39a0ca1bb4e07d749593a/
  - freerdp  : http://autobuild.buildroot.org/results/5d4/5d429d0e288754a541ee5d8be515454c5fccd28b/
  - libcec   : http://autobuild.buildroot.org/results/3f3/3f3593bab7734dd274faf5b5690895e9424cbb89/
  - and so on...

The bug was reported upstream [0], which dismissed it altogether [1] as
being expected behaviour, quoting:

    I don't think there is anything wrong with that change on its own.
    It merely exposed some existing behavior in a new case.

Instead, upstream suggested in that same message that a platform
definition be used instead, quoting:

    If a toolchain file specifies CMAKE_SYSTEM_NAME such that a custom
    `Platform/MySystem.cmake` file is loaded then the latter can set
    them as needed for the target platform.

So here we are doing so:

  - we add a new platfom definitions that inherits from the Linux one,
    then overrides the problematic settings;

  - we change our toolchain file to use that platform instead;

  - we tell cmake where to find additional modules, so that it can find
    our custom platform file.

This has been tested to work in the following conditions:

 - pre-installed host cmake, versions 3.5.1 (Ubuntu 16.04) and 3.7.2
   (manually built)

  - internal cmake, versions 3.6.3 (the current version as of this
    patch) and 3.7.2 (with the followup patches).

Thanks to J?rg, Ben and Baruch for the help investigating the issue.
Special thanks to J?rg for handling the discussion with upstream and
pointing to the relevant messages! :-)

[0] http://public.kitware.com/pipermail/cmake/2017-February/064970.html
[1] http://public.kitware.com/pipermail/cmake/2017-February/065063.html

To be noted: Thomas suggested we set these directly in the toolchain
file. Unfortunately, wherever we put those settings in the toolchain
file, this does not work.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J?rg Krause <joerg.krause@embedded.rocks>
Cc: Ben Boeckel <mathstuf@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-cmake.mk                | 4 ++++
 support/misc/Buildroot.cmake        | 3 +++
 support/misc/toolchainfile.cmake.in | 2 +-
 toolchain/toolchain/toolchain.mk    | 1 +
 4 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 support/misc/Buildroot.cmake

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index a7c8dc3..77fa1dc 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -87,6 +87,7 @@ define $(2)_CONFIGURE_CMDS
 	PATH=$$(BR_PATH) \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
+		-DCMAKE_MODULE_PATH="$$(HOST_DIR)/usr/share/buildroot" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_COLOR_MAKEFILE=OFF \
 		-DBUILD_DOC=OFF \
@@ -249,3 +250,6 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 		-e 's#@@CMAKE_BUILD_TYPE@@#$(if $(BR2_ENABLE_DEBUG),Debug,Release)#' \
 		$(TOPDIR)/support/misc/toolchainfile.cmake.in \
 		> $@
+
+$(HOST_DIR)/usr/share/buildroot/Platform/Buildroot.cmake:
+	$(Q)$(INSTALL) -D -m 0644 support/misc/Buildroot.cmake $(@)
diff --git a/support/misc/Buildroot.cmake b/support/misc/Buildroot.cmake
new file mode 100644
index 0000000..b0046b3
--- /dev/null
+++ b/support/misc/Buildroot.cmake
@@ -0,0 +1,3 @@
+include(Platform/Linux)
+set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB32_PATHS FALSE)
+set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB64_PATHS FALSE)
diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index d4252dd..5a42644 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -10,7 +10,7 @@
 # RELOCATED_HOST_DIR variable.
 string(REPLACE "/usr/share/buildroot" "" RELOCATED_HOST_DIR ${CMAKE_CURRENT_LIST_DIR})
 
-set(CMAKE_SYSTEM_NAME Linux)
+set(CMAKE_SYSTEM_NAME Buildroot)
 set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
 
 # Set the {C,CXX}FLAGS appended by CMake depending on the build type
diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index b16db01..e298373 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -38,3 +38,4 @@ endif
 $(eval $(virtual-package))
 
 toolchain: $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
+toolchain: $(HOST_DIR)/usr/share/buildroot/Platform/Buildroot.cmake
-- 
2.7.4
