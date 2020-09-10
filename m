From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2020 23:46:02 +0200
Subject: [Buildroot] [git commit] package/iptables: fix static build
Message-ID: <20200910213859.AF09D81E59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a41e7d9ecd9ec4678ea068a0f2498cdaa16bbea7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Static build of iptables 1.8.5 fails on:

/srv/storage/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../libxtables/.libs/libxtables.a(libxtables_la-xtables.o): in function `dlreg_free':
/srv/storage/autobuild/run/instance-3/output-1/build/iptables-1.8.5/libxtables/xtables.c:235: undefined reference to `dlclose'

Issue has been added with
https://git.netfilter.org/iptables/commit/?id=7db4333dc0b6cd8e943fab78d6dab40ff9f4512e

Fixes:
 - http://autobuild.buildroot.org/results/00f551be87507757a78e332f2859b1e7b3190363

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...compiler-warning-fixes-for-NO_SHARED_LIBS.patch | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/package/iptables/0001-libxtables-compiler-warning-fixes-for-NO_SHARED_LIBS.patch b/package/iptables/0001-libxtables-compiler-warning-fixes-for-NO_SHARED_LIBS.patch
new file mode 100644
index 0000000000..8d364b3789
--- /dev/null
+++ b/package/iptables/0001-libxtables-compiler-warning-fixes-for-NO_SHARED_LIBS.patch
@@ -0,0 +1,58 @@
+From 6cb8af1ff3951e47def7a16db39289dc9d9c61fe Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <maze@google.com>
+Date: Tue, 23 Jun 2020 16:09:02 -0700
+Subject: libxtables: compiler warning fixes for NO_SHARED_LIBS
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes two issues with NO_SHARED_LIBS:
+ - #include <dlfcn.h> is ifdef'ed out and thus dlclose()
+   triggers an undeclared function compiler warning
+ - dlreg_add() is unused and thus triggers an unused
+   function warning
+
+Test: builds without warnings
+Signed-off-by: Maciej ??enczykowski <maze@google.com>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+
+[Retrieved from:
+https://git.netfilter.org/iptables/commit/libxtables/xtables.c?id=6cb8af1ff3951e47def7a16db39289dc9d9c61fe]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libxtables/xtables.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libxtables/xtables.c b/libxtables/xtables.c
+index 7fe42580..8907ba20 100644
+--- a/libxtables/xtables.c
++++ b/libxtables/xtables.c
+@@ -206,6 +206,7 @@ struct xtables_target *xtables_targets;
+ static bool xtables_fully_register_pending_match(struct xtables_match *me);
+ static bool xtables_fully_register_pending_target(struct xtables_target *me);
+ 
++#ifndef NO_SHARED_LIBS
+ /* registry for loaded shared objects to close later */
+ struct dlreg {
+ 	struct dlreg *next;
+@@ -237,6 +238,7 @@ static void dlreg_free(void)
+ 		dlreg = next;
+ 	}
+ }
++#endif
+ 
+ void xtables_init(void)
+ {
+@@ -267,7 +269,9 @@ void xtables_init(void)
+ 
+ void xtables_fini(void)
+ {
++#ifndef NO_SHARED_LIBS
+ 	dlreg_free();
++#endif
+ }
+ 
+ void xtables_set_nfproto(uint8_t nfproto)
+-- 
+cgit v1.2.3
+
