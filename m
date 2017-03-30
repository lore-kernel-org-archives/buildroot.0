From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 00:33:56 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] ltp-testsuite: disable
	Open POSIX testsuite
Message-ID: <20170331071606.49869826C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eaadfab8e8c77d9b66b0b9b1215a6ebd0ca6307c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The Open POSIX testsuite builds and installs to the target directory a
program called 't0' that isn't cross-compiled, which is bad.

Since the LTP build system is autoconf but not automake based, and the
Open POSIX testsuite is a sort of sub-project inside it, fixing the
issue is not trivial.

Therefore, we simply disable the Open POSIX testsuite entirely. Oddly
enough, --without-open-posix-testsuite doesn't work due to another bug,
so we simply have to remove --with-open-posix-testsuite.

Open POSIX testsuite cross-compilation issue reported at
https://github.com/linux-test-project/ltp/issues/144.

Configure script bug reported at
https://github.com/linux-test-project/ltp/issues/143.

Fixes:

  http://autobuild.buildroot.net/results/8326ba9eb257dfc92c1ad282ba6d3565e8250def/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit b57e1355a72da407c19315cb4187767d28e4d064)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 9d82087..29f374b 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -9,8 +9,16 @@ LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPLv2, GPLv2+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
+
+# Do not enable Open POSIX testsuite as it doesn't cross-compile
+# properly: t0 program is built for the host machine. Notice that due
+# to a bug, --without-open-posix-testsuite actually enables the test
+# suite.
+# See https://github.com/linux-test-project/ltp/issues/143 (invalid
+# autoconf test) and
+# https://github.com/linux-test-project/ltp/issues/144 (Open POSIX
+# testsuite not cross-compiling).
 LTP_TESTSUITE_CONF_OPTS += \
-	--with-open-posix-testsuite \
 	--with-realtime-testsuite
 
 ifeq ($(BR2_LINUX_KERNEL),y)
