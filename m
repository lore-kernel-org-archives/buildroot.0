From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 30 Apr 2014 21:29:02 +0200
Subject: [Buildroot] [PATCH v2] target-finalize: avoid stripping kernel
 modules with incorrect permissions
Message-ID: <86b494c37c1419136d1e.1398886142@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If a kernel module is installed with incorrect permissions (0755 iso 0644),
it would get stripped in a way that would render the kernel module broken.
While the incorrect permissions are a developer error, it is a minor change
to prevent this mistake from causing incorrectly stripped modules.

This was reported with bug #6992:
https://bugs.busybox.net/show_bug.cgi?id=6992

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: add comment with more detail (Arnout)

 Makefile |  9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -507,7 +507,14 @@ ifneq (,$(call qstrip,$(BR2_STRIP_EXCLUD
 STRIP_FIND_CMD += \( $(call finddirclauses,$(TARGET_DIR),$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) -prune -o
 endif
 STRIP_FIND_CMD += -type f \( -perm /111 -o -name '*.so*' \)
-STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print
+# file exclusions:
+# - libpthread.so: a non-stripped libpthread shared library is needed for
+#   proper debugging of pthread programs using gdb.
+# - kernel modules (*.ko): do not function properly when stripped like normal
+#   applications and libraries. Normally kernel modules are already excluded
+#   by the executable permission check above, so the explicit exclusion is only
+#   done for kernel modules with incorrect permissions.
+STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* *.ko $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print
 
 $(TARGETS_ROOTFS): target-finalize
 
