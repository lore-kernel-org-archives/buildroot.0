From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  6 Mar 2017 21:56:01 +0100
Subject: [Buildroot] [PATCH 1/1] tinycbor: bump to version 1.4.1
Message-ID: <1488833761-41874-1-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Delete first patch as it has been integrated upstream
Retrieve second patch upstream

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../tinycbor/0001-Update-cjson-include-path.patch  | 69 ----------------------
 .../0002-Fix-static-compilation-of-json2cbor.patch | 29 ---------
 package/tinycbor/tinycbor.hash                     |  3 +-
 package/tinycbor/tinycbor.mk                       |  6 +-
 4 files changed, 7 insertions(+), 100 deletions(-)
 delete mode 100644 package/tinycbor/0001-Update-cjson-include-path.patch
 delete mode 100644 package/tinycbor/0002-Fix-static-compilation-of-json2cbor.patch

diff --git a/package/tinycbor/0001-Update-cjson-include-path.patch b/package/tinycbor/0001-Update-cjson-include-path.patch
deleted file mode 100644
index 5eea937..0000000
--- a/package/tinycbor/0001-Update-cjson-include-path.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 9aa79d8e9e38b31b34d9933a266c698e79808a79 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fabrice.fontaine@orange.com>
-Date: Sun, 13 Nov 2016 15:43:40 +0100
-Subject: [PATCH] Update cjson include path
-
-Since cjson-v1.0.0 (https://github.com/DaveGamble/cJSON/releases),
-cJSON.h is installed into cjson/cJSON.h and library has been renamed
-from cJSON to cjson
-
-Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
----
- Makefile                    | 4 ++--
- Makefile.configure          | 4 ++--
- tools/json2cbor/json2cbor.c | 2 +-
- 3 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index acd52eb..905fbdf 100644
---- a/Makefile
-+++ b/Makefile
-@@ -82,12 +82,12 @@ ifeq ($(open_memstream-pass),)
-   endif
- endif
- 
--# json2cbor depends on an external library (cJSON)
-+# json2cbor depends on an external library (cjson)
- ifneq ($(cjson-pass)$(system-cjson-pass),)
-   JSON2CBOR_SOURCES = tools/json2cbor/json2cbor.c
-   INSTALL_TARGETS += $(bindir)/json2cbor
-   ifeq ($(system-cjson-pass),1)
--    LDFLAGS_CJSON = -lcJSON
-+    LDFLAGS_CJSON = -lcjson
-   else
-     JSON2CBOR_SOURCES += src/cjson/cJSON.c
-     json2cbor_CCFLAGS = -I$(SRCDIR)src/cjson
-diff --git a/Makefile.configure b/Makefile.configure
-index 28f4c92..424efb3 100644
---- a/Makefile.configure
-+++ b/Makefile.configure
-@@ -10,11 +10,11 @@ PROGRAM-gc_sections = int main() {}
- CCFLAGS-gc_sections = -Wl,--gc-sections
- 
- PROGRAM-cjson  = \#include <stdlib.h>\n
--PROGRAM-cjson += \#include <cJSON.h>\n
-+PROGRAM-cjson += \#include <cjson/cJSON.h>\n
- PROGRAM-cjson += int main() { return cJSON_False; }
- CCFLAGS-cjson = -I$(dir $(MAKEFILE))src/cjson
- PROGRAM-system-cjson = $(PROGRAM-cjson)
--CCFLAGS-system-cjson = -lcJSON
-+CCFLAGS-system-cjson = -lcjson
- 
- sink:
- 	@echo >&2 Please run from the top-level Makefile.
-diff --git a/tools/json2cbor/json2cbor.c b/tools/json2cbor/json2cbor.c
-index 96d3ed1..e194299 100644
---- a/tools/json2cbor/json2cbor.c
-+++ b/tools/json2cbor/json2cbor.c
-@@ -27,7 +27,7 @@
- #include "cbor.h"
- #include "compilersupport_p.h"
- 
--#include <cJSON.h>
-+#include <cjson/cJSON.h>
- 
- #include <errno.h>
- #include <math.h>
--- 
-2.5.0
-
diff --git a/package/tinycbor/0002-Fix-static-compilation-of-json2cbor.patch b/package/tinycbor/0002-Fix-static-compilation-of-json2cbor.patch
deleted file mode 100644
index dfea4ca..0000000
--- a/package/tinycbor/0002-Fix-static-compilation-of-json2cbor.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 1be7da8d81bbd52d722ec60250567ea876f6f4b5 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fabrice.fontaine@orange.com>
-Date: Sat, 3 Dec 2016 20:15:41 +0100
-Subject: [PATCH] Fix static compilation of json2cbor
-
-json2cbor depends on cjson so tools/json2cbor/json2cbor.o must before
--lcjson
-
-Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 905fbdf..7b5fefc 100644
---- a/Makefile
-+++ b/Makefile
-@@ -115,7 +115,7 @@ bin/cbordump: $(CBORDUMP_SOURCES:.c=.o) lib/libtinycbor.a | bin
- 	$(CC) -o $@ $(LDFLAGS) $^ $(LDLIBS) -lm
- 
- bin/json2cbor: $(JSON2CBOR_SOURCES:.c=.o) lib/libtinycbor.a | bin
--	$(CC) -o $@ $(LDFLAGS) $(LDFLAGS_CJSON) $^ $(LDLIBS) -lm
-+	$(CC) -o $@ $(LDFLAGS) $^ $(LDFLAGS_CJSON) $(LDLIBS) -lm
- 
- tinycbor.pc: tinycbor.pc.in
- 	$(SED) > $@ < $< \
--- 
-2.5.0
-
diff --git a/package/tinycbor/tinycbor.hash b/package/tinycbor/tinycbor.hash
index 88300e8..416dce6 100644
--- a/package/tinycbor/tinycbor.hash
+++ b/package/tinycbor/tinycbor.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256	302ac9de66f1048725040ccc9a99e03c20529ac2b150ccf35cfd1e2dafa81c4b	tinycbor-v0.4.tar.gz
+sha256	8e42984015d62e8323b7f2a439bde157d707e0d7ae57a6d8d5a2665247af6638	tinycbor-v0.4.1.tar.gz
+sha256	1298b80ab23ae24e85515d9f06398236d087bc76dccd0a48757fcb7e54557175	ae608ea2735bd331ec7dcf9d89928c38f0e0c981.patch
diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index 65deacd..1f13e7d 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYCBOR_VERSION = v0.4
+TINYCBOR_VERSION = v0.4.1
 TINYCBOR_SITE = $(call github,01org,tinycbor,$(TINYCBOR_VERSION))
 TINYCBOR_LICENSE = MIT
 TINYCBOR_LICENSE_FILES = LICENSE
@@ -12,6 +12,10 @@ TINYCBOR_LICENSE_FILES = LICENSE
 TINYCBOR_DEPENDENCIES = host-pkgconf
 TINYCBOR_INSTALL_STAGING = YES
 
+# This patch fixes static build of json2cbor
+TINYCBOR_PATCH = \
+	https://github.com/01org/tinycbor/commit/ae608ea2735bd331ec7dcf9d89928c38f0e0c981.patch
+
 ifeq ($(BR2_PACKAGE_CJSON),y)
 TINYCBOR_DEPENDENCIES += cjson
 endif
-- 
2.5.0
