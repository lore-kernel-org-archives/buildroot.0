From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 19:20:57 +0200
Subject: [Buildroot] [git commit] python3: use pure python UUID backend
Message-ID: <20181021172032.003F188443@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b68713aae2887edf395c135ebbfaeeb8e77f2f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python3 at runtime identifies the uuid backend to use to implement safe
time-based UUID generation functions. When the python _uuid extension
module, /usr/lib/python3.7/lib-dynload/_uuid.cpython-37m-<arch>.so
is not found, the fall back is to use a pure python implementation.

 - If uuid.h from util-linux is available at build time, the _uuid
   module is built and used. A Buildroot patch allows us to disable this
   build-time check and never build the _uuid module.

With the bump to python 3.7, an optional dependency on util-linux was
added to build the _uuid module. However, this may lead to circular
dependencies. To break this circular dependency, we can disable the
build of the _uuid module and always use the pure python implementation.

Ref:
http://lists.busybox.net/pipermail/buildroot/2018-October/233113.html
http://lists.busybox.net/pipermail/buildroot/2018-September/231060.html
http://lists.busybox.net/pipermail/buildroot/2018-October/233079.html

CC: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Tested-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/Config.in  | 10 ----------
 package/python3/python3.mk |  7 +++----
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 6d77396380..0c5018f0b3 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -89,16 +89,6 @@ config BR2_PACKAGE_PYTHON3_UNICODEDATA
 	  Unicode character database (used by stringprep module)
 	  (large).
 
-config BR2_PACKAGE_PYTHON3_UUID
-	bool "uuid module"
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	help
-	  This module provides immutable UUID objects (the UUID class)
-	  and the functions uuid1(), uuid3(), uuid4(), uuid5() for
-	  generating version 1, 3, 4, and 5 UUIDs as specified in RFC
-	  4122.
-
 config BR2_PACKAGE_PYTHON3_SQLITE
 	bool "sqlite module"
 	select BR2_PACKAGE_SQLITE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index efb44c0454..cd01cf1ac3 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -94,11 +94,10 @@ ifneq ($(BR2_PACKAGE_PYTHON3_UNICODEDATA),y)
 PYTHON3_CONF_OPTS += --disable-unicodedata
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3_UUID),y)
-PYTHON3_DEPENDENCIES += util-linux
-else
+# Disable auto-detection of uuid.h (util-linux)
+# which would add _uuid module support, instead
+# default to the pure python implementation
 PYTHON3_CONF_OPTS += --disable-uuid
-endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_BZIP2),y)
 PYTHON3_DEPENDENCIES += bzip2
