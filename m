From: Ash Charles <ashcharles@gmail.com>
Date: Fri, 25 Nov 2016 12:50:00 -0500
Subject: [Buildroot] [PATCH v2 3/3] pru-sample: add sample PRU application
In-Reply-To: <1480096200-20475-1-git-send-email-ash.charles@savoirfairelinux.com>
References: <1480096200-20475-1-git-send-email-ash.charles@savoirfairelinux.com>
Message-ID: <1480096200-20475-3-git-send-email-ash.charles@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested [1], provide a sample application demonstrating how to use
the PRU toolchain (specifically, the ti-cgt-pru and
pru-software-support packages) within buildroot.  This sample is taken
from PRU Lab #4 for the AM335x [2, 3].

Note: No special userspace tools are needed to load PRU firmware. The
Linux kernel loads the specifically-named files as normal kernel
firmware.

[1] http://lists.busybox.net/pipermail/buildroot/2016-November/178050.html
[2] http://processors.wiki.ti.com/index.php/PRU_Training:_Hands-on_Labs
[3] https://git.ti.com/pru-software-support-package/pru-software-support-package/trees/v4.0.2/labs/lab_4

Signed-off-by: Ash Charles <ash.charles@savoirfairelinux.com>
---
 package/Config.in                         |   1 +
 package/pru-sample/Config.in              |   7 ++
 package/pru-sample/pru-sample.mk          |  22 +++++++
 package/pru-sample/src/AM335x_PRU.cmd     |  78 +++++++++++++++++++++++
 package/pru-sample/src/Makefile           |  31 +++++++++
 package/pru-sample/src/pru0.c             |  95 ++++++++++++++++++++++++++++
 package/pru-sample/src/pru1.c             |  65 +++++++++++++++++++
 package/pru-sample/src/resource_table_0.h | 102 ++++++++++++++++++++++++++++++
 package/pru-sample/src/resource_table_1.h |  83 ++++++++++++++++++++++++
 9 files changed, 484 insertions(+)
 create mode 100644 package/pru-sample/Config.in
 create mode 100644 package/pru-sample/pru-sample.mk
 create mode 100644 package/pru-sample/src/AM335x_PRU.cmd
 create mode 100644 package/pru-sample/src/Makefile
 create mode 100644 package/pru-sample/src/pru0.c
 create mode 100644 package/pru-sample/src/pru1.c
 create mode 100644 package/pru-sample/src/resource_table_0.h
 create mode 100644 package/pru-sample/src/resource_table_1.h

diff --git a/package/Config.in b/package/Config.in
index 9ed296f..f4995a5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -437,6 +437,7 @@ endmenu
 	source "package/pifmrds/Config.in"
 	source "package/powertop/Config.in"
 	source "package/pps-tools/Config.in"
+	source "package/pru-sample/Config.in"
 	source "package/pulseview/Config.in"
 	source "package/read-edid/Config.in"
 	source "package/rfkill/Config.in"
diff --git a/package/pru-sample/Config.in b/package/pru-sample/Config.in
new file mode 100644
index 0000000..20d9f81
--- /dev/null
+++ b/package/pru-sample/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PRU_SAMPLE
+	bool "PRU sample firmware"
+	depends on BR2_PACKAGE_HOST_PRU_SOFTWARE_SUPPORT
+	help
+	  Sample PRU firmware extracted from lab #4 from the TI
+	  example code. See
+	  http://processors.wiki.ti.com/index.php/PRU_Training:_Hands-on_Labs
diff --git a/package/pru-sample/pru-sample.mk b/package/pru-sample/pru-sample.mk
new file mode 100644
index 0000000..19cdf02
--- /dev/null
+++ b/package/pru-sample/pru-sample.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# pru-sample
+#
+################################################################################
+
+PRU_SAMPLE_VERSION = 0.1
+PRU_SAMPLE_SITE = package/pru-sample/src
+PRU_SAMPLE_SITE_METHOD = local
+PRU_SAMPLE_DEPENDENCIES = host-ti-cgt-pru host-pru-software-support
+
+define PRU_SAMPLE_BUILD_CMDS
+        $(MAKE) PRU_CGT=$(TI_CGT_PRU_DIR) -C $(@D)
+endef
+
+define PRU_SAMPLE_INSTALL_TARGET_CMDS
+        mkdir -p $(TARGET_DIR)/lib/firmware/
+        $(INSTALL) -m 0644 $(@D)/pru0.out $(TARGET_DIR)/lib/firmware/am335x-pru0-fw
+        $(INSTALL) -m 0644 $(@D)/pru1.out $(TARGET_DIR)/lib/firmware/am335x-pru1-fw
+endef
+
+$(eval $(generic-package))
diff --git a/package/pru-sample/src/AM335x_PRU.cmd b/package/pru-sample/src/AM335x_PRU.cmd
new file mode 100644
index 0000000..cdd969d
--- /dev/null
+++ b/package/pru-sample/src/AM335x_PRU.cmd
@@ -0,0 +1,78 @@
+/****************************************************************************/
+/*  AM335x_PRU.cmd                                                          */
+/*  Copyright (c) 2015  Texas Instruments Incorporated                      */
+/*                                                                          */
+/*    Description: This file is a linker command file that can be used for  */
+/*                 linking PRU programs built with the C compiler and       */
+/*                 the resulting .out file on an AM335x device.             */
+/****************************************************************************/
+/* Linker command file for PRU on the AM335x */
+-cr	/* link using C conventions */
+
+/* System Memory Map */
+MEMORY
+{
+PAGE 0:
+	PRU_IMEM	: org = 0x00000000 len = 0x00002000  /* 8kB PRU0 Instruction RAM */
+
+PAGE 1:
+	PRU_DMEM_0_1	: org = 0x00000000 len = 0x00002000 CREGISTER=24 /* 8kB PRU Data RAM 0_1 */
+	PRU_DMEM_1_0	: org = 0x00002000 len = 0x00002000 CREGISTER=25 /* 8kB PRU Data RAM 1_0 */
+
+PAGE 2:
+	PRU_SHAREDMEM	: org = 0x00010000 len = 0x00003000 CREGISTER=28 /* 12kB Shared RAM */
+	DDR		: org = 0x80000000 len = 0x00000100 CREGISTER=31
+	L3OCMC		: org = 0x40000000 len = 0x00010000 CREGISTER=30
+
+	/* Peripherals */
+	PRU_CFG		: org = 0x00026000 len = 0x00000044 CREGISTER=4
+	PRU_ECAP	: org = 0x00030000 len = 0x00000060 CREGISTER=3
+	PRU_IEP		: org = 0x0002E000 len = 0x0000031C CREGISTER=26
+	PRU_INTC	: org = 0x00020000 len = 0x00001504 CREGISTER=0
+	PRU_UART	: org = 0x00028000 len = 0x00000038 CREGISTER=7
+
+	DCAN0		: org = 0x481CC000 len = 0x000001E8 CREGISTER=14
+	DCAN1		: org = 0x481D0000 len = 0x000001E8 CREGISTER=15
+	DMTIMER2	: org = 0x48040000 len = 0x0000005C CREGISTER=1
+	PWMSS0		: org = 0x48300000 len = 0x000002C4 CREGISTER=18
+	PWMSS1		: org = 0x48302000 len = 0x000002C4 CREGISTER=19
+	PWMSS2		: org = 0x48304000 len = 0x000002C4 CREGISTER=20
+	GEMAC		: org = 0x4A100000 len = 0x0000128C CREGISTER=9
+	I2C1		: org = 0x4802A000 len = 0x000000D8 CREGISTER=2
+	I2C2		: org = 0x4819C000 len = 0x000000D8 CREGISTER=17
+	MBX0		: org = 0x480C8000 len = 0x00000140 CREGISTER=22
+	MCASP0_DMA	: org = 0x46000000 len = 0x00000100 CREGISTER=8
+	MCSPI0		: org = 0x48030000 len = 0x000001A4 CREGISTER=6
+	MCSPI1		: org = 0x481A0000 len = 0x000001A4 CREGISTER=16
+	MMCHS0		: org = 0x48060000 len = 0x00000300 CREGISTER=5
+	SPINLOCK	: org = 0x480CA000 len = 0x00000880 CREGISTER=23
+	TPCC		: org = 0x49000000 len = 0x00001098 CREGISTER=29
+	UART1		: org = 0x48022000 len = 0x00000088 CREGISTER=11
+	UART2		: org = 0x48024000 len = 0x00000088 CREGISTER=12
+
+	RSVD10		: org = 0x48318000 len = 0x00000100 CREGISTER=10
+	RSVD13		: org = 0x48310000 len = 0x00000100 CREGISTER=13
+	RSVD21		: org = 0x00032400 len = 0x00000100 CREGISTER=21
+	RSVD27		: org = 0x00032000 len = 0x00000100 CREGISTER=27
+}
+
+/* Allocate sections to memory */
+SECTIONS {
+	/* Force _c_int00 to the start of PRU IRAM (for binary, not ELF) */
+	.text:_c_int00*	>  0x0, PAGE 0
+
+	.text		>  PRU_IMEM, PAGE 0
+	.stack		>  PRU_DMEM_0_1, PAGE 1
+	.bss		>  PRU_DMEM_0_1, PAGE 1
+	.cio		>  PRU_DMEM_0_1, PAGE 1
+	.data		>  PRU_DMEM_0_1, PAGE 1
+	.switch		>  PRU_DMEM_0_1, PAGE 1
+	.sysmem		>  PRU_DMEM_0_1, PAGE 1
+	.cinit		>  PRU_DMEM_0_1, PAGE 1
+	.rodata		>  PRU_DMEM_0_1, PAGE 1
+	.rofardata	>  PRU_DMEM_0_1, PAGE 1
+	.farbss		>  PRU_DMEM_0_1, PAGE 1
+	.fardata	>  PRU_DMEM_0_1, PAGE 1
+
+	.resource_table > PRU_DMEM_0_1, PAGE 1
+}
diff --git a/package/pru-sample/src/Makefile b/package/pru-sample/src/Makefile
new file mode 100644
index 0000000..c0f9c41
--- /dev/null
+++ b/package/pru-sample/src/Makefile
@@ -0,0 +1,31 @@
+ifndef PRU_CGT
+define ERROR_BODY
+*******************************************************************************
+Set PRU_CGT environment variable e.g.
+ export PRU_CGT=/path/to/pru/code/gen/tools/ti-cgt-pru
+*******************************************************************************
+endef
+$(error $(ERROR_BODY))
+endif
+
+LINKER_COMMAND_FILE=./AM335x_PRU.cmd
+LIBS=--library=$(PRU_CGT)/usr/lib/rpmsg_lib.lib
+INCLUDE=--include_path=$(PRU_CGT)/include --include_path=$(PRU_CGT)/usr/include --include_path=$(PRU_CGT)/usr/include/am335x
+CFLAGS=-v3 -O2 --display_error_number --endian=little --hardware_mac=on -ppd -ppa
+LFLAGS=--reread_libs --warn_sections --stack_size=0x100 --heap_size=0x100
+
+TARGETS=pru0.out pru1.out
+
+.PHONY: all
+all: $(TARGETS)
+
+# Invokes the linker (-z flag) to make the .out file
+%.out: %.object $(LINKER_COMMAND_FILE)
+	@echo 'Linking target: $@'
+	$(PRU_CGT)/bin/clpru $(CFLAGS) -z -i$(PRU_CGT)/lib -i$(PRU_CGT)/include $(LFLAGS) -o $@ $< $(LINKER_COMMAND_FILE) --library=libc.a $(LIBS)
+	@echo 'Finished linking building target: $@'
+
+# Invokes the compiler on all c files in the directory to create the object files
+%.object: %.c
+	@echo 'Compiling: $<'
+	$(PRU_CGT)/bin/clpru $(INCLUDE) $(CFLAGS) -fe $@ $<
diff --git a/package/pru-sample/src/pru0.c b/package/pru-sample/src/pru0.c
new file mode 100644
index 0000000..42e80c8
--- /dev/null
+++ b/package/pru-sample/src/pru0.c
@@ -0,0 +1,95 @@
+/*
+ * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 	* Redistributions of source code must retain the above copyright
+ * 	  notice, this list of conditions and the following disclaimer.
+ *
+ * 	* Redistributions in binary form must reproduce the above copyright
+ * 	  notice, this list of conditions and the following disclaimer in the
+ * 	  documentation and/or other materials provided with the
+ * 	  distribution.
+ *
+ * 	* Neither the name of Texas Instruments Incorporated nor the names of
+ * 	  its contributors may be used to endorse or promote products derived
+ * 	  from this software without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include <stdint.h>
+#include <pru_cfg.h>
+#include <pru_intc.h>
+#include "resource_table_0.h"
+
+volatile register uint32_t __R30;
+volatile register uint32_t __R31;
+
+/* PRU0-to-PRU1 interrupt */
+#define PRU0_PRU1_EVT		(16)
+#define PRU0_PRU1_TRIGGER	(__R31 = (PRU0_PRU1_EVT - 16) | (1 << 5))
+
+/* SW1 offset */
+#define SW1		(1 << 5)
+
+/* INTC configuration
+ * We are going to map User event 16 to Host 1
+ * PRU1 will then wait for r31 bit 31 (designates Host 1) to go high
+ * */
+void configIntc(){
+        /* Clear any pending PRU-generated events */
+        __R31 = 0x00000000;
+
+        /* Map event 16 to channel 1 */
+        CT_INTC.CMR4_bit.CH_MAP_16 = 1;
+
+        /* Map channel 1 to host 1 */
+        CT_INTC.HMR0_bit.HINT_MAP_1 = 1;
+
+        /* Ensure event 16 is cleared */
+        CT_INTC.SICR = 16;
+
+        /* Enable event 16 */
+        CT_INTC.EISR = 16;
+
+        /* Enable Host interrupt 1 */
+        CT_INTC.HIEISR |= (1 << 0);
+
+        // Globally enable host interrupts
+        CT_INTC.GER = 1;
+}
+
+void main(){
+	/* Configure GPI and GPO as Mode 0 (Direct Connect) */
+	CT_CFG.GPCFG0 = 0x0000;
+
+	/* Clear GPO pins */
+	__R30 &= 0xFFFF0000;
+
+	/* Configure INTC */
+	configIntc();
+
+	while(1) {
+		/* Wait for SW1 to be pressed */
+		if ((__R31 & SW1) != SW1){
+			/* Interrupt PRU1, wait 500ms for cheap "debounce" */
+			__delay_cycles(100000000);
+			PRU0_PRU1_TRIGGER;
+		}
+	}
+}
+
diff --git a/package/pru-sample/src/pru1.c b/package/pru-sample/src/pru1.c
new file mode 100644
index 0000000..f364f0b
--- /dev/null
+++ b/package/pru-sample/src/pru1.c
@@ -0,0 +1,65 @@
+/*
+ * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 	* Redistributions of source code must retain the above copyright
+ * 	  notice, this list of conditions and the following disclaimer.
+ *
+ * 	* Redistributions in binary form must reproduce the above copyright
+ * 	  notice, this list of conditions and the following disclaimer in the
+ * 	  documentation and/or other materials provided with the
+ * 	  distribution.
+ *
+ * 	* Neither the name of Texas Instruments Incorporated nor the names of
+ * 	  its contributors may be used to endorse or promote products derived
+ * 	  from this software without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include <stdint.h>
+#include <pru_cfg.h>
+#include <pru_intc.h>
+#include "resource_table_1.h"
+
+volatile register uint32_t __R30;
+volatile register uint32_t __R31;
+
+/* Defines */
+#define HOST1_MASK		(0x80000000)
+#define PRU0_PRU1_EVT	(16)
+#define TOGGLE_BLUE		(__R30 ^= (1 << 3))
+
+void main(){
+	/* Configure GPI and GPO as Mode 0 (Direct Connect) */
+	CT_CFG.GPCFG0 = 0x0000;
+
+	/* Clear GPO pins */
+	__R30 &= 0xFFFF0000;
+
+	/* Spin in loop until interrupt on HOST 1 is detected */
+	while(1) {
+		if (__R31 & HOST1_MASK) {
+			TOGGLE_BLUE;
+			/* Clear interrupt event */
+			CT_INTC.SICR = 16;
+			/* Delay to ensure the event is cleared in INTC */
+			__delay_cycles(5);
+		}
+	}
+}
+
diff --git a/package/pru-sample/src/resource_table_0.h b/package/pru-sample/src/resource_table_0.h
new file mode 100644
index 0000000..dcaf849
--- /dev/null
+++ b/package/pru-sample/src/resource_table_0.h
@@ -0,0 +1,102 @@
+/*
+ * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 	* Redistributions of source code must retain the above copyright
+ * 	  notice, this list of conditions and the following disclaimer.
+ *
+ * 	* Redistributions in binary form must reproduce the above copyright
+ * 	  notice, this list of conditions and the following disclaimer in the
+ * 	  documentation and/or other materials provided with the
+ * 	  distribution.
+ *
+ * 	* Neither the name of Texas Instruments Incorporated nor the names of
+ * 	  its contributors may be used to endorse or promote products derived
+ * 	  from this software without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+/*
+ *  ======== rsc_table_pru.h ========
+ *
+ *  Define the resource table entries for all PRU cores. This will be
+ *  incorporated into corresponding base images, and used by the remoteproc
+ *  on the host-side to allocated/reserve resources.
+ *
+ */
+
+#ifndef _RSC_TABLE_PRU_H_
+#define _RSC_TABLE_PRU_H_
+
+#include <stddef.h>
+#include <rsc_types.h>
+#include <pru_virtio_ids.h>
+
+/*
+ * Sizes of the virtqueues (expressed in number of buffers supported,
+ * and must be power of 2)
+ */
+#define PRU_RPMSG_VQ0_SIZE	2
+#define PRU_RPMSG_VQ1_SIZE	2
+
+/* flip up bits whose indices represent features we support */
+#define RPMSG_PRU_C0_FEATURES	1
+
+/* Definition for unused interrupts */
+#define HOST_UNUSED		255
+
+/* Mapping sysevts to a channel. Each pair contains a sysevt, channel */
+struct ch_map pru_intc_map[] = { {16, 1},};
+
+struct my_resource_table {
+	struct resource_table base;
+
+	uint32_t offset[1]; /* Should match 'num' in actual definition */
+
+	/* intc definition */
+	struct fw_rsc_custom pru_ints;
+};
+
+#pragma DATA_SECTION(am335x_pru_remoteproc_ResourceTable, ".resource_table")
+#pragma RETAIN(am335x_pru_remoteproc_ResourceTable)
+struct my_resource_table am335x_pru_remoteproc_ResourceTable = {
+	1,	/* we're the first version that implements this */
+	1,	/* number of entries in the table */
+	0, 0,	/* reserved, must be zero */
+	/* offsets to entries */
+	{
+		offsetof(struct my_resource_table, pru_ints),
+	},
+
+	{
+		TYPE_CUSTOM, TYPE_PRU_INTS,
+		sizeof(struct fw_rsc_custom_ints),
+		{ /* PRU_INTS version */
+		  0x0000,
+		  /* Channel-to-host mapping, 255 for unused */
+		  HOST_UNUSED, 1, HOST_UNUSED, HOST_UNUSED, HOST_UNUSED,
+		  HOST_UNUSED, HOST_UNUSED, HOST_UNUSED, HOST_UNUSED, HOST_UNUSED,
+		  /* Number of evts being mapped to channels */
+		  (sizeof(pru_intc_map) / sizeof(struct ch_map)),
+		  /* Pointer to the structure containing mapped events */
+		  pru_intc_map,
+		},
+	},
+};
+
+#endif /* _RSC_TABLE_PRU_H_ */
diff --git a/package/pru-sample/src/resource_table_1.h b/package/pru-sample/src/resource_table_1.h
new file mode 100644
index 0000000..a35dd2a
--- /dev/null
+++ b/package/pru-sample/src/resource_table_1.h
@@ -0,0 +1,83 @@
+/*
+ * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 	* Redistributions of source code must retain the above copyright
+ * 	  notice, this list of conditions and the following disclaimer.
+ *
+ * 	* Redistributions in binary form must reproduce the above copyright
+ * 	  notice, this list of conditions and the following disclaimer in the
+ * 	  documentation and/or other materials provided with the
+ * 	  distribution.
+ *
+ * 	* Neither the name of Texas Instruments Incorporated nor the names of
+ * 	  its contributors may be used to endorse or promote products derived
+ * 	  from this software without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+/*
+ *  ======== rsc_table_pru.h ========
+ *
+ *  Define the resource table entries for all PRU cores. This will be
+ *  incorporated into corresponding base images, and used by the remoteproc
+ *  on the host-side to allocated/reserve resources.
+ *
+ */
+
+#ifndef _RSC_TABLE_PRU_H_
+#define _RSC_TABLE_PRU_H_
+
+#include <stddef.h>
+#include <rsc_types.h>
+#include <pru_virtio_ids.h>
+
+/*
+ * Sizes of the virtqueues (expressed in number of buffers supported,
+ * and must be power of 2)
+ */
+#define PRU_RPMSG_VQ0_SIZE	2
+#define PRU_RPMSG_VQ1_SIZE	2
+
+/* flip up bits whose indices represent features we support */
+#define RPMSG_PRU_C0_FEATURES	1
+
+/* Definition for unused interrupts */
+#define HOST_UNUSED		255
+
+/* Mapping sysevts to a channel. Each pair contains a sysevt, channel */
+struct ch_map pru_intc_map[] = { };
+
+struct my_resource_table {
+	struct resource_table base;
+
+	uint32_t offset[1]; /* Should match 'num' in actual definition */
+
+	/* intc definition */
+	struct fw_rsc_custom pru_ints;
+};
+
+#pragma DATA_SECTION(am335x_pru_remoteproc_ResourceTable, ".resource_table")
+#pragma RETAIN(am335x_pru_remoteproc_ResourceTable)
+struct my_resource_table am335x_pru_remoteproc_ResourceTable = {
+	1,	/* we're the first version that implements this */
+	0,	/* number of entries in the table */
+	0, 0,	/* reserved, must be zero */
+};
+
+#endif /* _RSC_TABLE_PRU_H_ */
-- 
2.7.4
