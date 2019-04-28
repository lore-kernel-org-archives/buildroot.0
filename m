From: Mark Corbin <mark.corbin@embecosm.com>
Date: Sun, 28 Apr 2019 15:49:37 +0100
Subject: [Buildroot] [PATCH v2 1/3] boot/riscv-pk: add generation of binary
 bbl file
In-Reply-To: <20190428144939.28964-1-mark.corbin@embecosm.com>
References: <20190428144939.28964-1-mark.corbin@embecosm.com>
Message-ID: <20190428144939.28964-2-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to support the SiFive HiFive Unleashed board we need to
generate a binary bootloader file ready for writing to an SD card.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>

---
Changes v1 -> v2:
  - moved generation of bbl binary file in riscv-pk.mk from
    INSTALL_CMDS to BUILD_CMDS (Arnout)
---
 boot/riscv-pk/riscv-pk.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/riscv-pk/riscv-pk.mk b/boot/riscv-pk/riscv-pk.mk
index 0ab5879ee4..8386dfe168 100644
--- a/boot/riscv-pk/riscv-pk.mk
+++ b/boot/riscv-pk/riscv-pk.mk
@@ -23,10 +23,12 @@ endef
 
 define RISCV_PK_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build bbl
+	$(TARGET_OBJCOPY) -S -O binary $(@D)/build/bbl $(@D)/build/bbl.bin
 endef
 
 define RISCV_PK_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/build/bbl $(BINARIES_DIR)/bbl
+	$(INSTALL) -D -m 0755 $(@D)/build/bbl.bin $(BINARIES_DIR)/bbl.bin
 endef
 
 $(eval $(generic-package))
-- 
2.19.1
