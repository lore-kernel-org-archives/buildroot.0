From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Aug 2019 23:39:01 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/qt5/qt5base:
 build with correct optimization
Message-ID: <20190829214317.B06A2813E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5616fc1f0c867e97a13feffbdcf59caf649a82c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Qt5 has predefined optimization flags depending if you're building for
size, for debug etc. These flags are defined in
mkspecs/common/gcc-base.conf:

QMAKE_CFLAGS_OPTIMIZE      = -O2
QMAKE_CFLAGS_OPTIMIZE_FULL = -O3
QMAKE_CFLAGS_OPTIMIZE_DEBUG = -Og
QMAKE_CFLAGS_OPTIMIZE_SIZE = -Os

Then, in common/features/default_post.prf, they add those flags to
QMAKE_CFLAGS_RELEASE/QMAKE_CXXFLAGS_RELEASE depending on various build
options (optimize_size, optimize_full, optimize_debug):

optimize_size {
    !isEmpty(QMAKE_CFLAGS_OPTIMIZE):!isEmpty(QMAKE_CFLAGS_OPTIMIZE_SIZE)  {
        QMAKE_CFLAGS_RELEASE -= $$QMAKE_CFLAGS_OPTIMIZE
        QMAKE_CXXFLAGS_RELEASE -= $$QMAKE_CFLAGS_OPTIMIZE
        QMAKE_CFLAGS_RELEASE += $$QMAKE_CFLAGS_OPTIMIZE_SIZE
        QMAKE_CXXFLAGS_RELEASE += $$QMAKE_CFLAGS_OPTIMIZE_SIZE
    }
} else: optimize_full {
    !isEmpty(QMAKE_CFLAGS_OPTIMIZE):!isEmpty(QMAKE_CFLAGS_OPTIMIZE_FULL)  {
        QMAKE_CFLAGS_RELEASE -= $$QMAKE_CFLAGS_OPTIMIZE
        QMAKE_CXXFLAGS_RELEASE -= $$QMAKE_CFLAGS_OPTIMIZE
        QMAKE_CFLAGS_RELEASE += $$QMAKE_CFLAGS_OPTIMIZE_FULL
        QMAKE_CXXFLAGS_RELEASE += $$QMAKE_CFLAGS_OPTIMIZE_FULL
    }
}

Since this default_post.prf is included *after* our qmake.conf file,
these flags override our optimizations flags, which is not good.

However, our qmake.conf file is included *after* gcc-base.conf, so we
can simply reset those variables to have the empty value, and our
optimization flags will be used.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
[Thomas: completely change the approach, by simply resetting the
QMAKE_CFLAGS_OPTIMIZE_* variables in qmake.conf]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit 7c0aa83527e0b0179f9e3f73a3e63df1fdc5a6e6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qmake.conf.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5base/qmake.conf.in b/package/qt5/qt5base/qmake.conf.in
index 26bee2cb39..2eb564e172 100644
--- a/package/qt5/qt5base/qmake.conf.in
+++ b/package/qt5/qt5base/qmake.conf.in
@@ -15,6 +15,10 @@ QMAKE_CXX               = $${CROSS_COMPILE}g++
 # modifications to gcc-base.conf
 QMAKE_CFLAGS           += $${BR_COMPILER_CFLAGS}
 QMAKE_CXXFLAGS         += $${BR_COMPILER_CXXFLAGS}
+QMAKE_CFLAGS_OPTIMIZE       =
+QMAKE_CFLAGS_OPTIMIZE_DEBUG =
+QMAKE_CFLAGS_OPTIMIZE_FULL  =
+QMAKE_CFLAGS_OPTIMIZE_SIZE  =
 CONFIG                 += nostrip
 
 QMAKE_LIBS             += -lrt -lpthread -ldl
