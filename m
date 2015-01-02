From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 19:10:52 +0100
Subject: [Buildroot] [git commit] lightning: new package
Message-ID: <20150102181119.4540A7FA9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=952391db0477d1baa9c451fe0b3dabbfaef5a9b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GNU lightning is a library that generates assembly language code at
run-time.

https://www.gnu.org/software/lightning/

[Thomas:
 - Wrap list of architectures in Config.in
 - Introduce an explicit Config.in option for the disassembler
   support, since it needs both binutils and zlib, which may not be
   easy to guess.
 - Add hash file.
 - Bump to version 2.0.5.
 - Add patch to fix cross-compilation issues on ARM and x86 due to
   AC_RUN_IFELSE() tests.
 - Adjust license information: the library is actually under LGPLv3+,
   not GPLv3. There is a COPYING file with the text of the GPLv3 in
   the code base, but this license doesn't seem to be used in anything
   that is actually installed.
 - Add AUTORECONF = YES since we're now patching configure.ac.
 - Add missing dependency on zlib for the disassembler support.
 - Add a special LIBS=-lintl when enabling the disassembler support
   because binutils libraries use gettext functions, but they are not
   linked against libintl.]

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 .../0001-cross-compilation-configure-fixes.patch   |   40 ++++++++++++++++++++
 package/lightning/Config.in                        |   26 +++++++++++++
 package/lightning/lightning.hash                   |    2 +
 package/lightning/lightning.mk                     |   23 +++++++++++
 5 files changed, 92 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1abcaa8..424ef12 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -928,6 +928,7 @@ menu "Other"
 	source "package/libunwind/Config.in"
 	source "package/liburcu/Config.in"
 	source "package/libuv/Config.in"
+	source "package/lightning/Config.in"
 	source "package/linux-pam/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/mpc/Config.in"
diff --git a/package/lightning/0001-cross-compilation-configure-fixes.patch b/package/lightning/0001-cross-compilation-configure-fixes.patch
new file mode 100644
index 0000000..6ced202
--- /dev/null
+++ b/package/lightning/0001-cross-compilation-configure-fixes.patch
@@ -0,0 +1,40 @@
+Assume that the functionality is not present
+
+Patch written by Holger Hans Peter Freyther, and fetched from
+http://lists.gnu.org/archive/html/lightning/2014-11/msg00002.html.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 031279d..a36bed6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -184,7 +184,7 @@ elif test $cpu = x86; then
+                          : "0" (1));
+        return (edx & 1 << 26) ? 0 : 1;
+     }
+-    ]])],[ac_cv_test_x86_x87=yes],[][])
++    ]])],[ac_cv_test_x86_x87=yes],[],[ac_cv_test_x86_x87=no])
+ elif test $cpu = arm; then
+     AC_RUN_IFELSE([AC_LANG_SOURCE([[
+     #include <stdio.h>
+@@ -207,7 +207,7 @@ elif test $cpu = arm; then
+     #endif
+        return 1;
+     }
+-    ]])],[ac_cv_test_arm_arm=yes],[][])
++    ]])],[ac_cv_test_arm_arm=yes],[],[ac_cv_test_arm_arm=no])
+     AC_RUN_IFELSE([AC_LANG_SOURCE([[
+     #include <stdio.h>
+     int main(void) {
+@@ -229,7 +229,7 @@ elif test $cpu = arm; then
+     #endif
+        return 1;
+     }
+-    ]])],[ac_cv_test_arm_swf=yes],[][])
++    ]])],[ac_cv_test_arm_swf=yes],[],[ac_cv_test_arm_swf=no])
+ fi
+ CFLAGS=$save_CFLAGS
diff --git a/package/lightning/Config.in b/package/lightning/Config.in
new file mode 100644
index 0000000..8caf39f
--- /dev/null
+++ b/package/lightning/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_LIGHTNING
+	bool "lightning"
+	depends on BR2_sparc || BR2_i386 || BR2_x86_64 || BR2_mips || \
+		BR2_mipsel || BR2_arm || BR2_powerpc
+	help
+	  GNU lightning is a library that generates
+	  assembly language code at run-time.
+
+	  https://www.gnu.org/software/lightning/
+
+if BR2_PACKAGE_LIGHTNING
+
+config BR2_PACKAGE_LIGHTNING_DISASSEMBLER
+	bool "enable disassembler"
+	select BR2_PACKAGE_BINUTILS
+	select BR2_PACKAGE_ZLIB
+	depends on !BR2_aarch64 && !BR2_nios2 # binutils
+	depends on BR2_USE_WCHAR # binutils
+	help
+	  Enable the GNU lightning disassembler.
+
+comment "lightning disassembler needs a toolchain w/ wchar"
+	depends on !BR2_aarch64 && !BR2_nios2
+	depends on !BR2_USE_WCHAR
+
+endif
diff --git a/package/lightning/lightning.hash b/package/lightning/lightning.hash
new file mode 100644
index 0000000..7e61d61
--- /dev/null
+++ b/package/lightning/lightning.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 65b66a86aef8772e8c6813868da5174c4977c65b9e6cff3d4c3bb0de1a52a94a lightning-2.0.5.tar.gz
diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
new file mode 100644
index 0000000..00fed73
--- /dev/null
+++ b/package/lightning/lightning.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# lightning
+#
+################################################################################
+
+LIGHTNING_VERSION = 2.0.5
+LIGHTNING_SITE = http://ftp.gnu.org/gnu/lightning/
+LIGHTNING_LICENSE = LGPLv3+
+LIGHTNING_LICENSE_FILES = COPYING.LESSER
+LIGHTNING_INSTALL_STAGING = YES
+
+# We're patching configure.ac
+LIGHTNING_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_LIGHTNING_DISASSEMBLER),y)
+LIGHTNING_DEPENDENCIES += binutils zlib
+LIGHTNING_CONF_OPTS += --enable-disassembler
+# binutils libraries are not explicitly linked against gettext
+LIGHTNING_CONF_ENV += $(if $(BR2_PACKAGE_GETTEXT),LIBS=-lintl)
+endif
+
+$(eval $(autotools-package))
