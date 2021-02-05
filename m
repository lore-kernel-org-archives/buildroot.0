From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Feb 2021 19:38:20 +0100
Subject: [Buildroot] [git commit] package/makedumpfile: fix build on sparc64
Message-ID: <20210205181826.5CB178045A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28df31e8dc3b878b4c0b12aaf4106bb0a95292ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure on sparc64:

/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc64-buildroot-linux-gnu/9.3.0/../../../../sparc64-buildroot-linux-gnu/bin/ld: /tmp/ccylTux8.o: in function `find_kaslr_offsets':
/home/giuliobenetti/autobuild/run/instance-0/output-1/build/makedumpfile-1.6.8/makedumpfile.c:4017: undefined reference to `get_kaslr_offset'

Even if this build failure is only raised with version 1.6.8,
get_kaslr_offset was also undeclared on sparc64 in version 1.6.7

Fixes:
 - http://autobuild.buildroot.org/results/1421f54f7599bba62c0a4bd5c65ce21c8cc7ee1a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-makedumpfile.h-fix-build-on-sparc64.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/makedumpfile/0002-makedumpfile.h-fix-build-on-sparc64.patch b/package/makedumpfile/0002-makedumpfile.h-fix-build-on-sparc64.patch
new file mode 100644
index 0000000000..defc101949
--- /dev/null
+++ b/package/makedumpfile/0002-makedumpfile.h-fix-build-on-sparc64.patch
@@ -0,0 +1,35 @@
+From 2c132ac5e6656723821acdb0ee57b34c42851fed Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 4 Feb 2021 20:15:56 +0100
+Subject: [PATCH] makedumpfile.h: fix build on sparc64
+
+Fix the following build failure on sparc64:
+
+/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc64-buildroot-linux-gnu/9.3.0/../../../../sparc64-buildroot-linux-gnu/bin/ld: /tmp/ccylTux8.o: in function `find_kaslr_offsets':
+/home/giuliobenetti/autobuild/run/instance-0/output-1/build/makedumpfile-1.6.8/makedumpfile.c:4017: undefined reference to `get_kaslr_offset'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1421f54f7599bba62c0a4bd5c65ce21c8cc7ee1a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+http://lists.infradead.org/pipermail/kexec/2021-February/021996.html]
+---
+ makedumpfile.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/makedumpfile.h b/makedumpfile.h
+index 97a5554..dfc1a77 100644
+--- a/makedumpfile.h
++++ b/makedumpfile.h
+@@ -1139,6 +1139,7 @@ unsigned long long vaddr_to_paddr_sparc64(unsigned long vaddr);
+ #define get_machdep_info()      TRUE
+ #define get_phys_base()         get_phys_base_sparc64()
+ #define get_versiondep_info()   get_versiondep_info_sparc64()
++#define get_kaslr_offset(X)     stub_false()
+ #define vaddr_to_paddr(X)       vaddr_to_paddr_sparc64(X)
+ #define paddr_to_vaddr(X)	paddr_to_vaddr_general(X)
+ #define is_phys_addr(X)		stub_true_ul(X)
+-- 
+2.29.2
+
