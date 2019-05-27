From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 27 May 2019 23:05:10 +0200
Subject: [Buildroot] [PATCH 2/2] package/brotli: work aroung gcc bug 68485
In-Reply-To: <20190527210510.70987-1-giulio.benetti@micronovasrl.com>
References: <20190527210510.70987-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190527210510.70987-2-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version <= 9.x the build hangs due to gcc bug 68485:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. The bug show up when
building brotli with optimization but not when building with -O0. To
work aroung this, if BR2_TOOLCHAIN_HAS_GCC_BUG_68458=y, we force using
-O0.

Fixes:

  http://autobuild.buildroot.net/results/d86/d86251974a0a348a64d9a1d1fd7d02dd4aff0792/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/brotli/brotli.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
index 2c1ad48753..248bfb9daf 100644
--- a/package/brotli/brotli.mk
+++ b/package/brotli/brotli.mk
@@ -14,4 +14,8 @@ BROTLI_CONF_OPTS = \
 	-DBROTLI_DISABLE_TESTS=ON \
 	-DBROTLI_BUNDLED_MODE=OFF
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+BROTLI_CONF_OPTS += -DCMAKE_C_FLAGS="-O0"
+endif
+
 $(eval $(cmake-package))
-- 
2.17.1
