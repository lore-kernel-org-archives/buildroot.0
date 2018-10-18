From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 18 Oct 2018 11:22:08 -0500
Subject: [Buildroot] [PATCH v2] python3: use stdlib UUID backend
Message-ID: <1539879728-29581-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python3 at runtime identifies the uuid backend to use to implement
functions like uuid_generate_time. This search includes libc first
and then other options like util-linux's libuuid.  There is also an
option to use an extension module, however it looks like that requires
the libuuid and headers to be present (./Modules/_uuidmodule.c).  The
extension isn't required to make this work.

 - This was runtime tested by updating the python3-3.7.0/Lib/uuid.py
   to include debug information in the def _load_system_functions():
   to print "libname".  Then at runtime it was observed that libc
   was the selected backend.

 - At build time, to prevent a dependency not being reflected on
   the use of the util-linux backend (some builds may use it if
   util-linux builds first, others not), the 0031-* patch was kept
   and the support to auto-detect was explicitly disabled. This
   has not affect on the runtime use of the libc backend.

Ref:
http://lists.busybox.net/pipermail/buildroot/2018-October/233113.html
http://lists.busybox.net/pipermail/buildroot/2018-September/231060.html
http://lists.busybox.net/pipermail/buildroot/2018-October/233079.html

CC: Adam Duskett <aduskett@greenlots.com>
CC: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Tested-by: Carlos Santos <casantos@datacom.com.br>
---
Changes
v1 -> v2
[Thomas P
 - Suggested keeping the patch and adding the explicit disable as
   util-linux being built before or after python3 would have resulted
   in different behavior
---
 package/python3/Config.in  | 10 ----------
 package/python3/python3.mk |  7 +++----
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 0701d56..623fefe 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -88,16 +88,6 @@ config BR2_PACKAGE_PYTHON3_UNICODEDATA
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
index 5e94e8e..9df59a2 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -94,11 +94,10 @@ ifneq ($(BR2_PACKAGE_PYTHON3_UNICODEDATA),y)
 PYTHON3_CONF_OPTS += --disable-unicodedata
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3_UUID),y)
-PYTHON3_DEPENDENCIES += util-linux
-else
+# Disable auto-detection of util-linux based
+# backend for UUID support, instead default
+# to libc which is determined at runtime
 PYTHON3_CONF_OPTS += --disable-uuid
-endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_BZIP2),y)
 PYTHON3_DEPENDENCIES += bzip2
-- 
1.9.1
