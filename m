From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 19 May 2019 22:08:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: bump to version
 20190517
Message-ID: <20190519200852.26710-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove workaround deleting testcases/kernel/controllers/cpuset/.
Upstream commit b24f3d32c ("cpuset: Detect missing fts.h") detect fts.h
presence, thus it's working with '#undef __UCLIBC_HAS_FTS__'.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Tested locally (uClibc) and with test-pkg.

./utils/test-pkg -p ltp-testsuite 
                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: SKIPPED
                          br-x86-64-musl [4/6]: SKIPPED
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 2 skipped, 0 build failed, 0 legal-info failed

NOTE: MUSL build is work-in-progress, maybe next release.

Kind regards,
Petr
---
 package/ltp-testsuite/ltp-testsuite.hash | 4 ++--
 package/ltp-testsuite/ltp-testsuite.mk   | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index ba0dcbe7e8..01111a8a30 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,2 +1,2 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20190115/ltp-full-20190115.tar.xz.sha1
-sha1 d87e2f96dc628f927e98ecba2e9dae581fc115b4  ltp-full-20190115.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20190517/ltp-full-20190517.tar.xz.sha1
+sha1 464d09ee1d3b43eecd0d78a9818596e6e1f2234e  ltp-full-20190517.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index ebc386d0cf..173c3bfe8c 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20190115
+LTP_TESTSUITE_VERSION = 20190517
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
@@ -60,7 +60,6 @@ LTP_TESTSUITE_CONF_ENV += \
 # Requires uClibc fts and bessel support, normally not enabled
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 define LTP_TESTSUITE_REMOVE_UNSUPPORTED
-	rm -rf $(@D)/testcases/kernel/controllers/cpuset/
 	rm -rf $(@D)/testcases/misc/math/float/bessel/
 	rm -f $(@D)/testcases/misc/math/float/float_bessel.c
 endef
-- 
2.21.0
