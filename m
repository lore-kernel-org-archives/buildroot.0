From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 29 Apr 2014 20:54:06 +0200
Subject: [Buildroot] [PATCH] target-finalize: avoid stripping kernel modules
 with incorrect permissions
Message-ID: <7d963df83be71e515c67.1398797646@argentina>
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
 Makefile |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -507,7 +507,7 @@ ifneq (,$(call qstrip,$(BR2_STRIP_EXCLUD
 STRIP_FIND_CMD += \( $(call finddirclauses,$(TARGET_DIR),$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) -prune -o
 endif
 STRIP_FIND_CMD += -type f \( -perm /111 -o -name '*.so*' \)
-STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print
+STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* *.ko $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print
 
 $(TARGETS_ROOTFS): target-finalize
 
