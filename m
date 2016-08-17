From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Aug 2016 08:35:54 +0200
Subject: [Buildroot] [git commit] wayland: fix musl build issue
Message-ID: <20160817064349.14C1F7FC4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=562a587d009e50f296c5746b2e0a37f9583db1d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With musl C library, we see following build failure.

  src/scanner.c: In function 'find_enumeration':
  src/scanner.c:811:2: error: unknown type name 'uint'
    uint idx = 0, j;
    ^

uint is defined in <sys/types.h> header. It is usually included by <stdlib.h>
but in musl stdlib.h doesn't include it.

This patch adds upstream patch where uint32_t is used instead of uint.

Fixes:

  http://autobuild.buildroot.net/results/fcf/fcf6dd3bd31f92eadbcae17338e5887a23e43ff9/

Cc: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0002-scanner-Use-uint32_t-instead-of-uint.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/wayland/0002-scanner-Use-uint32_t-instead-of-uint.patch b/package/wayland/0002-scanner-Use-uint32_t-instead-of-uint.patch
new file mode 100644
index 0000000..1d05f25
--- /dev/null
+++ b/package/wayland/0002-scanner-Use-uint32_t-instead-of-uint.patch
@@ -0,0 +1,31 @@
+From 6750b47d9e0d3074d2e56aa36c476493f533d696 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 15 Jul 2016 16:23:48 -0700
+Subject: [PATCH 1/1] scanner: Use uint32_t instead of uint
+
+uint32_t is C99 defined stdint type
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Reviewed-by: Daniel Stone <daniels@collabora.com>
+[Rahul Bedarkar: Backported from: 6750b47d9e0d3074d2e56aa36c476493f533d696]
+Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
+---
+ src/scanner.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/scanner.c b/src/scanner.c
+index 6e2c3a3..ebae4cc 100644
+--- a/src/scanner.c
++++ b/src/scanner.c
+@@ -819,7 +819,7 @@ find_enumeration(struct protocol *protocol,
+ 	struct interface *i;
+ 	struct enumeration *e;
+ 	char *enum_name;
+-	uint idx = 0, j;
++	uint32_t idx = 0, j;
+ 
+ 	for (j = 0; j + 1 < strlen(enum_attribute); j++) {
+ 		if (enum_attribute[j] == '.') {
+-- 
+2.6.2
+
