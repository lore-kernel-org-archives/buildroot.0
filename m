From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:28 -0000
Subject: [Buildroot] [git commit branch/next] intel-microcode: use
	<PKG>_STRIP_COMPONENTS
Message-ID: <20150808105627.D27A87FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=570566ddc5c0222d89484e8865ed79ba4d543aad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/intel-microcode/intel-microcode.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 4e8ea90..23c4b3e 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -7,17 +7,17 @@
 INTEL_MICROCODE_VERSION = 20150107
 INTEL_MICROCODE_SOURCE = microcode-$(INTEL_MICROCODE_VERSION).tgz
 INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/24616/eng
+INTEL_MICROCODE_STRIP_COMPONENTS = 0
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license.txt
 INTEL_MICROCODE_REDISTRIBUTE = NO
 
-# N.B. Don't strip any path components during extraction.
-define INTEL_MICROCODE_EXTRACT_CMDS
-	gzip -d -c $(DL_DIR)/$(INTEL_MICROCODE_SOURCE) | \
-	tar --strip-components=0 -C $(@D) -xf -
+define INTEL_MICROCODE_EXTRACT_LICENSE
 	head -n 33 $(@D)/microcode.dat > $(@D)/license.txt
 endef
 
+INTEL_MICROCODE_POST_EXTRACT_HOOKS += INTEL_MICROCODE_EXTRACT_LICENSE
+
 define INTEL_MICROCODE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/microcode.dat \
 		$(TARGET_DIR)/usr/share/misc/intel-microcode.dat
