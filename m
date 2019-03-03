From: Martin Kepplinger <martink@posteo.de>
Date: Sun,  3 Mar 2019 12:49:16 +0100
Subject: [Buildroot] [PATCH v2] make printvars: avoid invalid calls when
 arguments are missing
Message-ID: <20190303114916.28824-1-martink@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

during "make printvars > compare" the following error occurs -
reproducible after any "make *_defconfig":

/bin/bash: support/dependencies/check-host-.sh: no such file or directory
/bin/bash: -c: line 0: syntax error: ')' unexpected
/bin/bash: -c: line 0: `set -e; TMP="$(mktemp)"; if () >/dev/null 2>&1; then echo ""; else echo ""; fi;

which is 2 errors, resulting from $(1) arguments being empty, but
called anyway. So this simply skips parts when otherwise we would exit
when wrong scripts are tried be executed.

When comparing the outputs, this removes "host-lzip" from all packages'
*EXTRACT_DEPENDENCIES.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---

hi,                                                                             
                                                                                
ok so this neither breaks my build and "make printvars" succeeds too. When      
comparing "make printvars" output now, "host-lzip" is _removed_ from all        
packages' dependiencies (in contrast to the previous patch). 

thanks

                            martin



 package/Makefile.in                  | 8 ++++----
 support/dependencies/dependencies.mk | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index dc818a2c18..ae1e2e16f6 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -232,18 +232,18 @@ HOST_LDFLAGS  += -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib
 # Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
 # Exit code chooses option. "$$TMP" is can be used as temporary file and
 # is automatically cleaned up.
-try-run = $(shell set -e;               \
+try-run = $(if $(1), $(shell set -e;	\
 	TMP="$$(mktemp)";               \
 	if ($(1)) >/dev/null 2>&1;      \
 	then echo "$(2)";               \
 	else echo "$(3)";               \
 	fi;                             \
-	rm -f "$$TMP")
+	rm -f "$$TMP"))
 
 # host-cc-option
 # Usage: HOST_FOO_CFLAGS += $(call host-cc-option,-no-pie,)
-host-cc-option = $(call try-run,\
-        $(HOSTCC) $(HOST_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
+host-cc-option = $(if $(1), $(call try-run,\
+        $(HOSTCC) $(HOST_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2)))
 
 
 # host-intltool should be executed with the system perl, so we save
diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 4fac5c731b..c53bbe01ce 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -15,7 +15,7 @@ else
 # script should use 'which' to find a candidate. The script should return
 # the path to the suitable host tool, or nothing if no suitable tool was found.
 define suitable-host-package
-$(shell support/dependencies/check-host-$(1).sh $(2))
+$(if $(1), $(shell support/dependencies/check-host-$(1).sh $(2)))
 endef
 endif
 # host utilities needs host-tar to extract the source code tarballs, so
-- 
2.20.1
