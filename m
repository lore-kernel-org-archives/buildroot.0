From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 3 Jul 2017 10:41:06 +0200
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in: add host-cc-option
	macro
Message-ID: <20170703084107.5620-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This macro allows to test if HOSTCC supports a specific option. It is
needed to pass '-no-pie' on recent Debian, Ubuntu and Gentoo hosts.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Makefile.in | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 8087bde999..2dabfd69b2 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -222,6 +222,27 @@ HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
 HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
 
+# The macros below are taken from linux 4.11 and adapted slightly.
+# Copy more when needed.
+
+# try-run
+# Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
+# Exit code chooses option. "$$TMP" is can be used as temporary file and
+# is automatically cleaned up.
+try-run = $(shell set -e;               \
+	TMP="$$(tempfile)";             \
+	if ($(1)) >/dev/null 2>&1;      \
+	then echo "$(2)";               \
+	else echo "$(3)";               \
+	fi;                             \
+	rm -f "$$TMP")
+
+# host-cc-option
+# Usage: HOST_FOO_CFLAGS += $(call host-cc-option,-no-pie,)
+host-cc-option = $(call try-run,\
+        $(HOSTCC) $(HOST_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
+
+
 # host-intltool should be executed with the system perl, so we save
 # the path to the system perl, before a host-perl built by Buildroot
 # might get installed into $(HOST_DIR)/usr/bin and therefore appears
-- 
2.13.2
