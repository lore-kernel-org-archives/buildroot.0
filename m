From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 10 Feb 2020 18:41:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/ogre: link with libatomic when
 needed
Message-ID: <20200210174127.719019-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some architectures, atomic binutils are provided by the libatomic
library from gcc. Linking with libatomic is therefore necessary,
otherwise the build fails with:

/home/test/autobuild/run/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/8.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: ../../lib/libOgreMain.so.1.12.0: undefined reference to `__atomic_fetch_add_8'

This is often for example the case on sparc v8 32 bits.

Fixes:
 - http://autobuild.buildroot.org/results/3a09e2d1d26b19243244eb7f9235c85488a788d2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ogre/ogre.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ogre/ogre.mk b/package/ogre/ogre.mk
index f7711e41f1..253e022a73 100644
--- a/package/ogre/ogre.mk
+++ b/package/ogre/ogre.mk
@@ -39,4 +39,9 @@ else
 OGRE_CONF_OPTS += -DOGRE_BUILD_COMPONENT_PYTHON=OFF
 endif
 
+# Uses __atomic_fetch_add_8
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+OGRE_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
+endif
+
 $(eval $(cmake-package))
-- 
2.24.1
