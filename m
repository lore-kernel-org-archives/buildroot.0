From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 16:53:31 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/intel-microcode:
 install into images for early loading support
Message-ID: <20190606154047.6C8D07FA9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68469b5764d846c16c5e0c54f8aab7223c979931
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

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

Notice that there may be licensing concerns when embedded non-GPL firmware
in the kernel.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7c5dfea804af7b3a8f24092a27c1ff63b62b3f70)
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
