From: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Date: Thu, 26 May 2016 17:03:52 -0400
Subject: [Buildroot] [PATCH v3 1/2] ts4800-mbrboot: new package
In-Reply-To: <1464296633-1880-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
References: <1464296633-1880-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
Message-ID: <1464296633-1880-2-git-send-email-patrick.keroulas@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This MBR routine is based on TS' original bootloader.  It is loaded by
the bootrom stored in the companion FPGA, and chainloads an executable
located at the beginning of the first non-fs (0xda) partition.

Signed-off-by: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
---
 package/Config.in                        |  1 +
 package/ts4800-mbrboot/Config.in         |  5 +++
 package/ts4800-mbrboot/src/LICENSE       | 25 +++++++++++
 package/ts4800-mbrboot/src/Makefile      | 21 ++++++++++
 package/ts4800-mbrboot/src/mbrboot.c     | 72 ++++++++++++++++++++++++++++++++
 package/ts4800-mbrboot/src/mbrboot.ld    | 56 +++++++++++++++++++++++++
 package/ts4800-mbrboot/ts4800-mbrboot.mk | 22 ++++++++++
 7 files changed, 202 insertions(+)
 create mode 100644 package/ts4800-mbrboot/Config.in
 create mode 100644 package/ts4800-mbrboot/src/LICENSE
 create mode 100644 package/ts4800-mbrboot/src/Makefile
 create mode 100644 package/ts4800-mbrboot/src/mbrboot.c
 create mode 100644 package/ts4800-mbrboot/src/mbrboot.ld
 create mode 100644 package/ts4800-mbrboot/ts4800-mbrboot.mk

diff --git a/package/Config.in b/package/Config.in
index 9d668bf..41b509e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -336,6 +336,7 @@ menu "Firmware"
 	source "package/linux-firmware/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
+	source "package/ts4800-mbrboot/Config.in"
 	source "package/ux500-firmware/Config.in"
 	source "package/wilc1000-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
diff --git a/package/ts4800-mbrboot/Config.in b/package/ts4800-mbrboot/Config.in
new file mode 100644
index 0000000..556b0ec
--- /dev/null
+++ b/package/ts4800-mbrboot/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_TS4800_MBRBOOT
+	bool "ts4800-mbrboot"
+	depends on BR2_ARM_CPU_ARMV7A
+	help
+	  This package generate the ts4800 bootloader.
diff --git a/package/ts4800-mbrboot/src/LICENSE b/package/ts4800-mbrboot/src/LICENSE
new file mode 100644
index 0000000..8fa1a84
--- /dev/null
+++ b/package/ts4800-mbrboot/src/LICENSE
@@ -0,0 +1,25 @@
+    Copyright (C) 2009, Technologic Systems Inc.
+    Copyright (C) 2016, Savoir-faire Linux Inc.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions are
+met:
+
+1. Redistributions of source code must retain the above copyright notice,
+   this list of conditions and the following disclaimer.
+
+2. Redistributions in binary form must reproduce the above copyright notice,
+   this list of conditions and the following disclaimer in the documentation
+   and/or other materials provided with the distribution.
+
+THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS
+IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
+THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR
+CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
+OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
+WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
+OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
+ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/package/ts4800-mbrboot/src/Makefile b/package/ts4800-mbrboot/src/Makefile
new file mode 100644
index 0000000..b583f9f
--- /dev/null
+++ b/package/ts4800-mbrboot/src/Makefile
@@ -0,0 +1,21 @@
+COPTS=-march=armv7-a -marm -mno-thumb-interwork -Os -mno-apcs-frame -fomit-frame-pointer -ffunction-sections -fdata-sections
+
+.PHONY: all clean
+
+all: mbrboot.bin
+
+mbrboot.bin : mbrboot.elf
+	$(OBJCOPY) -S -O binary mbrboot.elf mbrboot.bin
+
+mbrboot.s : mbrboot.c
+	$(CC) -Wall $(COPTS) -S -c mbrboot.c
+
+mbrboot.o : mbrboot.c
+	$(CC) -Wall $(COPTS) -c mbrboot.c
+
+mbrboot.elf : mbrboot.o mbrboot.ld
+	$(CC) -Wl,--gc-sections -Wl,-static -o mbrboot.elf -nostdlib -Tmbrboot.ld -fno-pic mbrboot.o
+	size mbrboot.elf
+
+clean:
+	rm -f *.elf *.bin *.o
diff --git a/package/ts4800-mbrboot/src/mbrboot.c b/package/ts4800-mbrboot/src/mbrboot.c
new file mode 100644
index 0000000..b86869e
--- /dev/null
+++ b/package/ts4800-mbrboot/src/mbrboot.c
@@ -0,0 +1,72 @@
+/*
+ *     Copyright (C) 2009, Technologic Systems Inc.
+ *     Copyright (C) 2016, Savoir-faire Linux Inc.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are
+ * met:
+ *
+ * 1. Redistributions of source code must retain the above copyright notice,
+ *    this list of conditions and the following disclaimer.
+ *
+ * 2. Redistributions in binary form must reproduce the above copyright notice,
+ *    this list of conditions and the following disclaimer in the documentation
+ *    and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS
+ * IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
+ * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+ * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR
+ * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+ * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+ * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
+ * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
+ * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
+ * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
+ * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#define MBR_LOAD_ADDR 0x96000000
+#define OS_LOAD_ADDR 0x90008000
+
+#define PARTITION_TABLE_OFFSET (MBR_LOAD_ADDR + 446)
+#define PARTITION_TABLE_ENTRY_N 4
+#define PARTITION_TABLE_ENTRY_LEN 16
+#define PARTITION_TYPE_NONFS_DATA 0xda
+
+void mbrboot(void *(unsigned int, char*, int),
+		void *(char *),
+		void __attribute__((unused)) *(void))
+		__attribute__((noreturn));
+
+void mbrboot(void *read(unsigned int, char*, int),
+		void *ser_puts(char *),
+		void __attribute__((unused)) *clock_max_func(void))
+{
+	void (*os)(void) = (void *) OS_LOAD_ADDR;
+	unsigned char *part = (unsigned char *) PARTITION_TABLE_OFFSET;
+	int i;
+
+	ser_puts("ts4800-mbrboot: searching for boot partition... ");
+
+	for (i = 0; i < PARTITION_TABLE_ENTRY_N; i++) {
+		if (part[4] == PARTITION_TYPE_NONFS_DATA) {
+			/* get partition offset and size from entry and load */
+			unsigned short *p = (unsigned short *) &part[8];
+			unsigned int start = p[0] + (p[1] << 16);
+			unsigned int size = p[2] + (p[3] << 16);
+			read(start, (char *) OS_LOAD_ADDR, size);
+			break;
+		}
+		part += PARTITION_TABLE_ENTRY_LEN;
+	}
+
+	if (i < PARTITION_TABLE_ENTRY_N)
+		ser_puts("found\r\n");
+	else
+		ser_puts("\r\nts4800-mbrboot: fatal: partition type 0xda not found\r\n");
+
+	os();
+
+	__builtin_unreachable();
+}
diff --git a/package/ts4800-mbrboot/src/mbrboot.ld b/package/ts4800-mbrboot/src/mbrboot.ld
new file mode 100644
index 0000000..8fc33b9
--- /dev/null
+++ b/package/ts4800-mbrboot/src/mbrboot.ld
@@ -0,0 +1,56 @@
+/*
+ *     Copyright (C) 2009, Technologic Systems Inc.
+ *     Copyright (C) 2016, Savoir-faire Linux Inc.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are
+ * met:
+ *
+ * 1. Redistributions of source code must retain the above copyright notice,
+ *    this list of conditions and the following disclaimer.
+ *
+ * 2. Redistributions in binary form must reproduce the above copyright notice,
+ *    this list of conditions and the following disclaimer in the documentation
+ *    and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS
+ * IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
+ * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+ * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR
+ * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+ * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+ * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
+ * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
+ * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
+ * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
+ * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+ENTRY(mbrboot)
+
+MEMORY
+{
+	ram (rwx) : ORIGIN = 0x96000000, LENGTH = 446
+	bss (rwx) : ORIGIN = 0x96000200, LENGTH = 0x80
+}
+SECTIONS {
+	.text : AT(0x0) {
+		mbrboot.o(.text.mbrboot);
+		*(.text);
+		*(.text.*);
+		*(.glue_7 .glue_7t);
+		*(.got .got.*);
+		*(.rodata);
+		*(.rodata.*);
+		*(.data);
+		*(.data.*);
+	} > ram
+
+	.bss : {
+		bss_start = .;
+		*(.bss);
+		*(.bss.*);
+		*(COMMON);
+		bss_end = .;
+	} > bss
+}
diff --git a/package/ts4800-mbrboot/ts4800-mbrboot.mk b/package/ts4800-mbrboot/ts4800-mbrboot.mk
new file mode 100644
index 0000000..706d191
--- /dev/null
+++ b/package/ts4800-mbrboot/ts4800-mbrboot.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# ts4800-mbrboot
+#
+################################################################################
+
+TS4800_MBRBOOT_VERSION = 1.0
+TS4800_MBRBOOT_SITE = $(TOPDIR)/package/ts4800-mbrboot/src
+TS4800_MBRBOOT_SITE_METHOD = local
+TS4800_MBRBOOT_LICENSE = BSD-2c
+TS4800_MBRBOOT_LICENSE_FILES = LICENSE
+
+define TS4800_MBRBOOT_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" \
+		OBJCOPY="$(TARGET_OBJCOPY)" -C $(@D)
+endef
+
+define TS4800_MBRBOOT_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 $(@D)/mbrboot.bin $(BINARIES_DIR)/
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
