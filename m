From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 21:47:48 +0200
Subject: [Buildroot] [git commit branch/next] ltp-testsuite: support
	building with toolchains without native RPC
Message-ID: <20150808105642.5102780414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=baedef979cda7783b399099b49cd23536e44b1c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

ltp-testsuite needs RPC, but this could also be provided by libtirpc.

The dependency of libtirpc on
!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 does not need to be
propagated, because it is always satisfied: ltp-testsuite depends on
BR2_USE_MMU which is always unset for Blackfin targets.

Since musl toolchains never have RPC support, this change would now allow
building of ltp-testsuite on musl toolchains. Unfortunately, ltp-testsuite
does not build yet with musl, so a specific check on musl is added.
This is deemed more conceptually correct than checking on glibc||uclibc.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Cc: "Yann E. Morin" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltp-testsuite/Config.in        |    7 ++++---
 package/ltp-testsuite/ltp-testsuite.mk |   15 +++++++++++++--
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 52c02ce..91b09ce 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -6,7 +6,8 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	bool "ltp-testsuite"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on !BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	# does not build, cachectl.h issue
 	depends on !BR2_nios2
 	help
@@ -21,7 +22,7 @@ config BR2_PACKAGE_LTP_TESTSUITE
 
 	  http://ltp.sourceforge.net/
 
-comment "ltp-testsuite needs a toolchain w/ RPC, threads"
+comment "ltp-testsuite needs a non-musl toolchain w/ threads"
 	depends on !BR2_nios2
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 2d4f286..acc1640 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -19,8 +19,19 @@ endif
 
 # ltp-testsuite uses <fts.h>, which isn't compatible with largefile
 # support.
+LTP_TESTSUITE_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
+LTP_TESTSUITE_CPPFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))
+LTP_TESTSUITE_LIBS =
+
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+LTP_TESTSUITE_DEPENDENCIES += libtirpc host-pkgconf
+LTP_TESTSUITE_CFLAGS += "`$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
+LTP_TESTSUITE_LIBS += "`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"
+endif
+
 LTP_TESTSUITE_CONF_ENV += \
-	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
-	CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
+	CFLAGS="$(LTP_TESTSUITE_CFLAGS)" \
+	CPPFLAGS="$(LTP_TESTSUITE_CPPFLAGS)" \
+	LIBS="$(LTP_TESTSUITE_LIBS)"
 
 $(eval $(autotools-package))
