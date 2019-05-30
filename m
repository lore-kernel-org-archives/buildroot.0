From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 30 May 2019 14:01:39 +0200
Subject: [Buildroot] [PATCH/next v2 3/3] package/waylandpp: bump version to
 0.2.5
In-Reply-To: <20190530120139.21740-1-bernd.kuhls@t-online.de>
References: <20190530120139.21740-1-bernd.kuhls@t-online.de>
Message-ID: <20190530120139.21740-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream:
https://github.com/NilsBrause/waylandpp/commit/242c2c9a188b1a972978fc05dbe70d102bc7c4e1

Bundled pugixml was removed:
https://github.com/NilsBrause/waylandpp/commit/433ce65b681c27d54e1e6b9a602f1c8291aabd54
Use host-pugixml instead and added patch to fix linking error.

Updated license hash due to upstream commit:
https://github.com/NilsBrause/waylandpp/commit/f255d61ffd982614c0659be1742383dab06710a2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: add patch to fix pugixml linking error

 .../0001-fix-linking-with-pugixml.patch       | 39 +++++++++++++++++++
 ...iler-error-missing-stdexcept-to-use-.patch | 28 -------------
 package/waylandpp/waylandpp.hash              |  4 +-
 package/waylandpp/waylandpp.mk                |  5 ++-
 4 files changed, 44 insertions(+), 32 deletions(-)
 create mode 100644 package/waylandpp/0001-fix-linking-with-pugixml.patch
 delete mode 100644 package/waylandpp/0001-scanner-Fix-compiler-error-missing-stdexcept-to-use-.patch

diff --git a/package/waylandpp/0001-fix-linking-with-pugixml.patch b/package/waylandpp/0001-fix-linking-with-pugixml.patch
new file mode 100644
index 0000000000..1140a2b876
--- /dev/null
+++ b/package/waylandpp/0001-fix-linking-with-pugixml.patch
@@ -0,0 +1,39 @@
+From ad896b3a4d9a85416d21d2f56f1b1329cfb3291d Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Thu, 30 May 2019 13:39:19 +0200
+Subject: [PATCH] fix linking with pugixml
+
+Linking wayland-scanner++ fails
+
+[100%] Linking CXX executable wayland-scanner++
+/usr/bin/ld: cannot find -lpugixml
+
+when libpugixml.so is not installed in default location
+
+bernd at buildroot:~/buildroot/br9_next/output/build/host-waylandpp-0.2.5$ grep PUGIXML_LDFLAGS CMakeCache.txt
+PUGIXML_LDFLAGS:INTERNAL=-L/home/bernd/buildroot/br9_next/output/host/lib/pugixml-1.9;-lpugixml
+PUGIXML_LDFLAGS_OTHER:INTERNAL=
+
+Patch sent upstream as PR 59.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f8f76dc..a970d2d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -57,7 +57,7 @@ set(CMAKE_CXX_STANDARD 11)
+ if(BUILD_SCANNER)
+   pkg_check_modules(PUGIXML REQUIRED "pugixml>=1.4")
+   add_executable(wayland-scanner++ scanner/scanner.cpp)
+-  target_link_libraries(wayland-scanner++ ${PUGIXML_LIBRARIES})
++  target_link_libraries(wayland-scanner++ ${PUGIXML_LDFLAGS} ${PUGIXML_LIBRARIES})
+   target_compile_options(wayland-scanner++ PUBLIC ${PUGIXML_CFLAGS})
+   configure_file(wayland-scanner++.pc.in wayland-scanner++.pc @ONLY)
+   install(TARGETS wayland-scanner++ RUNTIME DESTINATION "${CMAKE_INSTALL_FULL_BINDIR}")
+-- 
+2.20.1
+
diff --git a/package/waylandpp/0001-scanner-Fix-compiler-error-missing-stdexcept-to-use-.patch b/package/waylandpp/0001-scanner-Fix-compiler-error-missing-stdexcept-to-use-.patch
deleted file mode 100644
index ad5b84257f..0000000000
--- a/package/waylandpp/0001-scanner-Fix-compiler-error-missing-stdexcept-to-use-.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 85b61589b0c73f6c6974862af678ed2f82806ac5 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Thu, 9 Aug 2018 21:44:46 +0200
-Subject: [PATCH] [scanner] Fix compiler error: missing <stdexcept> to use
- std::runtime_error
-
-Patch sent upstream as PR 50.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- scanner/scanner.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/scanner/scanner.cpp b/scanner/scanner.cpp
-index 9c97b7c..7019e0a 100644
---- a/scanner/scanner.cpp
-+++ b/scanner/scanner.cpp
-@@ -22,6 +22,7 @@
- #include <sstream>
- #include <cctype>
- #include <cmath>
-+#include <stdexcept>
- 
- #include "pugixml.hpp"
- 
--- 
-2.18.0
-
diff --git a/package/waylandpp/waylandpp.hash b/package/waylandpp/waylandpp.hash
index 1b14814c47..fb88573ee5 100644
--- a/package/waylandpp/waylandpp.hash
+++ b/package/waylandpp/waylandpp.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 ebd4a8447bb65f288cad0e04538f6ec704e155213fc2b9cc1a851534c70aacac  waylandpp-0.2.3.tar.gz
-sha256 49aa6d728fd13226952c9e3a5a9cae46379b2a501010064760172b5ce7cd94bb  LICENSE
+sha256 5a4361f73d2bee65bfe54b954ce085c9bfc7bc4429ac2bdc97c10e3b84660907  waylandpp-0.2.5.tar.gz
+sha256 8ff91f682a38f8a603b173222a60e8dc71754a79a522a316fb6b76ce138c542c  LICENSE
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  scanner/gpl-3.0.txt
diff --git a/package/waylandpp/waylandpp.mk b/package/waylandpp/waylandpp.mk
index ff17c35c1e..bb532103a2 100644
--- a/package/waylandpp/waylandpp.mk
+++ b/package/waylandpp/waylandpp.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-WAYLANDPP_VERSION = 0.2.3
+WAYLANDPP_VERSION = 0.2.5
 WAYLANDPP_SITE = $(call github,NilsBrause,waylandpp,$(WAYLANDPP_VERSION))
 WAYLANDPP_LICENSE = MIT, GPL-3.0+ (wayland_scanner)
 WAYLANDPP_LICENSE_FILES = LICENSE scanner/gpl-3.0.txt
 WAYLANDPP_INSTALL_STAGING = YES
-HOST_WAYLANDPP_DEPENDENCIES = host-pkgconf host-wayland
+# pugixml is needed only to build the host version of wayland-scanner++
+HOST_WAYLANDPP_DEPENDENCIES = host-pugixml host-pkgconf host-wayland
 WAYLANDPP_DEPENDENCIES = libegl host-pkgconf wayland host-waylandpp
 
 # host variant of wayland-scanner++ is needed for building the target
-- 
2.20.1
