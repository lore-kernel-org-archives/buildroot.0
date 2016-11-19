From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 19 Nov 2016 16:25:49 +0100
Subject: [Buildroot] [PATCH 2/2] tinycbor: fix cjson include path and
	library name
In-Reply-To: <1479569149-123944-1-git-send-email-fabrice.fontaine@orange.com>
References: <1479569149-123944-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <1479569149-123944-2-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the first official cjson release (v1.0.0), include path and library
name have changed

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 .../tinycbor/0001-Update-cjson-include-path.patch  | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 package/tinycbor/0001-Update-cjson-include-path.patch

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
-- 
2.5.0
