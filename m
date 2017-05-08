From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  8 May 2017 21:08:18 +0200
Subject: [Buildroot] [PATCH 1/2] package/ltp-testsuite: remove ldd commande
	test with static only build
Message-ID: <20170508190819.28493-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ldd command build system try to build a shared library unconditionally:

arc-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -matomic -Os -static \
	-I[...]/sysroot/usr/include/tirpc   -g -O2 -fno-strict-aliasing -pipe \
	-Wall -W -Wold-style-definition -shared -o lddfile1.obj.so lddfile1.o

Fixes:
http://autobuild.buildroot.net/results/2ec/2eccf9f517ab15d8d459b06195423fdfe3fba9fa

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 7f26bd2..2a7f620 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -68,4 +68,12 @@ endef
 LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_UNSUPPORTED
 endif
 
+# ldd command build system try to build a shared library unconditionally.
+ifeq ($(BR2_STATIC_LIBS),y)
+define LTP_TESTSUITE_REMOVE_LDD
+	rm -rf $(@D)/testcases/commands/ldd
+endef
+LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_LDD
+endif
+
 $(eval $(autotools-package))
-- 
2.9.3
