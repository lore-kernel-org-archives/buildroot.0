From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 16:29:17 +0200
Subject: [Buildroot] [git commit] package/brotli: properly pass
 TARGET_CFLAGS in Microblaze workaround
Message-ID: <20190620143038.94B4382BB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=657ffee375f4751a760b28795c7064e89b882147
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 39dde1ffb6a7111c2fa2b340c940e4d3e685aa29 ("package/brotli:
work around gcc bug 68485"), a mistake was made: when
BR2_TOOLCHAIN_HAS_GCC_BUG_68485=y, we're only passing -O0 as CFLAGS,
completely ignoring TARGET_CFLAGS, which is not good.

This commit fixes that by introducing a BROTLI_CFLAGS variable,
initially defined to TARGET_CFLAGS, and to which we add -O0 when
BR2_TOOLCHAIN_HAS_GCC_BUG_68485=y.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
[Thomas: rework commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/brotli/brotli.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
index 248bfb9daf..134f480895 100644
--- a/package/brotli/brotli.mk
+++ b/package/brotli/brotli.mk
@@ -14,8 +14,12 @@ BROTLI_CONF_OPTS = \
 	-DBROTLI_DISABLE_TESTS=ON \
 	-DBROTLI_BUNDLED_MODE=OFF
 
+BROTLI_CFLAGS = $(TARGET_CFLAGS)
+
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
-BROTLI_CONF_OPTS += -DCMAKE_C_FLAGS="-O0"
+BROTLI_CFLAGS += -O0
 endif
 
+BROTLI_CONF_OPTS += -DCMAKE_C_FLAGS="$(BROTLI_CFLAGS)"
+
 $(eval $(cmake-package))
