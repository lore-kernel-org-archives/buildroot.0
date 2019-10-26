From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 26 Oct 2019 19:06:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/Makefile.in: remove host-cc-option
 macro
Message-ID: <20191026170614.28766-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://git.buildroot.net/buildroot/commit/?id=91a08ecc998ae232ea6f3525540ed129d8176d18
added a macro solely used by the aespipe package:
https://git.buildroot.net/buildroot/commit/?id=00ecd72c28f103fc7d166f718db81a8b6c4919fa

After the latest version bump of aespipe the package does not need this
macro anymore so we can safely remove it.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Makefile.in | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 0a7899c852..285e2837ef 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -230,27 +230,6 @@ HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
 HOST_LDFLAGS  += -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib
 
-# The macros below are taken from linux 4.11 and adapted slightly.
-# Copy more when needed.
-
-# try-run
-# Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
-# Exit code chooses option. "$$TMP" is can be used as temporary file and
-# is automatically cleaned up.
-try-run = $(shell set -e;               \
-	TMP="$$(mktemp)";               \
-	if ($(1)) >/dev/null 2>&1;      \
-	then echo "$(2)";               \
-	else echo "$(3)";               \
-	fi;                             \
-	rm -f "$$TMP")
-
-# host-cc-option
-# Usage: HOST_FOO_CFLAGS += $(call host-cc-option,-no-pie,)
-host-cc-option = $(call try-run,\
-        $(HOSTCC) $(HOST_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
-
-
 # host-intltool should be executed with the system perl, so we save
 # the path to the system perl, before a host-perl built by Buildroot
 # might get installed into $(HOST_DIR)/bin and therefore appears
-- 
2.20.1
