From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 12 Jul 2015 18:26:32 +0200
Subject: [Buildroot] [PATCH 3/6] package/pkg-utils.mk: add fix_rpaths helpers
In-Reply-To: <1436718395-10536-1-git-send-email-s.martin49@gmail.com>
References: <1436718395-10536-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1436718395-10536-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This helper actually calls patchelf from the the HOST_DIR on a given
binary.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/pkg-utils.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index b556525..e38485d 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -66,6 +66,16 @@ get_rpaths = $(eval __rp :=) \
 			relative-path,$(dir $(patsubst $(1)%,%,$(2))),$(patsubst $(1)%,%,$(libdir))))) \
 	$(patsubst :%,%,$(__rp))
 
+# Fix RPATH in the given binary.
+# This helper calls patchelf from the HOST_DIR on the given binary, and
+# substitute the XORIGIN by $ORIGIN.
+#   $1: base directory, e.g. $(HOST_DIR)
+#   $2: binary path (should start with base directory)
+#   $3: libdirs, space-separated list of paths (each libdir should
+#       start with base directory)
+fix_rpaths = $(HOST_DIR)/usr/bin/patchelf 2>/dev/null --set-rpath \
+	$(subst XORIGIN,\$$ORIGIN,$(call get_rpaths,$(1),$(2),$(3))) $(2) ;
+
 #
 # Manipulation of .config files based on the Kconfig
 # infrastructure. Used by the BusyBox package, the Linux kernel
-- 
2.4.5
