From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 21:54:47 +0100
Subject: [Buildroot] [git commit] liblo: link with libatomic when available
Message-ID: <20180305200717.97AAC81EDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e44ae2afe7f39240ce5c17a104f73f3b4e492b64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

liblo uses atomic builtins that are only available inside libatomic on
some architectures, so link with it when available.

Fixes:

  http://autobuild.buildroot.net/results/c8bed3a3fa7d2b2258f573cbfcb01af07419e0bf/

Signed-off-by: Alex Baldwin <alexbaldwinmusic@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/liblo/liblo.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index c7d163dae2..7845c68ff2 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -17,4 +17,10 @@ LIBLO_CONF_OPTS += \
 	--disable-ipv6 \
 	--disable-werror
 
+# Liblo uses atomic builtins, so we need to link with libatomic for
+# the architectures who explicitly need libatomic.
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBLO_CONF_ENV += LIBS="-latomic"
+endif
+
 $(eval $(autotools-package))
