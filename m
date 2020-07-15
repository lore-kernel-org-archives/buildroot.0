From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 21:44:33 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/libnss: fix build
 with old PPC ABI
Message-ID: <20200715195249.A8E3181F67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7955f169da24d318251395a1831884857f19711e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Fixes:
http://autobuild.buildroot.net/results/bdbd33c7a764931b2066dd8b527dde2f5dc298b4
http://autobuild.buildroot.net/results/61bf50f73bb79e85c22e663f5fc22f4b9ccc0d3b
http://autobuild.buildroot.net/results/4437942a528ab8f782d3b97595e76bb690d3a409

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f30fc8944763c17ac8140c01b0775f458c6ade54)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/0001-fix-old-abi-ppc.patch | 40 +++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/libnss/0001-fix-old-abi-ppc.patch b/package/libnss/0001-fix-old-abi-ppc.patch
new file mode 100644
index 0000000000..202b4ad271
--- /dev/null
+++ b/package/libnss/0001-fix-old-abi-ppc.patch
@@ -0,0 +1,40 @@
+From a7a862bab5e4aae4615ddae3cbe230345f92ed0d Mon Sep 17 00:00:00 2001
+From: Lauri Kasanen <cand@gmx.com>
+Date: Mon, 1 Jun 2020 12:11:45 +0300
+Subject: [PATCH v3] Bug 1642174 /usr/bin/ld: OBJS/Linux_SINGLE_SHLIB/sha512-p8.o:
+ ABI version 2 is not compatible with ABI version 1 output
+
+Don't try to build the SHA-2 accelerated asm on old-ABI ppc.
+
+Currently make only, I don't have enough gyp-fu to do that side.
+However, the reporters of 1642174 and 1635625 both used make, not gyp.
+
+Signed-off-by: Lauri Kasanen <cand@gmx.com>
+[Fetch-from: https://bugzilla.mozilla.org/show_bug.cgi?id=1642174
+ Manually modified paths to apply to nss subdirectory in release tarball.]
+Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
+---
+ lib/freebl/Makefile | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
+index 5f7384429..e0461c7d3 100644
+--- a/nss/lib/freebl/Makefile
++++ b/nss/lib/freebl/Makefile
+@@ -267,9 +267,12 @@ ifeq ($(CPU_ARCH),arm)
+ endif
+ ifeq ($(CPU_ARCH),ppc)
+     EXTRA_SRCS += gcm-ppc.c
+-    ASFILES += sha512-p8.s
+ ifdef USE_64
+     DEFINES += -DNSS_NO_INIT_SUPPORT
++    PPC_ABI := $(shell $(CC) -dM -E - < /dev/null | awk '$$2 == "_CALL_ELF" {print $$3}')
++    ifeq ($(PPC_ABI),2)
++        ASFILES += sha512-p8.s
++    endif
+ endif # USE_64
+ endif # ppc
+ endif # Linux
+--
+2.19.1
+
