From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 12:18:36 +0200
Subject: [Buildroot] [git commit] cmake: move the host-pkgconf dependency
	from host-cmake to pkg-cmake
Message-ID: <20160705101946.8D42A82117@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ab3383f76c4e9f7151c4fce103e5ff7d5b6eb98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 3d475ee0ba4d6eea6aca25594cfe5bb153ac804f a dependency on
host-pkgconf was added to host-cmake. It is a workaround to fix build
failures for packages that use pkgconf through a cmake module, but do
not depend on host-pkgconf as they should.

Since it is the package that needs host-pkgconf and not host-cmake
itself, move the dependency to the proper place, in pkg-cmake.mk.

Also copy the explanation on the mentioned commit as a comment in
order to clarify why we do this.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Davide Viti <zinosat@tiscali.it>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas:
 - update on top of master
 - drop empty HOST_CMAKE_DEPENDENCIES, no longer needed since host
   dependencies are no longer derived from target dependencies.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cmake/cmake.mk | 1 -
 package/pkg-cmake.mk   | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index a776b14..95c73c0 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -10,7 +10,6 @@ CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
 
-HOST_CMAKE_DEPENDENCIES = host-pkgconf
 CMAKE_DEPENDENCIES = zlib jsoncpp libcurl libarchive expat bzip2 xz
 
 CMAKE_CONF_OPTS = \
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 9291523..4c6dc62 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -142,6 +142,10 @@ endef
 endif
 endif
 
+# Since some CMake modules (even upstream ones) use pgk_check_modules
+# primitives to find {C,LD}FLAGS, add it to the dependency list.
+$(2)_DEPENDENCIES += host-pkgconf
+
 $(2)_DEPENDENCIES += host-cmake
 
 #
