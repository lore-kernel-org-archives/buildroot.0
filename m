From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 21:20:00 +0100
Subject: [Buildroot] [git commit] lxc: fix build without stack protector
Message-ID: <20181206201620.8C60B840F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ab69b00fd353af4fc9105355408c12c4c9f8455
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Stack protector has been added in version 3.0.3 by
https://github.com/lxc/lxc/commit/2268c27754152aa538db2c9e3753d72d19bcd17a

However, some compilers could missed the needed library (-lssp or
-lssp_nonshared) at linking step so use ax_check_link_flag instead of
ax_check_compile_flag

Fixes:
 - http://autobuild.buildroot.org/results/0b90e7dca2984652842832a41abad93ac49a9b86

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...gure.ac-fix-build-without-stack-protector.patch | 37 ++++++++++++++++++++++
 package/lxc/lxc.mk                                 |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/package/lxc/0002-configure.ac-fix-build-without-stack-protector.patch b/package/lxc/0002-configure.ac-fix-build-without-stack-protector.patch
new file mode 100644
index 0000000000..744fcbbed3
--- /dev/null
+++ b/package/lxc/0002-configure.ac-fix-build-without-stack-protector.patch
@@ -0,0 +1,37 @@
+From 3aa7271157d3c815a4426c1f8eaea2f3b6dafa6a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 4 Dec 2018 08:40:05 +0100
+Subject: [PATCH] configure.ac: fix build without stack-protector
+
+Compiler based hardening (including -fstack-protector-strong) are
+enabled since version 3.0.3 and
+https://github.com/lxc/lxc/commit/2268c27754152aa538db2c9e3753d72d19bcd17a
+
+However, some compilers could missed the needed library (-lssp or
+-lssp_nonshared) at linking step so use ax_check_link_flag instead of
+ax_check_compile_flag
+
+Fixes:
+ - http://autobuild.buildroot.org/results/0b90e7dca2984652842832a41abad93ac49a9b86
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9a9adac3..032e4cfd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -696,7 +696,7 @@ AX_CHECK_COMPILE_FLAG([-Wcast-align], [CFLAGS="$CFLAGS -Wcast-align"],,[-Werror]
+ AX_CHECK_COMPILE_FLAG([-Wstrict-prototypes], [CFLAGS="$CFLAGS -Wstrict-prototypes"],,[-Werror])
+ AX_CHECK_COMPILE_FLAG([-fno-strict-aliasing], [CFLAGS="$CFLAGS -fno-strict-aliasing"],,[-Werror])
+ AX_CHECK_COMPILE_FLAG([-fstack-clash-protection], [CFLAGS="$CFLAGS -fstack-clash-protection"],,[-Werror])
+-AX_CHECK_COMPILE_FLAG([-fstack-protector-strong], [CFLAGS="$CFLAGS -fstack-protector-strong"],,[-Werror])
++AX_CHECK_LINK_FLAG([-fstack-protector-strong], [CFLAGS="$CFLAGS -fstack-protector-strong"],,[-Werror])
+ AX_CHECK_COMPILE_FLAG([-g], [CFLAGS="$CFLAGS -g"],,[-Werror])
+ AX_CHECK_COMPILE_FLAG([--mcet -fcf-protection], [CFLAGS="$CFLAGS --mcet -fcf-protection"],,[-Werror])
+ AX_CHECK_COMPILE_FLAG([-Werror=implicit-function-declaration], [CFLAGS="$CFLAGS -Werror=implicit-function-declaration"],,[-Werror])
+-- 
+2.14.1
+
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 48d5b20329..c9838fb229 100644
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
