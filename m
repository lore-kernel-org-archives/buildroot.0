From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 11 Jul 2012 00:30:36 +0200
Subject: [Buildroot] [PATCH] libnss: fix 64-bit build
Message-ID: <1341959436-31277-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some architectures (found on x86_64, but probably others too),
libnss builds with -m32 unless it is configured for 64-bit build.  So
force 64-bit build on 64-bit architectures.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/libnss/libnss.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index ea6a329..93547d9 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -28,6 +28,10 @@ LIBNSS_BUILD_VARS = MOZILLA_CLIENT=1 \
 		OS_RELEASE="2.6" \
 		OS_TEST="$(ARCH)"
 
+ifeq ($(BR2_ARCH_IS_64),y)
+LIBNSS_BUILD_VARS += USE_64=1
+endif
+
 
 define LIBNSS_BUILD_CMDS
 	$(MAKE1) -C $(@D)/$(LIBNSS_SUBDIR)/nss build_coreconf build_dbm all \
-- 
tg: (b8b57bb..) t/libnss-64 (depends on: master)
