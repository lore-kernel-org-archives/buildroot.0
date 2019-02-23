From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Sat, 23 Feb 2019 17:11:08 +0100
Subject: [Buildroot] [PATCH] make printvars: avoid invalid calls when
 arguments are missing
Message-ID: <20190223161108.22819-1-martin.kepplinger@ginzinger.com>
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

When comparing the outputs, this _adds_ "host-tar host-xz" to all packages'
*_DEPENDENCIES where until now only "host-lzip" is listed.

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
---
Hi,

This has been reported by me and others before and this patch might
as well _not_ be the real fix :) I guess $(1) should just never become
empty in the first place, right?

Anyways, I let you decide whether this fixes things (add host-tar dependency
for every package) and how much sense this makes.

Maybe you know what's going on.

thanks,

                                martin



 package/Makefile.in                  | 2 ++
 support/dependencies/dependencies.mk | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index dc818a2c18..f4f3864e8d 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -232,6 +232,7 @@ HOST_LDFLAGS  += -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib
 # Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
 # Exit code chooses option. "$$TMP" is can be used as temporary file and
 # is automatically cleaned up.
+ifneq ($(1),)
 try-run = $(shell set -e;               \
 	TMP="$$(mktemp)";               \
 	if ($(1)) >/dev/null 2>&1;      \
@@ -244,6 +245,7 @@ try-run = $(shell set -e;               \
 # Usage: HOST_FOO_CFLAGS += $(call host-cc-option,-no-pie,)
 host-cc-option = $(call try-run,\
         $(HOSTCC) $(HOST_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
+endif
 
 
 # host-intltool should be executed with the system perl, so we save
diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 4fac5c731b..45ecee0645 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -14,10 +14,12 @@ else
 # can be the candidate to be checked. If not present, the check-host-$(1).sh
 # script should use 'which' to find a candidate. The script should return
 # the path to the suitable host tool, or nothing if no suitable tool was found.
+ifneq ($(1),)
 define suitable-host-package
 $(shell support/dependencies/check-host-$(1).sh $(2))
 endef
 endif
+endif
 # host utilities needs host-tar to extract the source code tarballs, so
 # ensure check-host-tar.mk is included before the rest
 include support/dependencies/check-host-tar.mk
-- 
2.20.1

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3616 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190223/54cc3219/attachment.bin>
