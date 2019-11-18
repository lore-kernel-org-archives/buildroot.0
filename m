From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 23:23:44 +0100
Subject: [Buildroot] [git commit] package/lxc: fix build without SSP
Message-ID: <20191118221942.0FAD68F282@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=502d55fc2db265c5f9e3619d7ead5f44ce1a0e1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/57945f54ffbc5c8764b6891a4516c4907e56ab97

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ure.ac-fix-build-on-toolchain-without-SSP.patch | 36 ++++++++++++++++++++++
 package/lxc/lxc.mk                                 |  2 ++
 2 files changed, 38 insertions(+)

diff --git a/package/lxc/0002-configure.ac-fix-build-on-toolchain-without-SSP.patch b/package/lxc/0002-configure.ac-fix-build-on-toolchain-without-SSP.patch
new file mode 100644
index 0000000000..aa35e93824
--- /dev/null
+++ b/package/lxc/0002-configure.ac-fix-build-on-toolchain-without-SSP.patch
@@ -0,0 +1,36 @@
+From 226205f0c5e3ef6f5757ffdfddd5b815b217e4ff Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 11 Nov 2019 22:55:36 +0100
+Subject: [PATCH] configure.ac: fix build on toolchain without SSP
+
+Commit 3b5a0eebd4d2efdaa03c6fb11950abfcf081fab8 reverted
+3aa7271157d3c815a4426c1f8eaea2f3b6dafa6a resulting in lxc being unable
+to be built on toolchain without SSP support
+
+Fixes:
+ - http://autobuild.buildroot.org/results/57945f54ffbc5c8764b6891a4516c4907e56ab97
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/lxc/lxc/pull/3184]
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 645a2166d..4c1a10b3d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -713,8 +713,8 @@ AX_CHECK_COMPILE_FLAG([-Wcast-align], [CFLAGS="$CFLAGS -Wcast-align"],,[-Werror]
+ AX_CHECK_COMPILE_FLAG([-Wstrict-prototypes], [CFLAGS="$CFLAGS -Wstrict-prototypes"],,[-Werror])
+ AX_CHECK_COMPILE_FLAG([-fno-strict-aliasing], [CFLAGS="$CFLAGS -fno-strict-aliasing"],,[-Werror])
+ AX_CHECK_COMPILE_FLAG([-fstack-clash-protection], [CFLAGS="$CFLAGS -fstack-clash-protection"],,[-Werror])
+-AX_CHECK_COMPILE_FLAG([-fstack-protector-strong], [CFLAGS="$CFLAGS -fstack-protector-strong"],,[-Werror])
+-AX_CHECK_COMPILE_FLAG([--param=ssp-buffer-size=4], [CFLAGS="$CFLAGS --param=ssp-buffer-size=4"],,[-Werror])
++AX_CHECK_LINK_FLAG([-fstack-protector-strong], [CFLAGS="$CFLAGS -fstack-protector-strong"],,[-Werror])
++AX_CHECK_LINK_FLAG([--param=ssp-buffer-size=4], [CFLAGS="$CFLAGS --param=ssp-buffer-size=4"],,[-Werror])
+ AX_CHECK_COMPILE_FLAG([-g], [CFLAGS="$CFLAGS -g"],,[-Werror])
+ AX_CHECK_COMPILE_FLAG([--mcet -fcf-protection], [CFLAGS="$CFLAGS --mcet -fcf-protection"],,[-Werror])
+ AX_CHECK_COMPILE_FLAG([-Werror=implicit-function-declaration], [CFLAGS="$CFLAGS -Werror=implicit-function-declaration"],,[-Werror])
+-- 
+2.23.0
+
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 81adeef5ee..53e3c85c6d 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -10,6 +10,8 @@ LXC_LICENSE = LGPL-2.1+
 LXC_LICENSE_FILES = COPYING
 LXC_DEPENDENCIES = host-pkgconf
 LXC_INSTALL_STAGING = YES
+# We're patching configure.ac
+LXC_AUTORECONF = YES
 
 LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
 	--disable-werror \
