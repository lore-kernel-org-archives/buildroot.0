From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Jul 2018 01:30:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnss: fix aarch64_be build
Message-ID: <20180727233000.29075-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libnss does not treat aarch64_be the same way as aarch64:
https://hg.mozilla.org/projects/nss/file/fb3585458ac3/lib/freebl/Makefile#l523

Add code to translate "aarch64_be" into "aarch" to fix
http://autobuild.buildroot.net/results/4fc/4fca771980f9b049ce2690971ddd856652cd5b43/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libnss/libnss.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 03f575014d..0693f71ee6 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -23,6 +23,12 @@ endef
 LIBNSS_PRE_CONFIGURE_HOOKS += LIBNSS_DROP_GC_SECTIONS
 endif
 
+ifeq ($(BR2_aarch64_be),y)
+LIBNSS_ARCH = aarch64
+else
+LIBNSS_ARCH = $(ARCH)
+endif
+
 LIBNSS_BUILD_VARS = \
 	MOZILLA_CLIENT=1 \
 	NSPR_INCLUDE_DIR=$(STAGING_DIR)/usr/include/nspr \
@@ -35,7 +41,7 @@ LIBNSS_BUILD_VARS = \
 	NATIVE_CC="$(HOSTCC)" \
 	OS_ARCH="Linux" \
 	OS_RELEASE="2.6" \
-	OS_TEST="$(ARCH)"
+	OS_TEST="$(LIBNSS_ARCH)"
 
 # #pragma usage needs gcc >= 4.8
 # See https://bugzilla.mozilla.org/show_bug.cgi?id=1226179
-- 
2.18.0
