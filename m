From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 25 Apr 2019 22:49:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/bullet: extras needs dlfcn.h and
 threads
Message-ID: <20190425204922.9755-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

extras needs dynamic library (dlfcn.h) and threads

Fixes:
 - http://autobuild.buildroot.org/results/a2609de74c08d9287beb839b93794161a7868e30
 - http://autobuild.buildroot.org/results/3e961d40f3d7003061eee0f7dc476d26c444bd7b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bullet/bullet.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/bullet/bullet.mk b/package/bullet/bullet.mk
index 1345f3747e..7ff8195c85 100644
--- a/package/bullet/bullet.mk
+++ b/package/bullet/bullet.mk
@@ -16,4 +16,11 @@ BULLET_CONF_OPTS = -DBUILD_UNIT_TESTS=OFF \
 	-DBUILD_BULLET2_DEMOS=OFF \
 	-DBUILD_BULLET3=OFF
 
+# extras needs dlfcn.h and threads
+ifeq ($(BR2_STATIC_LIBS):$(BR2_TOOLCHAIN_HAS_THREADS),:y)
+BULLET_CONF_OPTS += -DBUILD_EXTRAS=ON
+else
+BULLET_CONF_OPTS += -DBUILD_EXTRAS=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.20.1
