From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 23:42:52 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/libnss: fix
 aarch64_be build
Message-ID: <20181125224646.1EC9888517@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c70a9fd4248a038e67229c028a1abdd7422c532
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

libnss does not treat aarch64_be the same way as aarch64:
https://hg.mozilla.org/projects/nss/file/fb3585458ac3/lib/freebl/Makefile#l523

Add code to translate "aarch64_be" into "aarch64" to fix
http://autobuild.buildroot.net/results/4fca771980f9b049ce2690971ddd856652cd5b43/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 826981d45ddbb85a92c01869cb2eccc2fb260475)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 0fc55785a8..52a17d3b72 100644
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
