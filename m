From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 11 Oct 2019 22:09:52 +0200
Subject: [Buildroot] [git commit] package/ltp-testsuite: fix build with
 musl-fts
Message-ID: <20191011201330.C1FCE8D436@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86f4dc0778fe62c2f6b2806148d7f5670d8a3335
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/7a4b54768584b2ec95f7f5c0932d0161ab8e43d5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ltp-testsuite/Config.in        | 1 +
 package/ltp-testsuite/ltp-testsuite.mk | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 711c859e6c..500a8c2688 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  The Linux Test Project provides a huge testsuite for Linux.
 
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 2276b75f8c..0c850d2b67 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -51,13 +51,18 @@ LTP_TESTSUITE_CFLAGS += "`$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
 LTP_TESTSUITE_LIBS += "`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"
 endif
 
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
+LTP_TESTSUITE_DEPENDENCIES += musl-fts
+LTP_TESTSUITE_LIBS += -lfts
+endif
+
 LTP_TESTSUITE_CONF_ENV += \
 	CFLAGS="$(LTP_TESTSUITE_CFLAGS)" \
 	CPPFLAGS="$(LTP_TESTSUITE_CPPFLAGS)" \
 	LIBS="$(LTP_TESTSUITE_LIBS)" \
 	SYSROOT="$(STAGING_DIR)"
 
-# Requires uClibc fts and bessel support, normally not enabled
+# Requires uClibc bessel support, normally not enabled
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 define LTP_TESTSUITE_REMOVE_UNSUPPORTED
 	rm -rf $(@D)/testcases/misc/math/float/bessel/
