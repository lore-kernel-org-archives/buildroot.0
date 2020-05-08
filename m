From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 May 2020 12:08:05 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/gflags: force
 Release mode
Message-ID: <20200508143236.4F26091051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73a52cbc9faf9c4868ded2507b45cf2405db6ac6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Force Release otherwise libraries will be suffixed by _debug which will raise
unexpected build failures with packages that use gflags (e.g. rocksdb)

Fixes:
 - http://autobuild.buildroot.org/results/3545774258babc3584f69e7d523efdf7fff1acb5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 198e42d6ebdc9a55da8378e437f3e4c20678b94b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gflags/gflags.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/gflags/gflags.mk b/package/gflags/gflags.mk
index c4fce45b3e..f32869f70d 100644
--- a/package/gflags/gflags.mk
+++ b/package/gflags/gflags.mk
@@ -10,8 +10,12 @@ GFLAGS_INSTALL_STAGING = YES
 GFLAGS_LICENSE = BSD-3-Clause
 GFLAGS_LICENSE_FILES = COPYING.txt
 
+# Force Release otherwise libraries will be suffixed by _debug which will raise
+# unexpected build failures with packages that use gflags (e.g. rocksdb)
+GFLAGS_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
-GFLAGS_CONF_OPTS = -DBUILD_gflags_LIB=OFF \
+GFLAGS_CONF_OPTS += -DBUILD_gflags_LIB=OFF \
 	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -DNO_THREADS"
 endif
 
