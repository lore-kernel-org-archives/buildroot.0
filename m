From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 15:40:07 +0100
Subject: [Buildroot] [git commit] cjson: bump to version v1.0.2
Message-ID: <20161204144913.E9211816A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8824a428b12c433e47e525978fe2ad216a074e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a major update in cjson:
 - project site moved from sourceforge to github
 - project recommends to use the new cmake buildsystem instead of the
   legacy make
 - BR2_STATIC_LIBS is now OK (README does not mention issue anymore)
 - As include path and library name have changed, tinycbor has to be
   updated
 - As cjson can now be built as a static library, fix a bug in
   json2cbor compilation from tinycbor package

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cjson/Config.in                            |  4 +-
 package/cjson/cjson.hash                           |  2 +
 package/cjson/cjson.mk                             | 22 +------
 .../tinycbor/0001-Update-cjson-include-path.patch  | 69 ++++++++++++++++++++++
 .../0002-Fix-static-compilation-of-json2cbor.patch | 29 +++++++++
 5 files changed, 104 insertions(+), 22 deletions(-)

diff --git a/package/cjson/Config.in b/package/cjson/Config.in
index bbe4c4a..04eff4c 100644
--- a/package/cjson/Config.in
+++ b/package/cjson/Config.in
@@ -1,9 +1,7 @@
 config BR2_PACKAGE_CJSON
 	bool "cJSON"
-	# For static build with cJSON.c directly see README
-	depends on !BR2_STATIC_LIBS
 	help
 	  An ultra-lightweight, portable, single-file, simple-as-can-be ANSI-C
 	  compliant JSON parser, under MIT license.
 
-	  http://cjson.sourceforge.net/
+	  https://github.com/DaveGamble/cJSON
diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
new file mode 100644
index 0000000..27f1d46
--- /dev/null
+++ b/package/cjson/cjson.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	5c3a4a77796b230efbd74369b0974d14ac0408f2677bd116d4a4b5894b9be372	cjson-v1.0.2.tar.gz
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 8f21ef8..c544a77 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,26 +4,10 @@
 #
 ################################################################################
 
-CJSON_VERSION = 58
-CJSON_SITE_METHOD = svn
-CJSON_SITE = http://svn.code.sf.net/p/cjson/code
+CJSON_VERSION = v1.0.2
+CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
 CJSON_LICENSE_FILES = LICENSE
 
-define CJSON_BUILD_CMDS
-	cd $(@D) && $(TARGET_CC) $(TARGET_CFLAGS) -shared -fPIC -lm \
-		cJSON.c -o libcJSON.so
-endef
-
-define CJSON_INSTALL_STAGING_CMDS
-	$(INSTALL) -D $(@D)/cJSON.h $(STAGING_DIR)/usr/include/cJSON.h
-	$(INSTALL) -D $(@D)/libcJSON.so $(STAGING_DIR)/usr/lib/libcJSON.so
-endef
-
-define CJSON_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/cJSON.h $(TARGET_DIR)/usr/include/cJSON.h
-	$(INSTALL) -D $(@D)/libcJSON.so $(TARGET_DIR)/usr/lib/libcJSON.so
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))
diff --git a/package/tinycbor/0001-Update-cjson-include-path.patch b/package/tinycbor/0001-Update-cjson-include-path.patch
new file mode 100644
index 0000000..5eea937
--- /dev/null
+++ b/package/tinycbor/0001-Update-cjson-include-path.patch
@@ -0,0 +1,69 @@
+From 9aa79d8e9e38b31b34d9933a266c698e79808a79 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Sun, 13 Nov 2016 15:43:40 +0100
+Subject: [PATCH] Update cjson include path
+
+Since cjson-v1.0.0 (https://github.com/DaveGamble/cJSON/releases),
+cJSON.h is installed into cjson/cJSON.h and library has been renamed
+from cJSON to cjson
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ Makefile                    | 4 ++--
+ Makefile.configure          | 4 ++--
+ tools/json2cbor/json2cbor.c | 2 +-
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index acd52eb..905fbdf 100644
+--- a/Makefile
++++ b/Makefile
+@@ -82,12 +82,12 @@ ifeq ($(open_memstream-pass),)
+   endif
+ endif
+ 
+-# json2cbor depends on an external library (cJSON)
++# json2cbor depends on an external library (cjson)
+ ifneq ($(cjson-pass)$(system-cjson-pass),)
+   JSON2CBOR_SOURCES = tools/json2cbor/json2cbor.c
+   INSTALL_TARGETS += $(bindir)/json2cbor
+   ifeq ($(system-cjson-pass),1)
+-    LDFLAGS_CJSON = -lcJSON
++    LDFLAGS_CJSON = -lcjson
+   else
+     JSON2CBOR_SOURCES += src/cjson/cJSON.c
+     json2cbor_CCFLAGS = -I$(SRCDIR)src/cjson
+diff --git a/Makefile.configure b/Makefile.configure
+index 28f4c92..424efb3 100644
+--- a/Makefile.configure
++++ b/Makefile.configure
+@@ -10,11 +10,11 @@ PROGRAM-gc_sections = int main() {}
+ CCFLAGS-gc_sections = -Wl,--gc-sections
+ 
+ PROGRAM-cjson  = \#include <stdlib.h>\n
+-PROGRAM-cjson += \#include <cJSON.h>\n
++PROGRAM-cjson += \#include <cjson/cJSON.h>\n
+ PROGRAM-cjson += int main() { return cJSON_False; }
+ CCFLAGS-cjson = -I$(dir $(MAKEFILE))src/cjson
+ PROGRAM-system-cjson = $(PROGRAM-cjson)
+-CCFLAGS-system-cjson = -lcJSON
++CCFLAGS-system-cjson = -lcjson
+ 
+ sink:
+ 	@echo >&2 Please run from the top-level Makefile.
+diff --git a/tools/json2cbor/json2cbor.c b/tools/json2cbor/json2cbor.c
+index 96d3ed1..e194299 100644
+--- a/tools/json2cbor/json2cbor.c
++++ b/tools/json2cbor/json2cbor.c
+@@ -27,7 +27,7 @@
+ #include "cbor.h"
+ #include "compilersupport_p.h"
+ 
+-#include <cJSON.h>
++#include <cjson/cJSON.h>
+ 
+ #include <errno.h>
+ #include <math.h>
+-- 
+2.5.0
+
diff --git a/package/tinycbor/0002-Fix-static-compilation-of-json2cbor.patch b/package/tinycbor/0002-Fix-static-compilation-of-json2cbor.patch
new file mode 100644
index 0000000..dfea4ca
--- /dev/null
+++ b/package/tinycbor/0002-Fix-static-compilation-of-json2cbor.patch
@@ -0,0 +1,29 @@
+From 1be7da8d81bbd52d722ec60250567ea876f6f4b5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Sat, 3 Dec 2016 20:15:41 +0100
+Subject: [PATCH] Fix static compilation of json2cbor
+
+json2cbor depends on cjson so tools/json2cbor/json2cbor.o must before
+-lcjson
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 905fbdf..7b5fefc 100644
+--- a/Makefile
++++ b/Makefile
+@@ -115,7 +115,7 @@ bin/cbordump: $(CBORDUMP_SOURCES:.c=.o) lib/libtinycbor.a | bin
+ 	$(CC) -o $@ $(LDFLAGS) $^ $(LDLIBS) -lm
+ 
+ bin/json2cbor: $(JSON2CBOR_SOURCES:.c=.o) lib/libtinycbor.a | bin
+-	$(CC) -o $@ $(LDFLAGS) $(LDFLAGS_CJSON) $^ $(LDLIBS) -lm
++	$(CC) -o $@ $(LDFLAGS) $^ $(LDFLAGS_CJSON) $(LDLIBS) -lm
+ 
+ tinycbor.pc: tinycbor.pc.in
+ 	$(SED) > $@ < $< \
+-- 
+2.5.0
+
