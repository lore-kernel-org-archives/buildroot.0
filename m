From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jan 2020 11:36:28 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/opencv3: fix
 build due to gcc bug 68485
Message-ID: <20200112104514.5028B8B4D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=412d835bc729d958316c1d11e22f53dfc378de92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

With Microblaze Gcc version <= 9.x the build fails due to gcc bug 68485:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. The bug show up when
building opencv3 with optimization but not when building with -O0. To
work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_68458=y, we force using
-O0.

Fixes:
 - http://autobuild.buildroot.org/results/c78eac84d1c5a6702e7759cd5364da1c3e399b4b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 87040137a38012e9ae680098fc5facda0ea0fcf3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv3/opencv3.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 5bc6376ca3..8fb97b5135 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -23,6 +23,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_64735),y)
 OPENCV3_CXXFLAGS += -DCV__EXCEPTION_PTR=0
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+OPENCV3_CXXFLAGS += -O0
+endif
+
 # OpenCV component options
 OPENCV3_CONF_OPTS += \
 	-DCMAKE_CXX_FLAGS="$(OPENCV3_CXXFLAGS)" \
