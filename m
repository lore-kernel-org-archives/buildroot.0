From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 9 Aug 2017 23:00:51 +0200
Subject: [Buildroot] [git commit branch/next] nvme: fix libuuid test when
	cross compiling
Message-ID: <20170809225751.C86407FE41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e13f7e11eecd7cb0c6f4f83ec4f1ff7a98b9fee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use $(LD) to test whether libuuid is installed, so that we check the target,
not the host.

Fixes:
http://autobuild.buildroot.net/results/e26/e263ffbf8947374c2aac73ab42edcbf4d9a3600a/
http://autobuild.buildroot.net/results/53b/53b2d1e0c3cdeafb980389bcfd8a10b6ca48fbc2/

Cc: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...allow-linker-override-for-cross-uuid-test.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/nvme/0001-Makefile-allow-linker-override-for-cross-uuid-test.patch b/package/nvme/0001-Makefile-allow-linker-override-for-cross-uuid-test.patch
new file mode 100644
index 0000000..dc1c01a
--- /dev/null
+++ b/package/nvme/0001-Makefile-allow-linker-override-for-cross-uuid-test.patch
@@ -0,0 +1,34 @@
+From f926559acd1beb74dc5dc9b0e414b087110a251f Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Wed, 9 Aug 2017 09:43:12 +0300
+Subject: [PATCH] Makefile: allow linker override for cross uuid test
+
+The test to determine whether libuuid is installed uses the host 'ld' utility.
+This breaks when cross compiling, since target libraries are often different
+than host libraries.
+
+Use $(LD) instead. This allows to easily use the cross compiler linker.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/linux-nvme/nvme-cli/pull/216
+
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 3f1d9aaa890d..cc74bdd6c3e6 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,7 +1,7 @@
+ CFLAGS ?= -O2 -g -Wall -Werror
+ CFLAGS += -std=gnu99
+ CPPFLAGS += -D_GNU_SOURCE -D__CHECK_ENDIAN__
+-LIBUUID = $(shell ld -o /dev/null -luuid >/dev/null 2>&1; echo $$?)
++LIBUUID = $(shell $(LD) -o /dev/null -luuid >/dev/null 2>&1; echo $$?)
+ NVME = nvme
+ INSTALL ?= install
+ DESTDIR =
+-- 
+2.13.2
+
