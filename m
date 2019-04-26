From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Apr 2019 09:06:42 +0200
Subject: [Buildroot] [git commit] package/bullet: extras needs dlfcn.h and
 threads
Message-ID: <20190426070349.F163883723@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef333f99a25d328a9d21d3ea26f163b1a79bfdef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

extras needs dynamic library (dlfcn.h) and threads

Fixes:
 - http://autobuild.buildroot.org/results/a2609de74c08d9287beb839b93794161a7868e30
 - http://autobuild.buildroot.org/results/3e961d40f3d7003061eee0f7dc476d26c444bd7b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
