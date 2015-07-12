From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 12 Jul 2015 18:26:31 +0200
Subject: [Buildroot] [PATCH 2/6] package/pkg-utils.mk: add get_rpaths helpers
In-Reply-To: <1436718395-10536-1-git-send-email-s.martin49@gmail.com>
References: <1436718395-10536-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1436718395-10536-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This helper computes the value of the RPATH for the given binary.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/pkg-utils.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 442c528..b556525 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -54,6 +54,18 @@ relative-path = $(strip \
 	$(__r)$(subst /%,%,$(2))))
 
 
+# Return the RPATH value starting with XORIGIN instead of $ORIGIN.
+# This helper supports multi-libdirs in RPATH.
+#   $1: base directory, e.g. $(HOST_DIR)
+#   $2: binary path (should start with base directory)
+#   $3: libdirs, a space-separated list of paths (each libdir should
+#       start with base directory)
+get_rpaths = $(eval __rp :=) \
+	$(foreach libdir,$(3),\
+		$(eval __rp := $(__rp):XORIGIN/$(call \
+			relative-path,$(dir $(patsubst $(1)%,%,$(2))),$(patsubst $(1)%,%,$(libdir))))) \
+	$(patsubst :%,%,$(__rp))
+
 #
 # Manipulation of .config files based on the Kconfig
 # infrastructure. Used by the BusyBox package, the Linux kernel
-- 
2.4.5
