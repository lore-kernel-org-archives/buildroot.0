From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  3 Dec 2018 22:46:37 +0100
Subject: [Buildroot] [PATCH 2/2] lxc: fix build without stack protector
In-Reply-To: <20181203214637.6633-1-fontaine.fabrice@gmail.com>
References: <20181203214637.6633-1-fontaine.fabrice@gmail.com>
Message-ID: <20181203214637.6633-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option to disable the stack protector flags added in version
3.0.3 by
https://github.com/lxc/lxc/commit/2268c27754152aa538db2c9e3753d72d19bcd17a

Fixes:
 - http://autobuild.buildroot.org/results/0b90e7dca2984652842832a41abad93ac49a9b86

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ure.ac-add-an-option-to-disable-hardening.patch | 73 ++++++++++++++++++++++
 package/lxc/lxc.mk                                 |  4 +-
 2 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 package/lxc/0002-configure.ac-add-an-option-to-disable-hardening.patch

diff --git a/package/lxc/0002-configure.ac-add-an-option-to-disable-hardening.patch b/package/lxc/0002-configure.ac-add-an-option-to-disable-hardening.patch
new file mode 100644
index 0000000000..24dd8f627a
--- /dev/null
+++ b/package/lxc/0002-configure.ac-add-an-option-to-disable-hardening.patch
@@ -0,0 +1,73 @@
+From 165d417003c66be6d2a61e3c6e706e33a6746788 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 3 Dec 2018 22:29:52 +0100
+Subject: [PATCH] configure.ac: add an option to disable hardening
+
+Compiler based hardening is enabled since version 3.0.3 and
+https://github.com/lxc/lxc/commit/2268c27754152aa538db2c9e3753d72d19bcd17a
+
+Add an option to disable it as some compilers could missed the needed
+library (-lssp or -lssp_nonshared) at linking step
+
+Fixes:
+ - http://autobuild.buildroot.org/results/0b9/0b90e7dca2984652842832a41abad93ac49a9b86/build-end.log
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 19 ++++++++++++++-----
+ 1 file changed, 14 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9a9adac3..3ff35a61 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -189,6 +189,11 @@ AC_ARG_ENABLE([werror],
+ 	[do not treat warnings as errors])],
+ 	[], [enable_werror=yes])
+ 
++AC_ARG_ENABLE([hardening],
++	[AC_HELP_STRING([--disable-hardening],
++	[do not enable hardening compiler options])],
++	[], [enable_hardening=yes])
++
+ # Allow disabling rpath
+ AC_ARG_ENABLE([rpath],
+ 	[AC_HELP_STRING([--enable-rpath], [set rpath in executables [default=no]])],
+@@ -695,11 +700,6 @@ AX_CHECK_COMPILE_FLAG([-Wimplicit-fallthrough], [CFLAGS="$CFLAGS -Wimplicit-fall
+ AX_CHECK_COMPILE_FLAG([-Wcast-align], [CFLAGS="$CFLAGS -Wcast-align"],,[-Werror])
+ AX_CHECK_COMPILE_FLAG([-Wstrict-prototypes], [CFLAGS="$CFLAGS -Wstrict-prototypes"],,[-Werror])
+ AX_CHECK_COMPILE_FLAG([-fno-strict-aliasing], [CFLAGS="$CFLAGS -fno-strict-aliasing"],,[-Werror])
+-AX_CHECK_COMPILE_FLAG([-fstack-clash-protection], [CFLAGS="$CFLAGS -fstack-clash-protection"],,[-Werror])
+-AX_CHECK_COMPILE_FLAG([-fstack-protector-strong], [CFLAGS="$CFLAGS -fstack-protector-strong"],,[-Werror])
+-AX_CHECK_COMPILE_FLAG([-g], [CFLAGS="$CFLAGS -g"],,[-Werror])
+-AX_CHECK_COMPILE_FLAG([--mcet -fcf-protection], [CFLAGS="$CFLAGS --mcet -fcf-protection"],,[-Werror])
+-AX_CHECK_COMPILE_FLAG([-Werror=implicit-function-declaration], [CFLAGS="$CFLAGS -Werror=implicit-function-declaration"],,[-Werror])
+ 
+ AX_CHECK_LINK_FLAG([-z relro], [LDLAGS="$LDLAGS -z relro"],,[])
+ AX_CHECK_LINK_FLAG([-z now], [LDLAGS="$LDLAGS -z now"],,[])
+@@ -709,6 +709,14 @@ if test "x$enable_werror" = "xyes"; then
+ 	CFLAGS="$CFLAGS -Werror"
+ fi
+ 
++if test "x$enable_hardening" = "xyes"; then
++	AX_CHECK_COMPILE_FLAG([-fstack-clash-protection], [CFLAGS="$CFLAGS -fstack-clash-protection"],,[-Werror])
++	AX_CHECK_COMPILE_FLAG([-fstack-protector-strong], [CFLAGS="$CFLAGS -fstack-protector-strong"],,[-Werror])
++	AX_CHECK_COMPILE_FLAG([-g], [CFLAGS="$CFLAGS -g"],,[-Werror])
++	AX_CHECK_COMPILE_FLAG([--mcet -fcf-protection], [CFLAGS="$CFLAGS --mcet -fcf-protection"],,[-Werror])
++	AX_CHECK_COMPILE_FLAG([-Werror=implicit-function-declaration], [CFLAGS="$CFLAGS -Werror=implicit-function-declaration"],,[-Werror])
++fi
++
+ AC_ARG_ENABLE([thread-safety],
+ 	[AC_HELP_STRING([--enable-thread-safety], [enforce thread-safety otherwise fail the build [default=yes]])],
+ 	[], [enable_thread_safety=yes])
+@@ -951,6 +959,7 @@ Environment:
+  - Bash integration: $enable_bash
+ 
+ Security features:
++ - Compiler hardening options: $enable_hardening
+  - Apparmor: $enable_apparmor
+  - Linux capabilities: $enable_capabilities
+  - seccomp: $enable_seccomp
+-- 
+2.14.1
+
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 48d5b20329..3af03ab256 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -10,9 +10,11 @@ LXC_LICENSE = LGPL-2.1+
 LXC_LICENSE_FILES = COPYING
 LXC_DEPENDENCIES = host-pkgconf
 LXC_INSTALL_STAGING = YES
+# We're patching configure.ac
+LXC_AUTORECONF = YES
 
 LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
-	--disable-werror \
+	--disable-hardening --disable-werror \
 	$(if $(BR2_PACKAGE_BASH),,--disable-bash)
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-- 
2.14.1
