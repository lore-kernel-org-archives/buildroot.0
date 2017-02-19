From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Feb 2017 22:23:21 +0100
Subject: [Buildroot] [git commit] libnss: workaround for microblaze ld bug
Message-ID: <20170219212848.31BA082138@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fceb1afd5dda45cf180f22877a6ab0e51d1b3dac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a workaround for a microblaze specific ld bug to avoid
segfault.

Fixes:
  http://autobuild.buildroot.net/results/638a65453879777a0d5bdb29231034cd261b41c0

[Peter: rename to LIBNSS_DROP_GC_SECTIONS for clarity]
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 4a40b0a..76532e8 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -13,6 +13,16 @@ LIBNSS_DEPENDENCIES = libnspr sqlite zlib
 LIBNSS_LICENSE = MPLv2.0
 LIBNSS_LICENSE_FILES = nss/COPYING
 
+# --gc-sections triggers binutils ld segfault
+# https://sourceware.org/bugzilla/show_bug.cgi?id=21180
+ifeq ($(BR2_microblaze),y)
+define LIBNSS_DROP_GC_SECTIONS
+	sed -i 's:-Wl,--gc-sections::g' $(@D)/nss/coreconf/Linux.mk
+endef
+
+LIBNSS_PRE_CONFIGURE_HOOKS += LIBNSS_DROP_GC_SECTIONS
+endif
+
 LIBNSS_BUILD_VARS = \
 	MOZILLA_CLIENT=1 \
 	NSPR_INCLUDE_DIR=$(STAGING_DIR)/usr/include/nspr \
