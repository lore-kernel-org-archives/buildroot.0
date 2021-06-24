From: Joseph Burt <caseorum@gmail.com>
Date: Thu, 24 Jun 2021 14:10:23 +0000
Subject: [Buildroot] [PATCH 1/1] package/qemu: disable NDEBUG
Message-ID: <20210624141023.61171-1-caseorum@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

QEMU cannot build with NDEBUG defined.

Signed-off-by: Joseph Burt <caseorum@gmail.com>
---
 package/qemu/qemu.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 470c285f16..c397b8883b 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -160,7 +160,7 @@ define QEMU_CONFIGURE_CMDS
 	unset TARGET_DIR; \
 	cd $(@D); \
 		LIBS='$(QEMU_LIBS)' \
-		$(TARGET_CONFIGURE_OPTS) \
+		$(filter-out -DNDEBUG,$(TARGET_CONFIGURE_OPTS)) \
 		$(TARGET_CONFIGURE_ARGS) \
 		CPP="$(TARGET_CC) -E" \
 		$(QEMU_VARS) \
@@ -327,7 +327,7 @@ endif
 # call the compiler.
 define HOST_QEMU_CONFIGURE_CMDS
 	unset TARGET_DIR; \
-	cd $(@D); $(HOST_CONFIGURE_OPTS) CPP="$(HOSTCC) -E" \
+	cd $(@D); $(filter-out -DNDEBUG,$(HOST_CONFIGURE_OPTS)) CPP="$(HOSTCC) -E" \
 		./configure \
 		--target-list="$(HOST_QEMU_TARGETS)" \
 		--prefix="$(HOST_DIR)" \
-- 
2.32.0
