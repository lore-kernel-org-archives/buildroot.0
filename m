From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:36:03 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] swupdate: bump to version
 2018.03
Message-ID: <20181216213238.C15A68D5B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8bca3e0294bce591e215abc05c5a77e56bbb90b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Remove upstream patches:
  * 0001-compat.h-introduce-compatibility-header.patch
  * 0002-Fix-build-if-DOWNLOAD-is-set-but-no-JSON.patch

Update note about bundled modified version of mongoose 6.11.

Update licenses. Some files are LGPL-2.1+ now. Remove Public Domain as the
relevant bundled sqlite3 code was removed some time age.

Regenerated the .config file by doing:

```
make swupdate-menuconfig
make swupdate-update-config
```
.. and removing the paths for the build options manually.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 26184c2815072e2ab5ba6eb3e13542684d65c55a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-compat.h-introduce-compatibility-header.patch |  87 -----------------
 ...-Fix-build-if-DOWNLOAD-is-set-but-no-JSON.patch | 107 ---------------------
 package/swupdate/swupdate.config                   |  25 ++---
 package/swupdate/swupdate.hash                     |   2 +-
 package/swupdate/swupdate.mk                       |   6 +-
 5 files changed, 13 insertions(+), 214 deletions(-)

diff --git a/package/swupdate/0001-compat.h-introduce-compatibility-header.patch b/package/swupdate/0001-compat.h-introduce-compatibility-header.patch
deleted file mode 100644
index 5e3bfb0f49..0000000000
--- a/package/swupdate/0001-compat.h-introduce-compatibility-header.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 9867a9d6a21e6b0b9bcba57c3e2398fe671cea17 Mon Sep 17 00:00:00 2001
-From: Christian Storm <christian.storm@siemens.com>
-Date: Tue, 16 Jan 2018 10:34:52 +0100
-Subject: [PATCH] compat.h: introduce compatibility header
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Introduce a compat.h housing compatibility definitions
-and macros along the lines of commit 7b49b8d having
-introduced a compatibility mechanism for Lua.
-
-First use case (and motivation) is the support for
-musl (https://www.musl-libc.org/) which doesn't
-bother to provide
-    char *strndupa(const char *s, size_t n)
-
-Backported from: 9867a9d6a21e6b0b9bcba57c3e2398fe671cea17
-
-Reviewed-by: Stefano Babic <sbabic@denx.de>
-Reported-by: J??rg Krause <joerg.krause@embedded.rocks>
-Signed-off-by: Christian Storm <christian.storm@siemens.com>
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- include/compat.h  | 24 ++++++++++++++++++++++++
- include/util.h    |  1 +
- ipc/network_ipc.c |  1 +
- 3 files changed, 26 insertions(+)
- create mode 100644 include/compat.h
-
-diff --git a/include/compat.h b/include/compat.h
-new file mode 100644
-index 0000000..29d7af1
---- /dev/null
-+++ b/include/compat.h
-@@ -0,0 +1,24 @@
-+/*
-+ * Author: Christian Storm
-+ * Copyright (C) 2018, Siemens AG
-+ *
-+ * SPDX-License-Identifier:     GPL-2.0-or-later
-+ */
-+
-+#pragma once
-+
-+#ifndef strndupa
-+/*
-+ * Define char *strndupa(const char *s, size_t n)
-+ * for, e.g., musl (https://www.musl-libc.org/)
-+ * which does not bother to implement this function.
-+ */
-+#define strndupa(s, n)                          \
-+	(__extension__({                            \
-+		const char *__in = (s);                 \
-+		size_t __len = strnlen(__in, (n)) + 1;  \
-+		char *__out = (char *)alloca(__len);    \
-+		__out[__len - 1] = '\0';                \
-+		(char *)memcpy(__out, __in, __len - 1); \
-+	}))
-+#endif
-diff --git a/include/util.h b/include/util.h
-index bec2975..d43cd8c 100644
---- a/include/util.h
-+++ b/include/util.h
-@@ -12,6 +12,7 @@
- #include <string.h>
- #include "swupdate.h"
- #include "swupdate_status.h"
-+#include "compat.h"
- 
- #define NOTIFY_BUF_SIZE 	2048
- #define ENOMEM_ASPRINTF		-1
-diff --git a/ipc/network_ipc.c b/ipc/network_ipc.c
-index 3f197c7..48f6fcc 100644
---- a/ipc/network_ipc.c
-+++ b/ipc/network_ipc.c
-@@ -27,6 +27,7 @@
- #include <pthread.h>
- 
- #include "network_ipc.h"
-+#include "compat.h"
- 
- #ifdef CONFIG_SOCKET_CTRL_PATH
- static char* SOCKET_CTRL_PATH = (char*)CONFIG_SOCKET_CTRL_PATH;
--- 
-2.15.1
-
diff --git a/package/swupdate/0002-Fix-build-if-DOWNLOAD-is-set-but-no-JSON.patch b/package/swupdate/0002-Fix-build-if-DOWNLOAD-is-set-but-no-JSON.patch
deleted file mode 100644
index 5e07995582..0000000000
--- a/package/swupdate/0002-Fix-build-if-DOWNLOAD-is-set-but-no-JSON.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-From 37a6666a532e9cbc42b56301f27919ae7c00d2eb Mon Sep 17 00:00:00 2001
-From: Stefano Babic <sbabic@denx.de>
-Date: Tue, 23 Jan 2018 16:52:32 +0100
-Subject: [PATCH] Fix build if DOWNLOAD is set, but no JSON
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The downloader does not require JSON, but channel_curl is built
-even if not called. Build fails with the error:
-
-corelib/channel_curl.c:27:10: fatal error: json-c/json.h: No such file or directory
-
-Add a CONFIG_CHANNEL_CURL that is automatically set by the modules
-reuiring it (suricatta and swuforwarder).
-
-Backported from: 37a6666a532e9cbc42b56301f27919ae7c00d2eb
-
-Signed-off-by: Stefano Babic <sbabic@denx.de>
-Reported-by: J??rg Krause <joerg.krause@embedded.rocks>
-Acked-by: J??rg Krause <joerg.krause@embedded.rocks>
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- Kconfig             | 7 +++++++
- corelib/Makefile    | 2 +-
- handlers/Config.in  | 8 +++++---
- suricatta/Config.in | 3 +--
- 4 files changed, 14 insertions(+), 6 deletions(-)
-
-diff --git a/Kconfig b/Kconfig
-index 4469096..e344572 100644
---- a/Kconfig
-+++ b/Kconfig
-@@ -294,6 +294,13 @@ config DOWNLOAD
- comment "Image downloading support needs libcurl"
- 	depends on !HAVE_LIBCURL
- 
-+config CHANNEL_CURL
-+	bool
-+	depends on HAVE_LIBCURL
-+	depends on HAVE_JSON_C
-+	select CURL
-+	select JSON
-+
- config HASH_VERIFY
- 	bool "Allow to add sha256 hash to each image"
- 	depends on HAVE_LIBSSL
-diff --git a/corelib/Makefile b/corelib/Makefile
-index 282bffd..4b30f9c 100644
---- a/corelib/Makefile
-+++ b/corelib/Makefile
-@@ -17,4 +17,4 @@ lib-$(CONFIG_ENCRYPTED_IMAGES)	+= swupdate_decrypt.o
- lib-$(CONFIG_LIBCONFIG)		+= swupdate_settings.o \
- 				   parsing_library_libconfig.o
- lib-$(CONFIG_JSON)		+= parsing_library_libjson.o
--lib-$(CONFIG_CURL)		+= channel_curl.o
-+lib-$(CONFIG_CHANNEL_CURL)	+= channel_curl.o
-diff --git a/handlers/Config.in b/handlers/Config.in
-index 596f069..6226b59 100644
---- a/handlers/Config.in
-+++ b/handlers/Config.in
-@@ -54,7 +54,6 @@ config UBIVIDOFFSET
- 	  if your NAND driver incorrectly reports that it can handle
- 	  sub-page accesses when it should not.
- 
--
- config CFI
- 	bool "cfi"
- 	depends on MTD
-@@ -164,8 +163,8 @@ comment "remote handler needs zeromq"
- config SWUFORWARDER_HANDLER
- 	bool "SWU forwarder"
- 	depends on HAVE_LIBCURL
--	select CURL
--	select JSON
-+	depends on HAVE_JSON_C
-+	select CHANNEL_CURL
- 	default n
- 	help
- 	  This allows to build a chain of updater. A
-@@ -174,6 +173,9 @@ config SWUFORWARDER_HANDLER
- 	  embedded SWU to the other devices using the
- 	  Webserver REST API.
- 
-+comment "swuforward handler needs json-c and curl"
-+	depends on !HAVE_JSON_C || !HAVE_LIBCURL
-+
- comment "SWU forwarder requires libcurl"
- 	depends on !HAVE_LIBCURL
- 
-diff --git a/suricatta/Config.in b/suricatta/Config.in
-index 62e448a..2586169 100644
---- a/suricatta/Config.in
-+++ b/suricatta/Config.in
-@@ -71,8 +71,7 @@ config SURICATTA_HAWKBIT
- 	bool "hawkBit support"
- 	depends on HAVE_LIBCURL
- 	depends on HAVE_JSON_C
--	select JSON
--	select CURL
-+	select CHANNEL_CURL
- 	help
- 	  Support for hawkBit server.
- 	  https://projects.eclipse.org/projects/iot.hawkbit
--- 
-2.16.1
-
diff --git a/package/swupdate/swupdate.config b/package/swupdate/swupdate.config
index 0f6e9615e5..730ebe500d 100644
--- a/package/swupdate/swupdate.config
+++ b/package/swupdate/swupdate.config
@@ -12,6 +12,7 @@ CONFIG_HAVE_DOT_CONFIG=y
 # General Configuration
 #
 # CONFIG_CURL is not set
+# CONFIG_CURL_SSL is not set
 # CONFIG_SYSTEMD is not set
 CONFIG_SCRIPTS=y
 # CONFIG_HW_COMPATIBILITY is not set
@@ -49,6 +50,10 @@ CONFIG_EXTRA_LDLIBS=""
 # CONFIG_WERROR is not set
 # CONFIG_NOCLEANUP is not set
 
+#
+# EFI Boot Guard needs libebgenv and libz
+#
+
 #
 # U-Boot support needs libubootenv, libz
 #
@@ -72,29 +77,13 @@ CONFIG_BOOTLOADER_NONE=y
 #
 # CONFIG_SURICATTA is not set
 CONFIG_WEBSERVER=y
-
-#
-# Webserver Features
-#
 CONFIG_MONGOOSE=y
-
-#
-# Mongoose Feature
-#
 CONFIG_MONGOOSEIPV6=y
 
 #
 # SSL support needs libcrypto, libssl
 #
 
-#
-# Archival Features
-#
-
-#
-# gunzip support needs libz
-#
-
 #
 # Parser Features
 #
@@ -124,6 +113,10 @@ CONFIG_RAW=y
 # remote handler needs zeromq
 #
 
+#
+# swuforward handler needs json-c and curl
+#
+
 #
 # SWU forwarder requires libcurl
 #
diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index d1b69c9a03..efc637976a 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  1e15d9675cf7e23886dca7ea058498282c35679a555845dbc85ffe688f2cc681  swupdate-2017.11.tar.gz
+sha256  19156bb30c3517a0ff9c918a38062df3cfa70f02f8162da4971a2f47d108688e  swupdate-2018.03.tar.gz
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index aa232e5837..8649931eb7 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2017.11
+SWUPDATE_VERSION = 2018.03
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
-SWUPDATE_LICENSE = GPL-2.0+, MIT, Public Domain
+SWUPDATE_LICENSE = GPL-2.0+, LGPL-2.1+, MIT
 SWUPDATE_LICENSE_FILES = COPYING
 
-# swupdate bundles its own version of mongoose (version 3.8)
+# swupdate bundles its own version of mongoose (version 6.11)
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 SWUPDATE_DEPENDENCIES += json-c
