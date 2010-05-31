From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jun 2010 00:08:29 +0200
Subject: [Buildroot] [PATCH 43/46] at91dataflashboot: add a patch step
In-Reply-To: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <56e4d4d766cf244be5c84826cf51cea8164119e1.1275343448.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91dataflashboot/at91dataflashboot.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/boot/at91dataflashboot/at91dataflashboot.mk b/boot/at91dataflashboot/at91dataflashboot.mk
index dcbe1ef..d11f842 100644
--- a/boot/at91dataflashboot/at91dataflashboot.mk
+++ b/boot/at91dataflashboot/at91dataflashboot.mk
@@ -18,7 +18,11 @@ $(DATAFLASHBOOT_DIR)/.unpacked: $(DL_DIR)/$(DATAFLASHBOOT_SOURCE)
 	$(BZCAT) $(DL_DIR)/$(DATAFLASHBOOT_SOURCE) | tar $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
 	touch $(DATAFLASHBOOT_DIR)/.unpacked
 
-$(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY): $(DATAFLASHBOOT_DIR)/.unpacked
+$(DATAFLASHBOOT_DIR)/.patched: $(DATAFLASHBOOT_DIR)/.unpacked
+	toolchain/patch-kernel.sh $(@D) boot/at91dataflashboot \
+		at91dataflashboot-$(DATAFLASHBOOT_VERSION)-\*.patch
+
+$(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY): $(DATAFLASHBOOT_DIR)/.patched
 	ls $(DATAFLASHBOOT_DIR)/.unpacked
 	make -C $(DATAFLASHBOOT_DIR) CROSS_COMPILE=$(TARGET_CROSS)
 
-- 
1.7.0.4
