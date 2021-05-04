From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 4 May 2021 22:30:14 +0200
Subject: [Buildroot] [git commit] package/bullet: fix build
Message-ID: <20210504200618.4A3B083982@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f154799b6ed772a0c028072996e110fac131508
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since bump to version 3.09 in commit
28b4947ed8f53c4edfbf8fef9304dc76480c01ca, build fails on:

[100%] Linking CXX shared library libBulletRoboticsGUI.so
/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc64-buildroot-linux-gnu/9.3.0/../../../../sparc64-buildroot-linux-gnu/bin/ld: cannot find -lBulletExampleBrowserLib

Upstream is aware of this issue and recommends to avoid changing any
options: https://github.com/bulletphysics/bullet3/issues/3143

So don't disable bullet3 and demos apps ...

Fixes:
 - http://autobuild.buildroot.org/results/1721df8b0859656f7420b0b166d1ca635e5ddc74

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout: remove the options instead of setting to ON]
---
 package/bullet/bullet.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/bullet/bullet.mk b/package/bullet/bullet.mk
index 6ed4da859f..01931b58a8 100644
--- a/package/bullet/bullet.mk
+++ b/package/bullet/bullet.mk
@@ -10,11 +10,10 @@ BULLET_INSTALL_STAGING = YES
 BULLET_LICENSE = Zlib
 BULLET_LICENSE_FILES = LICENSE.txt
 
-# Disable demos apps and unit tests.
-# Disable Bullet3 library.
-BULLET_CONF_OPTS = -DBUILD_UNIT_TESTS=OFF \
-	-DBUILD_BULLET2_DEMOS=OFF \
-	-DBUILD_BULLET3=OFF
+# Disable unit tests.
+# Don't disable demos apps and Bullet3 library to avoid a build failure:
+# https://github.com/bulletphysics/bullet3/issues/3143
+BULLET_CONF_OPTS = -DBUILD_UNIT_TESTS=OFF
 
 # extras needs dlfcn.h and NPTL (pthread_barrier_init)
 ifeq ($(BR2_STATIC_LIBS):$(BR2_TOOLCHAIN_HAS_THREADS_NPTL),:y)
