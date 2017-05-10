From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 May 2017 23:35:54 +0200
Subject: [Buildroot] [git commit] package/ltp-testsuite: remove ldd command
	test with static only build
Message-ID: <20170510213605.22ABD8280E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb98e425f8edc27c3d39d49cfec94a514b03b988
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ldd command build system try to build a shared library unconditionally:

arc-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -matomic -Os -static \
	-I[...]/sysroot/usr/include/tirpc   -g -O2 -fno-strict-aliasing -pipe \
	-Wall -W -Wold-style-definition -shared -o lddfile1.obj.so lddfile1.o

Fixes:
http://autobuild.buildroot.net/results/2ec/2eccf9f517ab15d8d459b06195423fdfe3fba9fa

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 7f26bd2..a4546df 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -68,4 +68,12 @@ endef
 LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_UNSUPPORTED
 endif
 
+# ldd command build system tries to build a shared library unconditionally.
+ifeq ($(BR2_STATIC_LIBS),y)
+define LTP_TESTSUITE_REMOVE_LDD
+	rm -rf $(@D)/testcases/commands/ldd
+endef
+LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_LDD
+endif
+
 $(eval $(autotools-package))
