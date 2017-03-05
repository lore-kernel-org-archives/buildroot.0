From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 21:34:49 +0100
Subject: [Buildroot] [git commit] core/pkg-cmake: better way to pass our
	CMAKE_MODULE_PATH
Message-ID: <20170305203507.EDE1A81EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=894ad2b094331f7a43e3b352caa721e8909a334f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we tell cmake where to look for our own custom platform
description by passing the path to the moduls directory on the command
line.

However, this causes two different problems.

First, some packages simply set CMAKE_MODULE_PATH in their
CMakeList.txt, thus overriding our own path, and then our platform
description is not found.

Second, cmake may internally call sub-cmake (e.g. in the try_compile
macro), but the CMAKE_MODULE_PATH is not automatically passed down in
this case.

For the first problem, we could hunt down and fix all offenders, but
this is an endless endeavour, especially since packagers are told to do
so on the cmake wiki [0]:

    CMAKE_MODULE_PATH
        tell CMake to search first in directories listed in
        CMAKE_MODULE_PATH when you use FIND_PACKAGE() or INCLUDE()
        SET(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/MyCMakeScripts)
        FIND_PACKAGE(HelloWorld)

The second problem could be solved by passing yet another variable on
the command line, that tells cmake to explicitly pass arbitrary
variables down to sub-cmake calls:

    -DCMAKE_TRY_COMPILE_PLATFORM_VARIABLES=CMAKE_MODULE_PATH

However, this only covers the case of try_compile. Even though no other
case is known yet, we'd still risk missing locations where we would need
to propagate CMAKE_MODULE_PATH, even some where we'd have no solution
like for try_compile.

Instead, ngladitz on IRC suggested that CMAKE_MODULE_PATH be set
directly from the toolchain file.

And indeed this fixes both problems explained above.

So be it.

[0] https://cmake.org/Wiki/CMake_Useful_Variables

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: J??rg Krause <joerg.krause@embedded.rocks>
Cc: Ben Boeckel <mathstuf@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-cmake.mk                | 1 -
 support/misc/toolchainfile.cmake.in | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 77fa1dc..5d0a455 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -87,7 +87,6 @@ define $(2)_CONFIGURE_CMDS
 	PATH=$$(BR_PATH) \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
-		-DCMAKE_MODULE_PATH="$$(HOST_DIR)/usr/share/buildroot" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_COLOR_MAKEFILE=OFF \
 		-DBUILD_DOC=OFF \
diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index 5a42644..c38800e 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -10,6 +10,10 @@
 # RELOCATED_HOST_DIR variable.
 string(REPLACE "/usr/share/buildroot" "" RELOCATED_HOST_DIR ${CMAKE_CURRENT_LIST_DIR})
 
+# Point cmake to the location where we have our custom modules,
+# so that it can find our custom platform description.
+list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR})
+
 set(CMAKE_SYSTEM_NAME Buildroot)
 set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
 
