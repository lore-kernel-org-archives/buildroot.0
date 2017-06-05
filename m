From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:51:56 +0200
Subject: [Buildroot] [git commit] package/exiv2: fix pthread detection
Message-ID: <20170605095211.DB56882138@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04f08a43dd14250fa61837c75ccb0adb54fa5a7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes an error during configure:

-- Check if compiler accepts -pthread
CMake Error: TRY_RUN() invoked in cross-compiling mode, please set the
 following cache variables appropriately:
   THREADS_PTHREAD_ARG (advanced)

Patch ported from librtlsdr:
https://git.busybox.net/buildroot/commit/?id=4c6eace6f756d15ae9639a503c9245d1e7fb12a9

Fixes
http://autobuild.buildroot.net/results/0f9/0f985993a0c0076f027cfe25bb13d6b85c644c0d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/exiv2/exiv2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index f56e861..bdd40f7 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -11,6 +11,10 @@ EXIV2_INSTALL_STAGING = YES
 
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BUILD_SAMPLES=OFF
 
+# The following CMake variable disables a TRY_RUN call in the -pthread
+# test which is not allowed when cross-compiling.
+EXIV2_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
+
 ifeq ($(BR2_PACKAGE_EXIV2_LENSDATA),)
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_LENSDATA=OFF
 endif
