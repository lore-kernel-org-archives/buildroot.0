From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 21:54:27 +0100
Subject: [Buildroot] [git commit] package/pkg-cmake.mk: add note about
 BUILD_STATIC_LIBS
Message-ID: <20180107224039.08E6583B9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d0058e2d3d5ebc22d4ad4ffaa9a265ba680bf53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As BUILD_STATIC_LIBS is not a standard cmake variable (while
BUILD_SHARED_LIBS is) we shouldn't add it in pkg-cmake.mk, although
for some packages that would make sense. Therefore, add a note so we
don't forget about this abnormality.

See: https://cmake.org/cmake/help/v3.8/manual/cmake-variables.7.html#variables-that-change-behavior

Signed-off-by: Jan Heylen <jan.heylen@nokia.com>
[Thomas: rework the comment in the code.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-cmake.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 6739704..14ffe4a 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -80,6 +80,14 @@ ifndef $(2)_CONFIGURE_CMDS
 ifeq ($(4),target)
 
 # Configure package for target
+#
+# - We are passing BUILD_SHARED_LIBS because it is documented as a
+#   standard CMake variable to control the build of shared libraries
+#   (see https://cmake.org/cmake/help/v3.8/manual/cmake-variables.7.html#variables-that-change-behavior)
+# - We are not passing BUILD_STATIC_LIBS because it is *not*
+#   documented as a standard CMake variable. If a package supports it,
+#   it must handle it explicitly.
+#
 define $(2)_CONFIGURE_CMDS
 	(mkdir -p $$($$(PKG)_BUILDDIR) && \
 	cd $$($$(PKG)_BUILDDIR) && \
