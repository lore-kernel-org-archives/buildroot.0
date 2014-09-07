From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  8 Sep 2014 01:39:16 +0200
Subject: [Buildroot] [PATCH 17/18 v4] Makefile: move manual inclusion
In-Reply-To: <cover.1410132603.git.yann.morin.1998@free.fr>
References: <cover.1410132603.git.yann.morin.1998@free.fr>
Message-ID: <de3533b0392d7094bc050b038999f7d40d27e6bc.1410132603.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move inclusion of the manual before that of br2-external, so that it is
possible to use the GENDOC infrastructure from br2-external.

We can no longer use $(pkgname) in our manual post-extract hook, because
it might no longer be the last file sourced, since br2-external can
include files after us.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

---
Note: I'm not too fond of this, but $(@D) does not work here. Any idea?
---
 Makefile              | 4 ++--
 docs/manual/manual.mk | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index e788f1b..7a11e9e 100644
--- a/Makefile
+++ b/Makefile
@@ -388,6 +388,8 @@ include linux/linux.mk
 include system/system.mk
 include fs/common.mk
 
+include docs/manual/manual.mk
+
 include $(BR2_EXTERNAL)/external.mk
 
 TARGETS_SOURCE := $(patsubst %,%-source,$(TARGETS))
@@ -931,6 +933,4 @@ release:
 print-version:
 	@echo $(BR2_VERSION_FULL)
 
-include docs/manual/manual.mk
-
 .PHONY: $(noconfig_targets)
diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 373c382..d0f38ac 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -156,7 +156,7 @@ MANUAL_RESSOURCES = $(TOPDIR)/docs/images
 # Our manual needs to generate lists
 define MANUAL_GEN_LISTS
 	$(Q)$(call MESSAGE,"Updating the manual lists...")
-	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(BUILD_DIR)/$(pkgname) \
+	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(BUILD_DIR)/manual \
 		BR2_EXTERNAL=$(TOPDIR)/support/dummy-external \
 		python -B $(TOPDIR)/support/scripts/gen-manual-lists.py
 endef
-- 
1.9.1
