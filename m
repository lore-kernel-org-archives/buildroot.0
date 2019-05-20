From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 May 2019 00:17:10 +0200
Subject: [Buildroot] [PATCH 1/3] package/intel-microcode: install into
 images for early loading support
Message-ID: <20190520221712.22564-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Microcode based security mitigation (E.G.  MDS) requires that the microcode
gets loaded very early. This can be handled by one of:

- Concatenating (a subset of) the intel-microcode files and write to
  kernel/x86/microcode/GenuineIntel.bin in the initrd.  Requires that the
  (first) initrd is external from the kernel and NOT compressed.

- Build (a subset of) the intel-microcode files into the kernel using the
  CONFIG_EXTRA_FIRMWARE option.

Install the microcode files into images to support these use cases (E.G.
through a post-build script for the initrd, or by pointing
CONFIG_EXTRA_FIRMWARE_DIR to ${BR_BINARIES_DIR}, similar to how we include
the .cpio image inside the kernel).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-microcode/intel-microcode.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index aa3b1f4dbb..43cdc3d0b8 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -9,6 +9,13 @@ INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
 INTEL_MICROCODE_REDISTRIBUTE = NO
+INTEL_MICROCODE_INSTALL_IMAGES = YES
+
+define INTEL_MICROCODE_INSTALL_IMAGES_CMDS
+	mkdir -p $(BINARIES_DIR)/intel-ucode
+	$(INSTALL) -m 0644 -t $(BINARIES_DIR)/intel-ucode \
+		$(@D)/intel-ucode/*
+endef
 
 define INTEL_MICROCODE_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/lib/firmware/intel-ucode
-- 
2.11.0
