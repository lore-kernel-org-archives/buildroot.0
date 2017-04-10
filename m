From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Apr 2017 19:27:03 +0200
Subject: [Buildroot] [PATCH 2/2] libmpeg2: add check-bin-arch exclusion for
	Sparc
In-Reply-To: <20170410172703.26251-1-arnout@mind.be>
References: <20170410172703.26251-1-arnout@mind.be>
Message-ID: <20170410172703.26251-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libmpeg2's configure forces -mcpu=ultrasparc -mvis, which generates
Sparcv8+ code. At runtime, however, the library detects if the VIS
instructions really are supported or not, so in fact this does work
even on < v8 machines.

Our check-bin-arch step will complain about the architecture mismatch
with

ERROR: architecture for "/usr/lib/libmpeg2convert.so.0.0.0" is "Sparc v8+", should be "Sparc"
ERROR: architecture for "/usr/lib/libmpeg2.so.0.1.0" is "Sparc v8+", should be "Sparc"

Therefore, explicitly disable the binary arch check for these two
libraries when building for Sparc.

Fixes:
http://autobuild.buildroot.net/results/690/690b07b2de0b5f2d2d6e37bcfa7223ee7cc53fe2
http://autobuild.buildroot.net/results/318/318dd1a396b10e7655e0e9b290721fa7bf7a7194
etc.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libmpeg2/libmpeg2.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/libmpeg2/libmpeg2.mk b/package/libmpeg2/libmpeg2.mk
index db9b2f8bbb..d5ce980c99 100644
--- a/package/libmpeg2/libmpeg2.mk
+++ b/package/libmpeg2/libmpeg2.mk
@@ -20,6 +20,19 @@ else
 LIBMPEG2_CONF_OPTS += --disable-sdl
 endif
 
+ifeq ($(BR2_sparc),y)
+# configure forces -mcpu=ultrasparc -mvis, which generates Sparcv8+ code.
+# This conflicts with the Sparc code that we expect. At runtime, the
+# library detects if the VIS instructions really are supported or not, so
+# in fact this does work even on < v8 machines. Therefore, explicitly
+# disable the binary arch check in that case.
+# When bumping/changing this package, please double-check if it still works
+# correctly for Sparc.
+LIBMPEG2_CHECK_BIN_ARCH_EXCLUSIONS = \
+	/usr/lib/libmpeg2convert.so.0.0.0 \
+	/usr/lib/libmpeg2.so.0.1.0
+endif
+
 ifneq ($(BR2_PACKAGE_LIBMPEG2_BINS),y)
 define LIBMPEG2_REMOVE_BINS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,\
-- 
2.11.0
