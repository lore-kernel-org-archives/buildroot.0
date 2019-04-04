From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu,  4 Apr 2019 17:39:04 +0200
Subject: [Buildroot] [PATCH] package/android-tools: fix static build failure
 due to missing -latomic
Message-ID: <20190404153904.69693-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During static linking build fails because -lcrypto doesn't inherit its
dependency like -latomic. So need to fix Makefile before building.

Add check in package recipe for TOOLCHAIN_HAS_LIBATOMIC. If toolchain
has libatomic use sed to append -latomic at the end of libs list in
adbd.mk makefile.

Fixes:
http://autobuild.buildroot.net/results/d75/d75a6cf99f58fb5f42abaf9d54cde28224bc44fb/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/android-tools/android-tools.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
index 6f6ca7729b..cd06afa2c2 100644
--- a/package/android-tools/android-tools.mk
+++ b/package/android-tools/android-tools.mk
@@ -12,6 +12,16 @@ HOST_ANDROID_TOOLS_EXTRA_DOWNLOADS = $(ANDROID_TOOLS_EXTRA_DOWNLOADS)
 ANDROID_TOOLS_LICENSE = Apache-2.0
 ANDROID_TOOLS_LICENSE_FILES = debian/copyright
 
+# Uses __atomic_fetch_add_4. In adbd.mk Makefile there is no hunk to the end of
+# linking command. So need to add -latomic to LIBS using sed to provide
+# -latomic at the correct place in the linking command.
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+define ANDROID_TOOLS_FIX_MAKEFILE
+	$(SED) 's/-lz -lcrypt/-lz -lcrypt -latomic/' $(@D)/debian/makefiles/adbd.mk
+endef
+ANDROID_TOOLS_POST_PATCH_HOOKS = ANDROID_TOOLS_FIX_MAKEFILE
+endif
+
 # Extract the Debian tarball inside the sources
 define ANDROID_TOOLS_DEBIAN_EXTRACT
 	$(call suitable-extractor,$(notdir $(ANDROID_TOOLS_EXTRA_DOWNLOADS))) \
-- 
2.17.1
