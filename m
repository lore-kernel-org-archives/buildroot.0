From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 28 May 2019 00:09:03 +0200
Subject: [Buildroot] [git commit] package/brotli: work around gcc bug 68485
Message-ID: <20190527220327.636798E6D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39dde1ffb6a7111c2fa2b340c940e4d3e685aa29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With Microblaze Gcc version <= 9.x the build fails due to gcc bug 68485:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. The bug show up when
building brotli with optimization but not when building with -O0. To
work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_68458=y, we force using
-O0.

Fixes:

  http://autobuild.buildroot.net/results/d86/d86251974a0a348a64d9a1d1fd7d02dd4aff0792/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
