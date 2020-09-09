From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 9 Sep 2020 22:43:11 +0200
Subject: [Buildroot] [git commit] package/neardal: fix build with gcc 10
Message-ID: <20200909204311.DBD1B88FD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a85ae8b297fd0526f57fe99d73087dd840ea6219
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/7efb100c899b67ffd570f73c202442f95ca5397e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-lib-neardal.h-fix-build-with-gcc-10.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/neardal/0001-lib-neardal.h-fix-build-with-gcc-10.patch b/package/neardal/0001-lib-neardal.h-fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..c9c4555022
--- /dev/null
+++ b/package/neardal/0001-lib-neardal.h-fix-build-with-gcc-10.patch
@@ -0,0 +1,35 @@
+From 08467411d7dfc2a2b7ede62e5fdc640748ea1db2 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 9 Sep 2020 19:14:52 +0200
+Subject: [PATCH] lib/neardal.h: fix build with gcc 10
+
+Define neardal_output_cb as extern to avoid the following build failure
+with gcc 10 (which defaults to -fno-common):
+
+/srv/storage/autobuild/run/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: ./.libs/neardal_adapter.o:(.bss+0x0): multiple definition of `neardal_output_cb'; ./.libs/neardal.o:(.bss+0x68): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7efb100c899b67ffd570f73c202442f95ca5397e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/connectivity/neardal/pull/10]
+---
+ lib/neardal.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/neardal.h b/lib/neardal.h
+index d1cd18b..3e83595 100644
+--- a/lib/neardal.h
++++ b/lib/neardal.h
+@@ -638,7 +638,7 @@ neardal_record *neardal_g_variant_to_record(GVariant *in);
+ 
+ void neardal_trace(const char *func, FILE *fp, char *fmt, ...)
+ 	__attribute__((format(printf, 3, 4)));
+-int (*neardal_output_cb)(FILE *fp, const char *fmt, va_list ap);
++extern int (*neardal_output_cb)(FILE *fp, const char *fmt, va_list ap);
+ 
+ #ifdef __cplusplus
+ }
+-- 
+2.28.0
+
