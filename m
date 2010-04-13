From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 17:05:45 +0200
Subject: [Buildroot] [PATCH 33/35] at91dataflashboot: add a patch step
In-Reply-To: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
Message-ID: <deefec105128bdcc74cbdc3ebb7cf17862cff2c4.1271170913.git.thomas.petazzoni@free-electrons.com>
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
1.6.3.3
