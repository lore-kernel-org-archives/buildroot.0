From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Apr 2019 19:13:20 +0200
Subject: [Buildroot] [git commit] package/sane-backends: security bump to
 version 1.0.27
Message-ID: <20190406171029.A54AE81387@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a911b7d2297dcd22a8c0893916c79bf92290f63b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch site to gitlab
- Remove second patch (already in version)
- Use new --{with,without}-usb option
- Add hash for license file
- Fix CVE-2017-6318

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-Add-missing-sys-types.h-includes.patch    | 106 ---------------------
 ...> 0002-sane_backend-add-missing-config.h.patch} |   0
 package/sane-backends/sane-backends.hash           |   7 +-
 package/sane-backends/sane-backends.mk             |   9 +-
 4 files changed, 10 insertions(+), 112 deletions(-)

diff --git a/package/sane-backends/0002-Add-missing-sys-types.h-includes.patch b/package/sane-backends/0002-Add-missing-sys-types.h-includes.patch
deleted file mode 100644
index 8ab41f1fef..0000000000
--- a/package/sane-backends/0002-Add-missing-sys-types.h-includes.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From d33f16f463e888846d69ddfbeeb963d40972b654 Mon Sep 17 00:00:00 2001
-From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
-Date: Thu, 15 Oct 2015 12:35:00 +0900
-Subject: [PATCH] Add missing <sys/types.h> includes
-
-[Thomas: backport from upstream commit
-33495ef9b42a783c8f5f2c056ac5699481d3cc7e, allows to fix the build with
-the musl C library.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- backend/epsonds-io.c     | 3 +++
- backend/hp5400.c         | 3 +++
- backend/hp5590.c         | 3 +++
- backend/kvs20xx_cmd.h    | 4 ++++
- backend/kvs40xx.h        | 3 +++
- include/sane/sanei_udp.h | 3 +++
- 6 files changed, 19 insertions(+)
-
-diff --git a/backend/epsonds-io.c b/backend/epsonds-io.c
-index 28bacfc..512997d 100644
---- a/backend/epsonds-io.c
-+++ b/backend/epsonds-io.c
-@@ -16,6 +16,9 @@
- #include "sane/config.h"
- #include <ctype.h>
- #include <unistd.h>     /* sleep */
-+#ifdef HAVE_SYS_TYPES_H
-+#include <sys/types.h>
-+#endif
- 
- #include "epsonds.h"
- #include "epsonds-io.h"
-diff --git a/backend/hp5400.c b/backend/hp5400.c
-index 61de3db..cfa2dc9 100644
---- a/backend/hp5400.c
-+++ b/backend/hp5400.c
-@@ -67,6 +67,9 @@
- #include <stdlib.h>		/* malloc, free */
- #include <string.h>		/* memcpy */
- #include <stdio.h>
-+#ifdef HAVE_SYS_TYPES_H
-+#include <sys/types.h>
-+#endif
- 
- 
- #define HP5400_CONFIG_FILE "hp5400.conf"
-diff --git a/backend/hp5590.c b/backend/hp5590.c
-index 7b1cd60..5422372 100644
---- a/backend/hp5590.c
-+++ b/backend/hp5590.c
-@@ -48,6 +48,9 @@
- #include <stdio.h>
- #include <string.h>
- #include <unistd.h>
-+#ifdef HAVE_SYS_TYPES_H
-+#include <sys/types.h>
-+#endif
- 
- #include "../include/sane/sane.h"
- #define BACKEND_NAME hp5590
-diff --git a/backend/kvs20xx_cmd.h b/backend/kvs20xx_cmd.h
-index c18b754..4acaf62 100644
---- a/backend/kvs20xx_cmd.h
-+++ b/backend/kvs20xx_cmd.h
-@@ -9,6 +9,10 @@
-    Panasonic KV-S20xx USB-SCSI scanners.
- */
- 
-+#ifdef HAVE_SYS_TYPES_H
-+#include <sys/types.h>
-+#endif
-+
- #define COMMAND_BLOCK	1
- #define DATA_BLOCK	2
- #define RESPONSE_BLOCK	3
-diff --git a/backend/kvs40xx.h b/backend/kvs40xx.h
-index fa17163..02e0da6 100644
---- a/backend/kvs40xx.h
-+++ b/backend/kvs40xx.h
-@@ -10,6 +10,9 @@
- 
- #include "../include/sane/config.h"
- #include <semaphore.h>
-+#ifdef HAVE_SYS_TYPES_H
-+#include <sys/types.h>
-+#endif
- 
- #undef  BACKEND_NAME
- #define BACKEND_NAME kvs40xx
-diff --git a/include/sane/sanei_udp.h b/include/sane/sanei_udp.h
-index c44afdd..e32fc1a 100644
---- a/include/sane/sanei_udp.h
-+++ b/include/sane/sanei_udp.h
-@@ -27,6 +27,9 @@
- #include <netinet/in.h>
- #include <netdb.h>
- #endif
-+#ifdef HAVE_SYS_TYPES_H
-+#include <sys/types.h>
-+#endif
- 
- extern SANE_Status sanei_udp_open(const char *host, int port, int *fdp);
- extern SANE_Status sanei_udp_open_broadcast(int *fdp);
--- 
-2.7.4
-
diff --git a/package/sane-backends/0003-sane_backend-add-missing-config.h.patch b/package/sane-backends/0002-sane_backend-add-missing-config.h.patch
similarity index 100%
rename from package/sane-backends/0003-sane_backend-add-missing-config.h.patch
rename to package/sane-backends/0002-sane_backend-add-missing-config.h.patch
diff --git a/package/sane-backends/sane-backends.hash b/package/sane-backends/sane-backends.hash
index a7693e2527..ddf82500bb 100644
--- a/package/sane-backends/sane-backends.hash
+++ b/package/sane-backends/sane-backends.hash
@@ -1,2 +1,5 @@
-# From http://www.sane-project.org/sane-md5sums.txt
-md5 f9ed5405b3c12f07c6ca51ee60225fe7  sane-backends-1.0.25.tar.gz
+# From https://gitlab.com/sane-project/backends/tags/RELEASE_1_0_27
+sha256 293747bf37275c424ebb2c833f8588601a60b2f9653945d5a3194875355e36c9  sane-backends-1.0.27.tar.gz
+
+#??Hash for license file
+sha256 dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index ed3b912479..092123e194 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-SANE_BACKENDS_VERSION = 1.0.25
-SANE_BACKENDS_SITE = https://alioth.debian.org/frs/download.php/file/4146
+SANE_BACKENDS_VERSION = 1.0.27
+SANE_BACKENDS_SITE = \
+	https://gitlab.com/sane-project/backends/uploads/a3ba9fff29253a94e84074917bff581a
 SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
 SANE_BACKENDS_LICENSE = GPL-2.0+
 SANE_BACKENDS_LICENSE_FILES = COPYING
@@ -23,9 +24,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 SANE_BACKENDS_DEPENDENCIES += libusb
-SANE_BACKENDS_CONF_OPTS += --enable-libusb_1_0
+SANE_BACKENDS_CONF_OPTS += --with-usb
 else
-SANE_BACKENDS_CONF_OPTS += --disable-libusb
+SANE_BACKENDS_CONF_OPTS += --without-usb
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
