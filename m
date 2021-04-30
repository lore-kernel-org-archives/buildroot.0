From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 30 Apr 2021 08:05:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/bullet: fix build
Message-ID: <20210430060545.1243461-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since bump to version 3.09 in commit
28b4947ed8f53c4edfbf8fef9304dc76480c01ca, build fails on:

[100%] Linking CXX shared library libBulletRoboticsGUI.so
/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc64-buildroot-linux-gnu/9.3.0/../../../../sparc64-buildroot-linux-gnu/bin/ld: cannot find -lBulletExampleBrowserLib

Upstream is aware of this issue and recommends to avoid changing any
options: https://github.com/bulletphysics/bullet3/issues/3143

So enable bullet3 and demos apps ...

Fixes:
 - http://autobuild.buildroot.org/results/1721df8b0859656f7420b0b166d1ca635e5ddc74

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bullet/bullet.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/bullet/bullet.mk b/package/bullet/bullet.mk
index 6ed4da859f..de51402ab6 100644
--- a/package/bullet/bullet.mk
+++ b/package/bullet/bullet.mk
@@ -10,11 +10,12 @@ BULLET_INSTALL_STAGING = YES
 BULLET_LICENSE = Zlib
 BULLET_LICENSE_FILES = LICENSE.txt
 
-# Disable demos apps and unit tests.
-# Disable Bullet3 library.
+# Disable unit tests.
+# Don't disable demos apps and Bullet3 library to avoid a build failure:
+# https://github.com/bulletphysics/bullet3/issues/3143
 BULLET_CONF_OPTS = -DBUILD_UNIT_TESTS=OFF \
-	-DBUILD_BULLET2_DEMOS=OFF \
-	-DBUILD_BULLET3=OFF
+	-DBUILD_BULLET2_DEMOS=ON \
+	-DBUILD_BULLET3=ON
 
 # extras needs dlfcn.h and NPTL (pthread_barrier_init)
 ifeq ($(BR2_STATIC_LIBS):$(BR2_TOOLCHAIN_HAS_THREADS_NPTL),:y)
-- 
2.30.2
