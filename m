From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 28 Jun 2014 10:56:01 -0300
Subject: [Buildroot] [RFC] libv4l: Bump version to 1.0.1
Message-ID: <1403963761-7924-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quite some work has been done from 0.8.3 to 1.0.1, and as a result
this commit is very intrusive. The biggest change is the move to an
autotools package.

Then, the options that enable utilities individually have been deprecated
and moved to Config.in.legacy. Instead, we introduce new option to select
either all the utilities. This change loses granularity in favor of
maintainability.

Peter's patch has been rebased to apply on top of v1.0.1, and Riku's patch
has been dropped given it was properly upstreamed and is part of v1.0.1.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 Config.in.legacy                                   | 40 ++++++++++++++++++
 package/libv4l/Config.in                           | 49 ++--------------------
 ...1-fixup-lfs-mismatch-in-preload-libraries.patch | 45 ++++++++++++++++++++
 package/libv4l/libv4l-01-largefile.patch           | 39 -----------------
 .../libv4l-02-use-openat-when-available.patch      | 34 ---------------
 package/libv4l/libv4l.mk                           | 44 +++++++------------
 6 files changed, 103 insertions(+), 148 deletions(-)
 create mode 100644 package/libv4l/libv4l-0001-fixup-lfs-mismatch-in-preload-libraries.patch
 delete mode 100644 package/libv4l/libv4l-01-largefile.patch
 delete mode 100644 package/libv4l/libv4l-02-use-openat-when-available.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index a2c7846..dc93f86 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -128,6 +128,46 @@ config BR2_PACKAGE_PROCPS
 	help
 	  The procps package has been replaced by the equivalent procps-ng.
 
+config BR2_PACKAGE_LIBV4L_DECODE_TM6000
+	bool "decode_tm6000"
+	select BR2_PACKAGE_LIBV4L_UTILS
+	select BR2_LEGACY
+	help
+	  This libv4l option has been deprecated and replaced by a single
+	  option to build all the libv4l utilities.
+
+config BR2_PACKAGE_LIBV4L_IR_KEYTABLE
+	bool "ir-keytable"
+	select BR2_PACKAGE_LIBV4L_UTILS
+	select BR2_LEGACY
+	help
+	  This libv4l option has been deprecated and replaced by a single
+	  option to build all the libv4l utilities.
+
+config BR2_PACKAGE_LIBV4L_V4L2_COMPLIANCE
+	bool "v4l2-compliance"
+	select BR2_PACKAGE_LIBV4L_UTILS
+	select BR2_LEGACY
+	help
+	  This libv4l option has been deprecated and replaced by a single
+	  option to build all the libv4l utilities.
+
+config BR2_PACKAGE_LIBV4L_V4L2_CTL
+	bool "v4l2-ctl"
+	select BR2_PACKAGE_LIBV4L_UTILS
+	select BR2_LEGACY
+	help
+	  This libv4l option has been deprecated and replaced by a single
+	  option to build all the libv4l utilities.
+
+config BR2_PACKAGE_LIBV4L_V4L2_DBG
+	bool "v4l2-dbg"
+	select BR2_PACKAGE_LIBV4L_UTILS
+	select BR2_LEGACY
+	help
+	  This libv4l option has been deprecated and replaced by a single
+	  option to build all the libv4l utilities.
+
 ###############################################################################
 comment "Legacy options removed in 2014.05"
 
diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index 2c9a919..0d457fb 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -12,52 +12,11 @@ config BR2_PACKAGE_LIBV4L
 
 if BR2_PACKAGE_LIBV4L
 
-config BR2_PACKAGE_LIBV4L_DECODE_TM6000
-	bool "decode_tm6000"
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+config BR2_PACKAGE_LIBV4L_UTILS
+	bool "v4l-utils tools"
 	help
-	  Tool to decode tm6000 proprietary format streams
-
-comment "decode_tm6000 needs an (e)glibc toolchain"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
-
-config BR2_PACKAGE_LIBV4L_IR_KEYTABLE
-	bool "ir-keytable"
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	help
-	  Tool to alter keymaps of Remote Controller devices
-
-comment "ir-keytable needs an (e)glibc toolchain"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
-
-config BR2_PACKAGE_LIBV4L_V4L2_COMPLIANCE
-	bool "v4l2-compliance"
-	depends on BR2_INSTALL_LIBSTDCPP
-	help
-	  Tool to test v4l2 API compliance of drivers
-
-comment "v4l2-compliance needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
-
-config BR2_PACKAGE_LIBV4L_V4L2_CTL
-	bool "v4l2-ctl"
-	depends on BR2_INSTALL_LIBSTDCPP
-	default y
-	help
-	  Tool to configure v4l2 controls from the cmdline
-
-comment "v4l2-ctl needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
-
-config BR2_PACKAGE_LIBV4L_V4L2_DBG
-	bool "v4l2-dbg"
-	depends on BR2_INSTALL_LIBSTDCPP
-	help
-	  Tool to directly get and set registers of v4l2 devices
-
-comment "v4l2-dbg needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
-
+	  Select this option to build the v4l-utils tools: v4l2-ctl, v4l2-dbg,
+	  v4l2-compliance, ir-keytable, and others.
 endif
 
 comment "libv4l needs a toolchain w/ largefile, threads"
diff --git a/package/libv4l/libv4l-0001-fixup-lfs-mismatch-in-preload-libraries.patch b/package/libv4l/libv4l-0001-fixup-lfs-mismatch-in-preload-libraries.patch
new file mode 100644
index 0000000..153a7a6
--- /dev/null
+++ b/package/libv4l/libv4l-0001-fixup-lfs-mismatch-in-preload-libraries.patch
@@ -0,0 +1,45 @@
+From e5952b043a71fe83fbc392e498e8f77774fca0d8 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Sat, 28 Jun 2014 09:32:53 -0300
+Subject: [PATCH] fixup lfs mismatch in preload libraries
+
+Ensure that the lfs variants are not transparently used instead of the !lfs
+ones so both can be wrapped, independently of any custom CFLAGS/CPPFLAGS.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ lib/libv4l1/v4l1compat.c  | 3 +++
+ lib/libv4l2/v4l2convert.c | 3 +++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/lib/libv4l1/v4l1compat.c b/lib/libv4l1/v4l1compat.c
+index e328288..70eb74f 100644
+--- a/lib/libv4l1/v4l1compat.c
++++ b/lib/libv4l1/v4l1compat.c
+@@ -19,6 +19,9 @@
+ # Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
+  */
+ 
++/* ensure we see *64 variants and they aren't transparently used */
++#undef _LARGEFILE_SOURCE
++#undef _FILE_OFFSET_BITS
+ #define _LARGEFILE64_SOURCE 1
+ 
+ #include <config.h>
+diff --git a/lib/libv4l2/v4l2convert.c b/lib/libv4l2/v4l2convert.c
+index 9b46ab8..bc41056 100644
+--- a/lib/libv4l2/v4l2convert.c
++++ b/lib/libv4l2/v4l2convert.c
+@@ -23,6 +23,9 @@
+ /* prevent GCC 4.7 inlining error */
+ #undef _FORTIFY_SOURCE
+ 
++/* ensure we see *64 variants and they aren't transparently used */
++#undef _LARGEFILE_SOURCE
++#undef _FILE_OFFSET_BITS
+ #define _LARGEFILE64_SOURCE 1
+ 
+ #include <config.h>
+-- 
+1.9.1
+
diff --git a/package/libv4l/libv4l-01-largefile.patch b/package/libv4l/libv4l-01-largefile.patch
deleted file mode 100644
index 9df8652..0000000
--- a/package/libv4l/libv4l-01-largefile.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-[PATCH] fixup lfs mismatch in preload libraries
-
-Ensure that the lfs variants are not transparently used instead of the !lfs
-ones so both can be wrapped, independently of any custom CFLAGS/CPPFLAGS.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- lib/libv4l1/v4l1compat.c  |    3 +++
- lib/libv4l2/v4l2convert.c |    3 +++
- 2 files changed, 6 insertions(+)
-
-Index: v4l-utils-0.8.5/lib/libv4l1/v4l1compat.c
-===================================================================
---- v4l-utils-0.8.5.orig/lib/libv4l1/v4l1compat.c
-+++ v4l-utils-0.8.5/lib/libv4l1/v4l1compat.c
-@@ -19,6 +19,9 @@
- # Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
-  */
- 
-+/* ensure we see *64 variants and they aren't transparently used */
-+#undef _LARGEFILE_SOURCE
-+#undef _FILE_OFFSET_BITS
- #define _LARGEFILE64_SOURCE 1
- 
- #include <stdlib.h>
-Index: v4l-utils-0.8.5/lib/libv4l2/v4l2convert.c
-===================================================================
---- v4l-utils-0.8.5.orig/lib/libv4l2/v4l2convert.c
-+++ v4l-utils-0.8.5/lib/libv4l2/v4l2convert.c
-@@ -20,6 +20,9 @@
- # Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
- */
- 
-+/* ensure we see *64 variants and they aren't transparently used */
-+#undef _LARGEFILE_SOURCE
-+#undef _FILE_OFFSET_BITS
- #define _LARGEFILE64_SOURCE 1
- 
- #include <stdarg.h>
diff --git a/package/libv4l/libv4l-02-use-openat-when-available.patch b/package/libv4l/libv4l-02-use-openat-when-available.patch
deleted file mode 100644
index 756733e..0000000
--- a/package/libv4l/libv4l-02-use-openat-when-available.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From: Riku Voipio <riku.voipio@linaro.org>
-Date: Tue, 22 Jan 2013 15:37:22 +0000 (-0300)
-Subject: v4l-utils: use openat when available
-X-Git-Tag: v4l-utils-0.9.4~61
-X-Git-Url: http://git.linuxtv.org
-
-v4l-utils: use openat when available
-
-New architectures such as 64-Bit arm build kernels without legacy
-system calls - Such as the the no-at system calls. Thus, use
-SYS_openat whenever it is available.
-
-Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
-Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>
----
-
-diff --git a/lib/libv4lconvert/libv4lsyscall-priv.h b/lib/libv4lconvert/libv4lsyscall-priv.h
-index 2dac49a..cdd38bc 100644
---- a/lib/libv4lconvert/libv4lsyscall-priv.h
-+++ b/lib/libv4lconvert/libv4lsyscall-priv.h
-@@ -72,8 +72,13 @@ typedef off_t __off_t;
- 
- #ifndef CONFIG_SYS_WRAPPER
- 
-+#ifdef SYS_openat
-+#define SYS_OPEN(file, oflag, mode) \
-+	syscall(SYS_openat, AT_FDCWD, (const char *)(file), (int)(oflag), (mode_t)(mode))
-+#else
- #define SYS_OPEN(file, oflag, mode) \
- 	syscall(SYS_open, (const char *)(file), (int)(oflag), (mode_t)(mode))
-+#endif
- #define SYS_CLOSE(fd) \
- 	syscall(SYS_close, (int)(fd))
- #define SYS_IOCTL(fd, cmd, arg) \
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index f62a4b6..37f8722 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,40 +4,24 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 0.8.9
+LIBV4L_VERSION = 1.0.1
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils/
 LIBV4L_INSTALL_STAGING = YES
-LIBV4L_MAKE_OPTS = PREFIX=/usr
-LIBV4L_DEPENDENCIES = jpeg
-
-LIBV4L_DIRS_y += lib
-LIBV4L_DIRS_$(BR2_PACKAGE_LIBV4L_DECODE_TM6000)	+= utils/libv4l2util utils/decode_tm6000
-LIBV4L_DIRS_$(BR2_PACKAGE_LIBV4L_IR_KEYTABLE)	+= utils/keytable
-LIBV4L_DIRS_$(BR2_PACKAGE_LIBV4L_V4L2_COMPLIANCE) += utils/v4l2-compliance
-LIBV4L_DIRS_$(BR2_PACKAGE_LIBV4L_V4L2_CTL)	+= utils/v4l2-ctl
-LIBV4L_DIRS_$(BR2_PACKAGE_LIBV4L_V4L2_DBG)	+= utils/v4l2-dbg
-
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
-	LIBV4L_MAKE_OPTS += LINKTYPE=static
-endif
 
-define LIBV4L_BUILD_CMDS
-	for i in $(LIBV4L_DIRS_y); do \
-		$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/$$i \
-			$(LIBV4L_MAKE_OPTS) || exit 1 ; done
-endef
+# v4l-utils components have different licences, see v4l-utils.spec for details
+LIBV4L_LICENSE = GPLv2 GPLv2+ LGPLv2+
+LIBV4L_LICENSE_FILES = COPYING
 
-define LIBV4L_INSTALL_STAGING_CMDS
-	for i in $(LIBV4L_DIRS_y); do \
-		$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/$$i \
-			DESTDIR=$(STAGING_DIR) $(LIBV4L_MAKE_OPTS) install || exit 1; done
-endef
+# v4l-utils now supports building without jpeg support, by passing the
+# --without-jpeg option to configure. We're not taking advantage of this
+# for now.
+LIBV4L_DEPENDENCIES = jpeg
 
-define LIBV4L_INSTALL_TARGET_CMDS
-	for i in $(LIBV4L_DIRS_y); do \
-		$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/$$i \
-			DESTDIR=$(TARGET_DIR) $(LIBV4L_MAKE_OPTS) install || exit 1; done
-endef
+ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
+LIBV4L_CONF_OPT += --enable-v4l-utils
+else
+LIBV4L_CONF_OPT += --disable-v4l-utils
+endif
 
-$(eval $(generic-package))
+$(eval $(autotools-package))
-- 
1.9.1
