From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 11 Jul 2015 16:15:06 +0200
Subject: [Buildroot] [PATCH 3/7] intel-microcode: use <PKG>_STRIP_COMPONENTS
In-Reply-To: <1436624110-20428-1-git-send-email-luca@lucaceresoli.net>
References: <1436624110-20428-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1436624110-20428-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/intel-microcode/intel-microcode.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 4e8ea906c624..23c4b3ebfb47 100644
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
-- 
1.9.1
