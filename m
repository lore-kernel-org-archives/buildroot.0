From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] at91dataflashboot: add a patch
	step
Message-ID: <20100614203443.D84D9804D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=470888bede7d604c870a6d47c6f41fa53a47a5d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
1.7.1
