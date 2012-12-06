From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Dec 2012 11:43:27 -0800
Subject: [Buildroot] [git commit] alsa-lib: fix build on bfin
Message-ID: <20121206194337.908B0999A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a6d3456f3e7965f30648fd09ef54b13109d210d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bfin toolchains don't have versionsort (which alsa-lib needs), so fake it
using alphasort instead.

Fixes http://autobuild.buildroot.net/results/cf760651b2e238842813bf0882011b5fbb898c0d

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/alsa-lib/alsa-lib.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index eddd3d2..ba222db 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -70,6 +70,12 @@ ifeq ($(BR2_SOFT_FLOAT),y)
 ALSA_LIB_CONF_OPT += --with-softfloat
 endif
 
+ifeq ($(BR2_bfin),y)
+# blackfin external toolchains don't have versionsort. Fake it using alphasort
+# instead
+ALSA_LIB_CFLAGS += -Dversionsort=alphasort
+endif
+
 ALSA_LIB_CONF_ENV = CFLAGS="$(ALSA_LIB_CFLAGS)" \
 		    LDFLAGS="$(TARGET_LDFLAGS) -lm"
 
