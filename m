From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Feb 2020 17:45:11 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/zeromq: add
 -latomic to libzmq.pc
Message-ID: <20200228163438.87B0B81539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ad22ad94dbc18aa339fdf5e1edcd1772553dddb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

This will fix a static build failure with czmq

Fixes:
 - http://autobuild.buildroot.org/results/4a12f1ede260cd956a0b5ccb4eec6ca8b44cb04f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f2fc6df260fc6ba9e8fac81b3ee27b0ad7b02875)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 565db7267e0a8ffb43f3ed8a2d70c03fd166803f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ude.m4-add-latomic-to-PKGCFG_LIBS_PRIVATE.patch | 36 ++++++++++++++++++++++
 package/zeromq/zeromq.mk                           |  2 ++
 2 files changed, 38 insertions(+)

diff --git a/package/zeromq/0001-acinclude.m4-add-latomic-to-PKGCFG_LIBS_PRIVATE.patch b/package/zeromq/0001-acinclude.m4-add-latomic-to-PKGCFG_LIBS_PRIVATE.patch
new file mode 100644
index 0000000000..49f753b27f
--- /dev/null
+++ b/package/zeromq/0001-acinclude.m4-add-latomic-to-PKGCFG_LIBS_PRIVATE.patch
@@ -0,0 +1,36 @@
+From d59dcbcaebd91ca30a0f866403c383177a4843f8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 12 Jan 2020 10:10:15 +0100
+Subject: [PATCH] acinclude.m4: add -latomic to PKGCFG_LIBS_PRIVATE
+
+Add -latomic to PKGCFG_LIBS_PRIVATE so applications linking statically
+with libzmq (such czmq) will know that they have to link with -latomic
+and the following build failure will be avoided:
+
+  CCLD     src/czmq_selftest
+/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/7.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/run/instance-3/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libzmq.a(src_libzmq_la-ctx.o): in function `zmq::ctx_t::create_socket(int)':
+ctx.cpp:(.text+0x1710): undefined reference to `__atomic_fetch_add_4'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4a12f1ede260cd956a0b5ccb4eec6ca8b44cb04f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/zeromq/libzmq/commit/d59dcbcaebd91ca30a0f866403c383177a4843f8]
+---
+ acinclude.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 8c042ca50..387a3d2a1 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -691,7 +691,7 @@ int main (int, char **)
+             return t;
+         }
+         ])],
+-        [AC_MSG_RESULT(yes) ; libzmq_cv_has_atomic_instrisics="yes" ; $1],
++        [AC_MSG_RESULT(yes) ; libzmq_cv_has_atomic_instrisics="yes" PKGCFG_LIBS_PRIVATE="$PKGCFG_LIBS_PRIVATE -latomic" ; $1],
+         [AC_MSG_RESULT(no) ; libzmq_cv_has_atomic_instrisics="no" LIBS=$save_LIBS ; $2])
+     fi
+ }])
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 2c2e3e45b8..04f7e7d3f2 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -11,6 +11,8 @@ ZEROMQ_DEPENDENCIES = util-linux
 ZEROMQ_CONF_OPTS = --without-documentation
 ZEROMQ_LICENSE = LGPL-3.0+ with exceptions
 ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
+# We're patching acinclude.m4
+ZEROMQ_AUTORECONF = YES
 
 # Assume these flags are always available. It is true, at least for
 # SOCK_CLOEXEC, since linux v2.6.27.
