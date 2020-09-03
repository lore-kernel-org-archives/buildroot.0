From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 21:02:27 +0200
Subject: [Buildroot] [git commit] package/wolfssl: disable examples and tests
Message-ID: <20200903185430.A805882108@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a33de882eb23ddab1035718fe236199dfe23e5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Examples and tests are not needed especially because of them fails on
some architectures because it wrongly tries to use wc_Sha256FinalRaw:

  CCLD     tests/unit.test
/tmp/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-none-linux-gnu/9.2.1/../../../../aarch64-none-linux-gnu/bin/ld: tests/tests_unit_test-api.o: in function `test_wc_Sha256FinalRaw':
/tmp/instance-0/output-1/build/wolfssl-4.5.0-stable/tests/api.c:6504: undefined reference to `wc_Sha256FinalRaw'

Fixes:
 - http://autobuild.buildroot.org/results/d5b6f97f7510874fe28c675e599be08cb8a78c7b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wolfssl/wolfssl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 5400b35fa5..e2833144fb 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -17,6 +17,8 @@ WOLFSSL_DEPENDENCIES = host-pkgconf
 # script, so we need autoreconf
 WOLFSSL_AUTORECONF = YES
 
+WOLFSSL_CONF_OPTS = --disable-examples --disable-crypttests
+
 ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
 WOLFSSL_CONF_OPTS += --enable-all
 else
