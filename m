From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 23:45:00 +0100
Subject: [Buildroot] [git commit] taskd: fix static linking issue with
	libuuid/libintl
Message-ID: <20161125224627.3343181839@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83e207d7bc52fbcb38b33dc387f37da333d3e248
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libuuid depends on libintl in specific scenarios, but since taskd wasn't
using pkg-config to detect libuuid, this dependency on libintl was not
taken into account. This commit adds a patch to taskd that uses
pkg-config to detect libuuid.

Fixes:

  http://autobuild.buildroot.net/results/cb5ea871812651025722d42508d4f37702088800/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-CMakeLists-use-pkg-config-uuid-detection.patch | 40 ++++++++++++++++++++++
 package/taskd/taskd.mk                             |  2 +-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/package/taskd/0003-CMakeLists-use-pkg-config-uuid-detection.patch b/package/taskd/0003-CMakeLists-use-pkg-config-uuid-detection.patch
new file mode 100644
index 0000000..34139fe
--- /dev/null
+++ b/package/taskd/0003-CMakeLists-use-pkg-config-uuid-detection.patch
@@ -0,0 +1,40 @@
+CMakeLists.txt: use pkg-config to detect uuid when possible
+
+In order to take into account the libraries used by libuuid when
+building statically, using pkg-config is recommended. This patch
+therefore improves the CMakeLists.txt to use pkg-config to detect
+libuuid when pkg-config is available.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/CMakeLists.txt
+===================================================================
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -6,6 +6,7 @@
+ 
+ include (CheckFunctionExists)
+ include (CheckStructHasMember)
++include (FindPkgConfig)
+ 
+ set (HAVE_CMAKE true)
+ 
+@@ -119,8 +120,16 @@
+   # Apple and FreeBSD include the uuid functions in their libc, rather than libuuid
+   check_function_exists (uuid_unparse_lower HAVE_UUID_UNPARSE_LOWER)
+ else (DARWIN OR FREEBSD)
+-  find_path    (UUID_INCLUDE_DIR   uuid/uuid.h)
+-  find_library (UUID_LIBRARY NAMES uuid)
++  if(PKG_CONFIG_FOUND)
++    pkg_check_modules(PC_UUID uuid)
++    if(PC_UUID_FOUND)
++      set (UUID_INCLUDE_DIR ${PC_UUID_INCLUDE_DIRS})
++      set (UUID_LIBRARY ${PC_UUID_LIBRARIES})
++    endif(PC_UUID_FOUND)
++  else(PKG_CONFIG_FOUND)
++    find_path    (UUID_INCLUDE_DIR   uuid/uuid.h)
++    find_library (UUID_LIBRARY NAMES uuid)
++  endif(PKG_CONFIG_FOUND)
+   if (UUID_INCLUDE_DIR AND UUID_LIBRARY)
+     set (TASKD_INCLUDE_DIRS ${TASKD_INCLUDE_DIRS} ${UUID_INCLUDE_DIR})
+     set (TASKD_LIBRARIES    ${TASKD_LIBRARIES}    ${UUID_LIBRARY})
diff --git a/package/taskd/taskd.mk b/package/taskd/taskd.mk
index 34a260e..b19be68 100644
--- a/package/taskd/taskd.mk
+++ b/package/taskd/taskd.mk
@@ -8,6 +8,6 @@ TASKD_VERSION = 1.1.0
 TASKD_SITE = http://taskwarrior.org/download
 TASKD_LICENSE = MIT
 TASKD_LICENSE_FILES = COPYING
-TASKD_DEPENDENCIES = gnutls util-linux
+TASKD_DEPENDENCIES = gnutls util-linux host-pkgconf
 
 $(eval $(cmake-package))
