From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 12 Oct 2018 09:14:48 -0500
Subject: [Buildroot] [PATCH] python3: use stdlib UUID backend
Message-ID: <1539353688-32225-1-git-send-email-matthew.weber@rockwellcollins.com>
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

 - At build time, the log was checked to confirmed the configure step
   didn't detect any uuid support in both the case of util-linux
   present and not. However, this did not prevent the uuid runtime
   from working. Thus the reason the patch 0031-* which adds the opt
   to disable uuid has no affect.

This patch removes the enable/disable option as it is no longer
required since python's use of libc should be possible in every system.
Note: Currently the BR2_PACKAGE_PYTHON3_UUID disable doesn't work to
prevent the "import uuid ; print(uuid.uuid1())" example from working
at runtime.

This patch drops the dependency on util-linux as the library isn't
required for a working python uuid implementation.  The enabling of
libuuid.so in a Buildroot configuration doesn't currently have any
affect on the feature, as python still uses the libc backend.

Ref:
http://lists.busybox.net/pipermail/buildroot/2018-October/233113.html
http://lists.busybox.net/pipermail/buildroot/2018-September/231060.html
http://lists.busybox.net/pipermail/buildroot/2018-October/233079.html

CC: Adam Duskett <aduskett@greenlots.com>
CC: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 ...0031-Add-an-option-to-disable-uuid-module.patch | 33 ----------------------
 package/python3/Config.in                          | 10 -------
 package/python3/python3.mk                         |  6 ----
 3 files changed, 49 deletions(-)
 delete mode 100644 package/python3/0031-Add-an-option-to-disable-uuid-module.patch

diff --git a/package/python3/0031-Add-an-option-to-disable-uuid-module.patch b/package/python3/0031-Add-an-option-to-disable-uuid-module.patch
deleted file mode 100644
index c429c59..0000000
--- a/package/python3/0031-Add-an-option-to-disable-uuid-module.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 1fe33c7bee9e6410f56c956ea19efd2f617176ae Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 18 Aug 2018 10:54:56 +0200
-Subject: [PATCH] Add an option to disable uuid module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- configure.ac | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index b022460e73..505b7c9be0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3258,6 +3258,15 @@ if test "$CURSES" = "no"; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
- fi
- 
-+AC_SUBST(UUID)
-+AC_ARG_ENABLE(uuid,
-+	AS_HELP_STRING([--disable-uuid], [disable uuid]),
-+	[ UUID="${enableval}" ], [ UUID=yes ])
-+
-+if test "$UUID" = "no"; then
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _uuid"
-+fi
-+
- AC_SUBST(PYDOC)
- 
- AC_ARG_ENABLE(pydoc,
--- 
-2.14.4
-
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
index 0c46806..71f5226 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -94,12 +94,6 @@ ifneq ($(BR2_PACKAGE_PYTHON3_UNICODEDATA),y)
 PYTHON3_CONF_OPTS += --disable-unicodedata
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3_UUID),y)
-PYTHON3_DEPENDENCIES += util-linux
-else
-#PYTHON3_CONF_OPTS += --disable-uuid
-endif
-
 ifeq ($(BR2_PACKAGE_PYTHON3_BZIP2),y)
 PYTHON3_DEPENDENCIES += bzip2
 else
-- 
1.9.1
