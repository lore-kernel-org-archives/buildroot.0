From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 11 Jul 2012 00:25:45 +0200
Subject: [Buildroot] [PATCH] libnspr: fix 64-bit build
Message-ID: <1341959145-20368-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some architectures (found on x86_64, but probably others too),
libnspr builds with -m32 unless it is configured for 64-bit build.  So
force 64-bit build on 64-bit architectures.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/libnspr/libnspr.mk |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 24b5370..cd7cf73 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -12,6 +12,8 @@ LIBNSPR_INSTALL_STAGING = YES
 LIBNSPR_CONF_ENV = HOST_CFLAGS="-g -O2" \
 		   HOST_LDFLAGS="-lc"
 # NSPR mixes up --build and --host
-LIBNSPR_CONF_OPT = --host=$(GNU_HOST_NAME)
+LIBNSPR_CONF_OPT  = --host=$(GNU_HOST_NAME)
+LIBNSPR_CONF_OPT += --$(if $(BR2_ARCH_IS_64),en,dis)able-64bit
+LIBNSPR_CONF_OPT += --$(if $(BR2_INET_IPV6),en,dis)able-ipv6
 
 $(eval $(call AUTOTARGETS))
-- 
tg: (8f6fc94..) t/libnspr-64 (depends on: master)
