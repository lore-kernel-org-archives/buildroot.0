From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 17:46:02 +0100
Subject: [Buildroot] [git commit] vnstat: bump to version 1.15
Message-ID: <20151223164610.2BF367FC86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a99b5cdfb329a0b36a5158db8bc3969b54a2ac47
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also:

  - Remove no longer needed patch (merged upstream).
  - Adapt vnstat.mk to the new autotools-based build system.
  - Include patch to improve gd library usability check + add
    configure option to explicitly disable that check.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-fcntl.h-include-needed-by-open-closes-21.patch | 28 ------------
 ...ure.ac-add-option-to-disable-image-output.patch | 51 ++++++++++++++++++++++
 package/vnstat/vnstat.hash                         |  2 +-
 package/vnstat/vnstat.mk                           | 27 +++++-------
 4 files changed, 64 insertions(+), 44 deletions(-)

diff --git a/package/vnstat/0001-add-missing-fcntl.h-include-needed-by-open-closes-21.patch b/package/vnstat/0001-add-missing-fcntl.h-include-needed-by-open-closes-21.patch
deleted file mode 100644
index 5489580..0000000
--- a/package/vnstat/0001-add-missing-fcntl.h-include-needed-by-open-closes-21.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From a222434e096ce42c7937839f9666691f2b8a612f Mon Sep 17 00:00:00 2001
-From: Teemu Toivola <git@humdi.net>
-Date: Sat, 27 Jun 2015 18:29:22 +0300
-Subject: [PATCH] add missing fcntl.h include needed by open(), closes #21
-
-[Backport from upstream commit 964d7cd62b8626d51bf7ce06564aa9bd1d2b4d4c.
-Fixes undeclared symbol issues when building with musl.]
-
-Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
----
- src/common.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/common.h b/src/common.h
-index 7616e55..eb0b61f 100644
---- a/src/common.h
-+++ b/src/common.h
-@@ -22,6 +22,7 @@
- #include <pwd.h>
- #include <grp.h>
- #include <libgen.h>
-+#include <fcntl.h>
- 
- #if defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__APPLE__) || defined(__FreeBSD_kernel__)
- #include <sys/param.h>
--- 
-2.1.4
-
diff --git a/package/vnstat/0001-configure.ac-add-option-to-disable-image-output.patch b/package/vnstat/0001-configure.ac-add-option-to-disable-image-output.patch
new file mode 100644
index 0000000..e46ef07
--- /dev/null
+++ b/package/vnstat/0001-configure.ac-add-option-to-disable-image-output.patch
@@ -0,0 +1,51 @@
+From 8a4a9b82d4f8fd39db8417fd06d969505fde9d0a Mon Sep 17 00:00:00 2001
+From: Rodrigo Rebello <rprebello@gmail.com>
+Date: Tue, 22 Dec 2015 18:02:22 -0200
+Subject: [PATCH 1/1] configure.ac: add option to disable image output
+
+Even when the gd library is present, it may be desirable to not build
+'vnstati' as image output is an optional feature.
+
+Also, when testing for the gd library, use gdImagePng() instead of
+gdImageLine() since it's possible that the installed gd library doesn't
+have PNG support. In such cases, the test in the configure script passed
+(because gdImageLine() is always present), but the build failed with:
+
+  src/vnstati.o: In function `writeoutput':
+  vnstati.c:(.text+0x3fc): undefined reference to `gdImagePng'
+  collect2: error: ld returned 1 exit status
+
+Upstream status: accepted, not yet released.
+https://github.com/vergoh/vnstat/pull/35
+
+Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
+---
+ configure.ac | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index be3d449..89f71ef 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -13,10 +13,16 @@ AM_PROG_CC_C_O
+ AC_PROG_MAKE_SET
+ AC_PROG_MKDIR_P
+ 
++AC_ARG_ENABLE([image-output], [
++AS_HELP_STRING([--disable-image-output], [disable PNG image output])])
++
+ # Checks for libraries.
+ AC_CHECK_LIB([m], [pow])
+-AC_CHECK_LIB([gd], [gdImageLine], [IMAGELIBS=-lgd])
+-AC_SUBST([IMAGELIBS])
++
++AS_IF([test "x$enable_image_output" != "xno"], [
++AC_CHECK_LIB([gd], [gdImagePng], [IMAGELIBS=-lgd])
++AC_SUBST([IMAGELIBS])])
++
+ AM_CONDITIONAL([HAVE_LIBGD], [test "$IMAGELIBS" = "-lgd"])
+ PKG_CHECK_MODULES([CHECK], [check >= 0.9.6], [], [AC_MSG_NOTICE([testcases can not be execute without check installed])])
+ AM_CONDITIONAL([HAVE_CHECK], [test "$CHECK_LIBS"])
+-- 
+2.1.4
+
diff --git a/package/vnstat/vnstat.hash b/package/vnstat/vnstat.hash
index 43438a7..82ee8c0 100644
--- a/package/vnstat/vnstat.hash
+++ b/package/vnstat/vnstat.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	f8462a47d85d0890493dc9eaeafbc725ae631aa5b103fb7f8af4ddb2314e8386	vnstat-1.14.tar.gz
+sha256	c3814b5baa8b627198a8debfe1dce4b4346a342523818cc8668a5497971dbc39	vnstat-1.15.tar.gz
diff --git a/package/vnstat/vnstat.mk b/package/vnstat/vnstat.mk
index 8512d2d..ba2610a 100644
--- a/package/vnstat/vnstat.mk
+++ b/package/vnstat/vnstat.mk
@@ -4,27 +4,24 @@
 #
 ################################################################################
 
-VNSTAT_VERSION = 1.14
+VNSTAT_VERSION = 1.15
 VNSTAT_SITE = http://humdi.net/vnstat
 VNSTAT_LICENSE = GPLv2
 VNSTAT_LICENSE_FILES = COPYING
+# We're patching configure.ac, so we need to autoreconf
+VNSTAT_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_GD)$(BR2_PACKAGE_LIBPNG),yy)
 VNSTAT_DEPENDENCIES = gd
-VNSTAT_GD_MAKE_OPT = all
-define VNSTAT_INSTALL_VNSTATI_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/src/vnstati $(TARGET_DIR)/usr/bin/vnstati
-endef
+VNSTAT_CONF_OPTS = --enable-image-output
+else
+VNSTAT_CONF_OPTS = --disable-image-output
 endif
 
-define VNSTAT_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(VNSTAT_GD_MAKE_OPT)
-endef
+# vnStat declares an 'install-data-hook' rule that tries to run
+# 'vnstat --showconfig' on the host to generate a default config file.
+# That obviously doesn't work when cross-compiling, so avoid it
+# entirely.
+VNSTAT_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec
 
-define VNSTAT_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/src/vnstat $(TARGET_DIR)/usr/bin/vnstat
-	$(INSTALL) -D -m 0755 $(@D)/src/vnstatd $(TARGET_DIR)/usr/sbin/vnstatd
-	$(VNSTAT_INSTALL_VNSTATI_CMDS)
-endef
-
-$(eval $(generic-package))
+$(eval $(autotools-package))
