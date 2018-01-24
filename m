From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 24 Jan 2018 23:00:29 +0100
Subject: [Buildroot] [PATCH] swupdate: add upstream patch to fix build error
Message-ID: <20180124220029.30284-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building SWUpdate with the following defconfig:

```
CONFIG_DOWNLOAD=y
```

.. the build process breaks with:

```
corelib/channel_curl.c:27:10: fatal error: json-c/json.h: No such file or directory
 #include <json-c/json.h>
```

Looking at the SWUpdate Kconfig based build system shows that `CONFIG_DOWNLOAD`
depends on `HAVE_LIBCURL`, which selects CURL, which eventually enables the
(unnecessary) build of channel_curl.o.

The upstream fixes the condition for building channel_curl.o by adding a new
hidden config option `CHANNEL_CURL`, which is only selected by the
dependent options.

Backported from:
https://github.com/sbabic/swupdate/commit/37a6666a532e9cbc42b56301f27919ae7c00d2eb

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...-Fix-build-if-DOWNLOAD-is-set-but-no-JSON.patch | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 package/swupdate/0002-Fix-build-if-DOWNLOAD-is-set-but-no-JSON.patch

diff --git a/package/swupdate/0002-Fix-build-if-DOWNLOAD-is-set-but-no-JSON.patch b/package/swupdate/0002-Fix-build-if-DOWNLOAD-is-set-but-no-JSON.patch
new file mode 100644
index 0000000000..5e07995582
--- /dev/null
+++ b/package/swupdate/0002-Fix-build-if-DOWNLOAD-is-set-but-no-JSON.patch
@@ -0,0 +1,107 @@
+From 37a6666a532e9cbc42b56301f27919ae7c00d2eb Mon Sep 17 00:00:00 2001
+From: Stefano Babic <sbabic@denx.de>
+Date: Tue, 23 Jan 2018 16:52:32 +0100
+Subject: [PATCH] Fix build if DOWNLOAD is set, but no JSON
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The downloader does not require JSON, but channel_curl is built
+even if not called. Build fails with the error:
+
+corelib/channel_curl.c:27:10: fatal error: json-c/json.h: No such file or directory
+
+Add a CONFIG_CHANNEL_CURL that is automatically set by the modules
+reuiring it (suricatta and swuforwarder).
+
+Backported from: 37a6666a532e9cbc42b56301f27919ae7c00d2eb
+
+Signed-off-by: Stefano Babic <sbabic@denx.de>
+Reported-by: J?rg Krause <joerg.krause@embedded.rocks>
+Acked-by: J?rg Krause <joerg.krause@embedded.rocks>
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ Kconfig             | 7 +++++++
+ corelib/Makefile    | 2 +-
+ handlers/Config.in  | 8 +++++---
+ suricatta/Config.in | 3 +--
+ 4 files changed, 14 insertions(+), 6 deletions(-)
+
+diff --git a/Kconfig b/Kconfig
+index 4469096..e344572 100644
+--- a/Kconfig
++++ b/Kconfig
+@@ -294,6 +294,13 @@ config DOWNLOAD
+ comment "Image downloading support needs libcurl"
+ 	depends on !HAVE_LIBCURL
+ 
++config CHANNEL_CURL
++	bool
++	depends on HAVE_LIBCURL
++	depends on HAVE_JSON_C
++	select CURL
++	select JSON
++
+ config HASH_VERIFY
+ 	bool "Allow to add sha256 hash to each image"
+ 	depends on HAVE_LIBSSL
+diff --git a/corelib/Makefile b/corelib/Makefile
+index 282bffd..4b30f9c 100644
+--- a/corelib/Makefile
++++ b/corelib/Makefile
+@@ -17,4 +17,4 @@ lib-$(CONFIG_ENCRYPTED_IMAGES)	+= swupdate_decrypt.o
+ lib-$(CONFIG_LIBCONFIG)		+= swupdate_settings.o \
+ 				   parsing_library_libconfig.o
+ lib-$(CONFIG_JSON)		+= parsing_library_libjson.o
+-lib-$(CONFIG_CURL)		+= channel_curl.o
++lib-$(CONFIG_CHANNEL_CURL)	+= channel_curl.o
+diff --git a/handlers/Config.in b/handlers/Config.in
+index 596f069..6226b59 100644
+--- a/handlers/Config.in
++++ b/handlers/Config.in
+@@ -54,7 +54,6 @@ config UBIVIDOFFSET
+ 	  if your NAND driver incorrectly reports that it can handle
+ 	  sub-page accesses when it should not.
+ 
+-
+ config CFI
+ 	bool "cfi"
+ 	depends on MTD
+@@ -164,8 +163,8 @@ comment "remote handler needs zeromq"
+ config SWUFORWARDER_HANDLER
+ 	bool "SWU forwarder"
+ 	depends on HAVE_LIBCURL
+-	select CURL
+-	select JSON
++	depends on HAVE_JSON_C
++	select CHANNEL_CURL
+ 	default n
+ 	help
+ 	  This allows to build a chain of updater. A
+@@ -174,6 +173,9 @@ config SWUFORWARDER_HANDLER
+ 	  embedded SWU to the other devices using the
+ 	  Webserver REST API.
+ 
++comment "swuforward handler needs json-c and curl"
++	depends on !HAVE_JSON_C || !HAVE_LIBCURL
++
+ comment "SWU forwarder requires libcurl"
+ 	depends on !HAVE_LIBCURL
+ 
+diff --git a/suricatta/Config.in b/suricatta/Config.in
+index 62e448a..2586169 100644
+--- a/suricatta/Config.in
++++ b/suricatta/Config.in
+@@ -71,8 +71,7 @@ config SURICATTA_HAWKBIT
+ 	bool "hawkBit support"
+ 	depends on HAVE_LIBCURL
+ 	depends on HAVE_JSON_C
+-	select JSON
+-	select CURL
++	select CHANNEL_CURL
+ 	help
+ 	  Support for hawkBit server.
+ 	  https://projects.eclipse.org/projects/iot.hawkbit
+-- 
+2.16.1
+
-- 
2.16.1
