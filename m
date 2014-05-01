From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 May 2014 22:17:50 +0200
Subject: [Buildroot] [git commit] target-finalize: avoid stripping kernel
	modules with incorrect permissions
Message-ID: <20140501201859.27B8E9CAB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=066359166fa9407382fd9ce40e002249dbdda9c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If a kernel module is installed with incorrect permissions (0755 iso 0644),
it would get stripped in a way that would render the kernel module broken.
While the incorrect permissions are a developer error, it is a minor change
to prevent this mistake from causing incorrectly stripped modules.

This was reported with bug #6992:
https://bugs.busybox.net/show_bug.cgi?id=6992

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index eff408b..30b2271 100644
--- a/Makefile
+++ b/Makefile
@@ -507,7 +507,14 @@ ifneq (,$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)))
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
 
